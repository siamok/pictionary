require 'rails_helper'
require_relative '../support/controller_macros'

RSpec.describe User, type: :request do
  it "should have a current_user" do
    expect(subject).to_not eq(nil)
  end
end
