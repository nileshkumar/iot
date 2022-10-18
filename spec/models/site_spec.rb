require 'rails_helper'

RSpec.describe Site, type: :model do
  it { should have_many(:devices) }
  it { should validate_presence_of(:name) }
end
