require 'gemdo/project'

class Ra::Shell

  #
  def project
    @project ||= Gemdo::Project.new
  end

  #
  def metadata
    project.metadata
  end

end

