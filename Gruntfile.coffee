module.exports = (grunt) ->
  grunt.initConfig {
    pkg: grunt.file.readJSON('package.json')
    coffee:
      compile:
        files:
          "compiled/coffeegrid.js": "src/coffeegrid.coffee"
        options:
          sourceMap: true
          bare: true
    less:
      compile:
        files:
          "compiled/coffeegrid.css": "src/coffeegrid.less"
        options:
          cleancss: true
    jasmine_node:
      options:
        coffee: true
        extensions: 'coffee'
    watch:
      scripts:
        tasks: ["coffee:compile", "less:compile"]
        files: ["src/coffeegrid.coffee", "src/coffeegrid.less"]

  }

  grunt.loadNpmTasks "grunt-contrib-coffee"

  grunt.loadNpmTasks "grunt-contrib-less"

  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.loadNpmTasks "grunt-jasmine-node"

  grunt.registerTask "default", ["jasmine_node", "coffee:compile", "less:compile"]

