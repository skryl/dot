require 'rubygems'
require 'pp'

begin
  require 'awesome_print'
  require 'interactive_editor'
rescue LoadError
end


# scratch buffer
# -------------------------------------------------------------------------------

def vim; vi("/Users/rut216/.irb_tempfile") end

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
