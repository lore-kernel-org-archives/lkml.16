Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97C41C07C3;
	Wed,  2 Jul 2025 22:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751496361; cv=none; b=HwFgZCe1/oW8h87mbqM7qHuB6raaND0eqsBBEONkuUA0iDZ4umgE/8OFbbclDGhOyePySvue7BcuoeaXLvqNI1FVmcRy2UL1NdEq+OiuIeMDJW5ADu4nGKeFzv6gHQY+OQA6XoacEuUMtZGNbz9yHIMq2BJ2yWg+pu8BE3R5/NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751496361; c=relaxed/simple;
	bh=Pgb8LSDtxIzqmAipgaHHQZ057ikA2yl3SNNhfO18ASU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/3GV5t7xsPrO19aStIuP8r4OTv3ivIHi0fQv5J7WTXOcbuMUQKnpdI6o2tSPEhPIv8aUaxlBfTWNdZv4YXLO+BZqWQN4muM3qPRUG/6vShXLc2kKUJmxDivMJeDaIEfwhrpDhx24BBSWHtH84FtBRAJ/JWbyByWYj2RrKcuW8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mP7rfF/L; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mP7rfF/L"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4A8E840AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751495760; bh=NYjm9zhDgUZ/tCYwlre9mvWRl7P3MGpd9SwqGGfx1rY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mP7rfF/LyKKrFTLyAz4yiNh5NXnDLLO6wN1+Mt9KCLMoi3WtKyyXiFwcRghl2/Mkm
	 zIDKQIxOKq3WhwWq92w4gcaW5ZsE0I9qId8yP5wmfRWwkOAOWn4PrX6jJ4Fa/2CMIW
	 2tZysPs2f3mJSjauHl1qQGM9ZN7Ja8VrN9Fg5l8RA9qKb46VdEwRngXzDmNsQ1ALEW
	 WfrngAfyf1YKbozOFjV9xdKYM4RVCiWqCwyuAinox+db/CEnX8DdUEZ6MPZaJQzV1m
	 JjjkmXmXLAj0v60CYZfP6Vr5CxsxN62ZClcocbu5xCvCTHG/RMJpabBROoafO47lTQ
	 fGBi0IrWCWbPA==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 4A8E840AD5;
	Wed,  2 Jul 2025 22:36:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 03/12] docs: kdoc: drop "sectionlist"
Date: Wed,  2 Jul 2025 16:35:15 -0600
Message-ID: <20250702223524.231794-4-corbet@lwn.net>
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

