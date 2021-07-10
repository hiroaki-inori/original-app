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

  //ページスクロールでtop移動
  $('#page_top').on('click', function(){
    $('html, body').animate({
      'scrollTop':0
    },500
    );
  });
  //一定の位置まできたらスクロールボタン表示
  if($('.scroll-btn-show').length){
    var scrollBtnShow = $('.scroll-btn-show').offset().top;
  }
  var pageTop = $('#page_top');
  $(window).scroll(function(){
    if($(window).scrollTop() > scrollBtnShow){
      pageTop.fadeIn();
    }else{
      pageTop.fadeOut();
    }
  });  
  //「相談一覧」へスクロール移動
  $('#show-btn').on('click', function(){
    var id = $(this).attr('href');
    // console.log(id);
    var position = $(id).offset().top;
    $('html, body').animate({
      'scrollTop': position
    }, 500);
  });

});