require 'i18n'
glob = Dir.glob(File.dirname(File.expand_path(__FILE__)))
I18n.config.load_path += Dir[File.join(glob, 'locales', '*.yml')]

require 'date'
require 'csv'

require 'chinese_zodiac/chinese_zodiac'
