module.exports = (grunt) ->

    grunt.initConfig(
        coffee:
            options:
                sourceMap: no
                sourceRoot: ''
            scripts:
                files: [
                    expand: true,
                    cwd: './public/coffee/'
                    src: ['**/*.coffee']
                    dest: './public/javascript/.tmp/'
                    ext: '.js'
                ]

        watch:
            main:
                files: ['./public/coffee/**/*.coffee', './public/tests/**/**/*.coffee'],
                tasks: ['default'],
                options:
                    interrupt: true
            dev:
                files: ['./public/coffee/**/*.coffee'],
                tasks: ['development'],
                options:
                    interrupt: true

        uglify:
            options:
                mangle: true
                sourceMap: './public/javascript/source-map.js'
                sourceMappingURL: 'source-map.js'
            main:
                files:
                    'public/javascript/application.min.js': [
                        'public/javascript/.tmp/dependencies/angular.min.js'
                        'public/javascript/.tmp/dependencies/angular-route.min.js'
                        'public/javascript/.tmp/dependencies/angular-resource.min.js'
                        'public/javascript/.tmp/dependencies/jquery.min.js'
                        'public/javascript/.tmp/boot.js'
                        'public/javascript/.tmp/**/*.js'
                    ]

        copy:
            main:
                files: [
                    { expand: true, cwd: './public/coffee/partials/', src: ['*'], dest: './public/javascript/partials/', filter: 'isFile' }
                    { expand: true, cwd: './public/coffee/dependencies/', src: ['*'], dest: './public/javascript/.tmp/dependencies/', filter: 'isFile' }
                ]

        clean:
            main:
                src: ['./public/javascript/.tmp']

        karma:
            unit:
                configFile: './public/karma.conf.js',
                singleRun: true

    )

    grunt.loadNpmTasks('grunt-contrib-uglify')
    grunt.loadNpmTasks('grunt-contrib-coffee')
    grunt.loadNpmTasks('grunt-contrib-copy')
    grunt.loadNpmTasks('grunt-contrib-clean')
    grunt.loadNpmTasks('grunt-contrib-watch')
    grunt.loadNpmTasks('grunt-karma')

    grunt.registerTask('default', ['coffee', 'copy', 'uglify', 'clean', 'karma'])
    grunt.registerTask('development', ['coffee', 'copy', 'uglify'])