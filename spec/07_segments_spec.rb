require 'spec_helper'

RSpec.describe "07: Segments" do
  let!(:female) { Surveyor::Segment.new(name: "Female") }
  let!(:male) { Surveyor::Segment.new(name: "Male") }

  let!(:melbourne) { Surveyor::Segment.new(name: "Melbourne") }
  let!(:sf) { Surveyor::Segment.new(name: "SF") }

  let!(:engineering) { Surveyor::Segment.new(name: "Engineering") }
  let!(:sales) { Surveyor::Segment.new(name: "Sales") }

  let!(:alice) do
    Surveyor::User.new(
      email: "alice@example.com",
      segments: [female, melbourne, sales]
    )
  end

  let!(:bob) do
    Surveyor::User.new(
      email: "bob@example.com",
      segments: [male, melbourne, engineering]
    )
  end

  let!(:claire) do
    Surveyor::User.new(
      email: "claire@example.com",
      segments: [female, sf, sales]
    )
  end

  let(:all_users) { [alice, bob, claire] }

  context "matching" do
    it "finds Melbourne-based users" do
      users = Surveyor::Segment.matching(all_users, [melbourne])
      expect(users).to include(alice)
      expect(users).to include(bob)
      expect(users).not_to include(claire)
    end

    it "finds SF-based users" do
      users = Surveyor::Segment.matching(all_users, [sf])
      expect(users).not_to include(alice)
      expect(users).not_to include(bob)
      expect(users).to include(claire)
    end

    it "finds Melbourne-based, sales users" do
      users = Surveyor::Segment.matching(all_users, [melbourne, sales])
      expect(users).to include(alice)
      expect(users).not_to include(bob)
      expect(users).not_to include(claire)
    end

    it "finds SF-based, engineering users" do
      users = Surveyor::Segment.matching(all_users, [sf, engineering])
      expect(users).to be_empty
    end
  end
end
