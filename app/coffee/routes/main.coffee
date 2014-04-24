routeProvider = ($routeProvider) ->
    $routeProvider
        .when('/', {controller: 'MainController' , templateUrl: 'javascript/partials/main.html', reloadOnSearch: false})
        .otherwise(redirectTo: '/')

angular.module('app').config ['$routeProvider', routeProvider]