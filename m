Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1220026656B;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=XQ8wa1M+RqnQroM1l0gHLHVbEQBrVQ1WA6+W7f1YS1juzLGREhAduVuLQcDsRG3q6XDN06pkeRE6BFGSYiQPPXdEJk2Gij1Nw1ZjueXyc5vVn3WJU2pOHrC/t20pIvdlMrDSGx4qcb54mSIVwRA9xD+EqaxSN6iqxEmGnQJzy9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=sXOUNajyjwmKqQnv7hchPEAJzSeCddrnAGb/R4Jp03A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/wvKQljIjIeQQdnF4maTmzYVjRXfVVuzw078Ako8BXZT5of/+p0g4VxTuQ5h9rNHo45ap43/OqNxy72xZRosof96DsVP1M5jxqmUpe1WMV+h0LRhEoOKXA8HNgDof+U4uxcLqJXFsE8eoTfkk+Z0QlHR9xF5PlGIyzfuPH+PXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4KMl5bj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4KMl5bj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F30C4CEEE;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106995;
	bh=sXOUNajyjwmKqQnv7hchPEAJzSeCddrnAGb/R4Jp03A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4KMl5bjRaaKJn/p13ksfffYbLrbb6+ox85Ny7/4DS+TDQliar6MgtnbVpHqJ7rQx
	 O3PFEVy35I6VSWegv+E6jqJMEN/mw3WcmhlZdYZcf/MdWzS1l8uDxC56rPAY23JgsT
	 2jys5zF90nrMT4rjqFmhVcd8tYl09weWdetlZPPylEPKxdGHGPw3YR2UAB3ZM6hCRY
	 CVNTH1m/LG90XJA3YilT+38Kye5v5a2HrAWg+KWilqfjB9DsDf3asjmO8C8Nwqgeyy
	 xFocvIs15VukbSGmur8QR50pSAS9XOcGRrPIbKm8g0uVRUO9ALeqjWtodEgeEJxppe
	 MfB7gnigEGoZw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RVs-15KS;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/33] scripts/kernel-doc.py: implement support for -no-doc-sections
Date: Tue,  8 Apr 2025 18:09:16 +0800
Message-ID: <06b18a32142b44d5ba8b41ac64a76c02b03b4969.1744106242.git.mchehab+huawei@kernel.org>
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

The venerable kernel-doc Perl script has a number of options that
aren't properly documented. Among them, there is -no-doc-sections,
which is used by the Sphinx extension.

Implement support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py           | 8 ++++++--
 scripts/lib/kdoc/kdoc_files.py  | 5 +++--
 scripts/lib/kdoc/kdoc_output.py | 7 ++++++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index e258a9df7f78..90aacd17499a 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -239,10 +239,13 @@ def main():
     sel_mut.add_argument("-s", "-function", "--symbol", action='append',
                          help=FUNCTION_DESC)
 
-    # This one is valid for all 3 types of filter
+    # Those are valid for all 3 types of filter
     parser.add_argument("-n", "-nosymbol", "--nosymbol", action='append',
                          help=NOSYMBOL_DESC)
 
+    parser.add_argument("-D", "-no-doc-sections", "--no-doc-sections",
+                        action='store_true', help="Don't outputt DOC sections")
+
     parser.add_argument("files", metavar="FILE",
                         nargs="+", help=FILES_DESC)
 
@@ -284,7 +287,8 @@ def main():
 
     for t in kfiles.msg(enable_lineno=args.enable_lineno, export=args.export,
                           internal=args.internal, symbol=args.symbol,
-                          nosymbol=args.nosymbol):
+                          nosymbol=args.nosymbol,
+                          no_doc_sections=args.no_doc_sections):
         msg = t[1]
         if msg:
             print(msg)
diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
index 47dab46c89fe..4c04546a74fe 100755
--- a/scripts/lib/kdoc/kdoc_files.py
+++ b/scripts/lib/kdoc/kdoc_files.py
@@ -238,7 +238,7 @@ class KernelFiles():
         return self.out_style.msg(fname, name, arg)
 
     def msg(self, enable_lineno=False, export=False, internal=False,
-            symbol=None, nosymbol=None):
+            symbol=None, nosymbol=None, no_doc_sections=False):
         """
         Interacts over the kernel-doc results and output messages,
         returning kernel-doc markups on each interaction
@@ -257,7 +257,8 @@ class KernelFiles():
         self.out_style.set_config(self.config)
 
         self.out_style.set_filter(export, internal, symbol, nosymbol,
-                                  function_table, enable_lineno)
+                                  function_table, enable_lineno,
+                                  no_doc_sections)
 
         for fname, arg_tuple in self.results:
             msg = ""
diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index fda07049ecf7..a246d213523c 100755
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -70,6 +70,7 @@ class OutputFormat:
         self.symbol = None
         self.function_table = set()
         self.config = None
+        self.no_doc_sections = False
 
         self.data = ""
 
@@ -77,7 +78,7 @@ class OutputFormat:
         self.config = config
 
     def set_filter(self, export, internal, symbol, nosymbol, function_table,
-                   enable_lineno):
+                   enable_lineno, no_doc_sections):
         """
         Initialize filter variables according with the requested mode.
 
@@ -87,6 +88,7 @@ class OutputFormat:
         """
 
         self.enable_lineno = enable_lineno
+        self.no_doc_sections = no_doc_sections
 
         if symbol:
             self.out_mode = self.OUTPUT_INCLUDE
@@ -117,6 +119,9 @@ class OutputFormat:
     def check_doc(self, name):
         """Check if DOC should be output"""
 
+        if self.no_doc_sections:
+            return False
+
         if self.out_mode == self.OUTPUT_ALL:
             return True
 
-- 
2.49.0

