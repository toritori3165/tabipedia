// rails-ujs.js

document.addEventListener('DOMContentLoaded', function() {
  // フォームのサブミット時にAjaxリクエストを送信する
  document.querySelectorAll('form[data-remote="true"]').forEach(function(form) {
    form.addEventListener('submit', function(event) {
      event.preventDefault(); // デフォルトのフォームの送信をキャンセル
      var formData = new FormData(form); // フォームデータを取得
      var url = form.getAttribute('action'); // フォームの送信先URLを取得
      var method = form.getAttribute('method'); // HTTPメソッドを取得

      // Ajaxリクエストを送信
      fetch(url, {
        method: method,
        body: formData
      }).then(function(response) {
        // レスポンスを処理する
        if (response.ok) {
          // 成功した場合の処理
          console.log('Ajax request succeeded');
        } else {
          // エラーが発生した場合の処理
          console.error('Ajax request failed');
        }
      }).catch(function(error) {
        console.error('Ajax request error:', error);
      });
    });
  });

  // リンクのクリック時にAjaxリクエストを送信する
  document.querySelectorAll('a[data-remote="true"]').forEach(function(link) {
    link.addEventListener('click', function(event) {
      event.preventDefault(); // デフォルトのリンクのクリックをキャンセル
      var url = link.getAttribute('href'); // リンクのURLを取得

      // Ajaxリクエストを送信
      fetch(url, {
        method: 'GET'
      }).then(function(response) {
        // レスポンスを処理する
        if (response.ok) {
          // 成功した場合の処理
          console.log('Ajax request succeeded');
        } else {
          // エラーが発生した場合の処理
          console.error('Ajax request failed');
        }
      }).catch(function(error) {
        console.error('Ajax request error:', error);
      });
    });
  });
});