# Replace with your username here.
username: "Balletie"

command: "curl -s https://github.com/users/#{this.username}/contributions"

refreshFrequency: 3600000 # 1 hour

style: """
position: absolute\n
bottom: 10px\n
left: 10px\n

.container\n
	opacity:0.8\n
	font: 13px/1.4 Helvetica, arial, freesans, clean, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol"\n
h3\n
	border: solid #d8d8d8 1px\n
	background-color: #f5f5f5\n
	border-radius: 3px 3px 0 0\n
	border-bottom:0\n
	margin:0px\n
	padding: 9px 10px 10px\n

.calendar-graph\n
	background-color: white\n
	border: solid #d8d8d8 1px\n
	border-radius: 0 0 3px 3px\n
	box-sizing: border-box\n
	color: rgb(102, 102, 102)\n
	display: block\n
	font-size: 10px\n
	font-style: normal\n
	font-variant: normal\n
	font-weight: normal\n
	line-height: 18.2000007629395px\n
"""

render: (output) -> """
<div class="container">
	<h3>GitHub Contributions by #{this.username}</h3>
	<div class="calendar-graph"></div>
</div>
"""

update: (output, domEl) ->
	calendar = $($.parseHTML(output))
	$(domEl)
		.find('.calendar-graph')
		.html(calendar)
