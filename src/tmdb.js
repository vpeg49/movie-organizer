import axios from 'axios'
import fs from 'fs'
import 'dotenv/config'
import { logger } from './logger.js'

const TMDB_BASE = 'https://api.themoviedb.org/3'
const CACHE_FILE = './movies.json'
const RATE_LIMIT_MS = 250

const GENRE_MAP = {
  28:    'accion',
  12:    'aventura',
  16:    'animacion',
  35:    'comedia',
  80:    'crimen',
  99:    'documental',
  18:    'drama',
  10751: 'familia',
  14:    'fantasia',
  36:    'historia',
  27:    'terror',
  10402: 'musica',
  9648:  'misterio',
  10749: 'romance',
  878:   'sci-fi',
  53:    'thriller',
  10752: 'guerra',
  37:    'western'
}

const sleep = (ms) => new Promise(resolve => setTimeout(resolve, ms))

function loadCache() {
  if (fs.existsSync(CACHE_FILE)) {
    return JSON.parse(fs.readFileSync(CACHE_FILE, 'utf-8'))
  }
  return { movies: [], lastUpdated: null }
}

function saveCache(data) {
  data.lastUpdated = new Date().toISOString()
  fs.writeFileSync(CACHE_FILE, JSON.stringify(data, null, 2))
}

export async function searchMovie(title, year) {
  const cache = loadCache()

  // Buscar en caché primero
  const cached = cache.movies.find(
    m => m.searchTitle?.toLowerCase() === title.toLowerCase()
      && m.searchYear === year
  )
  if (cached) {
    logger.dim(`Caché: ${title}`)
    return cached
  }

  try {
    await sleep(RATE_LIMIT_MS)

    const response = await axios.get(`${TMDB_BASE}/search/movie`, {
      params: {
        api_key: process.env.TMDB_API_KEY,
        query: title,
        year: year || undefined,
        language: process.env.TMDB_LANGUAGE || 'es-MX',
        include_adult: false
      }
    })

    const results = response.data.results

    if (!results.length) {
      logger.warn(`No encontrada en TMDB: ${title}`)
      return null
    }

    const movie = results[0]
    const primaryGenreId = movie.genre_ids[0]

    const result = {
      searchTitle: title,
      searchYear: year,
      tmdbId: movie.id,
      title: movie.title,
      originalTitle: movie.original_title,
      year: movie.release_date?.split('-')[0],
      genres: movie.genre_ids.map(id => GENRE_MAP[id] || 'sin-clasificar'),
      primaryGenre: GENRE_MAP[primaryGenreId] || 'sin-clasificar',
      rating: movie.vote_average,
      overview: movie.overview,
      poster: movie.poster_path
        ? `https://image.tmdb.org/t/p/w500${movie.poster_path}`
        : null
    }

    cache.movies.push(result)
    saveCache(cache)

    return result

  } catch (error) {
    if (error.response?.status === 401) {
      logger.error('API Key inválida. Revisa tu .env')
      process.exit(1)
    }
    logger.error(`Error consultando TMDB: ${title}`)
    return null
  }
}