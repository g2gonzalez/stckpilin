jQuery ->
  subcategories = $("#stocks_subcategory_id").html()
  $("#stocks_category_id").change ->
    category = $("#stocks_category_id :selected").text()
    options = $(subcategories).filter("optgroup[label='#{category}']").html()
    if options
      $("#stocks_subcategory_id").html(options)
      $("#stocks_subcategory_id").parent().show()
    else
      $("#stocks_subcategory_id").empty()
      $("#stocks_subcategory_id").parent().hide()