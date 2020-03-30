require 'fileutils'
require 'json'

class OutputFormatter
  def initialize
    @reports_dir = File.join(File.dirname(__FILE__ ), '..', 'reports')
    FileUtils.mkdir_p(@reports_dir) unless Dir.exist?(@reports_dir)
    @reports_dir = File.realpath(@reports_dir)
    @res = {:total => 0, :touched => 0, :coverage => 0}
    @res_match ={:total => 'Total Resources:', :touched => 'Touched Resource:', :coverage => 'Total coverage:'}
  end

  def populate_res(str)
    @res_match.each_pair do |key, val|
      str.lines.each do  |line|
        line = line.split.join(' ')
        @res[key] = line.split(val).last if line.start_with?(val)
      end
    end
  end

  def save_file(str)
    populate_res(str)
    File.open("result.json", 'w') do |f|
      f.write("#{JSON.pretty_generate(@res, array_nl: "\n\n", object_nl: "\n\n")}\n")
      f.close
    end
    puts '=========================================='
    puts "result saved to #{@reports_dir}/result.json"
    puts '=========================================='
  end
end