

window.onload = function () {
	const mainSlide = document.querySelector(".mainSlide");
slideImgSrc = [
  "${pageContext.request.contextPath}/view/images/slides/slide1.jpg",
  "${pageContext.request.contextPath}/view/images/slides/slide2.jpg",
  "${pageContext.request.contextPath}/view/images/slides/slide3.jpg",
  "${pageContext.request.contextPath}/view/images/slides/slide4.jpg",
  "${pageContext.request.contextPath}/view/images/slides/slide5.jpg",
  "${pageContext.request.contextPath}/view/images/slides/slide6.jpg"
]
for(let i=0; i<slideImgSrc.length; i++) {
  let slide = document.createElement("li");
  let img = document.createElement("img");
  slide.style = ` background-repeat: no-repeat; background-position: top; background-size: contain;`;
  img.setAttribute("src", slideImgSrc[i]);
  slide.appendChild(img);
  slide.setAttribute("data-index", i);
  if(i == 0) {
    slide.classList.add("on");
  }
  mainSlide.appendChild(slide);
}

const toLeft = document.querySelector(".toLeft");
const toRight = document.querySelector(".toRight");
let disable = true;
let loopDisable = true;

const toRightFunc = () => {
  const slides = mainSlide.querySelectorAll("li");
  const slideLen = slides.length;
  const curSlide = mainSlide.querySelector(".on");
  const curIndex = curSlide.getAttribute("data-index");
  let nextIndex = 0;

  curIndex == slideLen-1
  ? nextIndex = 0
  : nextIndex = parseInt(curIndex) + 1;

  slides[nextIndex].classList.add("right");
  
  setTimeout(() => {
    curSlide.classList.add("left");
    slides[nextIndex].classList.remove("right");
    curSlide.classList.remove("on");
    slides[nextIndex].classList.add("on");

    setTimeout(() => {
      curSlide.classList.remove("left");
      disable = true;

      setTimeout(() => {
        loopDisable = true;
      }, 1000);
    }, 450)
  }, 400)
}

const toLeftFunc = () => {
  const slides = mainSlide.querySelectorAll("li");
  const slideLen = slides.length;
  const curSlide = mainSlide.querySelector(".on");
  const curIndex = curSlide.getAttribute("data-index");
  let nextIndex = 0;

  curIndex == 0
  ? nextIndex = slideLen - 1
  : nextIndex = parseInt(curIndex) - 1;

  slides[nextIndex].classList.add("left");
  
  setTimeout(() => {
    curSlide.classList.add("right");
    slides[nextIndex].classList.remove("left");
    curSlide.classList.remove("on");
    slides[nextIndex].classList.add("on");

    setTimeout(() => {
      curSlide.classList.remove("right");
      disable = true;

      setTimeout(() => {
        loopDisable = true;
      }, 1000);
    }, 450)
  }, 400)
}

setInterval(() => {
    if(loopDisable) {
      toRightFunc();
    }
  }, 5000);


if(disable) {
  disable = false;
  toRight.addEventListener("click", () => {
    loopDisable = false;
    clearInterval();
    toRightFunc();

  });

  toLeft.addEventListener("click", () => {
    loopDisable = false;
    clearInterval();
    toLeftFunc();
  });
}

const review = document.querySelector(".review");
const view = review.querySelector(".view");
const revBtnR = review.querySelector("#revBtnR");
const revBtnL = review.querySelector("#revBtnL");

  revBtnR.addEventListener("click", () => {
    revBtnL.style.display = "block";
    setTimeout(() => {
      revBtnL.classList.add("showBtn");
      revBtnR.classList.remove("showBtn");
      view.classList.add("active");
      setTimeout(() => {
        revBtnR.style.display = "none";
      },300)
    }, 100)

  });

  revBtnL.addEventListener("click", () => {
    revBtnR.style.display = "block";
    setTimeout(() => {
      revBtnR.classList.add("showBtn");
      revBtnL.classList.remove("showBtn");
      view.classList.remove("active");
      setTimeout(() => {
        revBtnL.style.display = "none";
      },300)
    }, 100)
  });
  
}

 /* const searchInput = document.querySelector(".searchInput");
  const searchBox = document.querySelector(".searchBox");
  const searchIcon = document.querySelector(".searchIcon");
  
  searchInput.addEventListener("focus", () => {
    searchBox.classList.add("onFocus");
    searchIcon.classList.add("onFocus");
  })
  searchInput.addEventListener("focusout", () => {
    searchBox.classList.remove("onFocus");
    searchIcon.classList.remove("onFocus");
  })
}*/