Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3153214A66;
	Tue, 15 Apr 2025 03:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744686800; cv=none; b=IXKfmBkQv7Rtc9o7OhigqTfNSVI5f/eJHMBOcRnBOfVOIOKs5kjrvFpm/9+rJYSLwBLXSV8BhD1Y1OAYoYIePR7oiYInHkybFvk9OZ77L/qBPKB+t19olSDB7xgPCk1ZlvpQkD06zgVtcVXGMFFF6rPC+Uhz5KCoagRFJ0lModQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744686800; c=relaxed/simple;
	bh=84TV8R3IieGefza5TyZDGmhvzQadd2Ku2wFM7dif50w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqDvxcKLwFdHDqqfdCV38hQjzj2Uzg8d4jk5CjJskihfQsvJu98oBlXqQn4IYt8oPhwcHr6mo9jXBct9A4n5JC5kDPeL8ZfU5MmwIwrNB8kAwAq8vbw2cU0p5PHWumKANhqa3iWuIizvpYwPLxWceZ7ta5PijEO2XOnqs39LXpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzRLTkGH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzRLTkGH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6CBC4CEEA;
	Tue, 15 Apr 2025 03:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744686800;
	bh=84TV8R3IieGefza5TyZDGmhvzQadd2Ku2wFM7dif50w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bzRLTkGHBzcUfVdrs1ThBYQvMnBb+hCPMCYFM5XfG0Gqukmj3zOwdQRFirj57NTtD
	 H7DWBmUlfikKz90VQ2wLiuu0rUhe7t3u5/PvW9nQhyHh75wBYfaBgbnKjN2HUX+tF7
	 iVf1O7XxcimNAARHhUETW9VTo9b5QGsAID/q9wshlNDN6nyKMf+Gy3M2YmVGc20Ehy
	 eYul/kHRb68zy41W2cZgHf+7UCAyBndmP0U8cbE+76T9/i+nzPTWLo2jua6pUVsMhP
	 CFyjBDNvCqw5czlLUCfz+n5lLziuZAq1p0iMLE5iPqbj0elvmjIN3n1LqJIxcZArG8
	 aoE46KwbnkMuQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u4WjU-00000002FHM-45hG;
	Tue, 15 Apr 2025 11:13:08 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] docs: sphinx: kerneldoc: Use python class if available
Date: Tue, 15 Apr 2025 11:12:51 +0800
Message-ID: <1556a6c005d8e0fafa951f74725e984e1c7459bf.1744685912.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744685912.git.mchehab+huawei@kernel.org>
References: <cover.1744685912.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Better integrate with the new kernel-doc tool by calling the
Python classes directly if KERNELDOC=scripts/kernel-doc.py.

