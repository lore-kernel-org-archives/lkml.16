Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBFF230D0F;
	Fri, 25 Apr 2025 07:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745565239; cv=none; b=Nd+1OU0h1qs9ziec9mN57gBO6vvqdxUfEMUrmGQnwZ28LNpYI4YEHCAuGFPXnbAqddBgUVrPRuIicnsj+Rshg2ab9jLYOphT9FgRkcLOLb2xbaiH007IR6D1n1/lGmD98gUdk5DwJDQ8yuvBbUBkVJ9iTegwGPR58IQbNmZu8rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745565239; c=relaxed/simple;
	bh=W7TZX/lhi/us1KLr9toBvMbmOQHi/YzpspyRCuqCUT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LY6gQRQUAXQFrciQxXYxuWtveaKXWlhnbEiqeMp4F69UBttZAw5Q5NYOtT3YdVno4G2MIKqXTD48ET09vp4c0vu/X3GQYiDHRkyFOarXVC5igVrXF+44sh3oaU9l3vKNu9emXzi/EBKNKlxMai6mzbpMmqohO4GeOcoXQ7m77uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=As73L0Hq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="As73L0Hq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F78AC4AF09;
	Fri, 25 Apr 2025 07:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745565239;
	bh=W7TZX/lhi/us1KLr9toBvMbmOQHi/YzpspyRCuqCUT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=As73L0HqwFGHjFDX8cSJ+bL2PQt1yGMkMmlE8eAh3Bpz1Hhm9gLQBQbPyr3Ppxeml
	 pP4ggq6p9/rucvucCXxPr9Pb/WSEWL+DqMfgug1G6fylgI1kMO59B592ZQsiXgj1zK
	 OAnLSSwjGSL6+91xZquzvkeZmrKU5X32Sxtq364ggMYzUSfBdHusQYzMwAY+SQ/52u
	 bzqHEZb0zjwVBVHCa/NFtrMxVf6X1Skp0uGLw1WMpv0NE9lG9x3r7QubIwnApn3TTO
	 OC3aZWyI2/mxTCKi0GDOT82K6IQPvgsv468gjuVv6hrbM5gtvrLClWxtQ/bpX6dSqe
	 sA6IDlZ/QcVkQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u8DFw-00000000TG6-0JJ0;
	Fri, 25 Apr 2025 15:13:52 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] scripts/lib/kdoc/kdoc_parser.py: move kernel entry to a class
Date: Fri, 25 Apr 2025 15:13:40 +0800
Message-ID: <28b456f726a022011f0ce5810dbcc26827c1403a.1745564565.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745564565.git.mchehab+huawei@kernel.org>
References: <cover.1745564565.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

The KernelDoc class is too complex. Start optimizing it by
placing the kernel-doc parser entry to a separate class.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_parser.py | 277 +++++++++++++++++---------------
 1 file changed, 151 insertions(+), 126 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 461e0acb0fb7..062453eefc7a 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -12,7 +12,6 @@ Read a C language source or header FILE and extract embedded
 documentation comments
 """
 
-import argparse
 import re
 from pprint import pformat
 
@@ -104,6 +103,97 @@ class state:
         "_ERROR",
     ]
 
+SECTION_DEFAULT = "Description"  # default section
+
+class KernelEntry:
+
+    def __init__(self, config, ln):
+        self.config = config
+
+        self.contents = ""
+        self.function = ""
+        self.sectcheck = ""
+        self.struct_actual = ""
+        self.prototype = ""
+
+        self.warnings = []
+
+        self.parameterlist = []
+        self.parameterdescs = {}
+        self.parametertypes = {}
+        self.parameterdesc_start_lines = {}
+
+        self.section_start_lines = {}
+        self.sectionlist = []
+        self.sections = {}
+
+        self.anon_struct_union = False
+
+        self.leading_space = None
+
+        # State flags
+        self.brcount = 0
+
+        self.in_doc_sect = False
+        self.declaration_start_line = ln + 1
+
+    # TODO: rename to emit_message after removal of kernel-doc.pl
+    def emit_msg(self, log_msg, warning=True):
+        """Emit a message"""
+
+        if not warning:
+            self.config.log.info(log_msg)
+            return
+
+        # Delegate warning output to output logic, as this way it
+        # will report warnings/info only for symbols that are output
+
+        self.warnings.append(log_msg)
+        return
+
+    def dump_section(self, start_new=True):
+        """
+        Dumps section contents to arrays/hashes intended for that purpose.
+        """
+
+        name = self.section
+        contents = self.contents
+
+        if type_param.match(name):
+            name = type_param.group(1)
+
+            self.parameterdescs[name] = contents
+            self.parameterdesc_start_lines[name] = self.new_start_line
+
+            self.sectcheck += name + " "
+            self.new_start_line = 0
+
+        elif name == "@...":
+            name = "..."
+            self.parameterdescs[name] = contents
+            self.sectcheck += name + " "
+            self.parameterdesc_start_lines[name] = self.new_start_line
+            self.new_start_line = 0
+
+        else:
+            if name in self.sections and self.sections[name] != "":
+                # Only warn on user-specified duplicate section names
+                if name != SECTION_DEFAULT:
+                    self.emit_msg(self.new_start_line,
+                                  f"duplicate section name '{name}'\n")
+                self.sections[name] += contents
+            else:
+                self.sections[name] = contents
+                self.sectionlist.append(name)
+                self.section_start_lines[name] = self.new_start_line
+                self.new_start_line = 0
+
+#        self.config.log.debug("Section: %s : %s", name, pformat(vars(self)))
+
+        if start_new:
+            self.section = SECTION_DEFAULT
+            self.contents = ""
+
 
 class KernelDoc:
     """
