class Editor
  def self.set_html(constants)
    old = File.read('site/map.html')
    new = old.gsub(/key=.*\&/, "key=#{constants["api_key"]}&")
    File.open('site/map.html', "w") {|file| file.puts(new) }
  end

  def self.set_javascript(world, constants)
    `sed -i '' "s|.*//mapLocation|center: {lat: #{constants["map"]["center"]["lat"]}, lng: #{constants["map"]["center"]["lng"]}}, //mapLocation|g" 'site/js.js'`
    `sed -i '' "s|.*//mapZoom|zoom: #{constants["map"]["zoom"]}, //mapZoom|g" 'site/js.js'`
    `sed -i '' "s|.*//mapType|mapTypeId: '#{constants["map"]["type"]}' //mapType|g" 'site/js.js'`
    `sed -i '' "s|.*//lineColor|strokeColor: '#{constants["line"]["color"]}', //lineColor|g" 'site/js.js'`
    `sed -i '' "s|.*//iconColor|strokeColor: '#{constants["icon"]["color"]}' //iconColor|g" 'site/js.js'`
    `sed -i '' "s|.*//iconSpeed|}\, #{constants["icon"]["speed"]}); //iconSpeed|g" 'site/js.js'`
    `sed -i '' "/var points .*/d" 'site/js.js'`
    `echo var points = #{world.formatted_points} >> 'site/js.js'`
  end
end
