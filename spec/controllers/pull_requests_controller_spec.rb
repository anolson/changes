require 'spec_helper'

describe PullRequestsController do

  describe "GET #show" do
    let(:pull_request) { PullRequest.create! }

    it "responds successfully with a 200 status" do
      get :show, id: pull_request.id
      expect(response).to be_success
    end

    it "renders the show template" do
      get :show, id: pull_request.id
      expect(response).to render_template(:show)
    end

    it "assigns @pull_request correctly" do
      get :show, id: pull_request.id
      expect(assigns(:pull_request)).to eq(pull_request)
    end
  end

  describe "POST #create" do
    let(:diff) do
<<-DIFF
diff --git a/lib/grit/commit.rb b/lib/grit/commit.rb
index 403ea33..dd4b590 100644
--- a/lib/grit/commit.rb
+++ b/lib/grit/commit.rb
@@ -27,6 +27,7 @@

       lines = info.split("\\n")
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

    let(:pull_request_attributes) { { diff: diff } }

    context "with valid attributes" do
      it "creates a new pull_request" do
        expect {
          post :create, pull_request: pull_request_attributes
        }.to change(PullRequest, :count).by(1)
        
        # expect(response.status).to eq(201)
      end
    end

  end

end
