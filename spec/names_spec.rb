require 'names'

describe Names do
  its(:all) { should have(255).items }
  its(:random_name) { should match(/ /) }
end

