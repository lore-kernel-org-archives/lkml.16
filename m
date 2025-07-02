Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8BF21770B;
	Wed,  2 Jul 2025 22:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751496361; cv=none; b=KP4gN7s87XhQ5bgrKsjqdJqkjAXYLeZ+9Q7J+amRHumIa6728e+QRjwoDGURDFfXzZDhTF7YQExlRd7BIV1FspMsAmgjGS83HBebtro46/MqnEbj3amtOhtQnsRVIqgHhKCTHuDOD4mZd7/5MTK1BRHS+X8bz9YXNSoMQt7AyG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751496361; c=relaxed/simple;
	bh=UPS3jRecEgBaQrFDvJUIey28qto38FfAohZ6dAgaey8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iDBV2CFVIOqXvNC0rbWysm/Posjaiex6liktgvshC4pforpbY+/8X1Ey3FVYdIg0uaeSKcPFPhl+ogRIOaFpEhkFOgbCIRIvnAHLubb1s2XA8z9/ATzd6/wjF0xNkqwtzBkQyMKpY/v1v9O8yM9/ey69ZePfct3WfbCVbboPxzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KvS4CyeV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KvS4CyeV"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D13E440AD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751495761; bh=/IXkiFnHxKywSEBZcmAZNPVT8JLzPS8dyYGnsbT50ws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KvS4CyeVaC8a0sxpwR43rOHRMW3jcor+9DSHtk5uzdQDG6xTjocJpgloDaT9W6vJF
	 knUAKp9elkA6NreE+rup+gXKwpJieNqPotvRY1JrP4KZQzN2X/yYHXXm5MPzJ8h9aY
	 vZnaiOxyJ+2Gofiofppjk9jG2As7tg0kbju3nuJ1a6qm9nnempNvi6F7tlBa1UgzMi
	 esnPLlJ+/2ZTOW5qRu7Zy+DEXOPw+VRCgYNwlM0XJoOFstDoox9lxNfkZYKG0lh9de
	 TMDsNawsVv6YK10Ohf4lfu63jAuzIU0K+6YyWiG8vBcMCzU/DznQ3GZ5tAQeb6FxYz
	 oHWhc8ottBSvA==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id D13E440AD6;
	Wed,  2 Jul 2025 22:36:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 04/12] docs: kdoc: Centralize handling of the item section list
Date: Wed,  2 Jul 2025 16:35:16 -0600
Message-ID: <20250702223524.231794-5-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702223524.231794-1-corbet@lwn.net>
References: <20250702223524.231794-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The section list always comes directly from the under-construction entry
and is used uniformly.  Formalize section handling in the KdocItem class,
and have output_declaration() load the sections directly from the entry,
eliminating a lot of duplicated, verbose parameters.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_item.py   |  8 ++++++++
 scripts/lib/kdoc/kdoc_output.py | 36 ++++++++++++---------------------
 scripts/lib/kdoc/kdoc_parser.py | 20 +++---------------
 3 files changed, 24 insertions(+), 40 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_item.py b/scripts/lib/kdoc/kdoc_item.py
index add2cc772fec..c8329019a219 100644
--- a/scripts/lib/kdoc/kdoc_item.py
+++ b/scripts/lib/kdoc/kdoc_item.py
@@ -9,6 +9,7 @@ class KdocItem:
         self.name = name
         self.type = type
         self.declaration_start_line = start_line
+        self.sections = self.sections_start_lines = { }
         #
         # Just save everything else into our own dict so that the output
         # side can grab it directly as before.  As we move things into more
@@ -24,3 +25,10 @@ class KdocItem:
 
     def __getitem__(self, key):
         return self.get(key)
