# Dr. Anser Daud — personal website

Plain HTML and CSS, rebuilt from the Weebly site so it can be hosted free on GitHub Pages.
No Weebly code, trackers or "Powered by" badge.

```
index.html        Home
research.html     Research
advocacy.html     Advocacy
media.html        Media
connect.html      Connect (contact form)
assets/css/style.css   all styling (colours and fonts are at the top)
assets/js/site.js      menu, photo viewer, contact form
images/                every picture on the site
get-images.command     one-time helper that fills the images folder
```

## 1. Fill the images folder (one time, before Weebly is switched off)

The pages are finished, but the photos still live on Weebly's servers. This step copies them onto your Mac.

1. Double-click `anserd-site.zip` in your Downloads folder. You get a folder called `anserd-site`.
2. Open Terminal: press Cmd + Space, type `Terminal`, press Return.
3. Paste this line and press Return:

       cd ~/Downloads/anserd-site && bash get-images.command

4. It takes about a minute and ends with "Done: 79 images are in the images folder."

Then double-click `index.html` to preview the whole site with photos. YouTube videos may not play in
this local preview, but they will on the live site.

## 2. Put it on GitHub Pages

1. Sign in at github.com and create a **New repository**, set to **Public**.
   Name it `YOUR-USERNAME.github.io` and the site will live at `https://YOUR-USERNAME.github.io`.
2. On the empty repository page, click **uploading an existing file**. Select everything in this folder
   (you can leave out `get-images.command`), drag it in, and click **Commit changes**.
   Chrome keeps the `images` and `assets` folders intact. The browser limit is 100 files per upload,
   and this folder is about 87 files.
3. Go to **Settings → Pages**. Under *Build and deployment*, set Source to **Deploy from a branch**,
   choose **main** and **/ (root)**, and click **Save**. The site is live a minute or two later.

Custom domain (optional): enter it under Settings → Pages → Custom domain, then at your domain registrar add
four A records for `@` pointing to 185.199.108.153, 185.199.109.153, 185.199.110.153 and 185.199.111.153,
plus a CNAME for `www` pointing to `YOUR-USERNAME.github.io`. Once the certificate is issued, tick **Enforce HTTPS**.

## 3. Contact form

Out of the box, **Submit** opens the visitor's email app with their message addressed to you.
To get messages straight to your inbox instead:

1. Make a free account at formspree.io and create a form. It gives you a URL like `https://formspree.io/f/abcdwxyz`.
2. In `connect.html`, paste it into `data-endpoint=""` on the `<form>` line and commit.

## Editing later

On GitHub, open any file and click the pencil icon. Commit, and the live site updates within a minute or two.

- **New publication:** in `research.html`, copy one `<li>…</li>` line and edit the text.
- **New op-ed:** in `advocacy.html`, copy one entry (title line, citation line, `<br/><br/>`).
- **New photo:** add it to `images/`, then copy a gallery line in `index.html` and change the file names and caption.
- **Swap a banner photo:** replace `images/hero-*.jpg` with a new photo of the same name.
- **Colours, fonts, spacing:** the variables at the top of `assets/css/style.css`.

Icons: Font Awesome Free (CC BY 4.0).
