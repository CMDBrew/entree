# CMDBrew Jekyll Theme
[![Jekyll](https://img.shields.io/badge/Jekyll-4.0-%23CB0000)](https://jekyllrb.com/news/2019/08/20/jekyll-4-0-0-released/)
[![Ruby](https://img.shields.io/badge/Ruby->2.3-%23CB0000)](https://www.ruby-lang.org/en/news/2015/12/25/ruby-2-3-0-released/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-4.3.1-563D7C)](https://getbootstrap.com/)

## Getting started
1. Add this line to your Jekyll site's `Gemfile` `gem "jekyll_cmdbrew"`
1. Add this line to your Jekyll site's `_config.yml` `theme: jekyll_cmdbrew`
1. Copy the plugins in [_config.yml](_config.yml) to your Jekyll site's `_config.yml`.
1. Add bundle config for private gems `bundle config --local GITHUB__COM {GITHUB_AUTH_KEY}`. You can find this key from heroku pipeline under `BUNDLE_GITHUB__COM`
1. Run `bundle install`
1. Copy sample data files from [_data](_data) directory to your project
1. Copy sample configs from [_config.yml](_config.yml) to your project
1. Copy [404.html](404.html) to your project.
1. Run `jekyll server` to start up server.

### Setup Netlify
For references see https://docs.netlify.com/large-media/setup/

1. Connect your site to your github repo.
1. Update your build settings
    1. Add `BUNDLE_GITHUB__COM` variable.
1. `netlify link`
1. `netlify lm:setup`
1. `git lfs track "uploads/**"`
1. Commit your settings `git add -A` and `git commit -m 'Setup Netlify Large Media'`.

### Customize Styles
1. enable custom style sheets by adding the following in your [_config.yml](_config.yml)
    ```yaml
    jekyll_cmdbrew:
      sass:
        custom_vars: 'custom_vars'
        custom_styles:
          - 'custom_style'
    ```
1. `custom_vars` is used for variable overrides.
1. `custom_styles` are used for additional styles that overrides defined styles.

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
1. Enable PWA:
    1. Copy [pwa.yml](_data/pwa.yml) to your project.
    1. Make sure you have `pwa` enabled set to `true` inside your [pwa.yml](_data/pwa.yml).
    1. Copy [serviceworker.js](serviceworker.js) and [manifest.json](manifest.json) to your project.
1. Enable Smart Banner:
    1. Copy [smartbanner.yml](_data/smartbanner.yml) to your project.
    1. Make sure you have `smartbanner` enabled set to `true` inside your [installs.yml](_data/smartbanner.yml).

### Update translations
1. Copy [translations.yml](_data/translations.yml) to your project.

### Add Social Sharing
1. Copy files in [social_feeds] to your project. For examples to enable it in your post see [2016-05-20-my-example-post.md](_posts/2016-05-20-my-example-post.md).

### Cookies Policy
1. Enable Cookies Policy by setting `cookies_policy: true` inside `jekyll_cmdbrew` in [_config.yml](_config.yml)
    ```yaml
    jekyll_cmdbrew:
      cookies_policy: true
    ```

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

