require 'spec_helper'

describe PatchesController do
    let(:diff) do
<<-'DIFF'
diff --git a/lib/grit/commit.rb b/lib/grit/commit.rb
index 403ea33..dd4b590 100644
--- a/lib/grit/commit.rb
+++ b/lib/grit/commit.rb
@@ -27,6 +27,7 @@

       lines = info.split("\n")
       tree = lines.shift.split(' ', 2).last
+
       parents = []
       parents << lines.shift[7..-1] while lines.first[0, 6] == 'parent'
       author,    authored_date  = Grit::Commit.actor(lines.shift)
diff --git a/lib/grit/repo.rb b/lib/grit/repo.rb
index 033b446..0e2d140 100644
--- a/lib/grit/repo.rb
+++ b/lib/grit/repo.rb
@@ -180,7 +180,7 @@ module Grit
       io = StringIO.new(text)
       objects = []
       while line = io.gets
-        sha, type, size = line.split(" ", 3)
+        sha, type, size = line.split(" ", 3) #wut
         parser = BATCH_PARSERS[type]
         if type == 'missing' || !parser
           io.seek(size.to_i + 1, IO::SEEK_CUR)
DIFF
    end

  describe "GET #show" do
    let(:patch) { Patch.create!(raw: diff) }

    it "responds successfully with a 200 status" do
      get :show, id: patch.permalink
      expect(response).to be_success
    end

    it "renders the show template" do
      get :show, id: patch.permalink
      expect(response).to render_template(:show)
    end

    it "assigns @patch correctly" do
      get :show, id: patch.permalink
      expect(assigns(:patch)).to eq(patch)
    end
  end

  describe "POST #create" do
    let(:patch_attributes) { { raw: diff } }

    context "with valid attributes" do
      it "creates a new patch" do
        expect {
          post :create, patch: patch_attributes
        }.to change(Patch, :count).by(1)
      end
    end
  end
end
