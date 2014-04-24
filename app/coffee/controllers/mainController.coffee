class MainController
    constructor: (@scope, @location, @MainService) ->
        @scope.data = ''
        @scope.update  = @update

        @MainService.get {}, (data) =>
            @scope.data = data

    update: (data) =>
        @scope.data.status = data

angular.module('app').controller 'MainController', ['$scope', '$location', 'MainService', MainController]