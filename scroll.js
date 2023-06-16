function scrollPage() {
  window.scrollBy(0, 100);
  if ((window.innerHeight + window.scrollY) < document.body.offsetHeight) {
    setTimeout(scrollPage, 200);
  }
}
scrollPage();
