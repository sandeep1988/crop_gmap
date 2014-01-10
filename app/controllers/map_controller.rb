class MapController < ApplicationController
  def index
  	 @map = MapLayers::Map.new("map") do |map, page|
    page << map.add_layer(MapLayers::GOOGLE)
    page << map.zoom_to_max_extent()
  end
  end
end
