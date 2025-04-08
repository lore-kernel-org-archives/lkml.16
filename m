Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B90267B07;
	Tue,  8 Apr 2025 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106997; cv=none; b=QHRPMo0tiZVWM1VDfRYJ2niDRwF6L1C6NNTMXQk5JU/qd8JWKnWHm5jXrVl0wkI+CTZfotMuJvnUkytfRm56ItIWheZBWT1Bj2uWSkJ+wGIFv5PBryI25NnIRzhoMN9ju1jg6v9kIbwm5TbJUMdX2zDGmApcCI4vfYLDcOWI6aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106997; c=relaxed/simple;
	bh=fECQ0wT3cwyILMq52vt+FKrJbJo2Gu0emu+5UkOVdgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bgm6n0IR67XbAYdw7QZx7V27Z/5FoMFhRzCR5HtkolAN89nG2D3pCs2idgsyV1E9sXQhdwNRefi1voLwKCDMo5uh+4QvH6JxksO6rqd4z4q4yRDlv6CLfcecEmYF9pEPeH5vLdpwXkW53oXOe2/yWBQK9Em+vO9vw24oe9ma46M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVtGygnS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVtGygnS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F90CC4AF0D;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106997;
	bh=fECQ0wT3cwyILMq52vt+FKrJbJo2Gu0emu+5UkOVdgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VVtGygnSL21S0Bb+6WFI3FSyVeXdlkaF4bB6gh8jFc3yLM/+Uv4zPZD/oSgzwXl/L
	 TSjXMfLCi+MUcIubTqXDSCLySusbS9xFeL+tgzHo883+J/PtVak5yLqpmWVPV8Fgze
	 +mvbFuupjjadPYwNFtPoR/W381sapvryTeUQfVTQDbOl9b1lu9lH8TQInyGxU3j70J
	 G4ovXGNaiqyPD2PvNWYARsPbJLS3W8iz+ibCYVdehk3Qvrtl7GG/1Vqqpg+LWFwomt
	 c82a5k0ESFEvB/4mrypW7h9+SdHrTzHFL8VazOMXxeuxUAwAIOb3GYodMmEFZYiwTK
	 6tRH5gV1EVoSg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RWk-2nBW;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 31/33] scripts/kernel_doc.py: better handle exported symbols
Date: Tue,  8 Apr 2025 18:09:34 +0800
Message-ID: <6a69ba8d2b7ee6a6427abb53e60d09bd4d3565ee.1744106242.git.mchehab+huawei@kernel.org>
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

Change the logic which detects internal/external symbols in a way
that we can re-use it when calling via Sphinx extension.

While here, remove an unused self.config var and let it clearer
that self.config variables are read-only. This helps to allow
handling multiple times in parallel if ever needed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py           |   2 +-
 scripts/lib/kdoc/kdoc_files.py  | 142 +++++++++++++++++---------------
 scripts/lib/kdoc/kdoc_output.py |   9 +-
 scripts/lib/kdoc/kdoc_parser.py |  52 ++++++++++--
 4 files changed, 125 insertions(+), 80 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 2f2fad813024..12ae66f40bd7 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -287,7 +287,7 @@ def main():
 
     for t in kfiles.msg(enable_lineno=args.enable_lineno, export=args.export,
                         internal=args.internal, symbol=args.symbol,
-                        nosymbol=args.nosymbol,
+                        nosymbol=args.nosymbol, export_file=args.export_file,
                         no_doc_sections=args.no_doc_sections):
         msg = t[1]
         if msg:
diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
index 527ab9117268..dd003feefd1b 100644
--- a/scripts/lib/kdoc/kdoc_files.py
+++ b/scripts/lib/kdoc/kdoc_files.py
@@ -68,6 +68,9 @@ class GlobSourceFiles:
         handling directories if any
         """
 
+        if not file_list:
+            return
+
         for fname in file_list:
             if self.srctree:
                 f = os.path.join(self.srctree, fname)
@@ -84,40 +87,70 @@ class GlobSourceFiles:
 
 class KernelFiles():
     """
