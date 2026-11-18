/* Dr. Anser Daud — site behaviour: header, mobile menu, photo lightbox, contact form. */
(function () {
  "use strict";

  /* Header turns solid once you scroll past the banner */
  var header = document.querySelector(".site-header");
  function onScroll() {
    if (header) header.classList.toggle("scrolled", window.scrollY > 40);
  }
  onScroll();
  window.addEventListener("scroll", onScroll, { passive: true });

  /* Mobile menu */
  var toggle = document.querySelector(".menu-toggle");
  var mobileNav = document.getElementById("mobile-nav");
  function setMenu(open) {
    toggle.setAttribute("aria-expanded", String(open));
    mobileNav.hidden = !open;
    document.body.classList.toggle("nav-open", open);
  }
  if (toggle && mobileNav) {
    toggle.addEventListener("click", function () {
      setMenu(toggle.getAttribute("aria-expanded") !== "true");
    });
    mobileNav.addEventListener("click", function (e) {
      if (e.target.closest("a")) setMenu(false);
    });
  }

  /* Photo lightbox for every .gallery on the page */
  var lb = document.getElementById("lightbox");
  if (lb) {
    var lbImg = lb.querySelector("img");
    var lbCap = lb.querySelector("figcaption");
    var items = [];
    var index = 0;

    function show(i) {
      index = (i + items.length) % items.length;
      var a = items[index];
      lbImg.src = a.getAttribute("href");
      lbImg.alt = a.querySelector("img").alt || "";
      var cap = a.getAttribute("data-caption") || "";
      lbCap.textContent = cap;
      lbCap.hidden = !cap;
      lb.querySelector(".lb-prev").hidden = items.length < 2;
      lb.querySelector(".lb-next").hidden = items.length < 2;
    }
    function open(list, i) {
      items = list;
      show(i);
      lb.hidden = false;
      document.body.classList.add("nav-open");
      lb.querySelector(".lb-close").focus();
    }
    function close() {
      lb.hidden = true;
      lbImg.src = "";
      document.body.classList.remove("nav-open");
    }

    document.querySelectorAll(".gallery").forEach(function (g) {
      var links = Array.prototype.slice.call(g.querySelectorAll("a"));
      links.forEach(function (a, i) {
        a.addEventListener("click", function (e) {
          e.preventDefault();
          open(links, i);
        });
      });
    });

    lb.querySelector(".lb-close").addEventListener("click", close);
    lb.querySelector(".lb-prev").addEventListener("click", function () { show(index - 1); });
    lb.querySelector(".lb-next").addEventListener("click", function () { show(index + 1); });
    lb.addEventListener("click", function (e) { if (e.target === lb) close(); });
    document.addEventListener("keydown", function (e) {
      if (lb.hidden) return;
      if (e.key === "Escape") close();
      if (e.key === "ArrowLeft") show(index - 1);
      if (e.key === "ArrowRight") show(index + 1);
    });
  }

  /* Contact form.
     If data-endpoint is filled in (e.g. a Formspree URL), messages are sent there.
     If it's empty, the visitor's email app opens with the message ready to send. */
  var form = document.getElementById("contact-form");
  if (form) {
    var status = form.querySelector(".form-status");
    var button = form.querySelector("button[type=submit]");
    var fallbackEmail = form.getAttribute("data-fallback-email");

    form.addEventListener("submit", function (e) {
      e.preventDefault();
      if (!form.reportValidity()) return;

      var data = new FormData(form);
      var endpoint = (form.getAttribute("data-endpoint") || "").trim();

      if (!endpoint) {
        var name = ((data.get("first_name") || "") + " " + (data.get("last_name") || "")).trim();
        var subject = "Website message from " + name;
        var body = (data.get("message") || "") + "\n\n— " + name + " (" + (data.get("email") || "") + ")";
        window.location.href = "mailto:" + fallbackEmail +
          "?subject=" + encodeURIComponent(subject) +
          "&body=" + encodeURIComponent(body);
        status.textContent = "Your email app should open with your message ready to send.";
        return;
      }

      button.disabled = true;
      status.textContent = "Sending…";
      fetch(endpoint, { method: "POST", body: data, headers: { Accept: "application/json" } })
        .then(function (r) {
          if (!r.ok) throw new Error("Bad response");
          form.reset();
          status.textContent = "Thank you — your message has been sent.";
        })
        .catch(function () {
          status.innerHTML = "Sorry, something went wrong. Please email me directly at " +
            '<a href="mailto:' + fallbackEmail + '">' + fallbackEmail + "</a>.";
        })
        .then(function () { button.disabled = false; });
    });
  }

  /* Keep the footer year current */
  var year = document.getElementById("year");
  if (year) year.textContent = new Date().getFullYear();
})();
