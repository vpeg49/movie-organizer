import fs from 'fs'
import path from 'path'
import { logger } from './logger.js'

const VIDEO_EXTENSIONS = ['.mp4', '.mkv', '.avi', '.mov']
const IGNORE_DIRS = ['___futbol', '__futbol', 'futbol']

/**
 * Extrae título y año del nombre del archivo
 * "Demolition.Man.1993.720p.BluRay.x264.YIFY.mp4"
 *  → { title: "Demolition Man", year: "1993" }
 */
export function parseFilename(filename) {
  const name = path.parse(filename).name
  const yearMatch = name.match(/(19|20)\d{2}/)

  if (!yearMatch) {
    return { title: cleanTitle(name), year: null }
  }

  const yearIndex = name.indexOf(yearMatch[0])
  const rawTitle = name.substring(0, yearIndex)

  return {
    title: cleanTitle(rawTitle),
    year: yearMatch[0]
  }
}

function cleanTitle(raw) {
  return raw
    .replace(/\./g, ' ')
    .replace(/_/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

/**
 * Busca el .srt con el mismo nombre base que el video
 */
function findSrt(directory, videoFilename) {
  const baseName = path.parse(videoFilename).name
  const srtPath = path.join(directory, `${baseName}.srt`)
  return fs.existsSync(srtPath) ? srtPath : null
}

/**
 * Barre recursivamente el directorio fuente
 * Ignora carpetas de futbol y retorna array de películas
 */
export function scanDirectory(dirPath) {
  const results = []

  if (!fs.existsSync(dirPath)) {
    logger.error(`Directorio no existe: ${dirPath}`)
    return results
  }

  function walk(currentPath) {
    const entries = fs.readdirSync(currentPath, { withFileTypes: true })

    for (const entry of entries) {
      const fullPath = path.join(currentPath, entry.name)

      if (entry.isDirectory()) {
        const shouldIgnore = IGNORE_DIRS.some(i =>
          entry.name.toLowerCase().includes(i.toLowerCase())
        )
        if (!shouldIgnore) walk(fullPath)
        else logger.dim(`Ignorando: ${entry.name}`)
        continue
      }

      const ext = path.extname(entry.name).toLowerCase()
      if (!VIDEO_EXTENSIONS.includes(ext)) continue

      const { title, year } = parseFilename(entry.name)

      results.push({
        filename: entry.name,
        fullPath,
        directory: currentPath,
        title,
        year,
        extension: ext,
        srtPath: findSrt(currentPath, entry.name)
      })
    }
  }

  walk(dirPath)
  return results
}
