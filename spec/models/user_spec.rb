require "rails_helper"

describe User do
  let!(:facebook_hash) do
    eval(File.read("spec/fixtures/facebook_hash.yml"))
  end

  describe ".from_omniauth" do
    it "has a provider" do
      expect(facebook_hash[:provider]).not_to be_empty
    end

    it "has a uid" do
      expect(facebook_hash[:uid]).not_to be_empty
    end

    it "has a name" do
      expect(facebook_hash[:info][:name]).not_to be_empty
    end
    
    it "has an image" do
      expect(facebook_hash[:info][:image]).not_to be_empty
    end
  end
end
