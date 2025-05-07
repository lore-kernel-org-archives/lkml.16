Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEC125D20E;
	Wed,  7 May 2025 12:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619899; cv=none; b=Nfx1kXaUpT+AZ9pWuWia4Gdj01jQZf5wH5SxWL/bwl+xzXdeY3kuze1Xj3/vcegQlw5dNpCv+E6Y6VcZm2yeniwELhEQq8pzOQh5VMaU+xDEyxO7ZVlVKPBiwQINRbftZ9kmB3OrbuyUEHoCFE6oqpLuUpIASMPjOZLiW30yWnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619899; c=relaxed/simple;
	bh=cSo6FStu8b5zTsbjRZmWUY84qNUjg6csdXKm1ISmQ4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oF8kqqqbPpPOjDMKcJkZKE4irNO7GHdBw8o0sGcdAf+w8oiAJpq393Ah0CpcCAOUF4fvsKG6FapHZ6RvdLOm2XS2JIgFFZiBOmyBUwuFdp0maNz884wNt0M7Ho4y5kQ1pfPa0S5rNY7N2Yvf28+17pqxqxBm7R2+Su0fpgj2OiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TyUyxHKp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TyUyxHKp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFFCC4CEE7;
	Wed,  7 May 2025 12:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746619898;
	bh=cSo6FStu8b5zTsbjRZmWUY84qNUjg6csdXKm1ISmQ4w=;
	h=From:To:Cc:Subject:Date:From;
	b=TyUyxHKpdMXb5VkrfKTlhYrSc2Pp3Y0PmmReFW5iTtCd+4Rd+beq1YBmPsLAo69h3
	 XpZsjRackyQM0njfUKu0SaG/UQshXZasebbkKLKdC8HE7rbfd6ODhLFxqAIeqT+l1l
	 zTFzRWFYso5v7osjq4rEkgRnSZMwGZfi61AwHQp1rdBPpr730z+9U3wu1V63sSAaIB
	 CUHxQOz5nXLgkWM3wNzXn3vq7ZvAQ6kn+ljiSGMKHPslX9qj7rX38ek/qLXw9YDXbv
	 f7Z6hai7ztv79Dl2KnMr7//h3pGw7EOJYMDzY/UrM03gl8mCl9lJPUJNbMqty/sVmU
	 uDMNhDzcVwOHA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uCdce-00000001KgE-043m;
	Wed, 07 May 2025 14:11:36 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: conf.py: drop backward support for old Sphinx versions
Date: Wed,  7 May 2025 14:11:17 +0200
Message-ID: <20250507121117.317810-1-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Since commit 5e25b972a22b ("docs: changes: update Python minimal version"),
the minimal Sphinx version is 3.4.3.

