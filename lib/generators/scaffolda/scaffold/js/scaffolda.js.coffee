$ ->
  $('input#search').keyup 'change', ->
    $.ajax type: 'GET', dataType: 'script', data: 'search=' + $(this).val()