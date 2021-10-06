

require_relative 'tsv_buddy'
require_relative 'yaml_buddy'

class Tester
  include TsvBuddy
  include YamlBuddy
end

t = Tester.new.take_tsv(File.read('data/survey.tsv'))
y = Tester.new.take_yaml(File.read('data/survey.yml'))

col_names = y[0].keys.join("\t") + "\n"
values = y.map{|row| row.values.join("\t")}.join("\n")
puts @data = col_names + values
