# <rep>

This repository contains the resources and source code of the <proj> website.

## Social Media

* **[Facebook](https://www.facebook.com/<proj>/)**
* **[Instagram](https://www.instagram.com/<proj>/)**

## Preview

* **[Live Preview (GitHub Pages)](https://<user>.github.io/<rep>/)**
* **[<proj> Website](https://www.<proj>.com.br/)**

## Status

[![Build Status](https://travis-ci.org/<user>/<rep>.svg?branch=master)](https://travis-ci.org/<user>/<rep>)
[![dependencies Status](https://david-dm.org/<user>/<rep>/status.svg)](https://david-dm.org/<user>/<rep>)
[![devDependencies Status](https://david-dm.org/<user>/<rep>/dev-status.svg)](https://david-dm.org/<user>/<rep>?type=dev)

## Download and Installation

To begin using this website, choose one of the following options to get started:

* Clone the repo: `git clone https://github.com/<user>/<rep>.git`
* [Fork, Clone, or Download on GitHub](https://github.com/<user>/<rep>)

## Usage

### Basic Usage

After downloading, simply edit the HTML, CSS and JS files included with the website in a code editor to make changes. These are the only files you need to worry about, you can ignore everything else! To preview the changes you make to the code, you can open the `index.html` file in your web browser.

### Advanced Usage

After downloading, run `npm install` and then run `npm start` (or `gulp watch`) which will open up a preview of the website in your default browser, watch for changes to core website files, and live reload the browser when changes are saved. You can view the `gulpfile.js` to see which tasks are included with the dev environment.

#### Gulp Tasks

- `gulp` the default task that builds everything
- `gulp watch` browserSync opens the project in your default browser and live reloads when changes are made
- `gulp html` replaces keywords and minifies the HTML files
- `gulp css` minifies the CSS files
- `gulp js` minifies the themes JS files
- `gulp img` compress image files
- `gulp vendor` copies dependencies from node_modules to the vendor directory

You must have npm and Gulp installed globally in order to use these features.

## Bugs and Issues

Have a bug or an issue with this website? [Open a new issue](https://github.com/<user>/<rep>/issues) here on GitHub.

## About

This repository was created by and is maintained by **[<autor>](https://github.com/<user>/)**. To see more projects, visit [portfolio](https://<user>.github.io/).
