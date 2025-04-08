Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C853C267707;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=TdZzZymH5frMaO4WQ+gE50tfsObG8gSflWGIQsyyBl/NaE/3013vPywnDUDPOknysqKgMCI84obQP7niv3UCLxJx4dWGEDNcXZs5PWOsMMY3fLnfY2wMJJKYyXLuXVLQdWHvkB/76uy/Xr/du0zbOFktOB5D0UsiTULOxt37Y/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=2gtlbokD3wIvcyskgL2DYRWExsd4tWZg94PvP3UaS7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIDaJU3CR0MvkaVhSI+lMKdmsXAfQDujhy+CcF9zEvzgFA4lHjuhiKCtu/MTq3VvWWsJ09YWs8PTAXjDFYAdDOyzSkRqZFEfwSIdJcxO8GpQWLeKvv2CHBBY+bHgRPLyS+dHXamvqp5RzrVmQow5m2XA7bt+ThHKKs9JQRF1nRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omwK458e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omwK458e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64672C4CEEE;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106996;
	bh=2gtlbokD3wIvcyskgL2DYRWExsd4tWZg94PvP3UaS7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=omwK458eL+K/pQKW9eEpQfOOETKxlPJV6K8dd2yoiSFjxcGhsCrcJaaAgOR53ZiFz
	 /W8Z2sAgUDlxxRpNWi2piA5sa1dSSN0lZCT3kqpk2i6PyIIvGjCjOH11LbeztfKxy3
	 o29u5nX8adDLX6z/QLpOM6jHHxt/24tMOHfjrRuiyYB4pLrdMDzBtNuNLnr/hVp+Yt
	 QW3ff+eSLG5nOk5bvdvodwH3QQLmO6TYFWishnksf689pvfVj7Hu0BuzcnEHbOcxN5
	 IkmobPrZcNPFmPKqHTtL83My7YBBiBjzoEgSmGdExpEVpfqoUMacluLYtdGI5JqvoH
	 hGJMqDEumRO1A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RWM-21WJ;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 23/33] scripts/kernel-doc.py: adjust some coding style issues
Date: Tue,  8 Apr 2025 18:09:26 +0800
Message-ID: <0f9d5473105e4c09c6c41e3db72cc63f1d4d55f9.1744106242.git.mchehab+huawei@kernel.org>
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

Make pylint happier by adding some missing documentation and
addressing a couple of pylint warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py           | 12 ++++----
 scripts/lib/kdoc/kdoc_files.py  |  4 +--
 scripts/lib/kdoc/kdoc_output.py | 50 ++++++++++++++++++++++++++-------
 scripts/lib/kdoc/kdoc_parser.py | 30 +++++---------------
 scripts/lib/kdoc/kdoc_re.py     |  3 +-
 5 files changed, 57 insertions(+), 42 deletions(-)
 mode change 100755 => 100644 scripts/lib/kdoc/kdoc_files.py

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 90aacd17499a..eca7e34f9d03 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -2,7 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Copyright(c) 2025: Mauro Carvalho Chehab <mchehab@kernel.org>.
 #
-# pylint: disable=C0103
+# pylint: disable=C0103,R0915
 #
 # Converted from the kernel-doc script originally written in Perl
 # under GPLv2, copyrighted since 1998 by the following authors:
@@ -165,6 +165,8 @@ neither here nor at the original Perl script.
 
 
 class MsgFormatter(logging.Formatter):
+    """Helper class to format warnings on a similar way to kernel-doc.pl"""
+
     def format(self, record):
         record.levelname = record.levelname.capitalize()
         return logging.Formatter.format(self, record)
@@ -241,7 +243,7 @@ def main():
 
     # Those are valid for all 3 types of filter
     parser.add_argument("-n", "-nosymbol", "--nosymbol", action='append',
-                         help=NOSYMBOL_DESC)
+                        help=NOSYMBOL_DESC)
 
     parser.add_argument("-D", "-no-doc-sections", "--no-doc-sections",
                         action='store_true', help="Don't outputt DOC sections")
