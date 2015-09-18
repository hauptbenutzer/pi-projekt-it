var App = angular.module('pi-bulb', ['minicolors', 'ui.bootstrap-slider', 'frapontillo.bootstrap-switch', 'restangular']);

App.config(function (minicolorsProvider) {
angular.extend(minicolorsProvider.defaults, {
  control: 'hue',
  position: 'bottom left',
  theme: 'bootstrap'
});
});

App.controller('TypeCtrl', function($scope, Restangular, $timeout) {

	Restangular.setBaseUrl('/')
		.setRequestSuffix('.json');


	$scope.color = {
	  hue: '#00AA00',
	  brightness: '#FFFFFF',
	  saturation: '#AAAAAA',
	  wheel: '#336688',
	  textfield: '#BBBBBB',
	  hidden: '#121212',
	  inline: '#555555',
	  topleft: '#444444',
	  topright: '#777777',
	  bottomleft: '#888888',
	  bottomright: '#191919',
	  opacityHex: '#aabbaa',
	  opacityVal: '1',
	  opacityRgba: 'rgba(0,0,0,0.5)',
	  lettercase: '#EEEEAA',
	  random: '#000000',
	  dynamic: '#CCCCCC'
	  // formvalidation: '#EEEEAA'
	};

	Restangular.oneUrl('/bulb','').get().then(function(rsp) {
		$scope.bulbStatus = rsp;
	});

	$scope.isOn = true;
	$scope.sliderValue = 3;
	//Objects for control types:
	//object for brightness
	$scope.brightnesssettings = {
	  control: 'brightness'
	};

	//object for saturation
	$scope.saturationsettings = {
	  control: 'saturation'
	};

	//object for wheel
	$scope.wheelsettings = {
	  control: 'wheel'
	};


	//objects for input modes
	//inline textfield
	$scope.inlinesettings = {
	  inline: true
	};

	//objects for positions
	$scope.topleftsettings = {
	  position: 'top left'
	};

	$scope.toprightsettings  = {
	  position: 'top right'
	};

	$scope.bottomrightsettings = {
	  position: 'bottom right'
	};


	//objects for more
	$scope.opacitysettings = {
	  opacity: true
	};

	$scope.lettercasesettings = {
	  letterCase: 'uppercase'
	};

	$scope.dynamicSettings = {
	  letterCase: 'uppercase'
	};

	$scope.changeLetterCase = function (letterCase) {
	  $scope.dynamicSettings.letterCase = letterCase;
	};

	$scope.changePosition = function (pos) {
	  $scope.dynamicSettings.position = pos;
	};

	$scope.randomColor = function () {
	  $scope.color.random = getRandomColor();
	};
	var changePromise;

	$scope.$watchGroup(['bulbStatus.color', 'bulbStatus.brightness', 'bulbStatus.on'], function() {
		if(changePromise) {
			$timeout.cancel(changePromise);
		}
		changePromise = $timeout(1000);
		changePromise.then(function() {
			console.log($scope.bulbStatus);
			$scope.bulbStatus.put();
		})
	});

	var getRandomColor = function () {
	  var letters = '0123456789ABCDEF'.split('');
	  var color = '#';
	  for (var i = 0; i < 6; i++ ) {
	      color += letters[Math.round(Math.random() * 15)];
	  }
	  return color;
	};

});