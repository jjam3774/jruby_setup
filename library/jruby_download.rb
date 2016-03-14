class Chef::Recipe::JRubyDownload
  def self.download
    require "open-uri"
    FILES = [ "jruby-bin-1.7.24.tar.gz" ]

    FILES.each{|rpm|
      open(rpm, 'wb') do |file|
        puts "Downloading #{rpm}"
        file << open("https://s3.amazonaws.com/jruby.org/downloads/1.7.24/#{rpm}").read
      end
    }
  end
end