@@ -286,9 +288,9 @@ def main():
     kfiles.parse(args.files, export_file=args.export_file)
 
     for t in kfiles.msg(enable_lineno=args.enable_lineno, export=args.export,
-                          internal=args.internal, symbol=args.symbol,
-                          nosymbol=args.nosymbol,
-                          no_doc_sections=args.no_doc_sections):
+                        internal=args.internal, symbol=args.symbol,
+                        nosymbol=args.nosymbol,
+                        no_doc_sections=args.no_doc_sections):
         msg = t[1]
         if msg:
             print(msg)
diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
old mode 100755
new mode 100644
index dd3dbe87520b..e2221db7022a
--- a/scripts/lib/kdoc/kdoc_files.py
+++ b/scripts/lib/kdoc/kdoc_files.py
@@ -4,8 +4,6 @@
 #
 # pylint: disable=R0903,R0913,R0914,R0917
 
-# TODO: implement warning filtering
-
 """
 Parse lernel-doc tags on multiple kernel source files.
 """
@@ -128,7 +126,7 @@ class KernelFiles():
     def __init__(self, verbose=False, out_style=None,
                  werror=False, wreturn=False, wshort_desc=False,
                  wcontents_before_sections=False,
-                 logger=None, modulename=None, export_file=None):
+                 logger=None, modulename=None):
         """
         Initialize startup variables and parse all files
         """
diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index 6582d1f64d1e..7f84bf12f1e1 100755
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -2,9 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Copyright(c) 2025: Mauro Carvalho Chehab <mchehab@kernel.org>.
 #
-# pylint: disable=C0301,R0911,R0912,R0913,R0914,R0915,R0917
-
-# TODO: implement warning filtering
+# pylint: disable=C0301,R0902,R0911,R0912,R0913,R0914,R0915,R0917
 
 """
 Implement output filters to print kernel-doc documentation.
@@ -52,6 +50,11 @@ type_member_func = type_member + Re(r"\(\)", cache=False)
 
 
 class OutputFormat:
+    """
+    Base class for OutputFormat. If used as-is, it means that only
+    warnings will be displayed.
+    """
+
     # output mode.
     OUTPUT_ALL          = 0 # output all symbols and doc sections
     OUTPUT_INCLUDE      = 1 # output only specified symbols
@@ -75,6 +78,10 @@ class OutputFormat:
         self.data = ""
 
     def set_config(self, config):
+        """
+        Setup global config variables used by both parser and output.
+        """
+
         self.config = config
 
     def set_filter(self, export, internal, symbol, nosymbol, function_table,
@@ -117,6 +124,10 @@ class OutputFormat:
         return block
 
     def out_warnings(self, args):
+        """
+        Output warnings for identifiers that will be displayed.
+        """
+
         warnings = args.get('warnings', [])
 
         for warning, log_msg in warnings:
@@ -146,6 +157,11 @@ class OutputFormat:
         return False
 
     def check_declaration(self, dtype, name, args):
+        """
+        Checks if a declaration should be output or not based on the
+        filtering criteria.
+        """
+
         if name in self.nosymbol:
             return False
 
@@ -169,6 +185,10 @@ class OutputFormat:
         return False
 
     def msg(self, fname, name, args):
+        """
+        Handles a single entry from kernel-doc parser
+        """
+
         self.data = ""
 
         dtype = args.get('type', "")
@@ -203,24 +223,25 @@ class OutputFormat:
         return None
 
     # Virtual methods to be overridden by inherited classes
+    # At the base class, those do nothing.
     def out_doc(self, fname, name, args):
-        pass
+        """Outputs a DOC block"""
 
     def out_function(self, fname, name, args):
-        pass
+        """Outputs a function"""
 
     def out_enum(self, fname, name, args):
-        pass
+        """Outputs an enum"""
 
     def out_typedef(self, fname, name, args):
-        pass
+        """Outputs a typedef"""
 
     def out_struct(self, fname, name, args):
-        pass
+        """Outputs a struct"""
 
 
 class RestFormat(OutputFormat):
-    # """Consts and functions used by ReST output"""
+    """Consts and functions used by ReST output"""
 
     highlights = [
         (type_constant, r"``\1``"),
@@ -265,6 +286,11 @@ class RestFormat(OutputFormat):
             self.data += f".. LINENO {ln}\n"
 
     def output_highlight(self, args):
+        """
+        Outputs a C symbol that may require being converted to ReST using
+        the self.highlights variable
+        """
+
         input_text = args
         output = ""
         in_literal = False
@@ -579,6 +605,10 @@ class ManFormat(OutputFormat):
         self.man_date = dt.strftime("%B %Y")
 
     def output_highlight(self, block):
+        """
+        Outputs a C symbol that may require being highlighted with
+        self.highlights variable using troff syntax
+        """
 
         contents = self.highlight_block(block)
 
@@ -601,7 +631,7 @@ class ManFormat(OutputFormat):
         sections = args.get('sections', {})
 
         if not self.check_doc(name, args):
-                return
+            return
 
         self.data += f'.TH "{module}" 9 "{module}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 3698ef625367..dcb9515fc40b 100755
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -131,7 +131,7 @@ class KernelDoc:
         # Place all potential outputs into an array
         self.entries = []
 
-    # TODO: rename to emit_message
+    # TODO: rename to emit_message after removal of kernel-doc.pl
     def emit_warning(self, ln, msg, warning=True):
         """Emit a message"""
 
@@ -157,19 +157,6 @@ class KernelDoc:
         name = self.entry.section
         contents = self.entry.contents
 
-        # TODO: we can prevent dumping empty sections here with:
-        #
-        #    if self.entry.contents.strip("\n"):
-        #       if start_new:
-        #           self.entry.section = self.section_default
-        #           self.entry.contents = ""
-        #
-        #        return
-        #
-        # But, as we want to be producing the same output of the
-        # venerable kernel-doc Perl tool, let's just output everything,
-        # at least for now
-
         if type_param.match(name):
             name = type_param.group(1)
 
@@ -205,7 +192,7 @@ class KernelDoc:
             self.entry.section = self.section_default
             self.entry.contents = ""
 
-    # TODO: rename it to store_declaration
+    # TODO: rename it to store_declaration after removal of kernel-doc.pl
     def output_declaration(self, dtype, name, **args):
         """
         Stores the entry into an entry array.