@@ -113,7 +203,6 @@ class KernelDoc:
 
     # Section names
 
-    section_default = "Description"  # default section
     section_intro = "Introduction"
     section_context = "Context"
     section_return = "Return"
@@ -136,67 +225,27 @@ class KernelDoc:
         # Place all potential outputs into an array
         self.entries = []
 
-    # TODO: rename to emit_message after removal of kernel-doc.pl
-    def emit_warning(self, ln, msg, warning=True):
+    def emit_msg(self, ln, msg, warning=True):
         """Emit a message"""
 
         log_msg = f"{self.fname}:{ln} {msg}"
 
-        if not warning:
+        if self.entry:
+            self.entry.emit_msg(log_msg, warning)
+            return
+
+        if warning:
+            self.config.log.warning(log_msg)
+        else:
             self.config.log.info(log_msg)
-            return
-
-        if self.entry:
-            # Delegate warning output to output logic, as this way it
-            # will report warnings/info only for symbols that are output
-
-            self.entry.warnings.append(log_msg)
-            return
-
-        self.config.log.warning(log_msg)
 
     def dump_section(self, start_new=True):
         """
         Dumps section contents to arrays/hashes intended for that purpose.
         """
 
-        name = self.entry.section
-        contents = self.entry.contents
-
-        if type_param.match(name):
-            name = type_param.group(1)
-
-            self.entry.parameterdescs[name] = contents
-            self.entry.parameterdesc_start_lines[name] = self.entry.new_start_line
-
-            self.entry.sectcheck += name + " "
-            self.entry.new_start_line = 0
-
-        elif name == "@...":
-            name = "..."
-            self.entry.parameterdescs[name] = contents
-            self.entry.sectcheck += name + " "
-            self.entry.parameterdesc_start_lines[name] = self.entry.new_start_line
-            self.entry.new_start_line = 0
-
-        else:
-            if name in self.entry.sections and self.entry.sections[name] != "":
-                # Only warn on user-specified duplicate section names
-                if name != self.section_default:
-                    self.emit_warning(self.entry.new_start_line,
-                                      f"duplicate section name '{name}'\n")
-                self.entry.sections[name] += contents
-            else:
-                self.entry.sections[name] = contents
-                self.entry.sectionlist.append(name)
-                self.entry.section_start_lines[name] = self.entry.new_start_line
-                self.entry.new_start_line = 0
-
-#        self.config.log.debug("Section: %s : %s", name, pformat(vars(self.entry)))
-
-        if start_new:
-            self.entry.section = self.section_default
-            self.entry.contents = ""
+        if self.entry:
+            self.entry.dump_section(start_new)
 
     # TODO: rename it to store_declaration after removal of kernel-doc.pl
     def output_declaration(self, dtype, name, **args):
