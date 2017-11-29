class Editor
  def self.set_html(constants)
    old = File.read('site/map.html')
    new = old.gsub(/key=.*\&/, "key=#{constants["api_key"]}&")
    File.open('site/map.html', "w") { |file| file.puts(new) }
  end

  def self.set_javascript(world, constants)
    `#{sed} "s|.*//mapLocation|center: {lat: #{constants["map"]["center"]["lat"]}, lng: #{constants["map"]["center"]["lng"]}}, //mapLocation|g" 'site/js.js'`
    `#{sed} "s|.*//mapZoom|zoom: #{constants["map"]["zoom"]}, //mapZoom|g" 'site/js.js'`
    `#{sed} "s|.*//mapType|mapTypeId: '#{constants["map"]["type"]}' //mapType|g" 'site/js.js'`
    `#{sed} "s|.*//lineColor|strokeColor: '#{constants["line"]["color"]}', //lineColor|g" 'site/js.js'`
    `#{sed} "s|.*//iconColor|strokeColor: '#{constants["icon"]["color"]}' //iconColor|g" 'site/js.js'`
    `#{sed} "s|.*//iconSpeed|}\, #{constants["icon"]["speed"]}); //iconSpeed|g" 'site/js.js'`
  end

  def self.set_points(file, instruction)
    case instruction
    when 'scrub'
      `#{sed} "/var points .*/d" 'site/js.js'`
    when 'start'
      file << "var points = ["
    when 'close'
      file << "];"
    end
  end

  private

  def self.sed
    @sed ||=
      case RUBY_PLATFORM
      when /darwin/
        "sed -i ''"
      when /linux/
        "sed -i"
      else
        "sed -i"
      end
  end
end
