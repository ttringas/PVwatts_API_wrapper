# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#nrel a').click ->
    query = ""
    $('#form input[type="text"]').each ->
      if this.value.length > 0 
        query = query + this.id.replace("project_","") + "=" + this.value.replace(/\s/g,"+") + "&"
    console.log query
    $.getJSON '/pvwatts.json?' + query, (data) ->
      console.log data
      $('#cost_per_kw').text Math.round(data.outputs.financials.cost_per_kw, 1)
      $('#installed_cost').text Math.round(data.outputs.financials.installed_cost, 1)
      $('#lcoe').text Math.round(data.outputs.financials.lcoe, 1)
      $('#npv').text Math.round(data.outputs.financials.npv, 1)
      $('#payback').text Math.round(data.outputs.financials.payback, 1)
      $('#ann_kwh_yr').text Math.round(data.outputs.ann_kwh_yr, 1)
    false