@@ -241,36 +290,11 @@ class KernelDoc:
         variables used by the state machine.
         """
 
-        self.entry = argparse.Namespace
-
-        self.entry.contents = ""
-        self.entry.function = ""
-        self.entry.sectcheck = ""
-        self.entry.struct_actual = ""
-        self.entry.prototype = ""
-
-        self.entry.warnings = []
-
-        self.entry.parameterlist = []
-        self.entry.parameterdescs = {}
-        self.entry.parametertypes = {}
-        self.entry.parameterdesc_start_lines = {}
-
-        self.entry.section_start_lines = {}
-        self.entry.sectionlist = []
-        self.entry.sections = {}
-
-        self.entry.anon_struct_union = False
-
-        self.entry.leading_space = None
+        self.entry = KernelEntry(self.config, ln)
 
         # State flags
         self.state = state.NORMAL
         self.inline_doc_state = state.INLINE_NA
-        self.entry.brcount = 0
-
-        self.entry.in_doc_sect = False
-        self.entry.declaration_start_line = ln + 1
 
     def push_parameter(self, ln, decl_type, param, dtype,
                        org_arg, declaration_name):
@@ -328,8 +352,8 @@ class KernelDoc:
                 else:
                     dname = f"{decl_type} member"
 
-                self.emit_warning(ln,
-                                  f"{dname} '{param}' not described in '{declaration_name}'")
+                self.emit_msg(ln,
+                              f"{dname} '{param}' not described in '{declaration_name}'")
 
         # Strip spaces from param so that it is one continuous string on
         # parameterlist. This fixes a problem where check_sections()
@@ -393,7 +417,7 @@ class KernelDoc:
                 if r.match(arg):
                     param = r.group(1)
                 else:
-                    self.emit_warning(ln, f"Invalid param: {arg}")
+                    self.emit_msg(ln, f"Invalid param: {arg}")
                     param = arg
 
                 dtype = KernRe(r'([^\(]+\(\*?)\s*' + re.escape(param)).sub(r'\1', arg)
@@ -409,7 +433,7 @@ class KernelDoc:
                 if r.match(arg):
                     param = r.group(1)
                 else:
-                    self.emit_warning(ln, f"Invalid param: {arg}")
+                    self.emit_msg(ln, f"Invalid param: {arg}")
                     param = arg
 
                 dtype = KernRe(r'([^\(]+\(\*?)\s*' + re.escape(param)).sub(r'\1', arg)
@@ -442,7 +466,7 @@ class KernelDoc:
                     if KernRe(r'^(\*+)\s*(.*)').match(param):
                         r = KernRe(r'^(\*+)\s*(.*)')
                         if not r.match(param):
-                            self.emit_warning(ln, f"Invalid param: {param}")
+                            self.emit_msg(ln, f"Invalid param: {param}")
                             continue
 
                         param = r.group(1)
@@ -455,7 +479,7 @@ class KernelDoc:
                     elif KernRe(r'(.*?):(\w+)').search(param):
                         r = KernRe(r'(.*?):(\w+)')
                         if not r.match(param):
-                            self.emit_warning(ln, f"Invalid param: {param}")
+                            self.emit_msg(ln, f"Invalid param: {param}")
                             continue
 
                         if dtype != "":  # Skip unnamed bit-fields
@@ -503,8 +527,8 @@ class KernelDoc:
                 else:
                     dname = f"{decl_type} member"
 
-                self.emit_warning(ln,
-                                  f"Excess {dname} '{sects[sx]}' description in '{decl_name}'")
+                self.emit_msg(ln,
+                              f"Excess {dname} '{sects[sx]}' description in '{decl_name}'")
 
     def check_return_section(self, ln, declaration_name, return_type):
         """
@@ -521,8 +545,8 @@ class KernelDoc:
             return
 
         if not self.entry.sections.get("Return", None):
