// import Sortable from 'sortablejs';
import 'jquery-ui/ui/widgets/sortable';

$(document).ready(function () {
  let action_name = $('body').data('action')
  console.log(action_name)
});

$(function () {
  // const csrfToken = document.querySelector('[name="csrf-token"]').getAttribute('content');
  console.log(csrfToken)
  return $('#sortable-procedure').sortable({
    axis: 'y',
    items: '.procedure',
    update: function (e, ui) {
      // console.log(ui)
      var item, item_data, params;
      item = ui.item;
      item_data = item.data();
      // console.log(item)
      // console.log(item_data)
      // console.log(item_data.updateUrl)

      // data属性のデータを取得する
      params = {
        _method: 'put'
      };

      // parameterを作成
      params[item_data.modelName] = {
        row_order_position: item.index()
      };

      console.log(params)

      // ranked_model用
      // 並べ替えをDBに反映(ajaxでPOST)
      return $.ajax({
        type: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': csrfToken
        },
        url: item_data.updateUrl,
        dataType: 'json',
        data: params
      });
    }
  });
});
