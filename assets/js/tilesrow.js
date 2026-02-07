const tiles = document.querySelectorAll('.tilesrow-tile');

const options = {
  threshold: 0.6  // 60% of the screen to activate
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      tiles.forEach(t => t.classList.remove('active'));
      entry.target.classList.add('active');
    }
  });
}, options);

tiles.forEach(tile => observer.observe(tile));