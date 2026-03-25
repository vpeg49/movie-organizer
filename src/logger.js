import chalk from 'chalk'

export const logger = {
  info: (msg) => console.log(chalk.cyan(`ℹ️  ${msg}`)),
  success: (msg) => console.log(chalk.green(`✅ ${msg}`)),
  warn: (msg) => console.log(chalk.yellow(`⚠️  ${msg}`)),
  error: (msg) => console.log(chalk.red(`❌ ${msg}`)),
  title: (msg) => console.log(chalk.bold.blue(`\n🎬 ${msg}`)),
  dim: (msg) => console.log(chalk.dim(`   ${msg}`)),
}
