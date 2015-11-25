module.exports =
  images:
    options:
      optimizationLevel: 5
      svgoPlugins: [
        { removeEmptyAttrs: yes }
        { removeUselessStrokeAndFill: yes }
      ]
    files: [
      expand: yes
      cwd: 'src/assets/images/'
      src: "{,**/}*.{png,jpg,jpeg,svg}"
      dest: 'public/images/'
    ]
