/* Advocacy page — topic filter and search for the writing grid */
(function () {
  "use strict";
  var grid = document.querySelector(".writing-grid");
  if (!grid) return;

  var cards = Array.prototype.slice.call(grid.querySelectorAll(".piece"));
  var buttons = Array.prototype.slice.call(document.querySelectorAll(".writing-tabs button"));
  var input = document.getElementById("writing-search");
  var status = document.querySelector(".writing-status");
  var empty = document.querySelector(".writing-empty");
  var topic = "all";

  function apply() {
    var q = (input.value || "").trim().toLowerCase();
    var shown = 0;
    cards.forEach(function (c) {
      var ok = (topic === "all" || c.getAttribute("data-topic") === topic) &&
               (!q || c.getAttribute("data-search").indexOf(q) !== -1);
      c.hidden = !ok;
      if (ok) shown++;
    });
    status.textContent = (topic === "all" && !q) ? "" : "Showing " + shown + " of " + cards.length;
    empty.hidden = shown > 0;
  }

  function setTopic(t) {
    topic = t;
    buttons.forEach(function (b) {
      b.setAttribute("aria-pressed", String(b.getAttribute("data-topic") === t));
    });
    apply();
  }

  buttons.forEach(function (b) {
    b.addEventListener("click", function () { setTopic(b.getAttribute("data-topic")); });
  });
  input.addEventListener("input", apply);
  document.querySelector(".writing-reset").addEventListener("click", function () {
    input.value = "";
    setTopic("all");
    input.focus();
  });
})();
