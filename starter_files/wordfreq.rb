class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with']

    def initialize(filename)
      @contents = File.read(filename)
      # contents.downcase.gsub(/\W+/, '')
      #
      # @arr = contents.split(" ").select do |el|
      #   if !STOP_WORDS.index(el.downcase)
      #     el
      #   end
      # end
    end

  def frequency(word)
    index = 0
    used = []
    @contents.each_char do |c|
    otherIndex = word.length + index
      if @contents[index ... (otherIndex)] == word && (!@contents[index-1].match(/^[[:alpha:]]$/) && !@contents[otherIndex].match(/^[[:alpha:]]$/))
        used.push(word)
      end
      index += 1
    end
    print used
    used.length
  end

  def frequencies
    index = 0
    used = []
    @contents.each_char do |c|
    otherIndex = word.length + index
      if @contents[index ... (otherIndex)] == word && (!@contents[index-1].match(/^[[:alpha:]]$/) && !@contents[otherIndex].match(/^[[:alpha:]]$/))
        used.push(word)
      end
      index += 1
    end
    print used
    used.length
  end

  def top_words(number)
  end

  def print_report
  end
end

if __FILE__ == $0
  filename = ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      wf = Wordfreq.new(full_filename)
      wf.print_report
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end
end
