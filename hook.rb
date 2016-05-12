module Hooks
end

class InstallHook
  def install_hook(klass, method_name)
    begin
      hook_module = Hooks.const_get(klass.name)
    rescue NameError
      hook_module = Module.new
      Hooks.const_set(klass.name, hook_module)
    end
  end
end

module HookB
  def b1(*args)
    puts 'HookB#b1'
    HookB.send(:remove_method, :b1)
    super
  end
end

B.prepend(HookB)
