require 'rails_helper'
describe "Websites model", type: :model do
  it { should validate_presence_of :url }
end

