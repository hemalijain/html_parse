require 'rails_helper'

RSpec.describe Website, type: :model do

  it { should validate_presence_of :url }
  
end

