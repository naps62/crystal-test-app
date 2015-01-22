class X
  def fail_1(&@b : Int -> _)
    yield 1
  end

  def fail_2(&b : Int -> _)
    @b = b
    yield 1
  end

  def work_1(&@b : Int32 -> _)
    yield 1
  end

  def work_2(&b : Int -> _)
    yield 1
  end
end

X.new.fail_1 { puts "this fails" }
X.new.fail_2 { puts "this fails as well" }
X.new.work_1 { puts "this one works" }
X.new.work_2 { puts "this works as well" }
