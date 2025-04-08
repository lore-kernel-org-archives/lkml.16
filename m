Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8607267708;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=pYyFzf9zKVN1op4i2r5jVABJTCYxsabV7FN86htwzFJSstIFQkvI6YmTN3yHrbKuBV8l54YV3ajZUY60GH7gpmIithzHd23mPCjyOnOyzd+EX5QwE+My4YoqO9JcNlc9CfQZLCRS7d3Zk66g4zgloIzfpGrUS1DojjHVDMwAugk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=M/5483xsneVac2QnbA1ZZyNS5r11vVv9aaft8Yje1UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTgw9QNpvhpyRIxelN+pA5UV4jebcgFtRdaLMKT3ChcKvVi/0HLERdQyUXjMHEv9IVk7ujzfGF9su0i0OoP9KJM7bbMva/LPAmMiE2zovabpgfHsh9y4r5xx736FPCjgYzbnqTqL2Q8SyGpCBL9l/5DPCvGQyYw9mLCbBcfHG88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4N3UPvh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4N3UPvh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628B9C4CEF1;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106996;
	bh=M/5483xsneVac2QnbA1ZZyNS5r11vVv9aaft8Yje1UA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H4N3UPvhIOT3p3fhRQOi5DCB5j1bnGfsVRxncUvcuUnsJ2TbOOVo4J+xCIJsTuwOk
	 8wtiv1UK16DJr1bVGzFbwCZpi0rNXMWohwjHZqaGjo8q+m9VLVTUX4I7aNglWBTll+
	 SDztmfh5e08Od6Askc/ObQREySXVfqgKvAbZrpzDCXqAbVFf/8zHMIKF4tJ+v/bO5i
	 Xfg5UDnnyMBvgl/C4NVr0OMJkbF7lSDx8yGROtYHfZqzU8glU6UEi/kTEuhCAAR1rb
	 qng21hz+FBLKxBPEPARQDTN+M1vxD/BCqwQXm2wla42GzxCJ5RsSGq8vEIZGCyW72O
	 FqpiGXZg3dMKg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RVv-1B4E;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/33] scripts/kernel-doc.py: fix line number output
Date: Tue,  8 Apr 2025 18:09:17 +0800
Message-ID: <5182a531d14b5fe9e1fc5da5f9dae05d66852a60.1744106242.git.mchehab+huawei@kernel.org>
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

With the Pyhton version, the actual output happens after parsing,
from records stored at self.entries.

Ensure that line numbers will be properly stored there and
that they'll produce the desired results at the ReST output.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_output.py | 13 +++++++------
 scripts/lib/kdoc/kdoc_parser.py | 21 +++++++++++++++++----
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index a246d213523c..6a7187980bec 100755
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -255,7 +255,8 @@ class RestFormat(OutputFormat):
     def print_lineno(self, ln):
         """Outputs a line number"""
 
-        if self.enable_lineno and ln:
+        if self.enable_lineno and ln is not None:
+            ln += 1
             self.data += f".. LINENO {ln}\n"
 
     def output_highlight(self, args):
@@ -358,7 +359,7 @@ class RestFormat(OutputFormat):
         parameterdescs = args.get('parameterdescs', {})
         parameterdesc_start_lines = args.get('parameterdesc_start_lines', {})
 
-        ln = args.get('ln', 0)
+        ln = args.get('declaration_start_line', 0)
 
         count = 0
         for parameter in parameterlist:
@@ -375,11 +376,11 @@ class RestFormat(OutputFormat):
         if not func_macro:
             signature += ")"
 
+        self.print_lineno(ln)
         if args.get('typedef') or not args.get('functiontype'):
             self.data += f".. c:macro:: {args['function']}\n\n"
 
             if args.get('typedef'):
-                self.print_lineno(ln)
                 self.data += "   **Typedef**: "
                 self.lineprefix = ""
                 self.output_highlight(args.get('purpose', ""))
@@ -434,7 +435,7 @@ class RestFormat(OutputFormat):
         name = args.get('enum', '')
         parameterlist = args.get('parameterlist', [])
         parameterdescs = args.get('parameterdescs', {})
-        ln = args.get('ln', 0)
+        ln = args.get('declaration_start_line', 0)
 
         self.data += f"\n\n.. c:enum:: {name}\n\n"
 
@@ -464,7 +465,7 @@ class RestFormat(OutputFormat):
 
         oldprefix = self.lineprefix
         name = args.get('typedef', '')
-        ln = args.get('ln', 0)
+        ln = args.get('declaration_start_line', 0)
 
         self.data += f"\n\n.. c:type:: {name}\n\n"
 
