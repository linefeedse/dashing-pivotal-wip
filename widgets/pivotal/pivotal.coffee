class Dashing.Pivotal extends Dashing.Widget

  @accessor 'started', Dashing.AnimatedValue
  @accessor 'finished', Dashing.AnimatedValue

  constructor: ->
    super
    @observe 'started', (started) ->
      $(@node).find(".smeter").val(started).trigger('change')
    @observe 'finished', (finished) ->
      $(@node).find(".fmeter").val(finished).trigger('change')

  ready: ->
    smeter = $(@node).find(".smeter")
    smeter.attr("data-bgcolor", smeter.css("background-color"))
    smeter.attr("data-fgcolor", smeter.css("color"))
    smeter.knob()
    fmeter = $(@node).find(".fmeter")
    fmeter.attr("data-bgcolor", fmeter.css("background-color"))
    fmeter.attr("data-fgcolor", fmeter.css("color"))
    fmeter.knob()
