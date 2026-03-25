import 'dotenv/config'
import cliProgress from 'cli-progress'
import { scanDirectory } from './scanner.js'
import { searchMovie } from './tmdb.js'
import { moveMovie } from './organizer.js'
import { logger } from './logger.js'

const SOURCE = process.env.SOURCE_PATH
const DEST   = process.env.DEST_PATH
const INBOX  = process.env.INBOX_PATH
const DRY_RUN = process.argv.includes('--dry-run')

async function run() {
  const mode = process.argv.includes('--inbox') ? 'inbox' : 'migrate'
  const sourcePath = mode === 'inbox' ? INBOX : SOURCE

  logger.title('Movie Organizer')
  logger.info(`Modo:     ${mode}`)
  logger.info(`Fuente:   ${sourcePath}`)
  logger.info(`Destino:  ${DEST}`)
  logger.info(`DRY RUN:  ${DRY_RUN ? 'SÍ (simulación)' : 'NO (moviendo archivos)'}`)

  // 1. Escanear
  logger.info('Escaneando archivos...')
  const movies = scanDirectory(sourcePath)

  if (!movies.length) {
    logger.warn('No se encontraron películas.')
    return
  }

  logger.success(`Encontradas: ${movies.length} películas`)

  // 2. Barra de progreso
  const bar = new cliProgress.SingleBar({
    format: '  {bar} {percentage}% | {value}/{total} | {filename}',
    barCompleteChar: '█',
    barIncompleteChar: '░',
  })

  const stats = { success: 0, notFound: 0, skipped: 0, errors: 0 }

  bar.start(movies.length, 0, { filename: '' })

  // 3. Procesar cada película
  for (const movie of movies) {
    bar.update({ filename: movie.title.substring(0, 40) })

    const tmdbData = await searchMovie(movie.title, movie.year)
    const result = moveMovie(movie, tmdbData, DEST, DRY_RUN)

    if (result.success)                        stats.success++
    else if (result.reason === 'already_exists') stats.skipped++
    else                                         stats.errors++

    if (!tmdbData) stats.notFound++

    bar.increment()
  }

  bar.stop()

  // 4. Reporte final
  console.log('')
  logger.title('Resumen')
  logger.success(`Organizadas:       ${stats.success}`)
  logger.warn(`No encontradas:    ${stats.notFound} → /sin-clasificar`)
  logger.info(`Omitidas:          ${stats.skipped} (ya existían)`)
  logger.error(`Errores:           ${stats.errors}`)

  if (DRY_RUN) {
    console.log('')
    logger.warn('Modo simulación activo. Cambia a --migrate sin --dry-run para mover archivos.')
  }
}

run()