-    Parse lernel-doc tags on multiple kernel source files.
+    Parse kernel-doc tags on multiple kernel source files.
+
+    There are two type of parsers defined here:
+        - self.parse_file(): parses both kernel-doc markups and
+          EXPORT_SYMBOL* macros;
+        - self.process_export_file(): parses only EXPORT_SYMBOL* macros.
     """
 
+    def warning(self, msg):
+        """Ancillary routine to output a warning and increment error count"""
+
+        self.config.log.warning(msg)
+        self.errors += 1
+
+    def error(self, msg):
+        """Ancillary routine to output an error and increment error count"""
+
+        self.config.log.error(msg)
+        self.errors += 1
+
     def parse_file(self, fname):
         """
         Parse a single Kernel source.
         """
 
+        # Prevent parsing the same file twice if results are cached
+        if fname in self.files:
+            return
+
         doc = KernelDoc(self.config, fname)
-        doc.run()
+        export_table, entries = doc.parse_kdoc()
 
-        return doc.entries
+        self.export_table[fname] = export_table
+
+        self.files.add(fname)
+        self.export_files.add(fname)      # parse_kdoc() already check exports
+
+        self.results[fname] = entries
 
     def process_export_file(self, fname):
         """
         Parses EXPORT_SYMBOL* macros from a single Kernel source file.
         """
-        try:
-            with open(fname, "r", encoding="utf8",
-                      errors="backslashreplace") as fp:
-                for line in fp:
-                    KernelDoc.process_export(self.config.function_table, line)
-
-        except IOError:
-            self.config.log.error("Error: Cannot open fname %s", fname)
-            self.config.errors += 1
+
+        # Prevent parsing the same file twice if results are cached
+        if fname in self.export_files:
+            return
+
+        doc = KernelDoc(self.config, fname)
+        export_table = doc.parse_export()
+
+        if not export_table:
+            self.error(f"Error: Cannot check EXPORT_SYMBOL* on {fname}")
+            export_table = set()
+
+        self.export_table[fname] = export_table
+        self.export_files.add(fname)
 
     def file_not_found_cb(self, fname):
         """
         Callback to warn if a file was not found.
         """
 
-        self.config.log.error("Cannot find file %s", fname)
-        self.config.errors += 1
+        self.error(f"Cannot find file {fname}")
 
     def __init__(self, verbose=False, out_style=None,
                  werror=False, wreturn=False, wshort_desc=False,
@@ -147,7 +180,9 @@ class KernelFiles():
             if kdoc_werror:
                 werror = kdoc_werror
 
-        # Set global config data used on all files
+        # Some variables are global to the parser logic as a whole as they are
+        # used to send control configuration to KernelDoc class. As such,
+        # those variables are read-only inside the KernelDoc.
         self.config = argparse.Namespace
 
         self.config.verbose = verbose
@@ -156,27 +191,25 @@ class KernelFiles():
         self.config.wshort_desc = wshort_desc
         self.config.wcontents_before_sections = wcontents_before_sections
 
-        self.config.function_table = set()
-        self.config.source_map = {}
-
         if not logger:
             self.config.log = logging.getLogger("kernel-doc")
         else:
             self.config.log = logger
 
-        self.config.kernel_version = os.environ.get("KERNELVERSION",
-                                                    "unknown kernel version'")
+        self.config.warning = self.warning
+
         self.config.src_tree = os.environ.get("SRCTREE", None)
 
+        # Initialize variables that are internal to KernelFiles
+
         self.out_style = out_style
 
-        # Initialize internal variables
-
-        self.config.errors = 0
+        self.errors = 0
         self.results = {}
 
         self.files = set()
         self.export_files = set()
+        self.export_table = {}
 
     def parse(self, file_list, export_file=None):
         """
@@ -185,28 +218,11 @@ class KernelFiles():
 
         glob = GlobSourceFiles(srctree=self.config.src_tree)
 
-        # Prevent parsing the same file twice to speedup parsing and
-        # avoid reporting errors multiple times
-
         for fname in glob.parse_files(file_list, self.file_not_found_cb):
-            if fname not in self.files:
-                self.results[fname] = self.parse_file(fname)
-                self.files.add(fname)
-
-        # If a list of export files was provided, parse EXPORT_SYMBOL*
-        # from files that weren't fully parsed
-
-        if not export_file:
-            return
-
-        self.export_files |= self.files
-
-        glob = GlobSourceFiles(srctree=self.config.src_tree)
+            self.parse_file(fname)
 
         for fname in glob.parse_files(export_file, self.file_not_found_cb):
