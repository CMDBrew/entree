# CMDBrew Jekyll Theme
[![Jekyll](https://img.shields.io/badge/Jekyll-4.0-%23CB0000)](https://jekyllrb.com/news/2019/08/20/jekyll-4-0-0-released/)
[![Ruby](https://img.shields.io/badge/Ruby->2.3-%23CB0000)](https://www.ruby-lang.org/en/news/2015/12/25/ruby-2-3-0-released/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-4.3.1-563D7C)](https://getbootstrap.com/)

## Getting started
1. Add this line to your Jekyll site's `Gemfile` `gem "entree"`
1. Add this line to your Jekyll site's `_config.yml` `theme: entree`
1. Copy the plugins in [_config.yml](_config.yml) to your Jekyll site's `_config.yml`.
1. Add bundle config for private gems `bundle config --local GITHUB__COM {GITHUB_AUTH_KEY}`. You can find this key from heroku pipeline under `BUNDLE_GITHUB__COM`
1. Run `bundle install`
1. Create `Rakefile` in your project directory and add the followings:
    ```ruby
        # frozen_string_literal: true
        require 'bundler'
        Bundler.setup

        entree = Gem::Specification.find_by_name 'entree'
        load "#{entree.gem_dir}/Rakefile"
    ```
1. Run setup task— `rake entree:install`. To list out all available tasks you can run `rake -T`.
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
    entree:
      sass:
        custom_vars:
          - variables/_vars
          - variables/_bootstrap_vars
          - variables/_theme # if you are using a theme
        custom_styles:
          - custom_style
    ```
1. `custom_vars` is used for variable overrides.
1. `custom_styles` are used for additional styles that overrides defined styles.

### Customize Menus
1. Customize menus in [menus.yml](_data/menus.yml).
1. Customize the header:
    1. The header configs are under key `header`.
        1. Customize profiles under key `profiles`.
        1. Customize menus under key `menus`.
        1. Customize cta under key `cta`.
1. Customize the footer:
    1. The footer configs are under key `footer`.
        1. Customize groups under key `groups`.
        1. Customize footnote under key `footnote`.

### Enable Notices
1. Customize notices in [notices.yml](_data/notices.yml).
1. Enable Alert
    1. The alert configs are under key `alert`.
1. Enable PWA:
    1. The pwa configs are under key `pwa`.
    1. Make sure you have `pwa` enabled set to `true`.
    1. Copy [serviceworker.js](serviceworker.js) and [manifest.json](manifest.json) to your project.

### Update Locales
1. Customize locales in [locales.yml](_data/locales.yml).

### Add Social Sharing
1. Copy files in [social_feeds] to your project. For examples to enable it in your post see [2016-05-20-my-example-post.md](_posts/2016-05-20-my-example-post.md).

## Development
1. Run `gulp` to copy npm packages to `assets/vendors`.
1. Run `npm start` to compile js to `application-bundle.js`.
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