@@ -484,7 +485,7 @@ class RestFormat(OutputFormat):
         purpose = args.get('purpose', "")
         declaration = args.get('definition', "")
         dtype = args.get('type', "struct")
-        ln = args.get('ln', 0)
+        ln = args.get('declaration_start_line', 0)
 
         parameterlist = args.get('parameterlist', [])
         parameterdescs = args.get('parameterdescs', {})
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 3ce116595546..e8c86448d6b5 100755
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -276,7 +276,7 @@ class KernelDoc:
         self.entry.brcount = 0
 
         self.entry.in_doc_sect = False
-        self.entry.declaration_start_line = ln
+        self.entry.declaration_start_line = ln + 1
 
     def push_parameter(self, ln, decl_type, param, dtype,
                        org_arg, declaration_name):
@@ -806,8 +806,10 @@ class KernelDoc:
                                 parameterlist=self.entry.parameterlist,
                                 parameterdescs=self.entry.parameterdescs,
                                 parametertypes=self.entry.parametertypes,
+                                parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
                                 sectionlist=self.entry.sectionlist,
                                 sections=self.entry.sections,
+                                section_start_lines=self.entry.section_start_lines,
                                 purpose=self.entry.declaration_purpose)
 
     def dump_enum(self, ln, proto):
@@ -882,8 +884,10 @@ class KernelDoc:
                                 module=self.config.modulename,
                                 parameterlist=self.entry.parameterlist,
                                 parameterdescs=self.entry.parameterdescs,
+                                parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
                                 sectionlist=self.entry.sectionlist,
                                 sections=self.entry.sections,
+                                section_start_lines=self.entry.section_start_lines,
                                 purpose=self.entry.declaration_purpose)
 
     def dump_declaration(self, ln, prototype):
@@ -1054,8 +1058,10 @@ class KernelDoc:
                                     parameterlist=self.entry.parameterlist,
                                     parameterdescs=self.entry.parameterdescs,
                                     parametertypes=self.entry.parametertypes,
+                                    parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
                                     sectionlist=self.entry.sectionlist,
                                     sections=self.entry.sections,
+                                    section_start_lines=self.entry.section_start_lines,
                                     purpose=self.entry.declaration_purpose,
                                     func_macro=func_macro)
         else:
@@ -1067,8 +1073,10 @@ class KernelDoc:
                                     parameterlist=self.entry.parameterlist,
                                     parameterdescs=self.entry.parameterdescs,
                                     parametertypes=self.entry.parametertypes,
+                                    parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
                                     sectionlist=self.entry.sectionlist,
                                     sections=self.entry.sections,
+                                    section_start_lines=self.entry.section_start_lines,
                                     purpose=self.entry.declaration_purpose,
                                     func_macro=func_macro)
 
@@ -1112,8 +1120,10 @@ class KernelDoc:
                                     parameterlist=self.entry.parameterlist,
                                     parameterdescs=self.entry.parameterdescs,
                                     parametertypes=self.entry.parametertypes,
+                                    parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
                                     sectionlist=self.entry.sectionlist,
                                     sections=self.entry.sections,
+                                    section_start_lines=self.entry.section_start_lines,
                                     purpose=self.entry.declaration_purpose)
             return
 
@@ -1136,6 +1146,7 @@ class KernelDoc:
                                     module=self.entry.modulename,
                                     sectionlist=self.entry.sectionlist,
                                     sections=self.entry.sections,
+                                    section_start_lines=self.entry.section_start_lines,
                                     purpose=self.entry.declaration_purpose)
             return
 
@@ -1168,7 +1179,7 @@ class KernelDoc:
             return
 
         # start a new entry
-        self.reset_state(ln + 1)
+        self.reset_state(ln)
         self.entry.in_doc_sect = False
 
         # next line is always the function name
@@ -1281,7 +1292,7 @@ class KernelDoc:
             if r.match(line):
                 self.dump_section()
                 self.entry.section = self.section_default
-                self.entry.new_start_line = line
+                self.entry.new_start_line = ln
                 self.entry.contents = ""
 
         if doc_sect.search(line):
@@ -1619,7 +1630,9 @@ class KernelDoc:
             self.dump_section()
             self.output_declaration("doc", None,
                                     sectionlist=self.entry.sectionlist,
-                                    sections=self.entry.sections, module=self.config.modulename)
+                                    sections=self.entry.sections,
+                                    section_start_lines=self.entry.section_start_lines,
+                                    module=self.config.modulename)
             self.reset_state(ln)
 
         elif doc_content.search(line):
-- 
2.49.0

