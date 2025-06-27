Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B712EBDF2;
	Fri, 27 Jun 2025 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049617; cv=none; b=mRZxxHd85fY4Y8xaTGvNT5dH7WpGm5iC9QpBpWLFYJ0bCWnnPM8rHwoTtMjcHyjCcy7NXwhUnQTZyDutH/8OfeD4R4g49j9/sf2xjJNAMLOWnnZAI5r6HkCJ24iC5y/EKXxlRR+AuP2Nu1PIb+Kaxl5yMdkcsY6xG4Jfu1IHxl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049617; c=relaxed/simple;
	bh=7cMjQhucmymQ0w9SiWyAGJBSpMJ4zSOPqmEJCXm4PpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G12K0prv24+L6/iAqqpNuUofJJIIBP5/PE+siHrPURjJBlGMB2mR7aL9r65k7jXFX7Ysa8NNQM12VaEJXxXYb6rVqnZye4r9RO5SzUTteqM1xZVx3zt3pMxQkYrX9wZtt82sGTNeOpjB+NrzWQMtsv9qbFaDcy0TLrFn03kLvpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=K9sQvt6e; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="K9sQvt6e"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A742440AD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751049615; bh=06Uw1dFoiz9YMeGTYBzxq40tnk43FQ4EMKIpINn4oWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K9sQvt6eGnXmNzLoW0cH03/OGtlVECVF29ifv/88WX1yX3aYMy8uRv+FIBYa+XFfY
	 EkWPJmxsUNWL2iiy1WJb+3PXII3MEDZ/SWyKHNndN3FeRMhDlWxLBz9I8mQywmXnrs
	 jrnkRDdjRERa2OquNMOonfVCHajLvZB1ym7aAu5NZ96KYZPE8YZOtmZMsPYKCedpS3
	 Ra+MXhUA4H+q8skcNWy5Z+m1TVGfg6DTbPqdhgS8epqiZfkBeKY0951esTBjwLt6n+
	 fCUN7a7KsUvyUW8z6MQUW8IK5vENKMsj6AsMCWy5XYX7AP4I1WZaUDKu0VvLEc7Yz1
	 n3r99Q7JQQlYA==
Received: from trenco.lwn.net (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	by ms.lwn.net (Postfix) with ESMTPA id A742440AD3;
	Fri, 27 Jun 2025 18:40:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/8] docs: kdoc: Move content handling into KernelEntry
Date: Fri, 27 Jun 2025 12:39:54 -0600
Message-ID: <20250627184000.132291-3-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627184000.132291-1-corbet@lwn.net>
References: <20250627184000.132291-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than having other code mucking around with this bit of internal
state, encapsulate it internally.  Accumulate the description as a list of
strings, joining them at the end, which is a more efficient way of building
the text.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 62 ++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index f3970ffbf402..f87355b63c19 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -128,7 +128,7 @@ class KernelEntry:
     def __init__(self, config, ln):
         self.config = config
 
-        self.contents = ""
+        self._contents = []
         self.function = ""
         self.sectcheck = ""
         self.struct_actual = ""
@@ -153,6 +153,15 @@ class KernelEntry:
         self.brcount = 0
         self.declaration_start_line = ln + 1
 
+    #
+    # Management of section contents
+    #
+    def add_text(self, text):
+        self._contents.append(text)
+
+    def contents(self):
+        return '\n'.join(self._contents) + '\n'
+
     # TODO: rename to emit_message after removal of kernel-doc.pl
     def emit_msg(self, log_msg, warning=True):
         """Emit a message"""
@@ -180,9 +189,14 @@ class KernelEntry:
         """
         Dumps section contents to arrays/hashes intended for that purpose.
         """
-
+        #
+        # If we have accumulated no contents in the default ("description")
+        # section, don't bother.
+        #
+        if self.section == SECTION_DEFAULT and not self._contents:
+            return
         name = self.section
-        contents = self.contents
+        contents = self.contents()
 
         if type_param.match(name):
             name = type_param.group(1)
@@ -206,7 +220,8 @@ class KernelEntry:
                 if name != SECTION_DEFAULT:
                     self.emit_msg(self.new_start_line,
                                   f"duplicate section name '{name}'\n")
