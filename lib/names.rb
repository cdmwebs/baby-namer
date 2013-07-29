class Names
  attr_accessor :all

  def initialize
    @all = []
    parse_files
  end

  def random_name
    first_name = all.sample
    middle_name = all.sample
    last_name = "Moore"

    "#{first_name} #{middle_name} #{last_name}"
  end

  private

  def files_to_read
    Dir.glob('names/*.txt')
  end

  def parse_files
    files_to_read.each do |filename|
      parse_file(filename)
    end
  end

  def parse_file(filename)
    File.read(filename).split("\n").each do |line|
      parse_line(line)
    end
  end

  def parse_line(line)
    if line =~ /\w,\w/
      line_names = line.split(',')
      all.push(line_names.first)
      all.uniq!
    end
  end
end

names = Names.new
20.times { puts names.random_name }

