Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89820248893;
	Wed,  2 Jul 2025 22:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495769; cv=none; b=MbBc3p85fKEgQ6f8mkavx+T0/H7Cd6U1XR+aBEF28cSWR7LsHoJu9Xp6mqN3v89rZLrUR5XHRAOohI4iaVxcKtqowTONnPeyiEXWCnehHDQr2aIKY9ON1SMwMyzc/+VRC5+7JujTvYz9FGAfoYJfmjZbgCN5hIimFfN7wOFdRP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495769; c=relaxed/simple;
	bh=yK8y5N6gNclPxjmJnRZgewzX2UW9/j0lFf3u2z072sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mo/yR8ly+i1B8DdnZgH+Q/TolHUszv+Tt6OX+wBg3sXl4N9+mWH/K3nzz2FG0z71QQDKZNfBvcusZh9pIPtw6HifinNzx2YUGkywi0e44V/hXqTJHjqBcsG+jjo1/2oooYyYJ6hlhYYE33pER8DxUOrV09TK/WUa6oD3Fn7rsBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GMoGaT0d; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GMoGaT0d"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 45C2240ADE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751495765; bh=yzUoekRs6KviceLIn0+5Pv5CjlxCW0YQP/vVgcegNhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GMoGaT0dAJZXFUd906FVWEBe3Z2I8AESUza31qgaqgHe1iIWNyFzbNSkByWyZumCP
	 qdTGapEjLEvSskVvAEeAPmyzrBVZY5Lh2JnQ+titJWrmDWe6HGTlrLLh/3i1nAxa+8
	 YmA9muPlql9Gb82MuLhWI0mU5z+EtyQSxlmDVss6EGE9gyo5V2z+RQO0JGQ/VRkD6o
	 NvKVkRPmvYCrUk9jkd6cj7a+1Yah6YXn1SyxjREQ4RQafHEkrQslVgXVu+s1Jze7ot
	 ESIvOd72+UX3Fc5eJVQg6VAtD6nAfT9Rweo/OEoGnBoX1s3CZMfQ+l3+Gzj4AdKsi9
	 /sYsKx/V1p3GA==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 45C2240ADE;
	Wed,  2 Jul 2025 22:36:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 12/12] docs: kdoc: Improve the output text accumulation
Date: Wed,  2 Jul 2025 16:35:24 -0600
Message-ID: <20250702223524.231794-13-corbet@lwn.net>
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

Building strings with repeated concatenation is somewhat inefficient in
Python; it is better to make a list and glom them all together at the end.
Add a small set of methods to the OutputFormat superclass to manage the
output string, and use them throughout.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_output.py | 185 +++++++++++++++++---------------
 1 file changed, 98 insertions(+), 87 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index ea8914537ba0..d4aabdaa9c51 100644
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -73,7 +73,19 @@ class OutputFormat:
         self.config = None
         self.no_doc_sections = False
 
-        self.data = ""
+    #
+    # Accumulation and management of the output text.
+    #
+    def reset_output(self):
+        self._output = []
+
+    def emit(self, text):
+        """Add a string to out output text"""
+        self._output.append(text)
+
+    def output(self):
+        """Obtain the accumulated output text"""
+        return ''.join(self._output)
 
     def set_config(self, config):
         """
@@ -180,32 +192,31 @@ class OutputFormat:
         Handles a single entry from kernel-doc parser
         """
 
-        self.data = ""
-
+        self.reset_output()
         dtype = args.type
 
         if dtype == "doc":
             self.out_doc(fname, name, args)
-            return self.data
+            return self.output()
 
         if not self.check_declaration(dtype, name, args):
-            return self.data
+            return self.output()
 
         if dtype == "function":
             self.out_function(fname, name, args)
-            return self.data
+            return self.output()
 
         if dtype == "enum":
             self.out_enum(fname, name, args)
-            return self.data
+            return self.output()
 
         if dtype == "typedef":
             self.out_typedef(fname, name, args)
-            return self.data
+            return self.output()
 
         if dtype in ["struct", "union"]:
             self.out_struct(fname, name, args)
