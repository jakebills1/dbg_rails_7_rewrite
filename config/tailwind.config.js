const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'nav-background': 'rgb(149, 69, 32)',
        'nav-background-active': 'rgba(149, 69, 32, 0.5)',
        'main-background': 'rgba(39,25,16,255)',
        'hero-trans-background' : 'rgba(100, 10, 10, 0.7)',
        'secondary-background': 'rgba(189,148,118,255)'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
