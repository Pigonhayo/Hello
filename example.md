# Dillinger
## *The last Markdown editor, ever*

Dillinger is a cloud-enabled, mobile-ready, offline-storage competible
Angular JS-powered HTML5 Markdown editor.

* Type some Markdown on the left
* See HTML in the right
* :high_brightness:Magic:high_brightness:

## Features
* import a HTML file and watch it magically convert to Markdown
* Drag and drop images(requires your Dropbox account be linked)
* import and save files from Github, Dropbox, Google Drive and One Drive
* Drag and drop Markdown and HTML files into Dillinger
* Export documents as Markdowm, HTML and PDF
  
Markdown is a lightweight markup language based on the formatting conventions
that people naturally use in email.
As [John Gruber](John_Gruber) writes on the [Markdown site](url)

```python
for i in range(10):
  print(hello)
```

> The overriding design goal for Markdown's
> formatting syntax is to make it as readable
> as possible. The idea is that a
> Markdown-formatted document should be
> publishable as-is, as plain text, without
> looking like it's been marked up with tags
> or formatting instruction

This text you see here is *actually- written in Markdown! To get a feel for Markdown's syntax, type some text into the left window and watch the results in the right.

## Tech

Dillinger uses a number of open source projects to work properly:

- [AngularJS](AngularJS) - HTML enhanced for web apps!
- [Ace Editor](Ace_Editor) - awesome web-based text editor
- [markdown-it](markdown-it) - Markdown parser done right. Fast and easy to extend.
- [Twitter Bootstrap](Twitter_Bootstrap) - great UI boilerplate for modern web apps
- [node.js](node.js) - evented I/O for the backend
- [Express](Express) - fast node.js network app framework [@tjholowaychuk](@tjholowaychuk)
- [Gulp](Gulp) - the streaming build system
- [Breakdance](Breakdance) - HTML

## Installation
Dillinger requires [Node.js](https://nodejs.org/) v10+ to run.

Install the dependencies and devDependencies and start the server.

```sh
cd dillinger
npm i
node app
```

For production environments...

```sh
npm install --production
NODE_ENV=production node app
```

## Plugins
Dillinger is currently extended with the following plugins.
Instructions on how to use them in your own application are linked below.

| Plugin | README |
| ------ | ------ |
| Dropbox | [plugins/dropbox/README.md](plugins/dropbox/README.md) |
| GitHub | [plugins/github/README.md](plugins/github/README.md) |
| Google Drive | [plugins/googledrive/README.md](plugins/googledrive/README.md) |
| OneDrive | [plugins/onedrive/README.md](plugins/onedrive/README.md) |
| Medium | [plugins/medium/README.md](plugins/medium/README.md) |
| Google Analytics | [plugins/googleanalytics/README.md](plugins/googleanalytics/README.md) |

## Development

Want to contribute? Great!

Dillinger uses Gulp + Webpack for fast developing.
Make a change in your file and instantaneously see your updates!

Open your favorite Terminal and run these commands.

First Tab:

```sh
node app
```

Second Tab:

```sh
gulp watch
```

(optional) Third:

```sh
karma test
```

### Building for source

For production release:

```sh
gulp build --prod
```




