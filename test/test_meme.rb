require 'minitest/autorun'
require_relative '../lib/meme'
 
describe Meme do
  before do
    @meme = Meme.new
  end
 
  describe 'when asked about cheeseburgers' do
    it 'must respond positively' do
      @meme.i_can_have_cheezburger?.must_equal 'cheers!'
    end
  end
 
end