@@ -225,13 +212,13 @@ class KernelDoc:
         args["type"] = dtype
         args["warnings"] = self.entry.warnings
 
-        # TODO: use colletions.OrderedDict
+        # TODO: use colletions.OrderedDict to remove sectionlist
 
         sections = args.get('sections', {})
         sectionlist = args.get('sectionlist', [])
 
         # Drop empty sections
-        # TODO: improve it to emit warnings
+        # TODO: improve empty sections logic to emit warnings
         for section in ["Description", "Return"]:
             if section in sectionlist:
                 if not sections[section].rstrip():
@@ -636,7 +623,9 @@ class KernelDoc:
 
             # Replace macros
             #
-            # TODO: it is better to also move those to the NestedMatch logic,
+            # TODO: use NestedMatch for FOO($1, $2, ...) matches
+            #
+            # it is better to also move those to the NestedMatch logic,
             # to ensure that parenthesis will be properly matched.
 
             (Re(r'__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([^\)]+)\)', re.S), r'DECLARE_BITMAP(\1, __ETHTOOL_LINK_MODE_MASK_NBITS)'),
@@ -906,7 +895,6 @@ class KernelDoc:
             self.dump_struct(ln, prototype)
             return
 
-        # TODO: handle other types
         self.output_declaration(self.entry.decl_type, prototype,
                                 entry=self.entry)
 
@@ -1680,10 +1668,6 @@ class KernelDoc:
                                           self.st_inline_name[self.inline_doc_state],
                                           line)
 
-                    # TODO: not all states allow EXPORT_SYMBOL*, so this
-                    # can be optimized later on to speedup parsing
-                    self.process_export(self.config.function_table, line)
-
                     # Hand this line to the appropriate state handler
                     if self.state == self.STATE_NORMAL:
                         self.process_normal(ln, line)
diff --git a/scripts/lib/kdoc/kdoc_re.py b/scripts/lib/kdoc/kdoc_re.py
index 512b6521e79d..d28485ff94d6 100755
--- a/scripts/lib/kdoc/kdoc_re.py
+++ b/scripts/lib/kdoc/kdoc_re.py
@@ -131,7 +131,8 @@ class NestedMatch:
     will ignore the search string.
     """
 
-    # TODO:
+    # TODO: make NestedMatch handle multiple match groups
+    #
     # Right now, regular expressions to match it are defined only up to
     #       the start delimiter, e.g.:
     #
-- 
2.49.0