-            self.emit_warning(ln,
-                              f"No description found for return value of '{declaration_name}'")
+            self.emit_msg(ln,
+                          f"No description found for return value of '{declaration_name}'")
 
     def dump_struct(self, ln, proto):
         """
@@ -561,12 +585,12 @@ class KernelDoc:
                 members = r.group(2)
 
         if not members:
-            self.emit_warning(ln, f"{proto} error: Cannot parse struct or union!")
+            self.emit_msg(ln, f"{proto} error: Cannot parse struct or union!")
             return
 
         if self.entry.identifier != declaration_name:
-            self.emit_warning(ln,
-                              f"expecting prototype for {decl_type} {self.entry.identifier}. Prototype was for {decl_type} {declaration_name} instead\n")
+            self.emit_msg(ln,
+                          f"expecting prototype for {decl_type} {self.entry.identifier}. Prototype was for {decl_type} {declaration_name} instead\n")
             return
 
         args_pattern = r'([^,)]+)'
@@ -835,16 +859,16 @@ class KernelDoc:
                 members = r.group(2).rstrip()
 
         if not members:
-            self.emit_warning(ln, f"{proto}: error: Cannot parse enum!")
+            self.emit_msg(ln, f"{proto}: error: Cannot parse enum!")
             return
 
         if self.entry.identifier != declaration_name:
             if self.entry.identifier == "":
-                self.emit_warning(ln,
-                                  f"{proto}: wrong kernel-doc identifier on prototype")
+                self.emit_msg(ln,
+                              f"{proto}: wrong kernel-doc identifier on prototype")
             else:
-                self.emit_warning(ln,
-                                  f"expecting prototype for enum {self.entry.identifier}. Prototype was for enum {declaration_name} instead")
+                self.emit_msg(ln,
+                              f"expecting prototype for enum {self.entry.identifier}. Prototype was for enum {declaration_name} instead")
             return
 
         if not declaration_name:
@@ -861,14 +885,14 @@ class KernelDoc:
             self.entry.parameterlist.append(arg)
             if arg not in self.entry.parameterdescs:
                 self.entry.parameterdescs[arg] = self.undescribed
-                self.emit_warning(ln,
-                                  f"Enum value '{arg}' not described in enum '{declaration_name}'")
+                self.emit_msg(ln,
+                              f"Enum value '{arg}' not described in enum '{declaration_name}'")
             member_set.add(arg)
 
         for k in self.entry.parameterdescs:
             if k not in member_set:
-                self.emit_warning(ln,
-                                  f"Excess enum value '%{k}' description in '{declaration_name}'")
+                self.emit_msg(ln,
+                              f"Excess enum value '%{k}' description in '{declaration_name}'")
 
         self.output_declaration('enum', declaration_name,
                                 enum=declaration_name,
@@ -1023,13 +1047,13 @@ class KernelDoc:
                     found = True
                     break
         if not found:
-            self.emit_warning(ln,
-                              f"cannot understand function prototype: '{prototype}'")
+            self.emit_msg(ln,
+                          f"cannot understand function prototype: '{prototype}'")
             return
 
         if self.entry.identifier != declaration_name:
-            self.emit_warning(ln,
-                              f"expecting prototype for {self.entry.identifier}(). Prototype was for {declaration_name}() instead")
+            self.emit_msg(ln,
+                          f"expecting prototype for {self.entry.identifier}(). Prototype was for {declaration_name}() instead")
             return
 
         prms = " ".join(self.entry.parameterlist)
@@ -1092,8 +1116,8 @@ class KernelDoc:
             args = r.group(3)
 
             if self.entry.identifier != declaration_name:
-                self.emit_warning(ln,
-                                  f"expecting prototype for typedef {self.entry.identifier}. Prototype was for typedef {declaration_name} instead\n")
+                self.emit_msg(ln,
+                              f"expecting prototype for typedef {self.entry.identifier}. Prototype was for typedef {declaration_name} instead\n")
                 return
 
             decl_type = 'function'
@@ -1124,7 +1148,8 @@ class KernelDoc:
             declaration_name = r.group(1)
 
             if self.entry.identifier != declaration_name:
-                self.emit_warning(ln, f"expecting prototype for typedef {self.entry.identifier}. Prototype was for typedef {declaration_name} instead\n")
+                self.emit_msg(ln,
+                              f"expecting prototype for typedef {self.entry.identifier}. Prototype was for typedef {declaration_name} instead\n")
                 return
 
             self.output_declaration('typedef', declaration_name,
@@ -1135,7 +1160,7 @@ class KernelDoc:
                                     purpose=self.entry.declaration_purpose)
             return
 
-        self.emit_warning(ln, "error: Cannot parse typedef!")
+        self.emit_msg(ln, "error: Cannot parse typedef!")
 
     @staticmethod
     def process_export(function_set, line):
@@ -1232,7 +1257,7 @@ class KernelDoc:
             self.state = state.BODY
 
             # if there's no @param blocks need to set up default section here
-            self.entry.section = self.section_default
+            self.entry.section = SECTION_DEFAULT
             self.entry.new_start_line = ln + 1
 
             r = KernRe("[-:](.*)")
@@ -1248,28 +1273,28 @@ class KernelDoc:
                 self.entry.declaration_purpose = ""
 
             if not self.entry.is_kernel_comment:
-                self.emit_warning(ln,
-                                  f"This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n{line}")
+                self.emit_msg(ln,
+                              f"This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n{line}")
                 self.state = state.NORMAL
 
             if not self.entry.declaration_purpose and self.config.wshort_desc:
-                self.emit_warning(ln,
-                                  f"missing initial short description on line:\n{line}")
+                self.emit_msg(ln,
+                              f"missing initial short description on line:\n{line}")
 
             if not self.entry.identifier and self.entry.decl_type != "enum":
-                self.emit_warning(ln,
-                                  f"wrong kernel-doc identifier on line:\n{line}")
+                self.emit_msg(ln,
+                              f"wrong kernel-doc identifier on line:\n{line}")
                 self.state = state.NORMAL
 
             if self.config.verbose:
-                self.emit_warning(ln,
-                                  f"Scanning doc for {self.entry.decl_type} {self.entry.identifier}",
+                self.emit_msg(ln,
+                              f"Scanning doc for {self.entry.decl_type} {self.entry.identifier}",
                                   warning=False)
 
             return
 
         # Failed to find an identifier. Emit a warning
-        self.emit_warning(ln, f"Cannot find identifier on line:\n{line}")
+        self.emit_msg(ln, f"Cannot find identifier on line:\n{line}")
 
     def process_body(self, ln, line):
         """
