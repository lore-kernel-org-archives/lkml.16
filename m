Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD6C267388;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=VEdGWzVKsirjkzpNzKLpAm2wcCSE2qNO7POaFqCgkWiOFr5NTFr5O+KAZvJTDrnZES8luxpAlqE9acForKV8Vl4aqjvnJHGGtc/PkBlBI2AhjI1hCMjbbNqU5YKtNC1kz3HzmPQdD+ldNU9eVVJSyk7UP8tHB+oR+iA50v/tFGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=dSMMgREF1qhbEmSVC78ny/E/UlXH1qJJJkrWXWIPDo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kc4H7VWUiiLxgZSbGYDi5LlDFf1oLp6640Mw42oEZQNSpN4uo44+stjIDrGBBxamYtJ1JGf3O3trI1e3oKrvtIU8I/xUY5X05aCa7DkGoxua+pk8icWYcthsbEAWlqZKJFCdcqg8YDBn+5w/wQcsv9t02fKt+iEFpOjetNi5Bps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwFbS+x6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwFbS+x6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2717C4CEF2;
	Tue,  8 Apr 2025 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106996;
	bh=dSMMgREF1qhbEmSVC78ny/E/UlXH1qJJJkrWXWIPDo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DwFbS+x6UeuEIBsIJdPLXkrg5miGY0kKtbMnhsA+i0UUGujsJNFXIuFvbBHYLKZqe
	 dg//qeQMBBJwtbmW0R4/Oz4a7I8qK9dXZlB4wVEosEhQPXIDjn5oK6u0CRxYY1flkC
	 avJ5wEHf4mBK4owNSd2HxbjvT5bgOtgYFmlVwjgyqMlpcR41/DrAfdHSb0zBya97aC
	 4YgkPllxmCQZyFg3s0koUUIC9xar+Jzl0ZZDRWJIHkdQw+ppNah+aQ+7XxbXxeesY8
	 0LVnaQzCNxaSYOwrW8ddBBFOE78GY75WXq4hDTIjnEYfF6ziIpfl1zdy5MRj8MlSvy
	 PeQ2OtyzS26AA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RVm-0u1s;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/33] scripts/kernel-doc.py: convert message output to an interactor
Date: Tue,  8 Apr 2025 18:09:14 +0800
Message-ID: <557304c8458f1fb4aa2e833f4bdaff953094ddcb.1744106242.git.mchehab+huawei@kernel.org>
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

Instead of directly printing output messages, change kdoc classes
to return an interactor with the output message, letting the
actual display to happen at the command-line command.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py           |   9 +-
 scripts/lib/kdoc/kdoc_files.py  |  15 ++-
 scripts/lib/kdoc/kdoc_output.py | 171 ++++++++++++++++----------------
 3 files changed, 104 insertions(+), 91 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index abff78e9160f..63efec4b3f4b 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -283,9 +283,12 @@ def main():
 
     kfiles.parse()
 
-    kfiles.msg(enable_lineno=args.enable_lineno, export=args.export,
-               internal=args.internal, symbol=args.symbol,
-               nosymbol=args.nosymbol)
+    for t in kfiles.msg(enable_lineno=args.enable_lineno, export=args.export,
+                          internal=args.internal, symbol=args.symbol,
+                          nosymbol=args.nosymbol):
+        msg = t[1]
+        if msg:
+            print(msg)
 
 
 # Call main method
diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
index 8bcdc7ead984..817ed98b2727 100755
--- a/scripts/lib/kdoc/kdoc_files.py
+++ b/scripts/lib/kdoc/kdoc_files.py
@@ -229,9 +229,10 @@ class KernelFiles():
 
     def out_msg(self, fname, name, arg):
         """
-        Output messages from a file name using the output style filtering.
+        Return output messages from a file name using the output style
+        filtering.
 
-        If output type was not handled by the syler, return False.
+        If output type was not handled by the syler, return None.
         """
 
         # NOTE: we can add rules here to filter out unwanted parts,
@@ -242,7 +243,8 @@ class KernelFiles():
     def msg(self, enable_lineno=False, export=False, internal=False,
             symbol=None, nosymbol=None):
         """
-        Interacts over the kernel-doc results and output messages.
+        Interacts over the kernel-doc results and output messages,
+        returning kernel-doc markups on each interaction
         """
 
         function_table = self.config.function_table
