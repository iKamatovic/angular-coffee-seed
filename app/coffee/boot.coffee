app = angular.module('app', ['ngRoute', 'ngResource'])

angular.element(document).ready ->
    angular.bootstrap document, ['app']