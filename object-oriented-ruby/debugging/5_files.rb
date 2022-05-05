class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post

# When we invoke `puts`, `to_s` is automatically invoked on the argument passed in. On line 45, we do just this so we expect `to_s` to be invoked on the `MarkdownFile` object referenced by local variable `blog_post`.

# Ruby will first look in the `MarkdownFile` class for a definition of `to_s`, but not finding it there, will proceed up the method lookup chain to `File`, `MarkdownFile`'s parent class. There it does find a `to_s` method, so it invokes it.

# However, within `to_s` defined in the `File` class, we find reference to some constant `FORMAT`. All of the subclasses of `File` have a defined constant `FORMAT` but `File` does not. Since constants have lexical scope, Ruby will begin looking for constants in the class it is currently in and not start from the bottom of the class hierarchy. It will find no such constant  `FORMAT` in the `File` class nor in any of its ancestors, so a `NameError` is returned instead.