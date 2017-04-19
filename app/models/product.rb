class Product < ApplicationRecord

  # The fetch method can both read and write Rails’ cache (the first argument is the storage’s name).
  #  If the requested storage is empty, it will be populated with the content specified inside the block.
  #   If it contains something, the result will simply be returned.
  #   There are also write and read methods available.
  class << self
    def all_cached
      Rails.cache.fetch("products") { Product.all }
    end
  end

  after_commit :flush_cache

  private
  
    def flush_cache
      Rails.cache.delete('products')
    end
end
