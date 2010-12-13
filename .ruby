--- 
name: ruby applets
title: Ruby Applets
contact: trans <transfire@gmail.com>
requires: 
- group: []

  name: path
  version: 0+
- group: []

  name: plugin
  version: 0+
- group: []

  name: facets
  version: 0+
- group: 
  - build
  name: syckle
  version: 0+
resources: 
  repo: git://github.com/rubyworks/ra.git
  code: http://github.com/rubyworks/ra
  mail: http://groups.google.com/group/rubyworks-mailinglist
  docs: http://rubyworks.github.com/ra/docs/api
  home: http://rubyworks.github.com/ra
pom_verison: 1.0.0
manifest: 
- .ruby
- bin/ra
- lib/plugins/ra/help.rb
- lib/ra/core_ext/all.rb
- lib/ra/core_ext/facets.rb
- lib/ra/core_ext/filetest.rb
- lib/ra/core_ext/fileutils.rb
- lib/ra/core_ext/multiglob.rb
- lib/ra/core_ext/object/to_yamlfrag.rb
- lib/ra/core_ext/string/to_actual_filename.rb
- lib/ra/core_ext/string/unfold_paragraphs.rb
- lib/ra/core_ext/to_console.rb
- lib/ra/core_ext/to_list.rb
- lib/ra/gemdo.rb
- lib/ra.rb
- HISTORY.rdoc
- LICENSE.txt
- README.rdoc
- Version
version: 0.1.0
copyright: Copyright (c) 2010 Thomas Sawyer
licenses: 
- Apache 2.0
description: Ruby Applets creates an isolated namespace for running ruby-based commands. Think of it as a secondary system `bin/` designed for Ruby developers, but integerated with-in the Ruby language.
organization: rubyworks
summary: Dedicated Ruby Command System
authors: 
- Thomas Sawyer
created: 2010-08-01
