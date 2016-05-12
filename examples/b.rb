class B
  def b1(*args, recurse: true, **kv, &block)
    puts ['b1', recurse, args, kv, block]
    if recurse
      b1(recurse: false)
    end
  end

  def b2
    puts 'b2'
  end
end