Python dicts (as of 3.7) are guaranteed to remember the insertion order of
items, so we do not need a separate list for that purpose.  Drop the
per-entry sectionlist variable and just rely on native dict ordering.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_output.py | 18 ++++++------------
 scripts/lib/kdoc/kdoc_parser.py | 13 +------------
 2 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index 86102e628d91..4895c80e4b81 100644
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -339,11 +339,10 @@ class RestFormat(OutputFormat):
         tends to duplicate a header already in the template file.
         """
 
-        sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
         section_start_lines = args.get('section_start_lines', {})
 
-        for section in sectionlist:
+        for section in sections:
             # Skip sections that are in the nosymbol_table
             if section in self.nosymbol:
                 continue
@@ -636,7 +635,6 @@ class ManFormat(OutputFormat):
                 self.data += line + "\n"
 
     def out_doc(self, fname, name, args):
-        sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
 
         if not self.check_doc(name, args):
@@ -644,7 +642,7 @@ class ManFormat(OutputFormat):
 
         self.data += f'.TH "{self.modulename}" 9 "{self.modulename}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
-        for section in sectionlist:
+        for section in sections:
             self.data += f'.SH "{section}"' + "\n"
             self.output_highlight(sections.get(section))
 
@@ -653,7 +651,6 @@ class ManFormat(OutputFormat):
 
         parameterlist = args.get('parameterlist', [])
         parameterdescs = args.get('parameterdescs', {})
-        sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
 
         self.data += f'.TH "{args["function"]}" 9 "{args["function"]}" "{self.man_date}" "Kernel Hacker\'s Manual" LINUX' + "\n"
@@ -695,7 +692,7 @@ class ManFormat(OutputFormat):
             self.data += f'.IP "{parameter}" 12' + "\n"
             self.output_highlight(parameterdescs.get(parameter_name, ""))
 
-        for section in sectionlist:
+        for section in sections:
             self.data += f'.SH "{section.upper()}"' + "\n"
             self.output_highlight(sections[section])
 
@@ -703,7 +700,6 @@ class ManFormat(OutputFormat):
 
         name = args.get('enum', '')
         parameterlist = args.get('parameterlist', [])
-        sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
 
         self.data += f'.TH "{self.modulename}" 9 "enum {args["enum"]}" "{self.man_date}" "API Manual" LINUX' + "\n"
@@ -731,7 +727,7 @@ class ManFormat(OutputFormat):
             self.data += f'.IP "{parameter}" 12' + "\n"
             self.output_highlight(args['parameterdescs'].get(parameter_name, ""))
 
-        for section in sectionlist:
+        for section in sections:
             self.data += f'.SH "{section}"' + "\n"
             self.output_highlight(sections[section])
 
@@ -739,7 +735,6 @@ class ManFormat(OutputFormat):
         module = self.modulename
         typedef = args.get('typedef')
         purpose = args.get('purpose')
-        sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
 
         self.data += f'.TH "{module}" 9 "{typedef}" "{self.man_date}" "API Manual" LINUX' + "\n"
@@ -747,7 +742,7 @@ class ManFormat(OutputFormat):
         self.data += ".SH NAME\n"
         self.data += f"typedef {typedef} \\- {purpose}\n"
 
-        for section in sectionlist:
+        for section in sections:
             self.data += f'.SH "{section}"' + "\n"
             self.output_highlight(sections.get(section))
 
@@ -757,7 +752,6 @@ class ManFormat(OutputFormat):
         struct_name = args.get('struct')
         purpose = args.get('purpose')
         definition = args.get('definition')
-        sectionlist = args.get('sectionlist', [])
         parameterlist = args.get('parameterlist', [])
         sections = args.get('sections', {})
         parameterdescs = args.get('parameterdescs', {})
@@ -788,6 +782,6 @@ class ManFormat(OutputFormat):
             self.data += f'.IP "{parameter}" 12' + "\n"
             self.output_highlight(parameterdescs.get(parameter_name))
 
-        for section in sectionlist:
+        for section in sections:
             self.data += f'.SH "{section}"' + "\n"
             self.output_highlight(sections.get(section))
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 97380ff30a0d..2e00c8b3a5f2 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -127,7 +127,6 @@ class KernelEntry:
         self.parameterdesc_start_lines = {}
 
         self.section_start_lines = {}
-        self.sectionlist = []
         self.sections = {}
 
         self.anon_struct_union = False
@@ -202,7 +201,6 @@ class KernelEntry:
                 self.sections[name] += '\n' + contents
             else:
                 self.sections[name] = contents
-                self.sectionlist.append(name)
                 self.section_start_lines[name] = self.new_start_line
                 self.new_start_line = 0
 
@@ -275,14 +273,12 @@ class KernelDoc:
         item.warnings = self.entry.warnings
 
         sections = item.get('sections', {})
-        sectionlist = item.get('sectionlist', [])
 
         # Drop empty sections
         # TODO: improve empty sections logic to emit warnings
         for section in ["Description", "Return"]:
-            if section in sectionlist and not sections[section].rstrip():
+            if section in sections and not sections[section].rstrip():
                 del sections[section]
-                sectionlist.remove(section)
 
         self.entries.append(item)
 
@@ -828,7 +824,6 @@ class KernelDoc:
                                 parameterdescs=self.entry.parameterdescs,
                                 parametertypes=self.entry.parametertypes,
                                 parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
-                                sectionlist=self.entry.sectionlist,
                                 sections=self.entry.sections,
                                 section_start_lines=self.entry.section_start_lines,
                                 purpose=self.entry.declaration_purpose)
@@ -913,7 +908,6 @@ class KernelDoc:
                                 parameterlist=self.entry.parameterlist,
                                 parameterdescs=self.entry.parameterdescs,
                                 parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
-                                sectionlist=self.entry.sectionlist,
                                 sections=self.entry.sections,
                                 section_start_lines=self.entry.section_start_lines,
                                 purpose=self.entry.declaration_purpose)
@@ -1085,7 +1079,6 @@ class KernelDoc:
                                     parameterdescs=self.entry.parameterdescs,
                                     parametertypes=self.entry.parametertypes,
                                     parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
-                                    sectionlist=self.entry.sectionlist,
                                     sections=self.entry.sections,
                                     section_start_lines=self.entry.section_start_lines,
                                     purpose=self.entry.declaration_purpose,
@@ -1099,7 +1092,6 @@ class KernelDoc:
                                     parameterdescs=self.entry.parameterdescs,
                                     parametertypes=self.entry.parametertypes,
                                     parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
-                                    sectionlist=self.entry.sectionlist,
                                     sections=self.entry.sections,
                                     section_start_lines=self.entry.section_start_lines,
                                     purpose=self.entry.declaration_purpose,
@@ -1145,7 +1137,6 @@ class KernelDoc:
                                     parameterdescs=self.entry.parameterdescs,
                                     parametertypes=self.entry.parametertypes,
                                     parameterdesc_start_lines=self.entry.parameterdesc_start_lines,
-                                    sectionlist=self.entry.sectionlist,
                                     sections=self.entry.sections,
                                     section_start_lines=self.entry.section_start_lines,
                                     purpose=self.entry.declaration_purpose)
@@ -1168,7 +1159,6 @@ class KernelDoc:
 
             self.output_declaration('typedef', declaration_name,
                                     typedef=declaration_name,
-                                    sectionlist=self.entry.sectionlist,
                                     sections=self.entry.sections,
                                     section_start_lines=self.entry.section_start_lines,
                                     purpose=self.entry.declaration_purpose)
@@ -1653,7 +1643,6 @@ class KernelDoc:
         if doc_end.search(line):
             self.dump_section()
             self.output_declaration("doc", self.entry.identifier,
-                                    sectionlist=self.entry.sectionlist,
                                     sections=self.entry.sections,
                                     section_start_lines=self.entry.section_start_lines)
             self.reset_state(ln)
-- 
2.49.0

