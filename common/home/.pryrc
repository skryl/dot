require 'pp'

begin
  require 'pry'
  require 'hirb'
  require 'awesome_print'
  require 'benchmark'
  require 'benchmark/ips'
rescue LoadError
  puts "Error loading gems!"
end


# config
# -------------------------------------------------------------------------------

Pry.config.history.should_save = true
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]


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


# pretty print
# -------------------------------------------------------------------------------

 if defined? Hirb
   #Hirb.enable
   Pry.config.print = proc do |output, value, _pry_|
     Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value, _pry_)
   end
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


# rails
# -------------------------------------------------------------------------------

def ar_toggle_logger
  if ActiveRecord::Base.logger
    ActiveRecord::Base.logger = nil
  else
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end
end


# aliases
# -------------------------------------------------------------------------------

# Pry.config.commands.alias_command "lM", "ls -M"
#if defined?(PryDebugger)
  #Pry.commands.alias_command '.where', 'whereami'
  #Pry.commands.alias_command '.cont', 'continue'
#end


puts ".pryrc successfully loaded"
