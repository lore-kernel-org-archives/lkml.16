Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C612147F2;
	Tue, 15 Apr 2025 03:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744686800; cv=none; b=XkK3wGCyj7Gm0GLgXweSsKitqWpZ+R54ijJhvZANYfl68NzgEy8OjLuNkAe7DAptAwd6AaHOLYUNbQS5m4LT93kp638rK16qb5cOkNEp3Sgi7NDbv8O81ybSP+9cqGUhKj7vOeIYltmbK8U7evL32bz3HNzm7ssybFmC+ikiegQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744686800; c=relaxed/simple;
	bh=cBxfVJXfS6rXbTztBE/vjmAWRsDhtuQ7i5IC2EtKpNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JogVbZFx89HpR7/wyzpMhp66n4Bp4uAbPPaz6fAYg+G7+do+SoarnupW8BtjuzXlWmY03XgeeDwX4f/KLlnySvN+ox9JpqftYGSbzgiowg6deRZA5MdEl+IBgvacd90NrgD37LQ+vd+5f9w0d+LtbD86PjiLOWJJl6IgCZFMKpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pVeB+4ZU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pVeB+4ZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2189C4AF09;
	Tue, 15 Apr 2025 03:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744686800;
	bh=cBxfVJXfS6rXbTztBE/vjmAWRsDhtuQ7i5IC2EtKpNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pVeB+4ZUhN+sVHOYldvnNSWVqP3OTRIEeOgtf6BpLWNVNwxR8xiy8tmkLa05vukqP
	 CHzjdg7Dt+/8qoKiMVYQJAB8ZEfVy2XG3ZDKJLeC3did31PQLyWzBV160Bbhr+fCtx
	 qZLYwN9hrLpYlf0WeprhMz3mfF8GozDiQsKrLkcQQakVc9acnAAWtr7DB/bon1wSH1
	 CbeI4p8XPo9G27JGyYgJ63295/Opx4GYnppeULB0DFa1SIhpCOpAqdsUf7bki88Jk0
	 aBEu8cx7+TW5m7zluhGGrGVFnHZqw/HgbjalQDbyL+kJNQ+EBkoIqtDmwtYlNVR1kV
	 TPunRPJHsUvow==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u4WjU-00000002FHG-3vES;
	Tue, 15 Apr 2025 11:13:08 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] scripts/lib/kdoc/kdoc_parser.py: move states to a separate class
Date: Tue, 15 Apr 2025 11:12:49 +0800
Message-ID: <00cb4e0b8a1545bf7c4401b58213841db5cba2e2.1744685912.git.mchehab+huawei@kernel.org>
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

States are really enums. on Python, enums are actually classes,
as can be seen at:
	https://docs.python.org/3/library/enum.html

