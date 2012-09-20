require 'spec_helper'

describe Article do
  it { belong_to :user }
  it { belong_to :project }
end
