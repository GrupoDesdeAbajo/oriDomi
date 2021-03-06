document.addEventListener 'DOMContentLoaded', ->

  unless OriDomi.isSupported
    document.getElementById('unsupported').style.display = 'block'
    return

  logo = new OriDomi '.logo', shading: false, speed: 1000
  logo.stairs 17

  demos = [
    new OriDomi '.demo1', vPanels: 5, ripple: true
    new OriDomi '.demo2', maxAngle: 89, ripple: true
    new OriDomi '.demo3', vPanels: 8, ripple: true
    new OriDomi '.demo4', vPanels: 4, ripple: true
    new OriDomi '.demo5', hPanels: 4, ripple: true
    new OriDomi '.demo6', hPanels: 4, ripple: true, shading: false
  ]

  setTimeout ->
    demos[0].accordion 30
    demos[1].reveal 40
    demos[2].accordion -20, 'left'
    demos[3].stairs 18, 'right'
    demos[4].reveal 30, 'top'
    demos[5].stairs 20, 'bottom'
  , 1000


  methods = ['accordion', 'curl', 'foldUp', 'reveal', 'fracture', 'ramp', 'stairs', 'twist']

  document.getElementById('demos').addEventListener 'click', (e) ->

    return unless (el = e.target).className is 'button'
    n      = el.getAttribute 'data-n'
    method = methods[Math.floor Math.random() * methods.length]
    angle  = Math.floor Math.random() * 80 * (if Math.random() > .5 then -1 else 1)

    demos[n][method] if method isnt 'foldUp' then angle else undefined
    angle = '' if method is 'foldUp'

    el.parentNode.getElementsByClassName('label')[0].innerHTML = "#{ method }(#{ angle })"

  , false

