require 'rails_helper'

RSpec.describe Embassy, type: :model do
  let(:embassy) {build(:embassy)}

  it "name attr is a string" do
    expect(embassy.name.class == "String").to be_truth
end
