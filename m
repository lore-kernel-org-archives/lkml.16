Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F67267712;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=t0fNUxdRX4AwJddGz/EyoC0+OqjlIc+O0sdWOmHevGNQLiLlJYDwg47fBZxO/WQvN8Hb8v37DU565DrfDQeKEUwpFGOAKPCn+VgVpUnt05BS7fUUwQ1soH9ahgMQcYEZS2dSh3IIoPF9WBm4iNug8GwVuQGBKpv8mzl01f8tHQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=YknnQNXKSY9zOMID4CuZkIJaoPwVVvWlyNEsLX0P8r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t3im8NncTwFNEwEWdCdEPvQINVsCcVx/sCNK04VrWiP/uJITgd5hoq9lW4cwWFXBu733CJqdEWGz2WLXoBntIX+Dc9MKxWKEkPrzEu4IuuEtCE+3rKDlpXsPy4wdC3oHJN1h6WTKlOkUI39GxEo9ZGOjJtQUGj9dJbB2rzWQw2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2G+KxNA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2G+KxNA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E812C4CEF9;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106996;
	bh=YknnQNXKSY9zOMID4CuZkIJaoPwVVvWlyNEsLX0P8r8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g2G+KxNABV6Nfy9T38lDVc5vC5/3iAXlzZaC5GsDDVeumyylarlckWZIKMhRk+EyO
	 kSItWJ/d+G7OBFcRQ8owgmQUEhhLepX2nYiudTLysUb0L4BeM7ypo/q9SZwTadmVT3
	 ZNIZtEGjLU6kUYvEyOYm8exKaLeLZYC9fZTWqkoUBiyLsqEqTdRFFbS1FW1SEvMZMZ
	 +qNi0JDAw6DQ0u7b6ioaxm5/EhwREHoxf5xqJGRA1F3Z86MR8vS3cQX5op3SoE9FAa
	 jeHzQMbKh5mOsr49/0doJlGDppFfsC2PcCvzjPBuJg3von5EM2QFTryBt4VIeZv37D
	 QdQ9CK1iM8jFw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RWS-2DvZ;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 25/33] scripts/kernel-doc.py: move modulename to man class
Date: Tue,  8 Apr 2025 18:09:28 +0800
Message-ID: <583085e3885b0075d16ef9961b4f2ad870f30a55.1744106242.git.mchehab+huawei@kernel.org>
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

Only man output requires a modulename. Move its definition
to the man class.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py           |  6 +++---
 scripts/lib/kdoc/kdoc_files.py  |  6 +-----
 scripts/lib/kdoc/kdoc_output.py | 12 ++++++------
 scripts/lib/kdoc/kdoc_parser.py |  9 +--------
 4 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index eca7e34f9d03..6a6bc81efd31 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -186,6 +186,7 @@ def main():
                         help="Enable debug messages")
 
     parser.add_argument("-M", "-modulename", "--modulename",
+                        default="Kernel API",
                         help="Allow setting a module name at the output.")
 
     parser.add_argument("-l", "-enable-lineno", "--enable_lineno",
@@ -273,7 +274,7 @@ def main():
     logger.addHandler(handler)
 
     if args.man:
-        out_style = ManFormat()
+        out_style = ManFormat(modulename=args.modulename)
     elif args.none:
         out_style = None
     else:
@@ -282,8 +283,7 @@ def main():
     kfiles = KernelFiles(verbose=args.verbose,
                          out_style=out_style, werror=args.werror,
                          wreturn=args.wreturn, wshort_desc=args.wshort_desc,
-                         wcontents_before_sections=args.wcontents_before_sections,
-                         modulename=args.modulename)
+                         wcontents_before_sections=args.wcontents_before_sections)
 
     kfiles.parse(args.files, export_file=args.export_file)
 
diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
index e2221db7022a..5a6e92e34d05 100644
--- a/scripts/lib/kdoc/kdoc_files.py
+++ b/scripts/lib/kdoc/kdoc_files.py
@@ -126,7 +126,7 @@ class KernelFiles():
     def __init__(self, verbose=False, out_style=None,
                  werror=False, wreturn=False, wshort_desc=False,
                  wcontents_before_sections=False,
-                 logger=None, modulename=None):
+                 logger=None):
         """
         Initialize startup variables and parse all files
         """
@@ -134,9 +134,6 @@ class KernelFiles():
         if not verbose:
             verbose = bool(os.environ.get("KBUILD_VERBOSE", 0))
 
-        if not modulename:
-            modulename = "Kernel API"
-
         if out_style is None:
             out_style = OutputFormat()
 
@@ -168,7 +165,6 @@ class KernelFiles():
         self.config.wreturn = wreturn
         self.config.wshort_desc = wshort_desc
         self.config.wcontents_before_sections = wcontents_before_sections
