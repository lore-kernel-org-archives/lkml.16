Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120C5265613;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=j/f1rmOiN639XvE9vbcADkkfnpWtlC0t324KK5mt6CspsnTBm8vto6Ti21kPK4Lm3nNDdxwyrcG6Nw+sK8K5omKJqhHJh8nv3DZ5bevqJdmzK/0g6VK9aheumd8IFkOkR6btDeuHJ9DY00f2L64UEz+mMKzYYV7Zh1hr8WL4Wc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=vqPL8En8t9ALAvXP8ScDduZLWEBitge16Njw+N4oQik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTZEcSsCPZpPK9SyJMLyY3Lmm2m2wUdTXy0ZhS2THWTTWS6MIrrJK4jnXbbpQZpZ2ncUDJRMzmDf2BMl3lssKceA3VYtoloVhPEF7Nv8lsc4Ih3YDbP7oYz60pC8xVdVU+ERAKR8zb+o23iOBp/701uyVSE7ax/jISOo9ULVnaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNsNjyYH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNsNjyYH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24CAC4CEED;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106995;
	bh=vqPL8En8t9ALAvXP8ScDduZLWEBitge16Njw+N4oQik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GNsNjyYHu8tCNH1nFRuwN045M6XHrc/jJ0+NcWmD3ixZhX9cHJtkzCppzBxq1fLbi
	 9Bn0pmq/KYK7AO2N4kQ/uBSA5cIQT8Et0iNRUzistlPiOpeZIiU230ty3mjwLftztQ
	 rFN/nEGvoewP1W91rQYB2DGY6AKkTVsSNL167YFtx2/ssNPWvNBKj2Ni2y7kK0hM3f
	 OqlrsQOxn2LqBtrBjcYADjBLPlAdZcc5ofjZVRQPZ1WYb3uHmowk17wvS9CaHgnclA
	 QOsivMtWkxEdgaqgDkwbLW57dV+tcWA9yVtdPWbP6HbkzPEapw6MQ7KkiaCL6fXIlj
	 UxHKZDN8iIndQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RVp-0zSQ;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/33] scripts/kernel-doc.py: move file lists to the parser function
Date: Tue,  8 Apr 2025 18:09:15 +0800
Message-ID: <ab10bc94050406ce6536d4944b5d718ecd70812f.1744106242.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744106241.git.mchehab+huawei@kernel.org>
References: <cover.1744106241.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Instead of setting file lists at __init__ time, move it to
the actual parsing function. This allows adding more files
to be parsed in real time, by calling parse function multiple
times.

With the new way, the export_files logic was rewritten to
avoid parsing twice EXPORT_SYMBOL for partial matches.

Please notice that, with this logic, it can still read the
same file twice when export_file is used.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py          |  7 +++----
 scripts/lib/kdoc/kdoc_files.py | 37 ++++++++++++++++------------------
 2 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 63efec4b3f4b..e258a9df7f78 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -274,14 +274,13 @@ def main():
     else:
         out_style = RestFormat()
 
-    kfiles = KernelFiles(files=args.files, verbose=args.verbose,
+    kfiles = KernelFiles(verbose=args.verbose,
                          out_style=out_style, werror=args.werror,
                          wreturn=args.wreturn, wshort_desc=args.wshort_desc,
                          wcontents_before_sections=args.wcontents_before_sections,
-                         modulename=args.modulename,
-                         export_file=args.export_file)
+                         modulename=args.modulename)
 
-    kfiles.parse()
+    kfiles.parse(args.files, export_file=args.export_file)
 
     for t in kfiles.msg(enable_lineno=args.enable_lineno, export=args.export,
                           internal=args.internal, symbol=args.symbol,
diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
index 817ed98b2727..47dab46c89fe 100755
--- a/scripts/lib/kdoc/kdoc_files.py
+++ b/scripts/lib/kdoc/kdoc_files.py
@@ -124,7 +124,7 @@ class KernelFiles():
         self.config.log.error("Cannot find file %s", fname)
         self.config.errors += 1
 
-    def __init__(self, files=None, verbose=False, out_style=None,
+    def __init__(self, verbose=False, out_style=None,
                  werror=False, wreturn=False, wshort_desc=False,
                  wcontents_before_sections=False,
                  logger=None, modulename=None, export_file=None):
@@ -181,51 +181,48 @@ class KernelFiles():
         self.config.src_tree = os.environ.get("SRCTREE", None)
 
         self.out_style = out_style
-        self.export_file = export_file
 
         # Initialize internal variables
 
         self.config.errors = 0
         self.results = []
 
-        self.file_list = files
         self.files = set()
+        self.export_files = set()
 
-    def parse(self):
+    def parse(self, file_list, export_file=None):
         """
         Parse all files
         """
 
         glob = GlobSourceFiles(srctree=self.config.src_tree)
 
-        # Let's use a set here to avoid duplicating files
+        # Prevent parsing the same file twice to speedup parsing and
+        # avoid reporting errors multiple times
 
-        for fname in glob.parse_files(self.file_list, self.file_not_found_cb):
+        for fname in glob.parse_files(file_list, self.file_not_found_cb):
             if fname in self.files:
                 continue
 
-            self.files.add(fname)
-
             res = self.parse_file(fname)
+
             self.results.append((res.fname, res.entries))
-
-        if not self.files:
-            sys.exit(1)
+            self.files.add(fname)
 
         # If a list of export files was provided, parse EXPORT_SYMBOL*
-        # from the ones not already parsed
+        # from files that weren't fully parsed
 
-        if self.export_file:
-            files = self.files
+        if not export_file:
+            return
 
-            glob = GlobSourceFiles(srctree=self.config.src_tree)
+        self.export_files |= self.files
 
-            for fname in glob.parse_files(self.export_file,
-                                          self.file_not_found_cb):
-                if fname not in files:
-                    files.add(fname)
+        glob = GlobSourceFiles(srctree=self.config.src_tree)
 
-                    self.process_export_file(fname)
+        for fname in glob.parse_files(export_file, self.file_not_found_cb):
+            if fname not in self.export_files:
+                self.process_export_file(fname)
+                self.export_files.add(fname)
 
     def out_msg(self, fname, name, arg):
         """
-- 
2.49.0

