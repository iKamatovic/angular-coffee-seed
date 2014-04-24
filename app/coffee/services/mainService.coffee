class MainService
    constructor: (@resource) ->
        @service = @resource '/api/:param?team=:team'

        MainService::get = (query, cb) =>
            query.param = 'projects'
            @service.get(query).$promise.then (data) =>
                cb data

angular.module('app').service 'MainService', ['$resource', MainService]