Yet, I can't see any advantage of derivating the class from
enum class here. So, just place the states on a separate class.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_parser.py | 119 +++++++++++++++++---------------
 1 file changed, 62 insertions(+), 57 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 4f036c720b36..461e0acb0fb7 100755
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -61,24 +61,22 @@ export_symbol_ns = KernRe(r'^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,\s*"\S+"
 
 type_param = KernRe(r"\@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)", cache=False)
 
-
-class KernelDoc:
+class state:
     """
-    Read a C language source or header FILE and extract embedded
-    documentation comments.
+    State machine enums
     """
 
     # Parser states
-    STATE_NORMAL        = 0        # normal code
-    STATE_NAME          = 1        # looking for function name
-    STATE_BODY_MAYBE    = 2        # body - or maybe more description
-    STATE_BODY          = 3        # the body of the comment
-    STATE_BODY_WITH_BLANK_LINE = 4 # the body which has a blank line
-    STATE_PROTO         = 5        # scanning prototype
-    STATE_DOCBLOCK      = 6        # documentation block
-    STATE_INLINE        = 7        # gathering doc outside main block
+    NORMAL        = 0        # normal code
+    NAME          = 1        # looking for function name
+    BODY_MAYBE    = 2        # body - or maybe more description
+    BODY          = 3        # the body of the comment
+    BODY_WITH_BLANK_LINE = 4 # the body which has a blank line
+    PROTO         = 5        # scanning prototype
+    DOCBLOCK      = 6        # documentation block
+    INLINE        = 7        # gathering doc outside main block
 
-    st_name = [
+    name = [
         "NORMAL",
         "NAME",
         "BODY_MAYBE",
@@ -90,15 +88,15 @@ class KernelDoc:
     ]
 
     # Inline documentation state
-    STATE_INLINE_NA     = 0 # not applicable ($state != STATE_INLINE)
-    STATE_INLINE_NAME   = 1 # looking for member name (@foo:)
-    STATE_INLINE_TEXT   = 2 # looking for member documentation
-    STATE_INLINE_END    = 3 # done
-    STATE_INLINE_ERROR  = 4 # error - Comment without header was found.
-                            # Spit a warning as it's not
-                            # proper kernel-doc and ignore the rest.
+    INLINE_NA     = 0 # not applicable ($state != INLINE)
+    INLINE_NAME   = 1 # looking for member name (@foo:)
+    INLINE_TEXT   = 2 # looking for member documentation
+    INLINE_END    = 3 # done
+    INLINE_ERROR  = 4 # error - Comment without header was found.
+                      # Spit a warning as it's not
+                      # proper kernel-doc and ignore the rest.
 
-    st_inline_name = [
+    inline_name = [
         "",
         "_NAME",
         "_TEXT",
@@ -106,6 +104,13 @@ class KernelDoc:
         "_ERROR",
     ]
 
+
+class KernelDoc:
+    """
+    Read a C language source or header FILE and extract embedded
+    documentation comments.
+    """
+
     # Section names
 
     section_default = "Description"  # default section
@@ -122,8 +127,8 @@ class KernelDoc:
         self.config = config
 
         # Initial state for the state machines
-        self.state = self.STATE_NORMAL
-        self.inline_doc_state = self.STATE_INLINE_NA
+        self.state = state.NORMAL
+        self.inline_doc_state = state.INLINE_NA
 
         # Store entry currently being processed
         self.entry = None
@@ -260,8 +265,8 @@ class KernelDoc:
         self.entry.leading_space = None
 
         # State flags
-        self.state = self.STATE_NORMAL
-        self.inline_doc_state = self.STATE_INLINE_NA
+        self.state = state.NORMAL
+        self.inline_doc_state = state.INLINE_NA
         self.entry.brcount = 0
 
         self.entry.in_doc_sect = False
@@ -1166,7 +1171,7 @@ class KernelDoc:
         self.entry.in_doc_sect = False
 
         # next line is always the function name
-        self.state = self.STATE_NAME
+        self.state = state.NAME
 
     def process_name(self, ln, line):
         """
@@ -1182,7 +1187,7 @@ class KernelDoc:
                 self.entry.section = doc_block.group(1)
 
             self.entry.identifier = self.entry.section
-            self.state = self.STATE_DOCBLOCK
+            self.state = state.DOCBLOCK
             return
 
         if doc_decl.search(line):
@@ -1224,7 +1229,7 @@ class KernelDoc:
 
             self.entry.identifier = self.entry.identifier.strip(" ")
 
-            self.state = self.STATE_BODY
+            self.state = state.BODY
 
             # if there's no @param blocks need to set up default section here
             self.entry.section = self.section_default
@@ -1238,14 +1243,14 @@ class KernelDoc:
                 r = KernRe(r"\s+")
                 self.entry.descr = r.sub(" ", self.entry.descr)
                 self.entry.declaration_purpose = self.entry.descr
-                self.state = self.STATE_BODY_MAYBE
+                self.state = state.BODY_MAYBE
             else:
                 self.entry.declaration_purpose = ""
 
             if not self.entry.is_kernel_comment:
                 self.emit_warning(ln,
                                   f"This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n{line}")
-                self.state = self.STATE_NORMAL
+                self.state = state.NORMAL
 
             if not self.entry.declaration_purpose and self.config.wshort_desc:
                 self.emit_warning(ln,
@@ -1254,7 +1259,7 @@ class KernelDoc:
             if not self.entry.identifier and self.entry.decl_type != "enum":
                 self.emit_warning(ln,
                                   f"wrong kernel-doc identifier on line:\n{line}")
-                self.state = self.STATE_NORMAL
+                self.state = state.NORMAL
 
             if self.config.verbose:
                 self.emit_warning(ln,
@@ -1271,7 +1276,7 @@ class KernelDoc:
         STATE_BODY and STATE_BODY_MAYBE: the bulk of a kerneldoc comment.
         """
 
-        if self.state == self.STATE_BODY_WITH_BLANK_LINE:
+        if self.state == state.BODY_WITH_BLANK_LINE:
             r = KernRe(r"\s*\*\s?\S")
             if r.match(line):
                 self.dump_section()
@@ -1311,7 +1316,7 @@ class KernelDoc:
             if self.entry.contents:
                 self.entry.contents += "\n"
 
-            self.state = self.STATE_BODY
+            self.state = state.BODY
             return
 
         if doc_end.search(line):
@@ -1325,7 +1330,7 @@ class KernelDoc:
             self.entry.prototype = ""
             self.entry.new_start_line = ln + 1
 
-            self.state = self.STATE_PROTO
+            self.state = state.PROTO
             return
 
         if doc_content.search(line):
@@ -1336,16 +1341,16 @@ class KernelDoc:
                     self.dump_section()
 
                     self.entry.new_start_line = ln
-                    self.state = self.STATE_BODY
+                    self.state = state.BODY
                 else:
                     if self.entry.section != self.section_default:
-                        self.state = self.STATE_BODY_WITH_BLANK_LINE
+                        self.state = state.BODY_WITH_BLANK_LINE
                     else:
-                        self.state = self.STATE_BODY
+                        self.state = state.BODY
 
                     self.entry.contents += "\n"
 
-            elif self.state == self.STATE_BODY_MAYBE:
+            elif self.state == state.BODY_MAYBE:
 
                 # Continued declaration purpose
                 self.entry.declaration_purpose = self.entry.declaration_purpose.rstrip()
@@ -1388,7 +1393,7 @@ class KernelDoc:
     def process_inline(self, ln, line):
         """STATE_INLINE: docbook comments within a prototype."""
 
-        if self.inline_doc_state == self.STATE_INLINE_NAME and \
+        if self.inline_doc_state == state.INLINE_NAME and \
            doc_inline_sect.search(line):
             self.entry.section = doc_inline_sect.group(1)
             self.entry.new_start_line = ln
@@ -1397,7 +1402,7 @@ class KernelDoc:
             if self.entry.contents != "":
                 self.entry.contents += "\n"
 
-            self.inline_doc_state = self.STATE_INLINE_TEXT
+            self.inline_doc_state = state.INLINE_TEXT
             # Documentation block end */
             return
 
@@ -1405,21 +1410,21 @@ class KernelDoc:
             if self.entry.contents not in ["", "\n"]:
                 self.dump_section()
 
-            self.state = self.STATE_PROTO
-            self.inline_doc_state = self.STATE_INLINE_NA
+            self.state = state.PROTO
+            self.inline_doc_state = state.INLINE_NA
             return
 
         if doc_content.search(line):
-            if self.inline_doc_state == self.STATE_INLINE_TEXT:
+            if self.inline_doc_state == state.INLINE_TEXT:
                 self.entry.contents += doc_content.group(1) + "\n"
                 if not self.entry.contents.strip(" ").rstrip("\n"):
                     self.entry.contents = ""
 
-            elif self.inline_doc_state == self.STATE_INLINE_NAME:
+            elif self.inline_doc_state == state.INLINE_NAME:
                 self.emit_warning(ln,
                                   f"Incorrect use of kernel-doc format: {line}")
 
-                self.inline_doc_state = self.STATE_INLINE_ERROR
+                self.inline_doc_state = state.INLINE_ERROR
 
     def syscall_munge(self, ln, proto):         # pylint: disable=W0613
         """
@@ -1598,8 +1603,8 @@ class KernelDoc:
                 self.dump_section(start_new=False)
 
         elif doc_inline_start.search(line):
-            self.state = self.STATE_INLINE
-            self.inline_doc_state = self.STATE_INLINE_NAME
+            self.state = state.INLINE
+            self.inline_doc_state = state.INLINE_NAME
 
         elif self.entry.decl_type == 'function':
             self.process_proto_function(ln, line)
@@ -1663,7 +1668,7 @@ class KernelDoc:
                     line = line.expandtabs().strip("\n")
 
                     # Group continuation lines on prototypes
-                    if self.state == self.STATE_PROTO:
+                    if self.state == state.PROTO:
                         if line.endswith("\\"):
                             prev += line.rstrip("\\")
                             cont = True
@@ -1681,8 +1686,8 @@ class KernelDoc:
                             prev_ln = None
 
                     self.config.log.debug("%d %s%s: %s",
-                                          ln, self.st_name[self.state],
-                                          self.st_inline_name[self.inline_doc_state],
+                                          ln, state.name[self.state],
+                                          state.inline_name[self.inline_doc_state],
                                           line)
 
                     # This is an optimization over the original script.
@@ -1696,18 +1701,18 @@ class KernelDoc:
                     self.process_export(export_table, line)
 
                     # Hand this line to the appropriate state handler
-                    if self.state == self.STATE_NORMAL:
+                    if self.state == state.NORMAL:
                         self.process_normal(ln, line)
-                    elif self.state == self.STATE_NAME:
+                    elif self.state == state.NAME:
                         self.process_name(ln, line)
-                    elif self.state in [self.STATE_BODY, self.STATE_BODY_MAYBE,
-                                        self.STATE_BODY_WITH_BLANK_LINE]:
+                    elif self.state in [state.BODY, state.BODY_MAYBE,
+                                        state.BODY_WITH_BLANK_LINE]:
                         self.process_body(ln, line)
-                    elif self.state == self.STATE_INLINE:  # scanning for inline parameters
+                    elif self.state == state.INLINE:  # scanning for inline parameters
                         self.process_inline(ln, line)
-                    elif self.state == self.STATE_PROTO:
+                    elif self.state == state.PROTO:
                         self.process_proto(ln, line)
-                    elif self.state == self.STATE_DOCBLOCK:
+                    elif self.state == state.DOCBLOCK:
                         self.process_docblock(ln, line)
         except OSError:
             self.config.log.error(f"Error: Cannot open file {self.fname}")
-- 
2.49.0