Drop support for older versions from the config file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py | 162 +++++++++++++++++-------------------------
 1 file changed, 65 insertions(+), 97 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index b126f6760b5f..12de52a2b17e 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -28,16 +28,6 @@ def have_command(cmd):
     """
     return shutil.which(cmd) is not None
 
-# Get Sphinx version
-major, minor, patch = sphinx.version_info[:3]
-
-#
-# Warn about older versions that we don't want to support for much
-# longer.
-#
-if (major < 2) or (major == 2 and minor < 4):
-    print('WARNING: support for Sphinx < 2.4 will be removed soon.')
-
 # If extensions (or modules to document with autodoc) are in another directory,
 # add these directories to sys.path here. If the directory is relative to the
 # documentation root, use os.path.abspath to make it absolute, like shown here.
@@ -57,76 +47,71 @@ extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include',
               'maintainers_include', 'sphinx.ext.autosectionlabel',
               'kernel_abi', 'kernel_feat', 'translations']
 
-if major >= 3:
-    if (major > 3) or (minor > 0 or patch >= 2):
-        # Sphinx c function parser is more pedantic with regards to type
-        # checking. Due to that, having macros at c:function cause problems.
-        # Those needed to be scaped by using c_id_attributes[] array
-        c_id_attributes = [
-            # GCC Compiler types not parsed by Sphinx:
-            "__restrict__",
-
-            # include/linux/compiler_types.h:
-            "__iomem",
-            "__kernel",
-            "noinstr",
-            "notrace",
-            "__percpu",
-            "__rcu",
-            "__user",
-            "__force",
-            "__counted_by_le",
-            "__counted_by_be",
-
-            # include/linux/compiler_attributes.h:
-            "__alias",
-            "__aligned",
-            "__aligned_largest",
-            "__always_inline",
-            "__assume_aligned",
-            "__cold",
-            "__attribute_const__",
-            "__copy",
-            "__pure",
-            "__designated_init",
-            "__visible",
-            "__printf",
-            "__scanf",
-            "__gnu_inline",
-            "__malloc",
-            "__mode",
-            "__no_caller_saved_registers",
-            "__noclone",
-            "__nonstring",
-            "__noreturn",
-            "__packed",
-            "__pure",
-            "__section",
-            "__always_unused",
-            "__maybe_unused",
-            "__used",
-            "__weak",
-            "noinline",
-            "__fix_address",
-            "__counted_by",
-
-            # include/linux/memblock.h:
-            "__init_memblock",
-            "__meminit",
-
-            # include/linux/init.h:
-            "__init",
-            "__ref",
-
-            # include/linux/linkage.h:
-            "asmlinkage",
-
-            # include/linux/btf.h
-            "__bpf_kfunc",
-        ]
-
-else:
-    extensions.append('cdomain')
+# Since Sphinx version 3, the C function parser is more pedantic with regards
+# to type checking. Due to that, having macros at c:function cause problems.
+# Those needed to be escaped by using c_id_attributes[] array
+c_id_attributes = [
+    # GCC Compiler types not parsed by Sphinx:
+    "__restrict__",
+
+    # include/linux/compiler_types.h:
+    "__iomem",
+    "__kernel",
+    "noinstr",
+    "notrace",
+    "__percpu",
+    "__rcu",
+    "__user",
+    "__force",
+    "__counted_by_le",
+    "__counted_by_be",
+
+    # include/linux/compiler_attributes.h:
+    "__alias",
+    "__aligned",
+    "__aligned_largest",
+    "__always_inline",
+    "__assume_aligned",
+    "__cold",
+    "__attribute_const__",
+    "__copy",
+    "__pure",
+    "__designated_init",
+    "__visible",
+    "__printf",
+    "__scanf",
+    "__gnu_inline",
+    "__malloc",
+    "__mode",
+    "__no_caller_saved_registers",
+    "__noclone",
+    "__nonstring",
+    "__noreturn",
+    "__packed",
+    "__pure",
+    "__section",
+    "__always_unused",
+    "__maybe_unused",
+    "__used",
+    "__weak",
+    "noinline",
+    "__fix_address",
+    "__counted_by",
+
+    # include/linux/memblock.h:
+    "__init_memblock",
+    "__meminit",
+
+    # include/linux/init.h:
+    "__init",
+    "__ref",
+
+    # include/linux/linkage.h:
+    "asmlinkage",
+
+    # include/linux/btf.h
+    "__bpf_kfunc",
+]
 
 # Ensure that autosectionlabel will produce unique names
 autosectionlabel_prefix_document = True
@@ -149,10 +134,6 @@ if 'SPHINX_IMGMATH' in os.environ:
     else:
         sys.stderr.write("Unknown env SPHINX_IMGMATH=%s ignored.\n" % env_sphinx_imgmath)
 
-# Always load imgmath for Sphinx <1.8 or for epub docs
-load_imgmath = (load_imgmath or (major == 1 and minor < 8)
-                or 'epub' in sys.argv)
-
 if load_imgmath:
     extensions.append("sphinx.ext.imgmath")
     math_renderer = 'imgmath'
@@ -322,14 +303,6 @@ if "DOCS_CSS" in os.environ:
     for l in css:
         html_css_files.append(l)
 
-if major <= 1 and minor < 8:
-    html_context = {
-        'css_files': [],
-    }
-
-    for l in html_css_files:
-        html_context['css_files'].append('_static/' + l)
-
 if  html_theme == 'alabaster':
     html_theme_options = {
         'description': get_cline_version(),
@@ -409,11 +382,6 @@ latex_elements = {
     ''',
 }
 
-# Fix reference escape troubles with Sphinx 1.4.x
-if major == 1:
-    latex_elements['preamble']  += '\\renewcommand*{\\DUrole}[2]{ #2 }\n'
-
-
 # Load kerneldoc specific LaTeX settings
 latex_elements['preamble'] += '''
         % Load kerneldoc specific LaTeX settings
-- 
2.49.0

