require 'rails_helper'

describe ProductsHelper do
  it do
    helper.colored_class(:create)
  end

  it do
    helper.colored_class(:destroy)
  end
end