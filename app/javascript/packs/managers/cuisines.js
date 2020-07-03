$(document).ready(function () {
  let action_name = $('body').data('action')
  console.log(action_name)
});

$(function () {
  var el, sortable;
  el = document.getElementById("sortable-procedure");
  if (el !== null) {
    return sortable = Sortable.create(el, {
      delay: 200,
      onUpdate: function (evt) {
        return $.ajax({
          url: 'managers/procedures/' + $("#parent_id").val() + '/sort',
          type: 'patch',
          data: {
            from: evt.oldIndex,
            to: evt.newIndex
          }
        });
      }
    });
  }
});

// $(function () {
//   // UIをならべかえる要素(ここから)
//   var el, sortable;
//   el = $(".table-sortable-procedure");
//   if (el !== null) {
//     return sortable = Sortable.create(el, {
//       delay: 200,
//   // UIをならべかえる要素(ここまで)
//       return $.ajax({
//         type: 'PUT',
//         url: '/',
//         dataType: 'json'
//         data:
//       })

//     });
//   }
// });



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
