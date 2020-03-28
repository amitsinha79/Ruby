require 'minitest/autorun'
require_relative '../lib/output_formatter'

describe OutputFormatter do
  before do
    @outputFormatter = OutputFormatter.new

  end

  describe 'when saved file' do
    it 'must saved file' do
      @outputFormatter.save_file("poc").must_equal
    end
  end
  end