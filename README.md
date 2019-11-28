# CMDBrew Jekyll Theme
[![Jekyll](https://img.shields.io/badge/Jekyll-4.0-%23CB0000)](https://jekyllrb.com/news/2019/08/20/jekyll-4-0-0-released/)
[![Ruby](https://img.shields.io/badge/Ruby->2.3-%23CB0000)](https://www.ruby-lang.org/en/news/2015/12/25/ruby-2-3-0-released/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-4.3.1-563D7C)](https://getbootstrap.com/)

## Getting started
1. Add this line to your Jekyll site's `Gemfile` `gem "jekyll_cmdbrew"`
1. Add this line to your Jekyll site's `_config.yml` `theme: jekyll_cmdbrew`
1. Copy the following plugins to your Jekyll site's `_config.yml`
    ```yaml
      plugins:
        - jekyll_cmdbrew
        - jekyll-feed
        - jekyll-paginate
        - jekyll-seo-tag
        - jekyll-sitemap
        - jekyll-tagging-related_posts
    ```
1. Add bundle config for private gems `bundle config --local GITHUB__COM {GITHUB_AUTH_KEY}`. You can find this key from heroku pipeline under `BUNDLE_GITHUB__COM`
1. Run `bundle install`
1. Copy sample data files from [_data](_data) directory to your project
1. Copy sample configs from [_config.yml](_config.yml) to your project
1. Copy [404.html](404.html) to your project.
1. Run `jekyll server` to start up server.

### Customize Styles
1. Copy [main.scss](assets/main.scss) to your project.
1. Copy variables inside [_custom.scss](_sass/variables/_custom.scss) to your project and put them before `@import styles;`

### Customize Aside
1. Copy [installs.yml](_data/aside.yml) to your project.
1. Customize the call to action:
    1. The call to action is under key `call_to_action`.
1. Customize actions:
    1. The action items are under key `actions`.
1. Customize social links:
    1. The action items are under key `socials`.
    1. We are using FontAwesome 5. You can use free icons from https://fontawesome.com/icons?d=gallery&m=free.
    1. You can search social network brand colors from https://brandcolors.net/.
1. Customize the footnote:
    1. The footnote is under key `footnote`.

### Enable Installs
1. Copy [installs.yml](_data/installs.yml) to your project.
1. Enable PWA:
    1. Make sure you have `pwa` enabled set to `true` inside your [installs.yml](_data/installs.yml).
    1. Copy [serviceworker.js](serviceworker.js) and [manifest.json](manifest.json) to your project.
1. Enable Smart Banner:
    1. Make sure you have `smartbanner` enabled set to `true` inside your [installs.yml](_data/installs.yml).

### Update languages
1. Copy [languages.yml](_data/languages.yml) to your project.

## Development
1. Run `gulp` to copy npm packages to `assets/vendors`.
1. Run `npm start` to compile js to `main-bundle.js`.
1. Run `jekyll server` to start the server.

## Frameworks
Framework       | Description
----------------| -----------
[Bootstrap]     | Frontend framework

## Reports
Framework       | Description
----------------| -----------
[LicenseFinder] | List out gem licenses `bundle exec license_finder report --format html > licenses.html`.
[Inch]          | See documentation analytics by running `inch`.

[Bootstrap]: https://img.shields.io/badge/Bootstrap-4.3.1-563D7C
[LicenseFinder]: https://github.com/pivotal/LicenseFinder
[Inch]: https://github.com/rrrene/inch

## License
Please see [LICENSE](LICENSE) for licensing details.

