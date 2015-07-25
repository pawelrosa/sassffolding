# sassffolding

`sassffolding` generates architecture of css based on [The 7-1 Pattern](http://sass-guidelin.es/#the-7-1-pattern)
with some my modification. I removed `_variables.scss` from `utils` directory and added `vars` directoy instead which
contains diffrent files of variables. In this way The 7-1 Pattern became 8-1 pattern.

`
stylesheets/
|
|- base/
| |- _fonts.scss
| |- _typography.scss
|
|-  components/
|  |- _alerts.scss
|  |- _badges.scss
|  |- _breadcrumbs.scss
|  |- _buttons.scss
|  |- _dropdowns.scss
|  |- _labels.scss
|  |- _modals.scss
|  |- _pagination.scss
|  |- _panels.scss
|  |- _tabs.scss
|  |- _tooltips.scss
|
|- layout/
|  |- _footer.scss
|  |- _forms.scss
|  |- _header.scss
|  |- _navigation.scss
|  |- _sections.scss
|  |- _sidebar.scss
|
|- pages/
|  |-  _contact.scss
|  |- _home.scss
|
|- themes/
|  |- _theme.scss
|
|- utils/
|  |- _function.scss
|  |- _helpers.scss
|  |- _mixins.scss
|
|- vars/
|  |- _bootstrap.scss
|  |- _boxmodel2.scss
|  |- _colors.scss
|
|- vendors/
|  |- _bootstrap.scss
|  |- _foundation.scss
|
|- file_name.scss
`

`rails generate sassffolding:install FILE_NAME`

`rails generate sassffolding:install FILE_NAME --bootstrap`

`rails generate sassffolding:install FILE_NAME --foundation`

By default `sassffolding` uses [css normalization](github.com/necolas/normalize.css). If you want to reset all styles using Eric Meyer's [Reset CSS](http://meyerweb.com/eric/tools/css/reset/) try:
`rails generate sassffolding:install FILE_NAME --reset`