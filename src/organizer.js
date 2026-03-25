import fs from 'fs'
import path from 'path'
import { logger } from './logger.js'

/**
 * Construye nombre limpio para el archivo destino
 * "Demolition Man (1993)"
 */
function buildCleanName(tmdbData, movie) {
  if (tmdbData?.title && tmdbData?.year) {
    return `${tmdbData.title} (${tmdbData.year})`
      .replace(/[/\\?%*:|"<>]/g, '')
      .trim()
  }
  return `${movie.title} ${movie.year ? `(${movie.year})` : ''}`.trim()
}

/**
 * Mueve el video y su .srt al directorio destino
 * según el género primario obtenido de TMDB
 */
export function moveMovie(movie, tmdbData, destBase, dryRun = true) {
  const genre = tmdbData?.primaryGenre || 'sin-clasificar'
  const destDir = path.join(destBase, genre)
  const cleanName = buildCleanName(tmdbData, movie)
  const destVideo = path.join(destDir, `${cleanName}${movie.extension}`)
  const destSrt = movie.srtPath
    ? path.join(destDir, `${cleanName}.srt`)
    : null

  if (dryRun) {
    logger.dim(`[DRY RUN] ${genre}/${cleanName}${movie.extension}`)
    if (destSrt) logger.dim(`[DRY RUN] ${genre}/${cleanName}.srt`)
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

    if (movie.srtPath && destSrt) {
      fs.renameSync(movie.srtPath, destSrt)
    }

    return { success: true, dryRun: false, destVideo, genre }

  } catch (error) {
    logger.error(`Error moviendo: ${movie.filename} → ${error.message}`)
    return { success: false, dryRun: false, reason: error.message }
  }
}