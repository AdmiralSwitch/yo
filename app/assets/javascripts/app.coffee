yo = angular.module('yo',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
])

yo.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'ReviewsController'
      )
])

reviews = [
  {
    id: 1
    name: 'Ryan Shim',
    statement: 'Switch is my hero!',
  },
  {
    id: 2
    name: 'Lauren Asazawa',
    statement: '...pretty smart',
  },
  {
    id: 3
    name: 'Tim Licata',
    statement: '...one of my most determined students.',
  },
  {
    id: 4
    name: 'Calvin Jhunjhnuwala',
    statement: 'Amazing!',
  },
  {
    id: 5
    name: 'Sarah Harrison',
    statement: 'Switch loves making people laugh.',
  },
]

controllers = angular.module('controllers',[])
controllers.controller("ReviewsController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.reviews = reviews.filter (review)-> review.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.reviews = []
])