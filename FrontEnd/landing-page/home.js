


  // Mobile Menu Toggle
  const menuBtn = document.getElementById('menu-btn');
  const mobileMenu = document.getElementById('mobile-menu');
  menuBtn.addEventListener('click', () => {
    mobileMenu.classList.toggle('hidden');
  });

  // Shopping Cart Button (dynamically updates count + shows toast)
  const cartBtn = document.getElementById('cart-btn');
  const cartCount = document.getElementById('cart-count');
  let count = 0;

  cartBtn.addEventListener('click', (e) => {
    e.preventDefault();
    
    // Example logic: Increment cart count
    
    cartCount.innerText = count;
    

    // Toast message
    const cartToast = document.createElement('div');
    cartToast.innerText = "Cart is Empty!";
    cartToast.className = "fixed top-20 right-5 bg-blue-600 text-white px-4 py-2 rounded shadow-lg transition-opacity duration-300";
    document.body.appendChild(cartToast);

    setTimeout(() => {
      cartToast.classList.add('opacity-0');
      setTimeout(() => cartToast.remove(), 300);
    }, 2000);
  });

  // Slideshow
  const slideImg = document.getElementById('slide-img');
  const slides = [
    "../landing-page/images/image-01.jpg",
    "../landing-page/images/image-02.jpg",
    "../landing-page/images/image-03.jpg",
    "../landing-page/images/image-04.jpg",
    "../landing-page/images/image-05.jpg"
  ];
  let currentSlide = 0;

  const showSlide = (index) => {
    slideImg.classList.add('opacity-0');
    setTimeout(() => {
      slideImg.src = slides[index];
      slideImg.classList.remove('opacity-0', 'scale-95');
    }, 500);
  };

  const nextSlide = () => {
    currentSlide = (currentSlide + 1) % slides.length;
    showSlide(currentSlide);
  };

  const prevSlide = () => {
    currentSlide = (currentSlide - 1 + slides.length) % slides.length;
    showSlide(currentSlide);
  };

  document.getElementById('next-slide').addEventListener('click', () => {
    nextSlide();
    resetInterval();
  });

  document.getElementById('prev-slide').addEventListener('click', () => {
    prevSlide();
    resetInterval();
  });

  let slideInterval;

  const startInterval = () => {
    slideInterval = setInterval(nextSlide, 5000);
  };

  const resetInterval = () => {
    clearInterval(slideInterval);
    startInterval();
  };

  // Start
  showSlide(currentSlide);
  startInterval();


