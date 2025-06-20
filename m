Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFBF23236F;
	Fri, 20 Jun 2025 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407114; cv=none; b=VhXBCxlh8uEozNTks2Q8Nn2Bl2ojI6/dVeYJoer8fpTVI6Ubt0Bw+wCiBUOA+i8+1353eCEVWOqZTBnsQGx1MyIayEBjbECHpvqt+jmZZ+wJoQdSoLXY4Oa/JMpDXlGAGGdYHPsFWzrSx/t7/Jw3K+JKlBDrEs8JRf2Lu7CYWIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407114; c=relaxed/simple;
	bh=JvTI+DF/1Dszyn4T0n7ZKhi6vNtj6FoC1Ae/TMd5FHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ieOjYaC7VCvdhtGrVGnS6qppY/+KKfWogpx/4oEYWieM+Gx1hbZeP3Rr2iNSImMnX3+jwg2VMe0ubnf1GX2B983+J4/xDnxmd+fIr5EFCk+a47bKduKzN1LY37XqQe5oP9r6eiEU6zAk1xARz6Ku/NRfflygEHrw342NeT8UPEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9RBbEPy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9RBbEPy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1A0C4CEF0;
	Fri, 20 Jun 2025 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750407113;
	bh=JvTI+DF/1Dszyn4T0n7ZKhi6vNtj6FoC1Ae/TMd5FHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R9RBbEPybIDPIl5sxqWXk0nqMmbTRyx+Fh7+IEbpD2P0UFiQvaByzvjRhvhjo5aiX
	 AvQgoX+g64q+H2ETUi05ul1jL6nxGUlNNg4s0Meqxx+CWwoQ/i0KKJE8aHLUwirvjy
	 ifi4gpzk+lACr7ttf5qMWV1KjmfVYsA9MVPdlbDhqCaNKD0pQO2ZRM2TSbWOWn4FG2
	 S8ZqZ4H8Zi+yDyAZGoxILDsX1NLOTQVeV4Kx9TN2YkOSKqSv6A41XjBQqXCGqZl3QM
	 eULTtvbfoqtG9xReD0CfhtiFj3kceu/Zz+VHhx3WFqY+N9M9n0tPrCvKrM5xiHM82a
	 WwPbTYf2sCEqg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uSWql-00000004TWn-3Lm5;
	Fri, 20 Jun 2025 10:11:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH 1/6] docs: conf.py: properly handle include and exclude patterns
Date: Fri, 20 Jun 2025 10:11:41 +0200
Message-ID: <737b08e891765dc10bd944d4d42f8b1e37b80275.1750406900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750406900.git.mchehab+huawei@kernel.org>
References: <cover.1750406900.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

When one does:
	make SPHINXDIRS="foo" htmldocs

All patterns would be relative to Documentation/foo, which
causes the include/exclude patterns like:

	include_patterns = [
		...
		f'foo/*.{ext}',
	]

to break. This is not what it is expected. Address it by
adding a logic to dynamically adjust the pattern when
SPHINXDIRS is used.

That allows adding parsers for other file types.

It should be noticed that include_patterns was added on
Sphinx 5.1:
	https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-include_patterns

So, a backward-compatible code is needed when we start
using it for real.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
---
 Documentation/conf.py | 67 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 4 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 12de52a2b17e..4ba4ee45e599 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -17,6 +17,66 @@ import os
 import sphinx
 import shutil
 
+# Get Sphinx version
+major, minor, patch = sphinx.version_info[:3]
+
+# Include_patterns were added on Sphinx 5.1
+if (major < 5) or (major == 5 and minor < 1):
+    has_include_patterns = False
+else:
+    has_include_patterns = True
+    # Include patterns that don't contain directory names, in glob format
+    include_patterns = ['**.rst']
+
+# Location of Documentation/ directory
+doctree = os.path.abspath('.')
+
+# Exclude of patterns that don't contain directory names, in glob format.
+exclude_patterns = []
+
+# List of patterns that contain directory names in glob format.
+dyn_include_patterns = []
+dyn_exclude_patterns = ['output']
+
+# Properly handle include/exclude patterns
+# ----------------------------------------
+
+def update_patterns(app):
+
+    """
+    On Sphinx, all directories are relative to what it is passed as
+    SOURCEDIR parameter for sphinx-build. Due to that, all patterns
+    that have directory names on it need to be dynamically set, after
+    converting them to a relative patch.
+
+    As Sphinx doesn't include any patterns outside SOURCEDIR, we should
+    exclude relative patterns that start with "../".
+    """
+
+    sourcedir = app.srcdir  # full path to the source directory
+    builddir = os.environ.get("BUILDDIR")
+
+    # setup include_patterns dynamically
+    if has_include_patterns:
+        for p in dyn_include_patterns:
+            full = os.path.join(doctree, p)
+
+            rel_path = os.path.relpath(full, start = app.srcdir)
+            if rel_path.startswith("../"):
+                continue
+
+            app.config.include_patterns.append(rel_path)
+
+    # setup exclude_patterns dynamically
+    for p in dyn_exclude_patterns:
+        full = os.path.join(doctree, p)
+
+        rel_path = os.path.relpath(full, start = app.srcdir)
+        if rel_path.startswith("../"):
+            continue
+
+        app.config.exclude_patterns.append(rel_path)
+
 # helper
 # ------
 
@@ -219,10 +279,6 @@ language = 'en'
 # Else, today_fmt is used as the format for a strftime call.
 #today_fmt = '%B %d, %Y'
 
-# List of patterns, relative to source directory, that match files and
-# directories to ignore when looking for source files.
-exclude_patterns = ['output']
-
 # The reST default role (used for this markup: `text`) to use for all
 # documents.
 #default_role = None
@@ -516,3 +572,6 @@ kerneldoc_srctree = '..'
 # the last statement in the conf.py file
 # ------------------------------------------------------------------------------
 loadConfig(globals())
+
+def setup(app):
+	app.connect('builder-inited', update_patterns)
-- 
2.49.0

