#!/bin/bash
# get-images.command
# Downloads every image the site uses from anserd.weebly.com into the "images" folder.
# Run it once, while the Weebly site is still published.
#
#   How to run (Mac): open Terminal, type  bash  followed by a space,
#   drag this file into the Terminal window, then press Return.

cd "$(dirname "$0")" || exit 1
mkdir -p images
UA="Mozilla/5.0 (Macintosh) site-migration"
got=0
failed=""

get() {
  local name="$1"; shift
  local out="images/$name"
  if [ -s "$out" ]; then got=$((got+1)); return; fi
  for url in "$@"; do
    if curl -fsSL -A "$UA" --retry 2 -o "$out.part" "$url" 2>/dev/null; then
      case "$(file --mime-type -b "$out.part")" in
        image/*) mv "$out.part" "$out"; got=$((got+1)); echo "  ok   $name"; return ;;
      esac
    fi
  done
  rm -f "$out.part"
  failed="$failed\n  $name"
}

echo "Downloading images from anserd.weebly.com ..."
get "01-cosmec-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/01-cosmec-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/01-cosmec-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/01-cosmec-transparent.png"
get "01-cosmec-transparent_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/01-cosmec-transparent_orig.png"
get "02-executive-chief-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/02-executive-chief-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/02-executive-chief-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/02-executive-chief-transparent.png"
get "02-executive-chief-transparent_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/02-executive-chief-transparent_orig.png"
get "03-research-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/03-research-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/03-research-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/03-research-transparent.png"
get "03-research-transparent_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/03-research-transparent_orig.png"
get "04-awards-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/04-awards-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/04-awards-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/04-awards-transparent.png"
get "04-awards-transparent_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/04-awards-transparent_orig.png"
get "0428a078-f96e-4a8b-9bcf-655e20e551c8-snapseedcopy.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/0428a078-f96e-4a8b-9bcf-655e20e551c8-snapseedcopy.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/0428a078-f96e-4a8b-9bcf-655e20e551c8-snapseedcopy.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/0428a078-f96e-4a8b-9bcf-655e20e551c8-snapseedcopy.jpg"
get "0428a078-f96e-4a8b-9bcf-655e20e551c8-snapseedcopy_orig.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/0428a078-f96e-4a8b-9bcf-655e20e551c8-snapseedcopy_orig.jpg"
get "0428a078-f96e-4a8b-9bcf-655e20e551c8.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/0428a078-f96e-4a8b-9bcf-655e20e551c8.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/0428a078-f96e-4a8b-9bcf-655e20e551c8.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/0428a078-f96e-4a8b-9bcf-655e20e551c8.jpg"
get "0428a078-f96e-4a8b-9bcf-655e20e551c8_orig.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/0428a078-f96e-4a8b-9bcf-655e20e551c8_orig.jpg"
get "05-community-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/05-community-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/05-community-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/05-community-transparent.png"
get "05-community-transparent_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/05-community-transparent_orig.png"
get "06-golden-scalpel-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/06-golden-scalpel-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/06-golden-scalpel-transparent.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/06-golden-scalpel-transparent.png"
get "06-golden-scalpel-transparent_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/06-golden-scalpel-transparent_orig.png"
get "0e4e01e0-9124-4c14-8c31-0dbd636fb063.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/0e4e01e0-9124-4c14-8c31-0dbd636fb063.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/0e4e01e0-9124-4c14-8c31-0dbd636fb063.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/0e4e01e0-9124-4c14-8c31-0dbd636fb063.jpg"
get "0e4e01e0-9124-4c14-8c31-0dbd636fb063_orig.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/0e4e01e0-9124-4c14-8c31-0dbd636fb063_orig.jpg"
get "2e784cb1-21f1-47e2-a869-067fa4d72c81.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/2e784cb1-21f1-47e2-a869-067fa4d72c81.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/2e784cb1-21f1-47e2-a869-067fa4d72c81.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/2e784cb1-21f1-47e2-a869-067fa4d72c81.jpg"
get "2e784cb1-21f1-47e2-a869-067fa4d72c81_orig.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/2e784cb1-21f1-47e2-a869-067fa4d72c81_orig.jpg"
get "bg-home-gallery.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/background-images/882778513.jpg"
get "bg-home-quote.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/background-images/1247259080.jpg"
get "chch-logo-pos-rgb-web.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/chch-logo-pos-rgb-web.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/chch-logo-pos-rgb-web.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/chch-logo-pos-rgb-web.png"
get "divider-graphic_2_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/divider-graphic_2_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/divider-graphic_2_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/divider-graphic_2_orig.png"
get "four-university-logos-on-transparent-background.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/four-university-logos-on-transparent-background.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/four-university-logos-on-transparent-background.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/four-university-logos-on-transparent-background.png"
get "gold-award-certificate-with-centered-name-1.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/gold-award-certificate-with-centered-name-1.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/gold-award-certificate-with-centered-name-1.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/gold-award-certificate-with-centered-name-1.png"
get "gold-award-certificate-with-centered-name-1_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/gold-award-certificate-with-centered-name-1_orig.png"
get "hero-advocacy.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/background-images/1692792905.jpg"
get "hero-connect.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/background-images/1119582683.jpg"
get "hero-home.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/background-images/1687039184.jpg"
get "hero-media.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/background-images/1589138118.jpg"
get "hero-research.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/background-images/1467671523.jpg"
get "img-0978.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/img-0978.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/img-0978.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/img-0978.jpg"
get "img-0978_orig.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/img-0978_orig.jpg"
get "img-1549-published.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/img-1549.jpeg"
get "img-1549.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/img-1549.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/img-1549.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/img-1549.jpeg"
get "img-1549_orig.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/img-1549_orig.jpeg"
get "img-5405.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/img-5405.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/img-5405.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/img-5405.jpg"
get "img-6265-square.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/img-6265-square.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/img-6265-square.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/img-6265-square.jpg"
get "img-6439.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/img-6439.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/img-6439.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/img-6439.jpg"
get "img-6439_orig.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/img-6439_orig.jpg"
get "img-7259.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/img-7259.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/img-7259.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/img-7259.jpg"
get "img-7259_orig.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/img-7259_orig.jpg"
get "img-7792.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/img-7792.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/img-7792.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/img-7792.jpeg"
get "img-7792_orig.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/img-7792_orig.jpeg"
get "js.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/js.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/js.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/js.jpg"
get "js_orig.jpg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/js_orig.jpg"
get "leaps-bounds_1_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/leaps-bounds_1_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/leaps-bounds_1_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/leaps-bounds_1_orig.png"
get "pic-final.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/pic-final.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/pic-final.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/pic-final.png"
get "pic-final_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/pic-final_orig.png"
get "screenshot-2026-11-15-at-10-09-32-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-10-09-32-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-15-at-10-09-32-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-15-at-10-09-32-pm.png"
get "screenshot-2026-11-15-at-10-09-32-pm_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-10-09-32-pm_orig.png"
get "screenshot-2026-11-15-at-10-09-43-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-10-09-43-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-15-at-10-09-43-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-15-at-10-09-43-pm.png"
get "screenshot-2026-11-15-at-10-09-43-pm_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-10-09-43-pm_orig.png"
get "screenshot-2026-11-15-at-10-09-57-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-10-09-57-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-15-at-10-09-57-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-15-at-10-09-57-pm.png"
get "screenshot-2026-11-15-at-10-09-57-pm_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-10-09-57-pm_orig.png"
get "screenshot-2026-11-15-at-11-17-52-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-15-at-11-17-52-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-11-17-52-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-15-at-11-17-52-pm.png"
get "screenshot-2026-11-15-at-11-18-49-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-15-at-11-18-49-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-11-18-49-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-15-at-11-18-49-pm.png"
get "screenshot-2026-11-15-at-11-19-22-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-15-at-11-19-22-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-11-19-22-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-15-at-11-19-22-pm.png"
get "screenshot-2026-11-15-at-11-20-27-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-11-20-27-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-15-at-11-20-27-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-15-at-11-20-27-pm.png"
get "screenshot-2026-11-15-at-11-23-31-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-15-at-11-23-31-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-11-23-31-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-15-at-11-23-31-pm.png"
get "screenshot-2026-11-15-at-11-23-35-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-11-23-35-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-15-at-11-23-35-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-15-at-11-23-35-pm.png"
get "screenshot-2026-11-15-at-11-25-02-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-15-at-11-25-02-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-11-25-02-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-15-at-11-25-02-pm.png"
get "screenshot-2026-11-15-at-11-26-26-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-15-at-11-26-26-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-11-26-26-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-15-at-11-26-26-pm.png"
get "screenshot-2026-11-15-at-11-28-31-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-15-at-11-28-31-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-11-28-31-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-15-at-11-28-31-pm.png"
get "screenshot-2026-11-15-at-8-58-53-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-8-58-53-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-15-at-8-58-53-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-15-at-8-58-53-pm.png"
get "screenshot-2026-11-15-at-8-58-53-pm_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-15-at-8-58-53-pm_orig.png"
get "screenshot-2026-11-16-at-1-09-22-am.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-16-at-1-09-22-am.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-16-at-1-09-22-am.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-16-at-1-09-22-am.png"
get "screenshot-2026-11-16-at-12-23-52-am.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-16-at-12-23-52-am.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-16-at-12-23-52-am.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-16-at-12-23-52-am.png"
get "screenshot-2026-11-16-at-12-23-52-am_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-16-at-12-23-52-am_orig.png"
get "screenshot-2026-11-17-at-1-40-57-pm_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-17-at-1-40-57-pm_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-17-at-1-40-57-pm_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-17-at-1-40-57-pm_orig.png"
get "screenshot-2026-11-17-at-11-53-02-am_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-17-at-11-53-02-am_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-17-at-11-53-02-am_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-17-at-11-53-02-am_orig.png"
get "screenshot-2026-11-17-at-12-06-12-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-17-at-12-06-12-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-17-at-12-06-12-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-17-at-12-06-12-pm.png"
get "screenshot-2026-11-17-at-2-10-41-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-17-at-2-10-41-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/screenshot-2026-11-17-at-2-10-41-pm.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/screenshot-2026-11-17-at-2-10-41-pm.png"
get "screenshot-2026-11-17-at-2-10-41-pm_orig.png" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/screenshot-2026-11-17-at-2-10-41-pm_orig.png"
get "whatsapp-image-2025-05-27-at-21-42-01.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/whatsapp-image-2025-05-27-at-21-42-01.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/whatsapp-image-2025-05-27-at-21-42-01.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/whatsapp-image-2025-05-27-at-21-42-01.jpeg"
get "whatsapp-image-2025-05-27-at-21-42-01_orig.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/whatsapp-image-2025-05-27-at-21-42-01_orig.jpeg"
get "whatsapp-image-2025-06-13-at-17-02-48.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/whatsapp-image-2025-06-13-at-17-02-48.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/published/whatsapp-image-2025-06-13-at-17-02-48.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/editor/whatsapp-image-2025-06-13-at-17-02-48.jpeg"
get "whatsapp-image-2025-06-13-at-17-02-48_orig.jpeg" "https://anserd.weebly.com/uploads/1/3/1/8/131863738/whatsapp-image-2025-06-13-at-17-02-48_orig.jpeg"

echo
echo "Done: $got images are in the images folder."
if [ -n "$failed" ]; then
  echo "These could not be downloaded (save them from the Weebly site by hand):"
  printf '%b\n' "${failed#\\n}"
fi
