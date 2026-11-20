/* Research page — topic filter, search, section filter and sort for the publication list */
(function () {
  "use strict";
  var root = document.querySelector(".pubs");
  if (!root) return;

  var items = Array.prototype.slice.call(root.querySelectorAll(".pubs-list > li"));
  var groups = Array.prototype.slice.call(root.querySelectorAll(".pubs-group"));
  var tabs = Array.prototype.slice.call(root.querySelectorAll(".pubs-tabs button"));
  var search = document.getElementById("pubs-search");
  var groupSel = document.getElementById("pubs-group");
  var sortSel = document.getElementById("pubs-sort");
  var status = root.querySelector(".pubs-status");
  var empty = root.querySelector(".pubs-empty");
  var topic = "all";

  function sortLists() {
    var mode = sortSel.value;
    root.querySelectorAll(".pubs-list").forEach(function (ol) {
      var lis = Array.prototype.slice.call(ol.children);
      lis.sort(function (a, b) {
        var ya = +a.getAttribute("data-year"), yb = +b.getAttribute("data-year");
        if (mode === "new" && ya !== yb) return yb - ya;
        if (mode === "old" && ya !== yb) return ya - yb;
        return +a.getAttribute("data-order") - +b.getAttribute("data-order");
      });
      lis.forEach(function (li) { ol.appendChild(li); });
    });
  }

  function apply() {
    var q = (search.value || "").trim().toLowerCase();
    var g = groupSel.value;
    var shown = 0;
    groups.forEach(function (grp) {
      var inGroup = g === "all" || grp.getAttribute("data-group") === g;
      var n = 0;
      grp.querySelectorAll(".pubs-list > li").forEach(function (li) {
        var ok = inGroup &&
          (topic === "all" || (" " + li.getAttribute("data-tags") + " ").indexOf(" " + topic + " ") !== -1) &&
          (!q || li.getAttribute("data-search").indexOf(q) !== -1);
        li.hidden = !ok;
        if (ok) n++;
      });
      grp.hidden = n === 0;
      shown += n;
    });
    var filtered = topic !== "all" || q || g !== "all";
    status.textContent = filtered ? "Showing " + shown + " of " + items.length : items.length + " entries";
    empty.hidden = shown > 0;
  }

  tabs.forEach(function (b) {
    b.addEventListener("click", function () {
      topic = b.getAttribute("data-tag");
      tabs.forEach(function (x) { x.setAttribute("aria-pressed", String(x === b)); });
      apply();
    });
  });
  search.addEventListener("input", apply);
  groupSel.addEventListener("change", apply);
  sortSel.addEventListener("change", function () { sortLists(); apply(); });
  root.querySelector(".pubs-reset").addEventListener("click", function () {
    search.value = "";
    groupSel.value = "all";
    topic = "all";
    tabs.forEach(function (x) { x.setAttribute("aria-pressed", String(x.getAttribute("data-tag") === "all")); });
    apply();
    search.focus();
  });
})();
