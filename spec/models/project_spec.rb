require 'spec_helper'

describe Project do
  it { should belong_to :user }
  it "has a valid factory" do
    FactoryGirl.create(:project).should be_valid
  end
end
