import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Has your phone or laptop died?", "Do you need to borrow an electronic device quickly?", "Welcome friend, to devici"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
