require 'spec_helper'

describe Item do
  describe "check_recalled" do

    it "is called before save" do
      item = Item.new(name: "Babylicious crib")
      expect(item).to receive(:check_recalled).and_return(true)
      item.save!
    end

    context "with API" do
      context "recalled" do
        let(:item) { Item.new(name: "Babylicious Crib") }

        it "should set is_recalled to true" do
          item.check_recalled
          expect(item.is_recalled?).to be_truthy
        end

        it "should set the recall reason" do
          item.check_recalled
          expect(item.recall_reason).to include("Strangulation")
        end
      end

      context "not recalled" do
        let(:item) { Item.new(name: "DeathRay FireStarter")}

        it "should set is_recalled to false" do
          item.check_recalled
          expect(item.is_recalled?).to be_falsy
        end

        it "should not set the recall reason" do
          item.check_recalled
          expect(item.recall_reason).to be_empty
        end
      end
    end
  end

end
