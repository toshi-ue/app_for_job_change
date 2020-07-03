$(document).ready(function () {
  let action_name = $('body').data('action')
  console.log(action_name)
  // console.log(window)
  // console.log(window[controller])
  // table-sortable-procedure
  // if(action_name === "show"){
  //   console.log("show_passed")
  //   $('.table-sortable-procedure').sortable({

  //   })
  $('.table-sortable-procedure').sortable({
    axis: 'y',
    items: 'item'
  })

});
// $(function () {
//   return $('.table-sortable').sortable({
//     axis: 'y',
//     items: '.item',
//     update: function (e, ui) {
//       var item, item_data, params;
//       item = ui.item;
//       item_data = item.data();

//       data属性のデータを取得する
//       params = {
//         _method: 'put'
//       };

//       parameterを作成
//       params[item_data.modelName] = {
//         row_order_position: item.index()
//       };


//       ranked_model用
//       並べ替えをDBに反映(ajaxでPOST)
//       return $.ajax({
//         type: 'POST',
//         url: item_data.updateUrl,
//         dataType: 'json',
//         data: params
//       });
//     }
//   });
// });
