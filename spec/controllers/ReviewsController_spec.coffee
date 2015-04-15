describe "ReviewsController", ->
  scope        = null
  ctrl         = null
  location     = null
  routeParams  = null
  resource     = null

  setupController =(keywords)->
    inject(($location, $routeParams, $rootScope, $resource, $controller)->
      scope       = $rootScope.$new()
      location    = $location
      resource    = $resource
      routeParams = $routeParams
      routeParams.keywords = keywords

      ctrl        = $controller('ReviewsController',
                                $scope: scope
                                $location: location)
    )

  beforeEach(module("yo"))
  beforeEach(setupController())

  it 'defaults to no recipes', ->
    expect(scope.reviews).toEqualData([])