+
+    #
+    # Tracking of section information.
+    #
+    def set_sections(self, sections, start_lines):
+        self.sections = sections
+        self.section_start_lines = start_lines
diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index 4895c80e4b81..15cb89f91987 100644
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -338,11 +338,7 @@ class RestFormat(OutputFormat):
         starts by putting out the name of the doc section itself, but that
         tends to duplicate a header already in the template file.
         """
-
-        sections = args.get('sections', {})
-        section_start_lines = args.get('section_start_lines', {})
-
-        for section in sections:
+        for section, text in args.sections.items():
             # Skip sections that are in the nosymbol_table
             if section in self.nosymbol:
                 continue
@@ -354,8 +350,8 @@ class RestFormat(OutputFormat):
             else:
                 self.data += f'{self.lineprefix}**{section}**\n\n'
 
-            self.print_lineno(section_start_lines.get(section, 0))
-            self.output_highlight(sections[section])
+            self.print_lineno(args.section_start_lines.get(section, 0))
+            self.output_highlight(text)
             self.data += "\n"
         self.data += "\n"
 
@@ -635,23 +631,20 @@ class ManFormat(OutputFormat):
                 self.data += line + "\n"
 
     def out_doc(self, fname, name, args):
-        sections = args.get('sections', {})
-
         if not self.check_doc(name, args):
             return
 
         self.data += f'.TH "{self.modulename}" 9 "{self.modulename}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
-        for section in sections:
+        for section, text in args.sections.items():
             self.data += f'.SH "{section}"' + "\n"
-            self.output_highlight(sections.get(section))
+            self.output_highlight(text)
 
     def out_function(self, fname, name, args):
         """output function in man"""
 
         parameterlist = args.get('parameterlist', [])
         parameterdescs = args.get('parameterdescs', {})
-        sections = args.get('sections', {})
 
         self.data += f'.TH "{args["function"]}" 9 "{args["function"]}" "{self.man_date}" "Kernel Hacker\'s Manual" LINUX' + "\n"
 
@@ -692,15 +685,14 @@ class ManFormat(OutputFormat):
             self.data += f'.IP "{parameter}" 12' + "\n"
             self.output_highlight(parameterdescs.get(parameter_name, ""))
 
-        for section in sections:
+        for section, text in args.sections.items():
             self.data += f'.SH "{section.upper()}"' + "\n"
-            self.output_highlight(sections[section])
+            self.output_highlight(text)
 
     def out_enum(self, fname, name, args):
 
         name = args.get('enum', '')
         parameterlist = args.get('parameterlist', [])
-        sections = args.get('sections', {})
 
         self.data += f'.TH "{self.modulename}" 9 "enum {args["enum"]}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
@@ -727,24 +719,23 @@ class ManFormat(OutputFormat):
             self.data += f'.IP "{parameter}" 12' + "\n"
             self.output_highlight(args['parameterdescs'].get(parameter_name, ""))
 
-        for section in sections:
+        for section, text in args.sections.items():
             self.data += f'.SH "{section}"' + "\n"
-            self.output_highlight(sections[section])
+            self.output_highlight(text)
 
     def out_typedef(self, fname, name, args):
         module = self.modulename
         typedef = args.get('typedef')
         purpose = args.get('purpose')
-        sections = args.get('sections', {})
 
         self.data += f'.TH "{module}" 9 "{typedef}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
         self.data += ".SH NAME\n"
         self.data += f"typedef {typedef} \\- {purpose}\n"
 
-        for section in sections:
+        for section, text in args.sections.items():
             self.data += f'.SH "{section}"' + "\n"
-            self.output_highlight(sections.get(section))
+            self.output_highlight(text)
 
     def out_struct(self, fname, name, args):
         module = self.modulename
@@ -753,7 +744,6 @@ class ManFormat(OutputFormat):
         purpose = args.get('purpose')
         definition = args.get('definition')
         parameterlist = args.get('parameterlist', [])
-        sections = args.get('sections', {})
         parameterdescs = args.get('parameterdescs', {})
 
         self.data += f'.TH "{module}" 9 "{struct_type} {struct_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
@@ -782,6 +772,6 @@ class ManFormat(OutputFormat):
             self.data += f'.IP "{parameter}" 12' + "\n"
             self.output_highlight(parameterdescs.get(parameter_name))
 
-        for section in sections:
+        for section, text in args.sections.items():
             self.data += f'.SH "{section}"' + "\n"
-            self.output_highlight(sections.get(section))
+            self.output_highlight(text)
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 2e00c8b3a5f2..608f3a1045dc 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -272,13 +272,13 @@ class KernelDoc:
         item = KdocItem(name, dtype, self.entry.declaration_start_line, **args)
         item.warnings = self.entry.warnings
 
-        sections = item.get('sections', {})
-
         # Drop empty sections
         # TODO: improve empty sections logic to emit warnings
+        sections = self.entry.sections
         for section in ["Description", "Return"]:
             if section in sections and not sections[section].rstrip():
                 del sections[section]
+        item.set_sections(sections, self.entry.section_start_lines)
 
         self.entries.append(item)
 
@@ -824,8 +824,6 @@ class KernelDoc:
                                 parameterdescs=self.entry.parameterdescs,
                                 parametertypes=self.entry.parametertypes,
                                 parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
-                                sections=self.entry.sections,
-                                section_start_lines=self.entry.section_start_lines,
                                 purpose=self.entry.declaration_purpose)
 
     def dump_enum(self, ln, proto):
@@ -908,8 +906,6 @@ class KernelDoc:
                                 parameterlist=self.entry.parameterlist,
                                 parameterdescs=self.entry.parameterdescs,
                                 parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
-                                sections=self.entry.sections,
-                                section_start_lines=self.entry.section_start_lines,
                                 purpose=self.entry.declaration_purpose)
 
     def dump_declaration(self, ln, prototype):
@@ -1079,8 +1075,6 @@ class KernelDoc:
                                     parameterdescs=self.entry.parameterdescs,
                                     parametertypes=self.entry.parametertypes,
                                     parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
-                                    sections=self.entry.sections,
-                                    section_start_lines=self.entry.section_start_lines,
                                     purpose=self.entry.declaration_purpose,
                                     func_macro=func_macro)
         else:
@@ -1092,8 +1086,6 @@ class KernelDoc:
                                     parameterdescs=self.entry.parameterdescs,
                                     parametertypes=self.entry.parametertypes,
                                     parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
-                                    sections=self.entry.sections,
-                                    section_start_lines=self.entry.section_start_lines,
                                     purpose=self.entry.declaration_purpose,
                                     func_macro=func_macro)
 
@@ -1137,8 +1129,6 @@ class KernelDoc:
                                     parameterdescs=self.entry.parameterdescs,
                                     parametertypes=self.entry.parametertypes,
                                     parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
-                                    sections=self.entry.sections,
-                                    section_start_lines=self.entry.section_start_lines,
                                     purpose=self.entry.declaration_purpose)
             return
 
@@ -1159,8 +1149,6 @@ class KernelDoc:
 
             self.output_declaration('typedef', declaration_name,
                                     typedef=declaration_name,
-                                    sections=self.entry.sections,
-                                    section_start_lines=self.entry.section_start_lines,
                                     purpose=self.entry.declaration_purpose)
             return
 
@@ -1642,9 +1630,7 @@ class KernelDoc:
 
         if doc_end.search(line):
             self.dump_section()
-            self.output_declaration("doc", self.entry.identifier,
-                                    sections=self.entry.sections,
-                                    section_start_lines=self.entry.section_start_lines)
+            self.output_declaration("doc", self.entry.identifier)
             self.reset_state(ln)
 
         elif doc_content.search(line):
-- 
2.49.0

