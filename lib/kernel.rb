#require 'strftime/directive'
module Kernel
  def strfdirective(arg=nil)
    return Strftime::Directive.all if arg == 'all'
    if Strftime::Directive[arg]
      Strftime::Directive[arg]
    end
  end
  alias_method :strfd, :strfdirective
end
