$(function() {

  // 検索フォームをクリックすると文字が消える
  $('.search-input').on('click', function(){
    $(this).removeAttr('placeholder');
  });

  // ユーザー情報のアコーディオンメニュー
  $('.user-info').hover(
    function(){
      $('.list').stop().slideDown();
    },
    function(){
      $('.list').slideUp();
  });

});