@@ -261,10 +263,15 @@ class KernelFiles():
                                   function_table, enable_lineno)
 
         for fname, arg_tuple in self.results:
+            msg = ""
             for name, arg in arg_tuple:
-                if self.out_msg(fname, name, arg):
+                msg += self.out_msg(fname, name, arg)
+
+                if msg is None:
                     ln = arg.get("ln", 0)
                     dtype = arg.get('type', "")
 
                     self.config.log.warning("%s:%d Can't handle %s",
                                             fname, ln, dtype)
+            if msg:
+                yield fname, msg
diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index 24e40b3e7d1d..fda07049ecf7 100755
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -71,6 +71,8 @@ class OutputFormat:
         self.function_table = set()
         self.config = None
 
+        self.data = ""
+
     def set_config(self, config):
         self.config = config
 
@@ -157,37 +159,38 @@ class OutputFormat:
         return True
 
     def msg(self, fname, name, args):
+        self.data = ""
 
         dtype = args.get('type', "")
 
         if dtype == "doc":
             self.out_doc(fname, name, args)
-            return False
+            return self.data
 
         if not self.check_declaration(dtype, name):
-            return False
+            return self.data
 
         if dtype == "function":
             self.out_function(fname, name, args)
-            return False
+            return self.data
 
         if dtype == "enum":
             self.out_enum(fname, name, args)
-            return False
+            return self.data
 
         if dtype == "typedef":
             self.out_typedef(fname, name, args)
-            return False
+            return self.data
 
         if dtype in ["struct", "union"]:
             self.out_struct(fname, name, args)
-            return False
+            return self.data
 
         # Warn if some type requires an output logic
         self.config.log.warning("doesn't now how to output '%s' block",
                                 dtype)
 
-        return True
+        return None
 
     # Virtual methods to be overridden by inherited classes
     def out_doc(self, fname, name, args):
@@ -248,7 +251,7 @@ class RestFormat(OutputFormat):
         """Outputs a line number"""
 
         if self.enable_lineno and ln:
-            print(f".. LINENO {ln}")
+            self.data += f".. LINENO {ln}\n"
 
     def output_highlight(self, args):
         input_text = args
@@ -295,7 +298,7 @@ class RestFormat(OutputFormat):
 
         # Print the output with the line prefix
         for line in output.strip("\n").split("\n"):
