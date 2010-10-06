require 'facets/argvector'
require 'plugin'
require 'path/shell'
require 'rb/core_ext/all'

module Ra

  #
  def self.main
    shell = Shell.new(Dir.pwd)

    command = ARGV.shift

    #unless shell.respond_to?(command)  # TODO: improve
    unless shell.__send__(:available_commands).include?(command)
      abort "unknown command -- #{command}"
    end

    argv = ArgVector.new
    args, opts = argv.parameters
    args << opts
    shell.__send__(command, *args)
  end

  # Plugin files.
  def self.plugin_scripts
    @plugin_scripts ||= ::Plugin.find('ra/**/*')
  end

  # Personal plugins files.
  def self.personal_scripts
    @personal_scripts ||= Dir['.config/ra/**/*']
  end

  #
  def self.plugins
    @plugins ||= (
      (plugin_scripts + personal_scripts).map{ |file| Plugin.new(file) }
    )
  end

  # An instance of Shell is used as the context for the execution
  # of commands.
  class Shell < ::Path::Shell

    #
    def initialize(path, options={})
      super(path, options)

      @available_plugins = Ra.plugins.select{ |m| m.available? }
      @available_plugins.each{ |m| extend(m) }
      @available_commands = @available_plugins.map{ |ap|
        ap.public_instance_methods(false).map{ |s| s.to_s }
      }.flatten
    end

    private

    def available_plugins
      @available_plugins
    end

    def available_commands
      @available_commands
    end

  end

  # Plugin class encapsulates each Ra command script.
  class Plugin < Module

    #
    def initialize(file)
      @file = file
      module_eval(File.read(file), file)
    end

    #
    def file
      @file
    end

    #
    def availability(&block)
      @availability = block
    end

    #
    def available?
      return true if @availability.nil?
      @availability.call
    end

  end

end
