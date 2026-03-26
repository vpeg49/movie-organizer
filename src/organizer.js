import fs from 'fs'
import path from 'path'
import { logger } from './logger.js'

/**
 * Construye nombre limpio para el archivo destino
 * "Demolition Man (1993)"
 */
function buildCleanName(tmdbData, movie) {
  if (tmdbData?.year) {
    const title = tmdbData.englishTitle || tmdbData.originalTitle || tmdbData.title
    if (title) {
      return `${title} (${tmdbData.year})`
        .replace(/[/\\?%*:|"<>]/g, '')
        .trim()
    }
  }
  return `${movie.title} ${movie.year ? `(${movie.year})` : ''}`.trim()
}

/**
 * Mueve el video y todos sus subtítulos al directorio destino
 * según el género primario obtenido de TMDB
 * Cada subtítulo se renombra con su código de idioma: .es.srt, .en.srt, etc.
 */
export function moveMovie(movie, tmdbData, destBase, dryRun = true) {
  const genre = tmdbData?.primaryGenre || 'sin-clasificar'
  const destDir = path.join(destBase, genre)
  const cleanName = buildCleanName(tmdbData, movie)
  const destVideo = path.join(destDir, `${cleanName}${movie.extension}`)

  if (dryRun) {
    logger.dim(`[DRY RUN] ${genre}/${cleanName}${movie.extension}`)
    for (const sub of movie.subtitles) {
      logger.dim(`[DRY RUN] ${genre}/${cleanName}.${sub.srtLang}.srt`)
    }
    return { success: true, dryRun: true, destVideo, genre }
  }

  // Verificar que el destino no existe ya
  if (fs.existsSync(destVideo)) {
    logger.warn(`Ya existe, omitiendo: ${cleanName}${movie.extension}`)
    return { success: false, dryRun: false, reason: 'already_exists' }
  }

  try {
    fs.mkdirSync(destDir, { recursive: true })
    fs.renameSync(movie.fullPath, destVideo)

    for (const sub of movie.subtitles) {
      const destSrt = path.join(destDir, `${cleanName}.${sub.srtLang}.srt`)
      fs.renameSync(sub.srtPath, destSrt)
    }

    return { success: true, dryRun: false, destVideo, genre }

  } catch (error) {
    logger.error(`Error moviendo: ${movie.filename} → ${error.message}`)
    return { success: false, dryRun: false, reason: error.message }
  }
}