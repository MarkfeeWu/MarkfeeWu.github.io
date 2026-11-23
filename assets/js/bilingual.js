(function () {
  function updateLanguageLink() {
    var link = document.querySelector('.language-switch');
    if (!link) return;
    var target = new URL(link.href, location.href);
    target.hash = link.dataset.preserveHash === 'true' ? location.hash : '';
    link.href = target.href;
  }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', updateLanguageLink);
  } else {
    updateLanguageLink();
  }
  window.addEventListener('hashchange', updateLanguageLink);
  window.addEventListener('pageshow', updateLanguageLink);
  document.addEventListener('click', function (event) {
    if (event.target.closest('.language-switch')) updateLanguageLink();
  });
})();
