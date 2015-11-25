module.exports =
  less:
    options:
      paths: [ 'src/assets/stylesheets' ]
    report: 'gzip'
    compress: yes
    cleancss: yes
    sourceMap: on
    files:
      'public/assets/style.css': 'src/assets/stylesheets/Bootstrap.less'
