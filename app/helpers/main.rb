class Main < Monk::Glue
  helpers do
    RANDOM_IMG_PATH='images/180px'
    PUBLIC_ROOT_PATH=File.dirname(__FILE__)+"/../../public"

    def random_img handle
      filename = File.basename( Dir[File.join(PUBLIC_ROOT_PATH, RANDOM_IMG_PATH, handle.to_s, '*')].to_a.random )
      image_tag( '/'+File.join(RANDOM_IMG_PATH, handle.to_s, filename), handle )
    end
  end
end

class Array
  def random
    self[rand(length)]
  end
end
