describe 'Main Controller test', () ->
    controller = {}
    scope = {}
    httpBackend = {}

    beforeEach( ->
        angular.mock.module('app')
        angular.mock.inject(['$rootScope', '$controller', '$httpBackend', ($rootScope, $controller, $httpBackend) ->

            scope = $rootScope.$new()
            httpBackend = $httpBackend

            controller = $controller('MainController', {$scope: scope})
        ])
    )

    it 'Check if controller is properly loaded', () ->
         expect(controller).not.toBe(null)

    it 'must fail', () ->
        expect(scope.data).toBe('')