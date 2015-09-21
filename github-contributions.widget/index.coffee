# Replace with your username here.
username = "z4tech"

command: "curl -s https://github.com/users/#{username}/contributions"

refreshFrequency: 3600000 # 1 hour

style: """
  left: 10px
  bottom: 10px

  border-radius 5px
  background rgba(#000, .5)

  font-family Helvetica Neue
  font-size 13px
  font-weight bold
  text-shadow 0 1px 0px rgba(#000, .5)
  color: #fff

  .container
    margin 8px 12px 12px

  .widget-header
    margin-bottom 5px

  .username
    float right

  .github-contributions
    position relative

  .contribution
    position absolute
"""

render: -> """
  <div class="container">
    <div class="widget-header">
      <span class="widget-title">GitHub Contributions</span>
      <span class="username">@#{this.command.split('/')[4]}</span>
    </div>
    <div class="github-contributions"></div>
  </div>
"""

update: (output, widget) ->

  squareSize = 11
  squareSpacing = 2

  console.log output
  console.log
  console.log

  main = $(widget).find(".github-contributions")
    .css 'width', $(output).attr('width')
    .css 'height', $(output).attr('height')
    .css 'opacity', 0.8
    .html output

  # data  = JSON.parse(output)
  #
  # days = $.map data, (day) -> day[1]
  # maxContribution = Math.max.apply(Math, days)
  #
  # squareTopPos = (i) ->
  #   offset = i % 7
  #   "#{offset * (squareSize + squareSpacing)}px"
  #
  # squareLeftPos = (i) ->
  #   offset = Math.floor(i / 7)
  #   "#{offset * (squareSize + squareSpacing)}px"
  #
  # squareColour = (count, max) ->
  #   switch
  #     when count > 8 then "rgba(30, 104, 35, .8)"
  #     when count > 5 then "rgba(68, 163, 64, .8)"
  #     when count > 2 then "rgba(140, 198, 101, .8)"
  #     when count > 0 then "rgba(214, 230, 133, .8)"
  #     else "rgba(238, 238, 238, .5)"
  #
  # squareStyle = (i, count) ->
  #   "left: #{squareLeftPos(i)}; top: #{squareTopPos(i)}; background-color: #{squareColour(count, maxContribution)}; width: #{squareSize}px; height: #{squareSize}px;"
  #
  # $(widget).find(".github-contributions").empty()
  #
  # $.each data, (index, day) ->
  #   $(widget).find(".github-contributions").append("<span class='contribution' style='#{squareStyle(index, day[1])}'></span>")
