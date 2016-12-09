require "rails_helper"

# RSpec.describe User, type: :model do
#   let(:user) { build(:user) }
#   pending "use is valid" do
#     expect(user).to be_valid
      # end
# end

RSpec.describe Embassy, type: :model do
  let(:embassy) { build(:embassy) }
  it "name is not null" do
    expect(embassy).not_to be_nil
  end
  it "name to be a string" do
    expect(embassy.name.class==String).to be_truthy
  end
end