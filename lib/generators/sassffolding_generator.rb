require 'rails/generators/base'

class SassffoldingGenerator < Rails::Generators::Base

  def method_name
    create_file "app/assets/stylesheets/sassfolding.scss", "# Add initialization content here"
  end
end