# Setup the clock
start_time = 50


clock_tick = (e) ->
  time = clock.getTime().time
  check_for_events(time)

clock = {}  

$ -> 
  clock = new FlipClock($('.flip-clock'), {
      countdown: true,
      callbacks: { interval: clock_tick }
    })
  clock.setTime(start_time)
  clock.start()



space = angular.module('space',
    [
      'templates',
      'ngRoute',
      'controllers',
    ]
  )




check_for_events = (time) ->
  e = $.grep( events, (e) -> e.time == time )

  process_event( e ) unless (e.length == 0)


process_event = (e) ->
  highlight_image( e[0].affects )

image_container = ->
  svgDoc = a.contentDocument

highlight_image = (part_name) ->
  part = $('#launch_image')[0].getElementById( part_name )
  $(part).attr("class", "highlight")
  

space.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'LaunchController'
      )
])


# new_events = {
#   "events":
#   [
#     { "id":1, "time": 43, "time_unit": "hours", "hold_counting": "counting", "class": "", "short_event": "Closeouts", "event": "Begin final vehicle and facility closeouts for launch" },
#     { "id":2, "time": 43, "time_unit": "hours", "hold_counting": "counting", "class": "", "short_event": "Backup_checks", "event": "Check out backup flight systems" },
#     { "id":3, "time": 43, "time_unit": "hours", "hold_counting": "counting", "class": "", "short_event": "Software_review", "event": "Review flight software stored in mass memory units and display systems" },
#     { "id":4, "time": 43, "time_unit": "hours", "hold_counting": "counting", "class": "", "short_event": "Load_backups", "event": "Load backup flight system software into the orbiter's general purpose computers" },
#     { "id":5, "time": 43, "time_unit": "hours", "hold_counting": "counting", "class": "", "short_event": "Remove_platforms", "event": "Remove middeck and flight deck platforms" },
#     { "id":6, "time": 43, "time_unit": "hours", "hold_counting": "counting", "class": "", "short_event": "Navigation_system_test", "event": "Activate and test navigational systems" },
#     { "id":7, "time": 43, "time_unit": "hours", "hold_counting": "counting", "class": "", "short_event": "Power_system_preparation", "event": "Complete preparation to load power reactant storage and distribution system" },
#     { "id":8, "time": 43, "time_unit": "hours", "hold_counting": "counting", "class": "", "short_event": "Flight_deck_pinspect", "event": "Complete flight deck preliminary inspections" },
#     { "id":9, "time": 27, "time_unit": "hours", "hold_counting": "hold", "class": "launch_pad", "short_event": "Nonessential_personnel_cleared", "event": "Clear launch pad of all nonessential personnel" },
#     { "id":10, "time": 27, "time_unit": "hours", "hold_counting": "hold", "class": "", "short_event": "Load_propellants", "event": "Begin loading cryogenic propellants into orbiter's power reactant storage and distribution (PRSD) system" },
#     { "id":11, "time": 27, "time_unit": "hours", "hold_counting": "counting", "class": "orbiter,tanks,fuel cell storage tanks", "short_event": "Load_reactants", "event": "Begin operations to load cryogenic reactants into the orbiter's fuel cell storage tanks" },
#     { "id":12, "time": 19, "time_unit": "hours", "hold_counting": "hold", "class": "", "short_event": "Second_hold", "event": "This builtin hold typically lasts four hours but may be extended if PRSD offload is required." }
#   ]
# }

events = [
  {
    name: "Start of launch",
    affects: "Rocket_Body"
    time: start_time - 3
  },
  {
    name: "Warm fuel starts",
    affects: "Rocket_Booster_Right"
    time: start_time - 5
  },
  {
    name: "Warm OTHER fuel booster",
    affects: "Rocket_Booster_Left"
    time: start_time - 7
  }
]


controllers = angular.module('controllers',[])


controllers.controller("LaunchController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.events = events.filter (recipe)-> recipe.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.events = []
])