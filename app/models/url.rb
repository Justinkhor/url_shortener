class Url < ApplicationRecord
  validates :long_url, uniqueness: true, presence: true, format: { with: /(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?/, message: "Not a valid URL"}
  validates :short_url, uniqueness: true
  after_initialize :set_count
  before_create :shorten


  def set_count
    self.count ||= 0
  end

  def shorten
    self.short_url = SecureRandom.hex(3)
    #method that will generate a "random" URL
    # only_letters = (self.long_url).chars.select { |char| char =~ /[a-zA-Z]/ }
    # number_array = (0..9).to_a.sample(only_letters.length)
    # combined_array = only_letters + number_array
    # end_of_short_url = combined_array.sample(7).join("")
    # return "#{end_of_short_url}"
  end

  def increment_count
    self.count +=1
end
