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

  main = $(widget).find(".github-contributions")
    .css 'width', $(output).attr('width')
    .css 'height', $(output).attr('height')
    .css 'opacity', 0.8
    .html output

  main.find('[fill=#eeeeee]').attr('fill', "rgba(238, 238, 238, .5)")

  main.find('text').attr('fill', "#eeeeee")
