require "rails_helper"

describe User do
  let!(:facebook_hash) { eval(File.read("spec/fixtures/facebook_hash.yml")) }

  describe "from facebook hash" do
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

  describe ".from_omniauth" do
    context "provider and uid not on database" do
      it "creates a new record" do
        hash_info = double("info", name: "sample", image: "image")
        hash_auth = double("auth", provider: "12345", uid: "12345", info: hash_info)

        expect { 
          User.from_omniauth(hash_auth)
        }.to change{ User.all.count }.by(1)
      end
    end

    context "provider and uid on database" do

    end
  end
end
