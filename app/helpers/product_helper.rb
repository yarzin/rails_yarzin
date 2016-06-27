module ProductHelper
  def colored_class(key)
    return 'alert-success' if key.to_sym == :create
    'alert-danger' if key.to_sym == :destroy
  end

  def product_list_partial_name
    @products.empty? ? 'empty' : 'list'
  end
end
