window.addEventListener('DOMContentLoaded', function() {
  var slides = document.querySelectorAll('.slide');
  var currentSlide = 0;
  var slideInterval = setInterval(nextSlide, 5000); // Change slide every 3 seconds

  function nextSlide() {
    slides[currentSlide].style.display = 'none';
    currentSlide = (currentSlide + 1) % slides.length;
    slides[currentSlide].style.display = 'block';
  }
});
