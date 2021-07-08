$(function() {

  // 検索フォームをクリックすると文字が消える
  $('.search-input').on('click', function(){
    $(this).removeAttr('placeholder');
  });

});