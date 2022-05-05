require 'rails_helper'

RSpec.describe Book, type: :model do
  # Validation tests
  # ensure columns title, author and rating are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:rating) }
end
