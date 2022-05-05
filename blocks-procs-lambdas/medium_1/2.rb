class TextAnalyzer
  def process(file_name)
    text = File.new(file_name, 'r')
    yield(text.read)
    text.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process('gogol.txt') do |text|
  puts "#{text.split("\n\n").size} paragraphs"
  puts "#{text.lines.size} lines"
  puts "#{text.split(' ').size} words"
end

analyzer.process('lorem.txt') do |text|
  puts "#{text.split("\n\n").size} paragraphs"
  puts "#{text.lines.size} lines"
  puts "#{text.split(' ').size} words"
end