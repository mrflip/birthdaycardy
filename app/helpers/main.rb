class Main < Monk::Glue
  helpers do
    RANDOM_IMG_PATH='images/r'
    PUBLIC_ROOT_PATH=File.dirname(__FILE__)+"/../../public"

    def random_img handle
      filename = File.basename( Dir[File.join(PUBLIC_ROOT_PATH, RANDOM_IMG_PATH, '*')].to_a.random )
      image_tag( '/'+File.join(RANDOM_IMG_PATH, filename), handle )
    end
  end
end

class Array
  def random
    self[rand(length)]
  end
end