@@ -1280,7 +1305,7 @@ class KernelDoc:
             r = KernRe(r"\s*\*\s?\S")
             if r.match(line):
                 self.dump_section()
-                self.entry.section = self.section_default
+                self.entry.section = SECTION_DEFAULT
                 self.entry.new_start_line = ln
                 self.entry.contents = ""
 
@@ -1325,7 +1350,7 @@ class KernelDoc:
             # Look for doc_com + <text> + doc_end:
             r = KernRe(r'\s*\*\s*[a-zA-Z_0-9:\.]+\*/')
             if r.match(line):
-                self.emit_warning(ln, f"suspicious ending line: {line}")
+                self.emit_msg(ln, f"suspicious ending line: {line}")
 
             self.entry.prototype = ""
             self.entry.new_start_line = ln + 1
@@ -1343,7 +1368,7 @@ class KernelDoc:
                     self.entry.new_start_line = ln
                     self.state = state.BODY
                 else:
-                    if self.entry.section != self.section_default:
+                    if self.entry.section != SECTION_DEFAULT:
                         self.state = state.BODY_WITH_BLANK_LINE
                     else:
                         self.state = state.BODY
@@ -1388,7 +1413,7 @@ class KernelDoc:
             return
 
         # Unknown line, ignore
-        self.emit_warning(ln, f"bad line: {line}")
+        self.emit_msg(ln, f"bad line: {line}")
 
     def process_inline(self, ln, line):
         """STATE_INLINE: docbook comments within a prototype."""
@@ -1421,8 +1446,8 @@ class KernelDoc:
                     self.entry.contents = ""
 
             elif self.inline_doc_state == state.INLINE_NAME:
-                self.emit_warning(ln,
-                                  f"Incorrect use of kernel-doc format: {line}")
+                self.emit_msg(ln,
+                              f"Incorrect use of kernel-doc format: {line}")
 
                 self.inline_doc_state = state.INLINE_ERROR
 
@@ -1494,8 +1519,8 @@ class KernelDoc:
             tracepointargs = r.group(1)
 
         if not tracepointname or not tracepointargs:
-            self.emit_warning(ln,
-                              f"Unrecognized tracepoint format:\n{proto}\n")
+            self.emit_msg(ln,
+                          f"Unrecognized tracepoint format:\n{proto}\n")
         else:
             proto = f"static inline void trace_{tracepointname}({tracepointargs})"
             self.entry.identifier = f"trace_{self.entry.identifier}"
-- 
2.49.0

