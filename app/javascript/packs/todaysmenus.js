$(function () {
  const nabvarHeight = $(".navbar").outerHeight()
  const footerHeight = $(".page-footer").outerHeight()
  const htmlHeight = $("#index-todaysmenus").outerHeight()
  $("#no-todaysmenus").outerHeight(htmlHeight - nabvarHeight - footerHeight)

  // console.log($('[name="todaysmenu[serving_count]"'))

  const csrfToken = document.querySelector('[name="csrf-token"]').getAttribute('content');
  $('[name="todaysmenu[serving_count]"').change(function () {
    console.log($('[name="todaysmenu[serving_count]"').val())
    let changedServingCount = parseInt($('[name="todaysmenu[serving_count]"').val())
    let updateID = parseInt($(this).attr("class").substr(7))
    console.log($(this).attr("class"))
    console.log(updateID)
    $.ajax({
      url: "/todaysmenus/" + updateID,
      type: "put",
      headers: {
        // 'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      data: {
        todaysmenu: {
          serving_count: changedServingCount
        }
      },
      dataType: "json"
    }).done(function (data) {
      console.log("success")
    }).fail(function () {
      console.log("error")
    })
  })
});