-            if fname not in self.export_files:
-                self.process_export_file(fname)
-                self.export_files.add(fname)
+            self.process_export_file(fname)
 
     def out_msg(self, fname, name, arg):
         """
@@ -223,32 +239,35 @@ class KernelFiles():
 
     def msg(self, enable_lineno=False, export=False, internal=False,
             symbol=None, nosymbol=None, no_doc_sections=False,
-            filenames=None):
+            filenames=None, export_file=None):
         """
         Interacts over the kernel-doc results and output messages,
         returning kernel-doc markups on each interaction
         """
 
-        function_table = self.config.function_table
-
-        if symbol:
-            for s in symbol:
-                function_table.add(s)
-
-        # Output none mode: only warnings will be shown
-        if not self.out_style:
-            return
-
         self.out_style.set_config(self.config)
 
-        self.out_style.set_filter(export, internal, symbol, nosymbol,
-                                  function_table, enable_lineno,
-                                  no_doc_sections)
-
         if not filenames:
             filenames = sorted(self.results.keys())
 
         for fname in filenames:
+            function_table = set()
+
+            if internal or export:
+                if not export_file:
+                    export_file = [fname]
+
+                for f in export_file:
+                    function_table |= self.export_table[f]
+
+            if symbol:
+                for s in symbol:
+                    function_table.add(s)
+
+            self.out_style.set_filter(export, internal, symbol, nosymbol,
+                                      function_table, enable_lineno,
+                                      no_doc_sections)
+
             msg = ""
             for name, arg in self.results[fname]:
                 msg += self.out_msg(fname, name, arg)
@@ -261,12 +280,3 @@ class KernelFiles():
                                             fname, ln, dtype)
             if msg:
                 yield fname, msg
-
-    @property
-    def errors(self):
-        """
-        Return a count of the number of warnings found, including
-        the ones displayed while interacting over self.msg.
-        """
-
-        return self.config.errors
diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index e9b4d0093084..c352b7f8d3fd 100755
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -69,7 +69,7 @@ class OutputFormat:
         self.enable_lineno = None
         self.nosymbol = {}
         self.symbol = None
-        self.function_table = set()
+        self.function_table = None
         self.config = None
         self.no_doc_sections = False
 
@@ -94,10 +94,10 @@ class OutputFormat:
 
         self.enable_lineno = enable_lineno
         self.no_doc_sections = no_doc_sections
+        self.function_table = function_table
 
         if symbol:
             self.out_mode = self.OUTPUT_INCLUDE
-            function_table = symbol
         elif export:
             self.out_mode = self.OUTPUT_EXPORTED
         elif internal:
@@ -108,8 +108,6 @@ class OutputFormat:
         if nosymbol:
             self.nosymbol = set(nosymbol)
 
-        if function_table:
-            self.function_table = function_table
 
     def highlight_block(self, block):
         """
@@ -129,8 +127,7 @@ class OutputFormat:
         warnings = args.get('warnings', [])
 
         for log_msg in warnings:
-            self.config.log.warning(log_msg)
-            self.config.errors += 1
+            self.config.warning(log_msg)
 
     def check_doc(self, name, args):
         """Check if DOC should be output"""
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 43e6ffbdcc2c..33f00c77dd5f 100755
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1133,21 +1133,25 @@ class KernelDoc:
         self.emit_warning(ln, "error: Cannot parse typedef!")
 
     @staticmethod
-    def process_export(function_table, line):
+    def process_export(function_set, line):
         """
         process EXPORT_SYMBOL* tags
 
-        This method is called both internally and externally, so, it
-        doesn't use self.
+        This method doesn't use any variable from the class, so declare it
+        with a staticmethod decorator.
         """
 
+        # Note: it accepts only one EXPORT_SYMBOL* per line, as having
+        # multiple export lines would violate Kernel coding style.
+
         if export_symbol.search(line):
             symbol = export_symbol.group(2)
-            function_table.add(symbol)
+            function_set.add(symbol)
+            return
 
         if export_symbol_ns.search(line):
             symbol = export_symbol_ns.group(2)
-            function_table.add(symbol)
+            function_set.add(symbol)
 
     def process_normal(self, ln, line):
         """
@@ -1617,17 +1621,39 @@ class KernelDoc:
         elif doc_content.search(line):
             self.entry.contents += doc_content.group(1) + "\n"
 
-    def run(self):
+    def parse_export(self):
+        """
+        Parses EXPORT_SYMBOL* macros from a single Kernel source file.
+        """
+
+        export_table = set()
+
+        try:
+            with open(self.fname, "r", encoding="utf8",
+                      errors="backslashreplace") as fp:
+
+                for line in fp:
+                    self.process_export(export_table, line)
+
+        except IOError:
+            return None
+
+        return export_table
+
+    def parse_kdoc(self):
         """
         Open and process each line of a C source file.
-        he parsing is controlled via a state machine, and the line is passed
+        The parsing is controlled via a state machine, and the line is passed
         to a different process function depending on the state. The process
         function may update the state as needed.
+
+        Besides parsing kernel-doc tags, it also parses export symbols.
         """
 
         cont = False
         prev = ""
         prev_ln = None
+        export_table = set()
 
         try:
             with open(self.fname, "r", encoding="utf8",
@@ -1659,6 +1685,16 @@ class KernelDoc:
                                           self.st_inline_name[self.inline_doc_state],
                                           line)
 
+                    # This is an optimization over the original script.
+                    # There, when export_file was used for the same file,
+                    # it was read twice. Here, we use the already-existing
+                    # loop to parse exported symbols as well.
+                    #
+                    # TODO: It should be noticed that not all states are
+                    # needed here. On a future cleanup, process export only
+                    # at the states that aren't handling comment markups.
+                    self.process_export(export_table, line)
+
                     # Hand this line to the appropriate state handler
                     if self.state == self.STATE_NORMAL:
                         self.process_normal(ln, line)
@@ -1675,3 +1711,5 @@ class KernelDoc:
                         self.process_docblock(ln, line)
         except OSError:
             self.config.log.error(f"Error: Cannot open file {self.fname}")
+
+        return export_table, self.entries
-- 
2.49.0