-            print(self.lineprefix + line)
+            self.data += self.lineprefix + line + "\n"
 
     def out_section(self, args, out_reference=False):
         """
@@ -317,15 +320,15 @@ class RestFormat(OutputFormat):
 
             if not self.out_mode == self.OUTPUT_INCLUDE:
                 if out_reference:
-                    print(f".. _{section}:\n")
+                    self.data += f".. _{section}:\n\n"
 
                 if not self.symbol:
-                    print(f'{self.lineprefix}**{section}**\n')
+                    self.data += f'{self.lineprefix}**{section}**\n\n'
 
             self.print_lineno(section_start_lines.get(section, 0))
             self.output_highlight(sections[section])
-            print()
-        print()
+            self.data += "\n"
+        self.data += "\n"
 
     def out_doc(self, fname, name, args):
         if not self.check_doc(name):
@@ -368,42 +371,42 @@ class RestFormat(OutputFormat):
             signature += ")"
 
         if args.get('typedef') or not args.get('functiontype'):
-            print(f".. c:macro:: {args['function']}\n")
+            self.data += f".. c:macro:: {args['function']}\n\n"
 
             if args.get('typedef'):
                 self.print_lineno(ln)
-                print("   **Typedef**: ", end="")
+                self.data += "   **Typedef**: "
                 self.lineprefix = ""
                 self.output_highlight(args.get('purpose', ""))
-                print("\n\n**Syntax**\n")
-                print(f"  ``{signature}``\n")
+                self.data += "\n\n**Syntax**\n\n"
+                self.data += f"  ``{signature}``\n\n"
             else:
-                print(f"``{signature}``\n")
+                self.data += f"``{signature}``\n\n"
         else:
-            print(f".. c:function:: {signature}\n")
+            self.data += f".. c:function:: {signature}\n\n"
 
         if not args.get('typedef'):
             self.print_lineno(ln)
             self.lineprefix = "   "
             self.output_highlight(args.get('purpose', ""))
-            print()
+            self.data += "\n"
 
         # Put descriptive text into a container (HTML <div>) to help set
         # function prototypes apart
         self.lineprefix = "  "
 
         if parameterlist:
-            print(".. container:: kernelindent\n")
-            print(f"{self.lineprefix}**Parameters**\n")
+            self.data += ".. container:: kernelindent\n\n"
+            self.data += f"{self.lineprefix}**Parameters**\n\n"
 
         for parameter in parameterlist:
             parameter_name = Re(r'\[.*').sub('', parameter)
             dtype = args['parametertypes'].get(parameter, "")
 
             if dtype:
-                print(f"{self.lineprefix}``{dtype}``")
+                self.data += f"{self.lineprefix}``{dtype}``\n"
             else:
-                print(f"{self.lineprefix}``{parameter}``")
+                self.data += f"{self.lineprefix}``{parameter}``\n"
 
             self.print_lineno(parameterdesc_start_lines.get(parameter_name, 0))
 
@@ -412,9 +415,9 @@ class RestFormat(OutputFormat):
                parameterdescs[parameter_name] != KernelDoc.undescribed:
 
                 self.output_highlight(parameterdescs[parameter_name])
-                print()
+                self.data += "\n"
             else:
-                print(f"{self.lineprefix}*undescribed*\n")
+                self.data += f"{self.lineprefix}*undescribed*\n\n"
             self.lineprefix = "  "
 
         self.out_section(args)
@@ -428,26 +431,26 @@ class RestFormat(OutputFormat):
         parameterdescs = args.get('parameterdescs', {})
         ln = args.get('ln', 0)
 
-        print(f"\n\n.. c:enum:: {name}\n")
+        self.data += f"\n\n.. c:enum:: {name}\n\n"
 
         self.print_lineno(ln)
         self.lineprefix = "  "
         self.output_highlight(args.get('purpose', ''))
-        print()
+        self.data += "\n"
 
-        print(".. container:: kernelindent\n")
+        self.data += ".. container:: kernelindent\n\n"
         outer = self.lineprefix + "  "
         self.lineprefix = outer + "  "
-        print(f"{outer}**Constants**\n")
+        self.data += f"{outer}**Constants**\n\n"
 
         for parameter in parameterlist:
-            print(f"{outer}``{parameter}``")
+            self.data += f"{outer}``{parameter}``\n"
 
             if parameterdescs.get(parameter, '') != KernelDoc.undescribed:
                 self.output_highlight(parameterdescs[parameter])
             else:
-                print(f"{self.lineprefix}*undescribed*\n")
-            print()
+                self.data += f"{self.lineprefix}*undescribed*\n\n"
+            self.data += "\n"
 
         self.lineprefix = oldprefix
         self.out_section(args)
@@ -458,14 +461,14 @@ class RestFormat(OutputFormat):
         name = args.get('typedef', '')
         ln = args.get('ln', 0)
 
-        print(f"\n\n.. c:type:: {name}\n")
+        self.data += f"\n\n.. c:type:: {name}\n\n"
 
         self.print_lineno(ln)
         self.lineprefix = "   "
 
         self.output_highlight(args.get('purpose', ''))
 
-        print()
+        self.data += "\n"
 
         self.lineprefix = oldprefix
         self.out_section(args)
@@ -482,7 +485,7 @@ class RestFormat(OutputFormat):
         parameterdescs = args.get('parameterdescs', {})
         parameterdesc_start_lines = args.get('parameterdesc_start_lines', {})
 
-        print(f"\n\n.. c:{dtype}:: {name}\n")
+        self.data += f"\n\n.. c:{dtype}:: {name}\n\n"
 
         self.print_lineno(ln)
 
@@ -490,20 +493,20 @@ class RestFormat(OutputFormat):
         self.lineprefix += "  "
 
         self.output_highlight(purpose)
-        print()
+        self.data += "\n"
 
-        print(".. container:: kernelindent\n")
-        print(f"{self.lineprefix}**Definition**::\n")
+        self.data += ".. container:: kernelindent\n\n"
+        self.data += f"{self.lineprefix}**Definition**::\n\n"
 
         self.lineprefix = self.lineprefix + "  "
 
         declaration = declaration.replace("\t", self.lineprefix)
 
-        print(f"{self.lineprefix}{dtype} {name}" + ' {')
-        print(f"{declaration}{self.lineprefix}" + "};\n")
+        self.data += f"{self.lineprefix}{dtype} {name}" + ' {' + "\n"
+        self.data += f"{declaration}{self.lineprefix}" + "};\n\n"
 
         self.lineprefix = "  "
-        print(f"{self.lineprefix}**Members**\n")
+        self.data += f"{self.lineprefix}**Members**\n\n"
         for parameter in parameterlist:
             if not parameter or parameter.startswith("#"):
                 continue
@@ -515,15 +518,15 @@ class RestFormat(OutputFormat):
 
             self.print_lineno(parameterdesc_start_lines.get(parameter_name, 0))
 
-            print(f"{self.lineprefix}``{parameter}``")
+            self.data += f"{self.lineprefix}``{parameter}``\n"
 
             self.lineprefix = "    "
             self.output_highlight(parameterdescs[parameter_name])
             self.lineprefix = "  "
 
-            print()
+            self.data += "\n"
 
-        print()
+        self.data += "\n"
 
         self.lineprefix = oldprefix
         self.out_section(args)
@@ -576,19 +579,19 @@ class ManFormat(OutputFormat):
             line = Re(r"^\s*").sub("", line)
 
             if line and line[0] == ".":
-                print("\\&" + line)
+                self.data += "\\&" + line + "\n"
             else:
-                print(line)
+                self.data += line + "\n"
 
     def out_doc(self, fname, name, args):
         module = args.get('module')
         sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
 
-        print(f'.TH "{module}" 9 "{module}" "{self.man_date}" "API Manual" LINUX')
+        self.data += f'.TH "{module}" 9 "{module}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
         for section in sectionlist:
-            print(f'.SH "{section}"')
+            self.data += f'.SH "{section}"' + "\n"
             self.output_highlight(sections.get(section))
 
     def out_function(self, fname, name, args):
@@ -599,16 +602,16 @@ class ManFormat(OutputFormat):
         sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
 
-        print(f'.TH "{args['function']}" 9 "{args['function']}" "{self.man_date}" "Kernel Hacker\'s Manual" LINUX')
+        self.data += f'.TH "{args['function']}" 9 "{args['function']}" "{self.man_date}" "Kernel Hacker\'s Manual" LINUX' + "\n"
 
-        print(".SH NAME")
-        print(f"{args['function']} \\- {args['purpose']}")
+        self.data += ".SH NAME\n"
+        self.data += f"{args['function']} \\- {args['purpose']}\n"
 
-        print(".SH SYNOPSIS")
+        self.data += ".SH SYNOPSIS\n"
         if args.get('functiontype', ''):
-            print(f'.B "{args['functiontype']}" {args['function']}')
+            self.data += f'.B "{args['functiontype']}" {args['function']}' + "\n"
         else:
-            print(f'.B "{args['function']}')
+            self.data += f'.B "{args['function']}' + "\n"
 
         count = 0
         parenth = "("
@@ -621,25 +624,25 @@ class ManFormat(OutputFormat):
             dtype = args['parametertypes'].get(parameter, "")
             if function_pointer.match(dtype):
                 # Pointer-to-function
-                print(f'".BI "{parenth}{function_pointer.group(1)}" " ") ({function_pointer.group(2)}){post}"')
+                self.data += f'".BI "{parenth}{function_pointer.group(1)}" " ") ({function_pointer.group(2)}){post}"' + "\n"
             else:
                 dtype = Re(r'([^\*])$').sub(r'\1 ', dtype)
 
-                print(f'.BI "{parenth}{dtype}"  "{post}"')
+                self.data += f'.BI "{parenth}{dtype}"  "{post}"' + "\n"
             count += 1
             parenth = ""
 
         if parameterlist:
-            print(".SH ARGUMENTS")
+            self.data += ".SH ARGUMENTS\n"
 
         for parameter in parameterlist:
             parameter_name = re.sub(r'\[.*', '', parameter)
 
-            print(f'.IP "{parameter}" 12')
+            self.data += f'.IP "{parameter}" 12' + "\n"
             self.output_highlight(parameterdescs.get(parameter_name, ""))
 
         for section in sectionlist:
-            print(f'.SH "{section.upper()}"')
+            self.data += f'.SH "{section.upper()}"' + "\n"
             self.output_highlight(sections[section])
 
     def out_enum(self, fname, name, args):
@@ -649,33 +652,33 @@ class ManFormat(OutputFormat):
         sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
 
-        print(f'.TH "{args['module']}" 9 "enum {args['enum']}" "{self.man_date}" "API Manual" LINUX')
+        self.data += f'.TH "{args['module']}" 9 "enum {args['enum']}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
-        print(".SH NAME")
-        print(f"enum {args['enum']} \\- {args['purpose']}")
+        self.data += ".SH NAME\n"
+        self.data += f"enum {args['enum']} \\- {args['purpose']}\n"
 
-        print(".SH SYNOPSIS")
-        print(f"enum {args['enum']}" + " {")
+        self.data += ".SH SYNOPSIS\n"
+        self.data += f"enum {args['enum']}" + " {\n"
 
         count = 0
         for parameter in parameterlist:
-            print(f'.br\n.BI "    {parameter}"')
+            self.data += f'.br\n.BI "    {parameter}"' + "\n"
             if count == len(parameterlist) - 1:
-                print("\n};")
+                self.data += "\n};\n"
             else:
-                print(", \n.br")
+                self.data += ", \n.br\n"
 
             count += 1
 
-        print(".SH Constants")
+        self.data += ".SH Constants\n"
 
         for parameter in parameterlist:
             parameter_name = Re(r'\[.*').sub('', parameter)
-            print(f'.IP "{parameter}" 12')
+            self.data += f'.IP "{parameter}" 12' + "\n"
             self.output_highlight(args['parameterdescs'].get(parameter_name, ""))
 
         for section in sectionlist:
-            print(f'.SH "{section}"')
+            self.data += f'.SH "{section}"' + "\n"
             self.output_highlight(sections[section])
 
     def out_typedef(self, fname, name, args):
@@ -685,13 +688,13 @@ class ManFormat(OutputFormat):
         sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
 
-        print(f'.TH "{module}" 9 "{typedef}" "{self.man_date}" "API Manual" LINUX')
+        self.data += f'.TH "{module}" 9 "{typedef}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
-        print(".SH NAME")
-        print(f"typedef {typedef} \\- {purpose}")
+        self.data += ".SH NAME\n"
+        self.data += f"typedef {typedef} \\- {purpose}\n"
 
         for section in sectionlist:
-            print(f'.SH "{section}"')
+            self.data += f'.SH "{section}"' + "\n"
             self.output_highlight(sections.get(section))
 
     def out_struct(self, fname, name, args):
@@ -705,20 +708,20 @@ class ManFormat(OutputFormat):
         sections = args.get('sections', {})
         parameterdescs = args.get('parameterdescs', {})
 
-        print(f'.TH "{module}" 9 "{struct_type} {struct_name}" "{self.man_date}" "API Manual" LINUX')
+        self.data += f'.TH "{module}" 9 "{struct_type} {struct_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
-        print(".SH NAME")
-        print(f"{struct_type} {struct_name} \\- {purpose}")
+        self.data += ".SH NAME\n"
+        self.data += f"{struct_type} {struct_name} \\- {purpose}\n"
 
         # Replace tabs with two spaces and handle newlines
         declaration = definition.replace("\t", "  ")
         declaration = Re(r"\n").sub('"\n.br\n.BI "', declaration)
 
-        print(".SH SYNOPSIS")
-        print(f"{struct_type} {struct_name} " + "{" + "\n.br")
-        print(f'.BI "{declaration}\n' + "};\n.br\n")
+        self.data += ".SH SYNOPSIS\n"
+        self.data += f"{struct_type} {struct_name} " + "{" + "\n.br\n"
+        self.data += f'.BI "{declaration}\n' + "};\n.br\n\n"
 
-        print(".SH Members")
+        self.data += ".SH Members\n"
         for parameter in parameterlist:
             if parameter.startswith("#"):
                 continue
@@ -728,9 +731,9 @@ class ManFormat(OutputFormat):
             if parameterdescs.get(parameter_name) == KernelDoc.undescribed:
                 continue
 
-            print(f'.IP "{parameter}" 12')
+            self.data += f'.IP "{parameter}" 12' + "\n"
             self.output_highlight(parameterdescs.get(parameter_name))
 
         for section in sectionlist:
-            print(f'.SH "{section}"')
+            self.data += f'.SH "{section}"' + "\n"
             self.output_highlight(sections.get(section))
-- 
2.49.0

