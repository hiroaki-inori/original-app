function userDelete() {
  const popup = document.getElementById('delete-popup');
  if(!popup) return;

  const blackBg = document.getElementById('js-black-bg');
  const closeBtn = document.getElementById('js-close-btn');
  const showBtn = document.getElementById('js-show-popup');

  closePopUp(blackBg);
  closePopUp(closeBtn);
  closePopUp(showBtn);
  function closePopUp(elem) {
    if(!elem) return;
    elem.addEventListener('click', function() {
      popup.classList.toggle('is-show');
    });
  }
}

// クリックすると退会モーダルウインドウが表示
window.addEventListener('load', userDelete);