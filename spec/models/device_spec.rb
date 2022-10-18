require 'rails_helper'

RSpec.describe Device, type: :model do
  it { should belong_to(:site) }
  it { should validate_presence_of(:variant_name) }
  it { should validate_presence_of(:manufacturer) }
end
