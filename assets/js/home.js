/* Home page: turn the header line ("Orthopaedic Surgery · Research · …") into a
   vertical word wheel. The current word sits in the middle in white; the words
   above and below are smaller and dimmer. The plain line stays in the page for
   screen readers, and is what people see if they've asked for reduced motion. */
(function () {
  var line = document.querySelector(".welcome-pillars[data-words]");
  if (!line) return;
  if (window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches) return;

  var words = line.getAttribute("data-words").split("|");
  var n = words.length;
  var STEP_MS = 2200;

  // Three copies of the list so the wheel can keep turning in one direction.
  var wheel = document.createElement("div");
  wheel.className = "word-wheel";
  wheel.setAttribute("aria-hidden", "true");
  var track = document.createElement("ul");
  track.className = "word-track";
  var items = [];
  for (var c = 0; c < 3; c++) {
    for (var k = 0; k < n; k++) {
      var li = document.createElement("li");
      li.textContent = words[k];
      track.appendChild(li);
      items.push(li);
    }
  }
  wheel.appendChild(track);
  line.parentNode.insertBefore(wheel, line);
  line.parentNode.classList.add("has-wheel");

  var i = n; // start on the first word of the middle copy

  function render() {
    var row = items[0].offsetHeight;
    track.style.transform = "translateY(" + (-(i - 1) * row) + "px)";
    for (var j = 0; j < items.length; j++) {
      var d = Math.abs(j - i);
      items[j].className = d === 0 ? "is-current" : d === 1 ? "is-near" : "";
    }
  }

  function step() {
    i += 1;
    render();
  }

  // After moving into the last copy, jump back one copy without animating.
  track.addEventListener("transitionend", function (e) {
    if (e.target !== track || i < 2 * n) return;
    wheel.classList.add("is-resetting");
    i -= n;
    render();
    void track.offsetHeight; // apply the jump before turning animation back on
    wheel.classList.remove("is-resetting");
  });

  var timer = null;
  function start() { if (!timer) timer = window.setInterval(step, STEP_MS); }
  function stop() { window.clearInterval(timer); timer = null; }
  document.addEventListener("visibilitychange", function () {
    if (document.hidden) stop(); else start();
  });
  window.addEventListener("resize", function () {
    wheel.classList.add("is-resetting");
    render();
    void track.offsetHeight;
    wheel.classList.remove("is-resetting");
  });

  wheel.classList.add("is-resetting");
  render();
  void track.offsetHeight;
  wheel.classList.remove("is-resetting");
  start();
})();