-            return self.data
+            return self.output()
 
         # Warn if some type requires an output logic
         self.config.log.warning("doesn't now how to output '%s' block",
@@ -274,7 +285,7 @@ class RestFormat(OutputFormat):
 
         if self.enable_lineno and ln is not None:
             ln += 1
-            self.data += f".. LINENO {ln}\n"
+            self.emit(f".. LINENO {ln}\n")
 
     def output_highlight(self, args):
         """
@@ -326,7 +337,7 @@ class RestFormat(OutputFormat):
 
         # Print the output with the line prefix
         for line in output.strip("\n").split("\n"):
-            self.data += self.lineprefix + line + "\n"
+            self.emit(self.lineprefix + line + "\n")
 
     def out_section(self, args, out_docblock=False):
         """
@@ -343,15 +354,15 @@ class RestFormat(OutputFormat):
 
             if out_docblock:
                 if not self.out_mode == self.OUTPUT_INCLUDE:
-                    self.data += f".. _{section}:\n\n"
-                    self.data += f'{self.lineprefix}**{section}**\n\n'
+                    self.emit(f".. _{section}:\n\n")
+                    self.emit(f'{self.lineprefix}**{section}**\n\n')
             else:
-                self.data += f'{self.lineprefix}**{section}**\n\n'
+                self.emit(f'{self.lineprefix}**{section}**\n\n')
 
             self.print_lineno(args.section_start_lines.get(section, 0))
             self.output_highlight(text)
-            self.data += "\n"
-        self.data += "\n"
+            self.emit("\n")
+        self.emit("\n")
 
     def out_doc(self, fname, name, args):
         if not self.check_doc(name, args):
@@ -389,41 +400,41 @@ class RestFormat(OutputFormat):
 
         self.print_lineno(ln)
         if args.get('typedef') or not args.get('functiontype'):
-            self.data += f".. c:macro:: {name}\n\n"
+            self.emit(f".. c:macro:: {name}\n\n")
 
             if args.get('typedef'):
-                self.data += "   **Typedef**: "
+                self.emit("   **Typedef**: ")
                 self.lineprefix = ""
                 self.output_highlight(args.get('purpose', ""))
-                self.data += "\n\n**Syntax**\n\n"
-                self.data += f"  ``{signature}``\n\n"
+                self.emit("\n\n**Syntax**\n\n")
+                self.emit(f"  ``{signature}``\n\n")
             else:
-                self.data += f"``{signature}``\n\n"
+                self.emit(f"``{signature}``\n\n")
         else:
-            self.data += f".. c:function:: {signature}\n\n"
+            self.emit(f".. c:function:: {signature}\n\n")
 
         if not args.get('typedef'):
             self.print_lineno(ln)
             self.lineprefix = "   "
             self.output_highlight(args.get('purpose', ""))
-            self.data += "\n"
+            self.emit("\n")
 
         # Put descriptive text into a container (HTML <div>) to help set
         # function prototypes apart
         self.lineprefix = "  "
 
         if args.parameterlist:
-            self.data += ".. container:: kernelindent\n\n"
-            self.data += f"{self.lineprefix}**Parameters**\n\n"
+            self.emit(".. container:: kernelindent\n\n")
+            self.emit(f"{self.lineprefix}**Parameters**\n\n")
 
         for parameter in args.parameterlist:
             parameter_name = KernRe(r'\[.*').sub('', parameter)
             dtype = args.parametertypes.get(parameter, "")
 
             if dtype:
-                self.data += f"{self.lineprefix}``{dtype}``\n"
+                self.emit(f"{self.lineprefix}``{dtype}``\n")
             else:
-                self.data += f"{self.lineprefix}``{parameter}``\n"
+                self.emit(f"{self.lineprefix}``{parameter}``\n")
 
             self.print_lineno(args.parameterdesc_start_lines.get(parameter_name, 0))
 
@@ -432,9 +443,9 @@ class RestFormat(OutputFormat):
                args.parameterdescs[parameter_name] != KernelDoc.undescribed:
 
                 self.output_highlight(args.parameterdescs[parameter_name])
-                self.data += "\n"
+                self.emit("\n")
             else:
-                self.data += f"{self.lineprefix}*undescribed*\n\n"
+                self.emit(f"{self.lineprefix}*undescribed*\n\n")
             self.lineprefix = "  "
 
         self.out_section(args)
@@ -445,26 +456,26 @@ class RestFormat(OutputFormat):
         oldprefix = self.lineprefix
         ln = args.declaration_start_line
 
-        self.data += f"\n\n.. c:enum:: {name}\n\n"
+        self.emit(f"\n\n.. c:enum:: {name}\n\n")
 
         self.print_lineno(ln)
         self.lineprefix = "  "
         self.output_highlight(args.get('purpose', ''))
-        self.data += "\n"
+        self.emit("\n")
 
-        self.data += ".. container:: kernelindent\n\n"
+        self.emit(".. container:: kernelindent\n\n")
         outer = self.lineprefix + "  "
         self.lineprefix = outer + "  "
-        self.data += f"{outer}**Constants**\n\n"
+        self.emit(f"{outer}**Constants**\n\n")
 
         for parameter in args.parameterlist:
-            self.data += f"{outer}``{parameter}``\n"
+            self.emit(f"{outer}``{parameter}``\n")
 
             if args.parameterdescs.get(parameter, '') != KernelDoc.undescribed:
                 self.output_highlight(args.parameterdescs[parameter])
             else:
-                self.data += f"{self.lineprefix}*undescribed*\n\n"
-            self.data += "\n"
+                self.emit(f"{self.lineprefix}*undescribed*\n\n")
+            self.emit("\n")
 
         self.lineprefix = oldprefix
         self.out_section(args)
@@ -474,14 +485,14 @@ class RestFormat(OutputFormat):
         oldprefix = self.lineprefix
         ln = args.declaration_start_line
 
-        self.data += f"\n\n.. c:type:: {name}\n\n"
+        self.emit(f"\n\n.. c:type:: {name}\n\n")
 
         self.print_lineno(ln)
         self.lineprefix = "   "
 
         self.output_highlight(args.get('purpose', ''))
 
-        self.data += "\n"
+        self.emit("\n")
 
         self.lineprefix = oldprefix
         self.out_section(args)
@@ -493,7 +504,7 @@ class RestFormat(OutputFormat):
         dtype = args.type
         ln = args.declaration_start_line
 
-        self.data += f"\n\n.. c:{dtype}:: {name}\n\n"
+        self.emit(f"\n\n.. c:{dtype}:: {name}\n\n")
 
         self.print_lineno(ln)
 
@@ -501,20 +512,20 @@ class RestFormat(OutputFormat):
         self.lineprefix += "  "
 
         self.output_highlight(purpose)
-        self.data += "\n"
+        self.emit("\n")
 
-        self.data += ".. container:: kernelindent\n\n"
-        self.data += f"{self.lineprefix}**Definition**::\n\n"
+        self.emit(".. container:: kernelindent\n\n")
+        self.emit(f"{self.lineprefix}**Definition**::\n\n")
 
         self.lineprefix = self.lineprefix + "  "
 
         declaration = declaration.replace("\t", self.lineprefix)
 
-        self.data += f"{self.lineprefix}{dtype} {name}" + ' {' + "\n"
-        self.data += f"{declaration}{self.lineprefix}" + "};\n\n"
+        self.emit(f"{self.lineprefix}{dtype} {name}" + ' {' + "\n")
+        self.emit(f"{declaration}{self.lineprefix}" + "};\n\n")
 
         self.lineprefix = "  "
-        self.data += f"{self.lineprefix}**Members**\n\n"
+        self.emit(f"{self.lineprefix}**Members**\n\n")
         for parameter in args.parameterlist:
             if not parameter or parameter.startswith("#"):
                 continue
@@ -526,15 +537,15 @@ class RestFormat(OutputFormat):
 
             self.print_lineno(args.parameterdesc_start_lines.get(parameter_name, 0))
 
-            self.data += f"{self.lineprefix}``{parameter}``\n"
+            self.emit(f"{self.lineprefix}``{parameter}``\n")
 
             self.lineprefix = "    "
             self.output_highlight(args.parameterdescs[parameter_name])
             self.lineprefix = "  "
 
-            self.data += "\n"
+            self.emit("\n")
 
-        self.data += "\n"
+        self.emit("\n")
 
         self.lineprefix = oldprefix
         self.out_section(args)
@@ -610,33 +621,33 @@ class ManFormat(OutputFormat):
                 continue
 
             if line[0] == ".":
-                self.data += "\\&" + line + "\n"
+                self.emit("\\&" + line + "\n")
             else:
-                self.data += line + "\n"
+                self.emit(line + "\n")
 
     def out_doc(self, fname, name, args):
         if not self.check_doc(name, args):
             return
 
-        self.data += f'.TH "{self.modulename}" 9 "{self.modulename}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.emit(f'.TH "{self.modulename}" 9 "{self.modulename}" "{self.man_date}" "API Manual" LINUX' + "\n")
 
         for section, text in args.sections.items():
-            self.data += f'.SH "{section}"' + "\n"
+            self.emit(f'.SH "{section}"' + "\n")
             self.output_highlight(text)
 
     def out_function(self, fname, name, args):
         """output function in man"""
 
-        self.data += f'.TH "{name}" 9 "{name}" "{self.man_date}" "Kernel Hacker\'s Manual" LINUX' + "\n"
+        self.emit(f'.TH "{name}" 9 "{name}" "{self.man_date}" "Kernel Hacker\'s Manual" LINUX' + "\n")
 
-        self.data += ".SH NAME\n"
-        self.data += f"{name} \\- {args['purpose']}\n"
+        self.emit(".SH NAME\n")
+        self.emit(f"{name} \\- {args['purpose']}\n")
 
-        self.data += ".SH SYNOPSIS\n"
+        self.emit(".SH SYNOPSIS\n")
         if args.get('functiontype', ''):
-            self.data += f'.B "{args["functiontype"]}" {name}' + "\n"
+            self.emit(f'.B "{args["functiontype"]}" {name}' + "\n")
         else:
-            self.data += f'.B "{name}' + "\n"
+            self.emit(f'.B "{name}' + "\n")
 
         count = 0
         parenth = "("
@@ -649,68 +660,68 @@ class ManFormat(OutputFormat):
             dtype = args.parametertypes.get(parameter, "")
             if function_pointer.match(dtype):
                 # Pointer-to-function
-                self.data += f'".BI "{parenth}{function_pointer.group(1)}" " ") ({function_pointer.group(2)}){post}"' + "\n"
+                self.emit(f'".BI "{parenth}{function_pointer.group(1)}" " ") ({function_pointer.group(2)}){post}"' + "\n")
             else:
                 dtype = KernRe(r'([^\*])$').sub(r'\1 ', dtype)
 
-                self.data += f'.BI "{parenth}{dtype}"  "{post}"' + "\n"
+                self.emit(f'.BI "{parenth}{dtype}"  "{post}"' + "\n")
             count += 1
             parenth = ""
 
         if args.parameterlist:
-            self.data += ".SH ARGUMENTS\n"
+            self.emit(".SH ARGUMENTS\n")
 
         for parameter in args.parameterlist:
             parameter_name = re.sub(r'\[.*', '', parameter)
 
-            self.data += f'.IP "{parameter}" 12' + "\n"
+            self.emit(f'.IP "{parameter}" 12' + "\n")
             self.output_highlight(args.parameterdescs.get(parameter_name, ""))
 
         for section, text in args.sections.items():
-            self.data += f'.SH "{section.upper()}"' + "\n"
+            self.emit(f'.SH "{section.upper()}"' + "\n")
             self.output_highlight(text)
 
     def out_enum(self, fname, name, args):
-        self.data += f'.TH "{self.modulename}" 9 "enum {name}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.emit(f'.TH "{self.modulename}" 9 "enum {name}" "{self.man_date}" "API Manual" LINUX' + "\n")
 
-        self.data += ".SH NAME\n"
-        self.data += f"enum {name} \\- {args['purpose']}\n"
+        self.emit(".SH NAME\n")
+        self.emit(f"enum {name} \\- {args['purpose']}\n")
 
-        self.data += ".SH SYNOPSIS\n"
-        self.data += f"enum {name}" + " {\n"
+        self.emit(".SH SYNOPSIS\n")
+        self.emit(f"enum {name}" + " {\n")
 
         count = 0
         for parameter in args.parameterlist:
-            self.data += f'.br\n.BI "    {parameter}"' + "\n"
+            self.emit(f'.br\n.BI "    {parameter}"' + "\n")
             if count == len(args.parameterlist) - 1:
-                self.data += "\n};\n"
+                self.emit("\n};\n")
             else:
-                self.data += ", \n.br\n"
+                self.emit(", \n.br\n")
 
             count += 1
 
-        self.data += ".SH Constants\n"
+        self.emit(".SH Constants\n")
 
         for parameter in args.parameterlist:
             parameter_name = KernRe(r'\[.*').sub('', parameter)
-            self.data += f'.IP "{parameter}" 12' + "\n"
+            self.emit(f'.IP "{parameter}" 12' + "\n")
             self.output_highlight(args.parameterdescs.get(parameter_name, ""))
 
         for section, text in args.sections.items():
-            self.data += f'.SH "{section}"' + "\n"
+            self.emit(f'.SH "{section}"' + "\n")
             self.output_highlight(text)
 
     def out_typedef(self, fname, name, args):
         module = self.modulename
         purpose = args.get('purpose')
 
-        self.data += f'.TH "{module}" 9 "{name}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.emit(f'.TH "{module}" 9 "{name}" "{self.man_date}" "API Manual" LINUX' + "\n")
 
-        self.data += ".SH NAME\n"
-        self.data += f"typedef {name} \\- {purpose}\n"
+        self.emit(".SH NAME\n")
+        self.emit(f"typedef {name} \\- {purpose}\n")
 
         for section, text in args.sections.items():
-            self.data += f'.SH "{section}"' + "\n"
+            self.emit(f'.SH "{section}"' + "\n")
             self.output_highlight(text)
 
     def out_struct(self, fname, name, args):
@@ -718,20 +729,20 @@ class ManFormat(OutputFormat):
         purpose = args.get('purpose')
         definition = args.get('definition')
 
-        self.data += f'.TH "{module}" 9 "{args.type} {name}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.emit(f'.TH "{module}" 9 "{args.type} {name}" "{self.man_date}" "API Manual" LINUX' + "\n")
 
-        self.data += ".SH NAME\n"
-        self.data += f"{args.type} {name} \\- {purpose}\n"
+        self.emit(".SH NAME\n")
+        self.emit(f"{args.type} {name} \\- {purpose}\n")
 
         # Replace tabs with two spaces and handle newlines
         declaration = definition.replace("\t", "  ")
         declaration = KernRe(r"\n").sub('"\n.br\n.BI "', declaration)
 
-        self.data += ".SH SYNOPSIS\n"
-        self.data += f"{args.type} {name} " + "{" + "\n.br\n"
-        self.data += f'.BI "{declaration}\n' + "};\n.br\n\n"
+        self.emit(".SH SYNOPSIS\n")
+        self.emit(f"{args.type} {name} " + "{" + "\n.br\n")
+        self.emit(f'.BI "{declaration}\n' + "};\n.br\n\n")
 
-        self.data += ".SH Members\n"
+        self.emit(".SH Members\n")
         for parameter in args.parameterlist:
             if parameter.startswith("#"):
                 continue
@@ -741,9 +752,9 @@ class ManFormat(OutputFormat):
             if args.parameterdescs.get(parameter_name) == KernelDoc.undescribed:
                 continue
 
-            self.data += f'.IP "{parameter}" 12' + "\n"
+            self.emit(f'.IP "{parameter}" 12' + "\n")
             self.output_highlight(args.parameterdescs.get(parameter_name))
 
         for section, text in args.sections.items():
-            self.data += f'.SH "{section}"' + "\n"
+            self.emit(f'.SH "{section}"' + "\n")
             self.output_highlight(text)
-- 
2.49.0