This way, warnings won't be duplicated anymore, as files
will be parsed only once.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kerneldoc.py | 138 ++++++++++++++++++++++++++++--
 1 file changed, 130 insertions(+), 8 deletions(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index 344789ed9ea2..27baf28fb754 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -41,7 +41,14 @@ import sphinx
 from sphinx.util.docutils import switch_source_input
 from sphinx.util import logging
 
+srctree = os.path.abspath(os.environ["srctree"])
+sys.path.insert(0, os.path.join(srctree, "scripts/lib/kdoc"))
+
+from kdoc_files import KernelFiles
+from kdoc_output import RestFormat
+
 __version__  = '1.0'
+use_kfiles = False
 
 def cmd_str(cmd):
     """
@@ -82,11 +89,32 @@ class KernelDocDirective(Directive):
     logger = logging.getLogger('kerneldoc')
     verbose = 0
 
-    def run(self):
+    parse_args = {}
+    msg_args = {}
+
+    def handle_args(self):
+
         env = self.state.document.settings.env
         cmd = [env.config.kerneldoc_bin, '-rst', '-enable-lineno']
 
         filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]
+
+        # Arguments used by KernelFiles.parse() function
+        self.parse_args = {
+            "file_list": [filename],
+            "export_file": []
+        }
+
+        # Arguments used by KernelFiles.msg() function
+        self.msg_args = {
+            "enable_lineno": True,
+            "export": False,
+            "internal": False,
+            "symbol": [],
+            "nosymbol": [],
+            "no_doc_sections": False
+        }
+
         export_file_patterns = []
 
         verbose = os.environ.get("V")
@@ -99,7 +127,8 @@ class KernelDocDirective(Directive):
         # Tell sphinx of the dependency
         env.note_dependency(os.path.abspath(filename))
 
-        tab_width = self.options.get('tab-width', self.state.document.settings.tab_width)
+        self.tab_width = self.options.get('tab-width',
+                                          self.state.document.settings.tab_width)
 
         # 'function' is an alias of 'identifiers'
         if 'functions' in self.options:
@@ -108,12 +137,16 @@ class KernelDocDirective(Directive):
         # FIXME: make this nicer and more robust against errors
         if 'export' in self.options:
             cmd += ['-export']
+            self.msg_args["export"] = True
             export_file_patterns = str(self.options.get('export')).split()
         elif 'internal' in self.options:
             cmd += ['-internal']
+            self.msg_args["internal"] = True
             export_file_patterns = str(self.options.get('internal')).split()
         elif 'doc' in self.options:
-            cmd += ['-function', str(self.options.get('doc'))]
+            func = str(self.options.get('doc'))
+            cmd += ['-function', func]
+            self.msg_args["symbol"].append(func)
         elif 'identifiers' in self.options:
             identifiers = self.options.get('identifiers').split()
             if identifiers:
@@ -123,8 +156,10 @@ class KernelDocDirective(Directive):
                         continue
 
                     cmd += ['-function', i]
+                    self.msg_args["symbol"].append(i)
             else:
                 cmd += ['-no-doc-sections']
+                self.msg_args["no_doc_sections"] = True
 
         if 'no-identifiers' in self.options:
             no_identifiers = self.options.get('no-identifiers').split()
@@ -135,6 +170,7 @@ class KernelDocDirective(Directive):
                         continue
 
                     cmd += ['-nosymbol', i]
+                    self.msg_args["nosymbol"].append(i)
 
         for pattern in export_file_patterns:
             pattern = pattern.rstrip("\\").strip()
@@ -144,12 +180,29 @@ class KernelDocDirective(Directive):
             for f in glob.glob(env.config.kerneldoc_srctree + '/' + pattern):
                 env.note_dependency(os.path.abspath(f))
                 cmd += ['-export-file', f]
+                self.parse_args["export_file"].append(f)
+
+            # Export file is needed by both parse and msg, as kernel-doc
+            # cache exports.
+            self.msg_args["export_file"] = self.parse_args["export_file"]
 
         cmd += [filename]
 
+        return cmd
+
+    def run_cmd(self):
+        """
+        Execute an external kernel-doc command.
+        """
+
+        env = self.state.document.settings.env
+        cmd = self.handle_args()
+
         if self.verbose >= 1:
             print(cmd_str(cmd))
 
+        node = nodes.section()
+
         try:
             self.logger.verbose("calling kernel-doc '%s'" % (" ".join(cmd)))
 
@@ -167,7 +220,29 @@ class KernelDocDirective(Directive):
             elif env.config.kerneldoc_verbosity > 0:
                 sys.stderr.write(err)
 
-            lines = statemachine.string2lines(out, tab_width, convert_whitespace=True)
+        except Exception as e:  # pylint: disable=W0703
+            self.logger.warning("kernel-doc '%s' processing failed with: %s" %
+                                (" ".join(cmd), str(e)))
+            return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
+
+        filenames = self.parse_args["file_list"]
+        for filename in filenames:
+            ret = self.parse_msg(filename, node, out, cmd)
+            if ret:
+                return ret
+
+        return node.children
+
+    def parse_msg(self, filename, node, out, cmd):
+        """
+        Handles a kernel-doc output for a given file
+        """
+
+        env = self.state.document.settings.env
+
+        try:
+            lines = statemachine.string2lines(out, self.tab_width,
+                                              convert_whitespace=True)
             result = ViewList()
 
             lineoffset = 0;
@@ -183,20 +258,65 @@ class KernelDocDirective(Directive):
                     result.append(line, doc + ": " + filename, lineoffset)
                     lineoffset += 1
 
-            node = nodes.section()
             self.do_parse(result, node)
 
-            return node.children
-
         except Exception as e:  # pylint: disable=W0703
             self.logger.warning("kernel-doc '%s' processing failed with: %s" %
-                                (" ".join(cmd), str(e)))
+                                (cmd_str(cmd), str(e)))
             return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
 
+        return None
+
+    def run_kdoc(self, kfiles):
+        """
+        Execute kernel-doc classes directly instead of running as a separate
+        command.
+        """
+
+        cmd = self.handle_args()
+        env = self.state.document.settings.env
+
+        node = nodes.section()
+
+        kfiles.parse(**self.parse_args)
+        filenames = self.parse_args["file_list"]
+
+        for filename, out in kfiles.msg(**self.msg_args, filenames=filenames):
+            if self.verbose >= 1:
+                print(cmd_str(cmd))
+
+            ret = self.parse_msg(filename, node, out, cmd)
+            if ret:
+                return ret
+
+        return node.children
+
+    def run(self):
+        global use_kfiles
+
+        if use_kfiles:
+            out_style = RestFormat()
+            kfiles = KernelFiles(out_style=out_style, logger=self.logger)
+            return self.run_kdoc(kfiles)
+        else:
+            return self.run_cmd()
+
     def do_parse(self, result, node):
         with switch_source_input(self.state, result):
             self.state.nested_parse(result, 0, node, match_titles=1)
 
+def setup_kfiles(app):
+    global use_kfiles
+
+    kerneldoc_bin = app.env.config.kerneldoc_bin
+
+    if kerneldoc_bin and kerneldoc_bin.endswith("kernel-doc.py"):
+        print("Using Python kernel-doc")
+        use_kfiles = True
+    else:
+        print(f"Using {kerneldoc_bin}")
+
+
 def setup(app):
     app.add_config_value('kerneldoc_bin', None, 'env')
     app.add_config_value('kerneldoc_srctree', None, 'env')
@@ -204,6 +324,8 @@ def setup(app):
 
     app.add_directive('kernel-doc', KernelDocDirective)
 
+    app.connect('builder-inited', setup_kfiles)
+
     return dict(
         version = __version__,
         parallel_read_safe = True,
-- 
2.49.0

