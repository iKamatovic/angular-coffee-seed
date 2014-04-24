mainDirective = () ->
    restrict: 'E'

    scope:
        data: '='

    link: (scope, element) ->

    templateUrl: 'javascript/partials/mainTemplate.html'

angular.module('app').directive('mainDirective', mainDirective)