# help(1) -- display available rb commands
# =========================================
#
# ## SYNOPSIS
#
# `ra help`
# `ra help` [<command>]
#
# ## DESCRIPTION
#
# **help** displays the available list of rb commands.
# If `<command>` is given, then the full help header for
# that command will be displayed.

def help(command=nil, options={})
  command, options = nil, command if Hash === command
  if command
    mod = available_plugins.find{ |m| m.public_method_defined?(command) }

    file, line = mod.instance_method(command).source_location
    text = File.readlines(file)

    i = line - 2
    i = i - 1 while text[i] =~ /^\s*$/
    e = i
    i = i - 1 until i==0 or text[i] !~ /^\s*#/

    puts
    puts text[i..e].map{ |l| l.sub(/^\s*#\s?/, '') }
    puts
  else
    if options['all']
      commands = []
      Ra.plugins.each do |mod|
        commands.concat(mod.public_instance_methods)
      end
    else
      commands = available_commands  # Ra.available_pluigns
    end
    # TODO: Add first line of comments ?
    puts commands.join("\n")
  end
end

