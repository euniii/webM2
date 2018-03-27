<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<canvas id="myChart" width="300" height="200"></canvas>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="Chart.bundle.js"></script>
<title>Insert title here</title>
</head>
<body>
<script>
		var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
		var color = Chart.helpers.color;
		var barChartData = {
			labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
			datasets: [{
				label: 'Dataset 1',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}, {
				label: 'Dataset 2',
				backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
				borderColor: window.chartColors.blue,
				borderWidth: 1,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}]

		};

		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myBar = new Chart(ctx, {
				type: 'bar',
				data: barChartData,
				options: {
					responsive: true,
					legend: {
						position: 'top',
					},
					title: {
						display: true,
						text: 'Chart.js Bar Chart'
					}
				}
			});

		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			var zero = Math.random() < 0.2 ? true : false;
			barChartData.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return zero ? 0.0 : randomScalingFactor();
				});

			});
			window.myBar.update();
		});

		var colorNames = Object.keys(window.chartColors);
		document.getElementById('addDataset').addEventListener('click', function() {
			var colorName = colorNames[barChartData.datasets.length % colorNames.length];
			var dsColor = window.chartColors[colorName];
			var newDataset = {
				label: 'Dataset ' + barChartData.datasets.length,
				backgroundColor: color(dsColor).alpha(0.5).rgbString(),
				borderColor: dsColor,
				borderWidth: 1,
				data: []
			};

			for (var index = 0; index < barChartData.labels.length; ++index) {
				newDataset.data.push(randomScalingFactor());
			}

			barChartData.datasets.push(newDataset);
			window.myBar.update();
		});

		document.getElementById('addData').addEventListener('click', function() {
			if (barChartData.datasets.length > 0) {
				var month = MONTHS[barChartData.labels.length % MONTHS.length];
				barChartData.labels.push(month);

				for (var index = 0; index < barChartData.datasets.length; ++index) {
					// window.myBar.addData(randomScalingFactor(), index);
					barChartData.datasets[index].data.push(randomScalingFactor());
				}

				window.myBar.update();
			}
		});

		document.getElementById('removeDataset').addEventListener('click', function() {
			barChartData.datasets.splice(0, 1);
			window.myBar.update();
		});

		document.getElementById('removeData').addEventListener('click', function() {
			barChartData.labels.splice(-1, 1); // remove the label first

			barChartData.datasets.forEach(function(dataset) {
				dataset.data.pop();
			});

			window.myBar.update();
		});
	</script>









<!-- <script>
var data = {
	labels: ["${acc1}", "${acc2}", "${acc3}", "${acc4}", "${acc5}", "${acc6}"],
	datasets: [
		{
			label: "My First dataset",
			fillColor: "rgba(150,200,250,0.5)",
			strokeColor: "rgba(150,200,250,0.8)",
			highlightFill: "rgba(150,200,250,0.75)",
			highlightStroke: "rgba(150,200,250,1)",
			data: [65, 59, 80, 81, 56, 55]
		}
	]
};
var options = {	animation: false };
var ctx = $('#myChart').get(0).getContext('2d');
var myBarChart = new Chart(ctx).Bar(data, options);
</script>
 -->











<!-- <script type="text/javascript">
	var context = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(context, {
		type : 'pie',
		data : {
		labels : ["식비", "교통비", "통신비", "건강/의료", "소모품비", "미용" ],
		datasets : [{
		backgroundColor : ["#F23030", "#3E41E3", "#F69228", "#2FA667", "#3498db","#F8F82B"  ],
		hoverBackgroundColor : ["#A6A6A6", "#A6A6A6", "#A6A6A6", "#A6A6A6", "#A6A6A6","#A6A6A6" ],
		data : [100000, 150000, 200000, 300000, 50000, 20000]
		}]
		},
		options : {
			responsive : false
		}
	});
</script> -->
</body>
</html>