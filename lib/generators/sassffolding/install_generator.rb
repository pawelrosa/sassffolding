module Sassffolding
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../../templates", __FILE__)
      class_option :bootstrap, type: :boolean, desc: 'Add the Bootstrap.'
      class_option :foundation, type: :boolean, desc: 'Add the Zurb Foundation 5.'
      class_option :reset, type: :boolean, desc: 'Use css reset.'

      def create_7_directories
        %w(vars base components layout pages themes utils vendors).each do |dir|
          directory dir, "app/assets/stylesheets/#{dir}"
        end
      end

      def create_fonts_directory
        directory 'fonts', 'app/assets/fonts'
      end

      def create_normalize_file
        if options[:reset].nil?
          template '_normalize.scss', 'app/assets/stylesheets/vendors/_normalize.scss'
        end
      end

      def create_reset_file
        if options[:reset]
          template '_reset.scss', 'app/assets/stylesheets/vendors/_reset.scss'
        end
      end

      def create_shame_file
        template '_shame.scss', 'app/assets/stylesheets/_shame.scss'
      end

      def create_main_file
        body = ''
        
        # Vars
        body << batch_of_imports(%w(colors bootstrap boxmodel2), 'vars', true)

        # Bootstrap files
        if options[:bootstrap]
          body << single_import('bootstrap-sprockets')
          body << single_import('bootstrap', 'vendors')
        end

        # Foundation files
        if options[:foundation]
          body << single_import('foundation', 'vendors')
        end

        # Libs from gems
        body << batch_of_imports(%w(bourbon font-awesome-sprockets font-awesome boxmodel2), nil, true)

        # Utils
        body << batch_of_imports(%w(functions mixins helpers), 'utils')

        # Reset / normalize
        body << single_import((options[:reset] ? 'reset' : 'normalize'), 'vendors')

        # Base
        body << batch_of_imports(%w(fonts typography), 'base')

        # Layout
        body << batch_of_imports(%w(navigation header footer sections sidebar forms), 'layout')

        # Components
        body << batch_of_imports(%w(alerts badges breadcrumbs buttons dropdowns labels modals pagination panels tabs tooltips), 'components')

        # Pages
        body << batch_of_imports(%w(home contact), 'pages', true)

        # Themes
        body << batch_of_imports(%w(theme), 'themes', true)

        # Shame
        body << single_import('shame')

        filename = file_name.present? ? file_name.downcase : 'sassffolding'

        create_file "app/assets/stylesheets/#{filename}.scss", body
      end

      private

        def single_import(file, dir=nil, commented=false)
          import = ''
          import << "//" if commented
          import << "@import \"#{[dir, file].compact.join('/')}\";\n"
        end

        def batch_of_imports(files, dir=nil, commented=false)
          imports = ''
          files.each do |f|
            imports << single_import(f, dir, commented)
          end
          imports << "\n"
        end
    end
  end
end