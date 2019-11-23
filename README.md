# CMDBrew Jekyll Theme
[![Jekyll](https://img.shields.io/badge/Jekyll-4.0-%23CB0000)](https://jekyllrb.com/news/2019/08/20/jekyll-4-0-0-released/)
[![Ruby](https://img.shields.io/badge/Ruby->2.3-%23CB0000)](https://www.ruby-lang.org/en/news/2015/12/25/ruby-2-3-0-released/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-4.3.1-563D7C)](https://getbootstrap.com/)

## Getting started
1. Add this line to your Jekyll site's `Gemfile` `gem "jekyll_cmdbrew"`
1. And add this line to your Jekyll site's `_config.yml` `theme: jekyll_cmdbrew`
1. Add bundle config for private gems `bundle config --local GITHUB__COM {GITHUB_AUTH_KEY}`. You can find this key from heroku pipeline under `BUNDLE_GITHUB__COM`
1. Run `bundle install`
1. Copy sample data files from [_data](_data) directory to your project
1. Copy sample configs `jekyll_cmdbrew` from [_config.yml](_config.yml) to your project

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