-                self.sections[name] += contents
+                # Treat as a new paragraph - add a blank line
+                self.sections[name] += '\n' + contents
             else:
                 self.sections[name] = contents
                 self.sectionlist.append(name)
@@ -217,7 +232,7 @@ class KernelEntry:
 
         if start_new:
             self.section = SECTION_DEFAULT
-            self.contents = ""
+            self._contents = []
 
 
 class KernelDoc:
@@ -1334,16 +1349,11 @@ class KernelDoc:
             newcontents = doc_sect.group(2)
             if not newcontents:
                 newcontents = ""
-
-            if self.entry.contents.strip("\n"):
-                self.dump_section()
-
+            self.dump_section()
             self.entry.begin_section(ln, newsection)
             self.entry.leading_space = None
 
-            self.entry.contents = newcontents.lstrip()
-            if self.entry.contents:
-                self.entry.contents += "\n"
+            self.entry.add_text(newcontents.lstrip())
             return True
         return False
 
@@ -1385,7 +1395,6 @@ class KernelDoc:
             #
             if cont == "":
                 self.state = state.BODY
-                self.entry.contents += "\n"  # needed?
             #
             # Otherwise we have more of the declaration section to soak up.
             #
@@ -1407,7 +1416,6 @@ class KernelDoc:
         #
         if KernRe(r"\s*\*\s*$").match(line):
             self.entry.begin_section(ln, dump = True)
-            self.entry.contents += '\n'
             self.state = state.BODY
             return
         #
@@ -1444,7 +1452,7 @@ class KernelDoc:
             #
             # Add the trimmed result to the section and we're done.
             #
-            self.entry.contents += cont[self.entry.leading_space:] + '\n'
+            self.entry.add_text(cont[self.entry.leading_space:])
         else:
             # Unknown line, ignore
             self.emit_msg(ln, f"bad line: {line}")
@@ -1458,7 +1466,7 @@ class KernelDoc:
 
         if doc_content.search(line):
             cont = doc_content.group(1)
-            self.entry.contents += cont + "\n"
+            self.entry.add_text(cont)
         else:
             # Unknown line, ignore
             self.emit_msg(ln, f"bad line: {line}")
@@ -1470,27 +1478,20 @@ class KernelDoc:
            doc_inline_sect.search(line):
             self.entry.begin_section(ln, doc_inline_sect.group(1))
 
-            self.entry.contents = doc_inline_sect.group(2).lstrip()
-            if self.entry.contents != "":
-                self.entry.contents += "\n"
-
+            self.entry.add_text(doc_inline_sect.group(2).lstrip())
             self.inline_doc_state = state.INLINE_TEXT
             # Documentation block end */
             return
 
         if doc_inline_end.search(line):
-            if self.entry.contents not in ["", "\n"]:
-                self.dump_section()
-
+            self.dump_section()
             self.state = state.PROTO
             self.inline_doc_state = state.INLINE_NA
             return
 
         if doc_content.search(line):
             if self.inline_doc_state == state.INLINE_TEXT:
-                self.entry.contents += doc_content.group(1) + "\n"
-                if not self.entry.contents.strip(" ").rstrip("\n"):
-                    self.entry.contents = ""
+                self.entry.add_text(doc_content.group(1))
 
             elif self.inline_doc_state == state.INLINE_NAME:
                 self.emit_msg(ln,
@@ -1668,11 +1669,8 @@ class KernelDoc:
 
         if doc_inline_oneline.search(line):
             self.entry.begin_section(ln, doc_inline_oneline.group(1))
-            self.entry.contents = doc_inline_oneline.group(2)
-
-            if self.entry.contents != "":
-                self.entry.contents += "\n"
-                self.dump_section(start_new=False)
+            self.entry.add_text(doc_inline_oneline.group(2))
+            self.dump_section()
 
         elif doc_inline_start.search(line):
             self.state = state.INLINE
@@ -1696,7 +1694,7 @@ class KernelDoc:
             self.reset_state(ln)
 
         elif doc_content.search(line):
-            self.entry.contents += doc_content.group(1) + "\n"
+            self.entry.add_text(doc_content.group(1))
 
     def parse_export(self):
         """
-- 
2.49.0

