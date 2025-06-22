Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB9DA47;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750572171; cv=none; b=Ma5uPjKxMn9ZuZAaG4GyBJhtuyp0W/I/cEEsEPtbHyr/yvJViyTqlnDMvEeVykq5cP2ztpwoWuSGwFhBi7qq9iw16JKJJN+9V2iFvVjTNvXaN5a9lmA32eSfvLqOihi4fgO9Ik7XGQkes8WV+9ormptE12IYmpaSqa5TnYzBi2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750572171; c=relaxed/simple;
	bh=rpsVQaefgMO9qukOwI9h7kF6VHQFcBEbI70UXJr2STI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyySXhAasXXIa4iBBaPfCSK9WBqk7vP+ouknbW4lMKlqtUNWkV26MOLpfmt8OWM46C2YcDuCGG4yp90jlyTil6+Iew3nMQi511epbnyg154shzRbMCJPrQTcGrRONcpW3T2tqIoZs64F7d/164ywwRi6oWC7Z63InCJ9j2Y3Vq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCxMh4DZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCxMh4DZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B717C4CEF1;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750572171;
	bh=rpsVQaefgMO9qukOwI9h7kF6VHQFcBEbI70UXJr2STI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XCxMh4DZ5FNk4Q7Xt3MPzG4u2WEBJXK5OlyhjCgWgjtrDn+UM2G/1B5Ex4e5TMKtr
	 j+6CphrNV/BzVu3I4/EMkgcK3zb2KAlCVQkzovCS4JmigQtaZw9XFArKVZICihzisz
	 kGzVDNNLEeGkW4QDS/+1Uhegd47c4kKEGT6f18oMZyRDrJWkG+ZLzfvMFiodRLk2bO
	 3llvgerUjmCuPVCkKNQqt78gK1TEMaceWG11BCEy3r/I82Xd9k7tOukvbQEQ4ay6mZ
	 xSGeUe3Z+SCuoAZ+6NurWNARBUdX7TRLpgzIswbpdrHwzaoFLY5Ks4gqGaehXUchbg
	 f5RgkoHfLw/iA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uTDmz-00000000o24-1EwN;
	Sun, 22 Jun 2025 08:02:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH v3 01/15] docs: conf.py: properly handle include and exclude patterns
Date: Sun, 22 Jun 2025 08:02:30 +0200
Message-ID: <429c9c670fe27860f5e4f29aaf72576a4ed52ad1.1750571906.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750571906.git.mchehab+huawei@kernel.org>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
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
index 12de52a2b17e..91ce2b1c33cc 100644
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
+def update_patterns(app, config):
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
+            config.include_patterns.append(rel_path)
+
+    # setup exclude_patterns dynamically
+    for p in dyn_exclude_patterns:
+        full = os.path.join(doctree, p)
+
+        rel_path = os.path.relpath(full, start = app.srcdir)
+        if rel_path.startswith("../"):
+            continue
+
+        config.exclude_patterns.append(rel_path)
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
+    app.connect('config-inited', update_patterns)
-- 
2.49.0

