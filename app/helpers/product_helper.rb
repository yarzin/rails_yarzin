module ProductHelper
  def colored_class(key)
    return 'alert-success' if key.to_sym == :create
    'alert-danger' if key.to_sym == :destroy
  end

  def product_list_partial_name
    @products =  Product.all
    if Product.all.empty?
      return 'empty'
    else
      return 'list'
    end
  end

end
