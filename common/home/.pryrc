require 'pp'

begin
  require 'hirb'
  require 'awesome_print'
  require 'pry'
  require 'pry-debugger'
  require 'pry-stack_explorer'
rescue LoadError
end

# config
# -------------------------------------------------------------------------------

Pry.config.history.should_save = true
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

if defined?(Pry)
  Pry.commands.alias_command '.w', 'whereami'
  Pry.commands.alias_command '.c', 'continue'
  Pry.commands.alias_command '.s',  'step'
  Pry.commands.alias_command '.n', 'next'
  Pry.commands.alias_command '.f', 'finish'
end

# scratch buffer
# -------------------------------------------------------------------------------

Pry.config.editor = "vim"

Pry.config.commands.command "vim", "Edit scratch buffer" do |path|
  scratch = path || "#{ENV['HOME']}/.irb_tempfile.rb"
  unless File.exists?(scratch)
    puts "Cannot find ''#{scratch}''"
  else
    run('edit', scratch) 
  end
end

# pretty
# -------------------------------------------------------------------------------

if defined? Hirb
  Pry.config.print = proc do |output, value|
    Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
  end
  Hirb.enable
end

# trace
# -------------------------------------------------------------------------------

def enable_trace( event_regex = /^(call|return)/, class_regex = /IRB|Wirble|RubyLex|RubyToken/ )
  puts "Enabling trace with event regex #{event_regex.inspect} and class exclusion regex #{class_regex.inspect}"

  set_trace_func Proc.new{|event, file, line, id, binding, classname|
    printf "[%8s] %30s %30s (%s:%-2d)\n", event, id, classname, file, line if
      event          =~ event_regex and
      classname.to_s !~ class_regex
  }
  return
end

def disable_trace
  puts "Disabled trace"
  set_trace_func nil
end

# meta
# -------------------------------------------------------------------------------

class Class

  def metaclass; class << self; self; end; end
  def meta_eval &blk; metaclass.instance_eval &blk; end

end

# alias
# -------------------------------------------------------------------------------
# Pry.config.commands.alias_command "lM", "ls -M"

puts ".pryrc successfully loaded"
