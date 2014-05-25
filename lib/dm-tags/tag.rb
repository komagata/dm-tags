# encoding: utf-8

class Tag
  include DataMapper::Resource

  property :id,   Serial
  property :name, String, :required => true, :unique => true

  has n, :taggings

  def taggables
    taggings.map { |tagging| tagging.taggable }
  end

  def link
    "/tags/#{name}/"
  end
end