-        self.config.modulename = modulename
 
         self.config.function_table = set()
         self.config.source_map = {}
diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index e0ed79e4d985..8be69245c0d0 100755
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -586,7 +586,7 @@ class ManFormat(OutputFormat):
     )
     blankline = ""
 
-    def __init__(self):
+    def __init__(self, modulename):
         """
         Creates class variables.
 
@@ -595,6 +595,7 @@ class ManFormat(OutputFormat):
         """
 
         super().__init__()
+        self.modulename = modulename
 
         dt = datetime.now()
         if os.environ.get("KBUILD_BUILD_TIMESTAMP", None):
@@ -626,14 +627,13 @@ class ManFormat(OutputFormat):
                 self.data += line + "\n"
 
     def out_doc(self, fname, name, args):
-        module = args.get('module')
         sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
 
         if not self.check_doc(name, args):
             return
 
-        self.data += f'.TH "{module}" 9 "{module}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.data += f'.TH "{self.modulename}" 9 "{self.modulename}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
         for section in sectionlist:
             self.data += f'.SH "{section}"' + "\n"
@@ -697,7 +697,7 @@ class ManFormat(OutputFormat):
         sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
 
-        self.data += f'.TH "{args["module"]}" 9 "enum {args["enum"]}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.data += f'.TH "{self.modulename}" 9 "enum {args["enum"]}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
         self.data += ".SH NAME\n"
         self.data += f"enum {args['enum']} \\- {args['purpose']}\n"
@@ -727,7 +727,7 @@ class ManFormat(OutputFormat):
             self.output_highlight(sections[section])
 
     def out_typedef(self, fname, name, args):
-        module = args.get('module')
+        module = self.modulename
         typedef = args.get('typedef')
         purpose = args.get('purpose')
         sectionlist = args.get('sectionlist', [])
@@ -743,7 +743,7 @@ class ManFormat(OutputFormat):
             self.output_highlight(sections.get(section))
 
     def out_struct(self, fname, name, args):
-        module = args.get('module')
+        module = self.modulename
         struct_type = args.get('type')
         struct_name = args.get('struct')
         purpose = args.get('purpose')
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index e48ed128ca04..f923600561f8 100755
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -791,7 +791,6 @@ class KernelDoc:
 
         self.output_declaration(decl_type, declaration_name,
                                 struct=declaration_name,
-                                module=self.entry.modulename,
                                 definition=declaration,
                                 parameterlist=self.entry.parameterlist,
                                 parameterdescs=self.entry.parameterdescs,
@@ -869,7 +868,6 @@ class KernelDoc:
 
         self.output_declaration('enum', declaration_name,
                                 enum=declaration_name,
-                                module=self.config.modulename,
                                 parameterlist=self.entry.parameterlist,
                                 parameterdescs=self.entry.parameterdescs,
                                 parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
@@ -1040,7 +1038,6 @@ class KernelDoc:
             self.output_declaration(decl_type, declaration_name,
                                     function=declaration_name,
                                     typedef=True,
-                                    module=self.config.modulename,
                                     functiontype=return_type,
                                     parameterlist=self.entry.parameterlist,
                                     parameterdescs=self.entry.parameterdescs,
@@ -1055,7 +1052,6 @@ class KernelDoc:
             self.output_declaration(decl_type, declaration_name,
                                     function=declaration_name,
                                     typedef=False,
-                                    module=self.config.modulename,
                                     functiontype=return_type,
                                     parameterlist=self.entry.parameterlist,
                                     parameterdescs=self.entry.parameterdescs,
@@ -1102,7 +1098,6 @@ class KernelDoc:
             self.output_declaration(decl_type, declaration_name,
                                     function=declaration_name,
                                     typedef=True,
-                                    module=self.entry.modulename,
                                     functiontype=return_type,
                                     parameterlist=self.entry.parameterlist,
                                     parameterdescs=self.entry.parameterdescs,
@@ -1130,7 +1125,6 @@ class KernelDoc:
 
             self.output_declaration('typedef', declaration_name,
                                     typedef=declaration_name,
-                                    module=self.entry.modulename,
                                     sectionlist=self.entry.sectionlist,
                                     sections=self.entry.sections,
                                     section_start_lines=self.entry.section_start_lines,
@@ -1619,8 +1613,7 @@ class KernelDoc:
             self.output_declaration("doc", self.entry.identifier,
                                     sectionlist=self.entry.sectionlist,
                                     sections=self.entry.sections,
-                                    section_start_lines=self.entry.section_start_lines,
-                                    module=self.config.modulename)
+                                    section_start_lines=self.entry.section_start_lines)
             self.reset_state(ln)
 
         elif doc_content.search(line):
-- 
2.49.0

