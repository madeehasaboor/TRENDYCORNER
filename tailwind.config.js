/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./*.html",
    "./**/*.html",
    "./js/**/*.js"
  ],
  theme: {
    extend: {
      fontFamily: {
        'elegant': ['Playfair Display', 'serif'],
        'sans': ['Inter', 'sans-serif'],
      },
      colors: {
        'trendy': {
          'black': '#000000',
          'white': '#FFFFFF',
          'gray-light': '#F5F5F5',
          'gray': '#808080',
        }
      }
    },
  },
  plugins: [],
}

