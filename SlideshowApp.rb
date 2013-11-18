require "Gallery"

Shoes.app :width => 500, :height => 500, :title => "Slideshow" do
	background lightblue
	caption 'Slideshow by CS2'

	@g = Gallery.new
	@playing = false

	stack do
	  @img_holder = stack { image "no_image.png" }

		flow  do
			button("Add images") { @g.fetch_images(".") }
			button("Play slideshow"){ @playing = true }
			button("Pause slideshow"){ @playing = false }
		end
	end


	every 1 do
		debug "Trying to progress to the next image in the slideshow"
		if @g.is_empty? == false and @playing
		  @img_holder.clear { image @g.get_current_image }
		  @g.next_image
	  end
	end
end
