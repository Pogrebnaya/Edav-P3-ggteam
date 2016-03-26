// All the credit goes to EDAV Project 1 BestEDAV Team. 

var w = 350,
	h = 350;

var colorscale = d3.scale.category10();

//Legend titles
var LegendOptions = ["California", "District of Columbia", "New York", "Montana"];

d = [
  [
    {axis: "married", value: 46.7},
    {axis: "widowed", value: 5.1},
    {axis: "divorced", value: 9.6},
    {axis: "separated", value: 2.3},
    {axis: "never married", value: 36.3}
  ],
  [
    {axis: "married", value: 26.4},
    {axis: "widowed", value: 4.7},
    {axis: "divorced", value: 9.5},
    {axis: "separated", value: 2.4},
    {axis: "never married", value: 57}
  ],
  [
    {axis: "married", value: 44.7},
    {axis: "widowed", value: 6.1},
    {axis: "divorced", value: 8.6},
    {axis: "separated", value: 2.7},
    {axis: "never married", value: 37.9}
  ],
  [
    {axis: "married", value: 52.1},
    {axis: "widowed", value: 6.1},
    {axis: "divorced", value: 12.5},
    {axis: "separated", value: 1.4},
    {axis: "never married", value: 27.9}
  ]
];

d_ca = [
  [
    {axis: "married", value: 46.7},
    {axis: "widowed", value: 5.1},
    {axis: "divorced", value: 9.6},
    {axis: "separated", value: 2.3},
    {axis: "never married", value: 36.3}
  ]];
d_dc = [
  [
    {axis: "married", value: 26.4},
    {axis: "widowed", value: 4.7},
    {axis: "divorced", value: 9.5},
    {axis: "separated", value: 2.4},
    {axis: "never married", value: 57}
  ]];
d_ny = [
  [
    {axis: "married", value: 44.7},
    {axis: "widowed", value: 6.1},
    {axis: "divorced", value: 8.6},
    {axis: "separated", value: 2.7},
    {axis: "never married", value: 37.9}
  ]];
d_mo = [
  [
    {axis: "married", value: 52.1},
    {axis: "widowed", value: 6.1},
    {axis: "divorced", value: 12.5},
    {axis: "separated", value: 1.4},
    {axis: "never married", value: 27.9}
  ]
];

//Options for the Radar chart, other than default
var mycfg = {
  w: w,
  h: h,
  maxValue: 60,
  levels: 10,
  ExtraWidthX: 200
}
var mycfg_ca = JSON.parse(JSON.stringify(mycfg)),
  mycfg_dc = JSON.parse(JSON.stringify(mycfg)),
  mycfg_ny = JSON.parse(JSON.stringify(mycfg)),
  mycfg_mo = JSON.parse(JSON.stringify(mycfg));

mycfg_ca.color = d3.scale.ordinal().range(['#1F77B4']);
mycfg_dc.color = d3.scale.ordinal().range(['#FF7F0E']);
mycfg_ny.color = d3.scale.ordinal().range(['#2CA02C']);
mycfg_mo.color = d3.scale.ordinal().range(['#D62728']);


//Call function to draw the Radar chart
//Will expect that data is in %'s
RadarChart.draw("#chart", d, mycfg);
RadarChart.draw("#chart1", d_ca, mycfg_ca);
RadarChart.draw("#chart2", d_dc, mycfg_dc);
RadarChart.draw("#chart3", d_ny, mycfg_ny);
RadarChart.draw("#chart4", d_mo, mycfg_mo);

////////////////////////////////////////////
/////////// Initiate legend ////////////////
////////////////////////////////////////////

var svg = d3.select('#combined')
	.selectAll('svg')
	.append('svg')
	.attr("width", w+300)
	.attr("height", h)

//Create the title for the legend
var text = svg.append("text")
	.attr("class", "title")
	.attr('transform', 'translate(90,0)') 
	.attr("x", w - 50)
	.attr("y", 10)
	.attr("font-size", "12px")
	.attr("fill", "#404040")
	.text("Program Enrolled	");
		
//Initiate Legend	
var legend = svg.append("g")
	.attr("class", "legend")
	.attr("height", 100)
	.attr("width", 200)
	.attr('transform', 'translate(90,20)') 
	;
	//Create colour squares
	legend.selectAll('rect')
	  .data(LegendOptions)
	  .enter()
	  .append("rect")
	  .attr("x", w - 45)
	  .attr("y", function(d, i){ return i * 20;})
	  .attr("width", 10)
	  .attr("height", 10)
	  .style("fill", function(d, i){ return colorscale(i);})
	  ;
	//Create text next to squares
	legend.selectAll('text')
	  .data(LegendOptions)
	  .enter()
	  .append("text")
	  .attr("x", w - 32)
	  .attr("y", function(d, i){ return i * 20 + 9;})
	  .attr("font-size", "11px")
	  .attr("fill", "#737373")
	  .text(function(d) { return d; })
	  ;	