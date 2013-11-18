class Gallery

	# Constructor for the Gallery class. Initialize your variables here.
	def initialize
		debug "Gallery initialized."
    @images = fetch_images('.')
    @index = 0
  end

	# List all of the images in the gallery
	# @return A String listing all of the images in the gallery
	def list_all
		debug "Listing all of the images here!"
    return @images
	end

	# Is the gallery currently empty?
	# @return True or false if the gallery is currently empty
	def is_empty?
    debug "Checking if the gallery is empty..."
    if @images.length > 0
      return false
    else
      return true
    end
  end

  def fetch_images(dir)
    sub_dirs = get_subdirectories(dir)
    imgs =  get_images_in_current_folder(dir)
    sub_dirs.each do |d|
      imgs = imgs + fetch_images(d)
    end
    return imgs
  end


  ################################################
  ########       Add your own      ###############
  ################################################

  def get_current_image
    return @images[@index]
  end

  def next_image
    if @index < @images.length-1
      @index += 1
    else
      @index = 0
    end
  end

  ################################################
  ########       Helper methods   ################
  ################################################

  # A helper method that returns all folders in a given directory
  # @param dir The directory to search through
  # @return An array of File objects which are subdirectories of the directory passed in
  def get_subdirectories(dir)
    d = Dir.entries(dir) - [".", ".."]
    return d.map { |f| File.join(dir, f) }.select { |f| File.directory? f }
  end

	# A helper method that returns all .jpg and .jpeg files in a given directory
  # @param dir The directory to search through
  # @return An array of File objects which are .jpgs and .jpegs
	def get_images_in_current_folder(dir)
	  f = Dir.entries(dir) - [".", ".."]
	  tmp = f.map { |f| File.join(dir, f) }.select { |f| !File.directory? f and [".jpg", ".jpeg"].include? File.extname f }
	  return tmp
  end
end
