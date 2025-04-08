Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15472676FF;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=D89HpGvttcCLcayzAx5+73wwzd1s0hPqcKIvfgKi0w2F/20LhaDBXaxAut53bHWaYckzC5FJtpO72p+Vi4VCWo8IxqGDPyyio1rEuekuvbLL6pE744XdjevNcYbLgzSeHdN2Llm5y4s70lIwsXpF3iIwQU3cVkPTKeKL4LsqrlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=ap4JRnRfz9etkeP/FGAkkiE80UWtsVBLm1sZD3/QPKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+PcAbemn9/563HDm8fjfIp/AIJaPfNgxn4qLJjtYcN4f6t1St1+x5FHT3oNl/5T2v7KM4sd0a2Qhq0OV1NJC14sQc1G521KGUc+CP/y9E7VKsIBSp5sqyCt2nlohrF0eQZ7jfr0NzY/NcK96IbTjkad6V1A7KUqkFZyl3tTycQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgmCOUrs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgmCOUrs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689F8C4AF0C;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106996;
	bh=ap4JRnRfz9etkeP/FGAkkiE80UWtsVBLm1sZD3/QPKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NgmCOUrsCQtM6L8JEe1XQ5hOwQZbW5TzfAB35TRvNNTXBKQ9oJ6jeTu7n0Agp8CXs
	 qqLVYkn3aWUGpnS3g8qwJ0NQKiLs9iuY4M34ohATyqOh4gYPgTwxkmFbWWFiUFtAJs
	 S7OnZi9Wp49dhVFCYw/1+MUERASqeDa1tbzgfl7httFPz5WzTsxl8R7KID7uU6Bn95
	 32zo76yQFcJk5G3rRkQ4KnxCbn1hHbypgX1io2Rgy3BRaKHF2VMq42kuCg/+GAEZB/
	 Dulyy/m2nXtANgLdI3LOorgEbTXUiG6FMLnLBzZBuHKw6hMlF7MHSGjYn+k4mrh4cF
	 JKMIpLyxgMTRg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RW4-1SvQ;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 17/33] scripts/kernel-doc.py: postpone warnings to the output plugin
Date: Tue,  8 Apr 2025 18:09:20 +0800
Message-ID: <e6344711e390cf22af02a56bb5dd51ca67c0afb6.1744106242.git.mchehab+huawei@kernel.org>
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

We don't want to have warnings displayed for symbols that
weren't output. So, postpone warnings print to the output
plugin, where symbol output is validated.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_output.py | 24 +++++++++++++++----
 scripts/lib/kdoc/kdoc_parser.py | 41 ++++++++++++++++-----------------
 2 files changed, 39 insertions(+), 26 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index d0c8cedb0ea5..6582d1f64d1e 100755
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -116,7 +116,16 @@ class OutputFormat:
 
         return block
 
-    def check_doc(self, name):
+    def out_warnings(self, args):
+        warnings = args.get('warnings', [])
+
+        for warning, log_msg in warnings:
+            if warning:
+                self.config.log.warning(log_msg)
+            else:
+                self.config.log.info(log_msg)
+
+    def check_doc(self, name, args):
         """Check if DOC should be output"""
 
         if self.no_doc_sections:
@@ -126,19 +135,22 @@ class OutputFormat:
             return False
 
         if self.out_mode == self.OUTPUT_ALL:
+            self.out_warnings(args)
             return True
 
         if self.out_mode == self.OUTPUT_INCLUDE:
             if name in self.function_table:
+                self.out_warnings(args)
                 return True
 
         return False
 
-    def check_declaration(self, dtype, name):
+    def check_declaration(self, dtype, name, args):
         if name in self.nosymbol:
             return False
 
         if self.out_mode == self.OUTPUT_ALL:
+            self.out_warnings(args)
             return True
 
         if self.out_mode in [self.OUTPUT_INCLUDE, self.OUTPUT_EXPORTED]:
@@ -147,9 +159,11 @@ class OutputFormat:
 
         if self.out_mode == self.OUTPUT_INTERNAL:
             if dtype != "function":
+                self.out_warnings(args)
                 return True
 
             if name not in self.function_table:
+                self.out_warnings(args)
                 return True
 
         return False
@@ -163,7 +177,7 @@ class OutputFormat:
             self.out_doc(fname, name, args)
             return self.data
 
-        if not self.check_declaration(dtype, name):
+        if not self.check_declaration(dtype, name, args):
             return self.data
 
         if dtype == "function":
@@ -328,7 +342,7 @@ class RestFormat(OutputFormat):
         self.data += "\n"
 
     def out_doc(self, fname, name, args):
-        if not self.check_doc(name):
+        if not self.check_doc(name, args):
             return
         self.out_section(args, out_docblock=True)
 
@@ -586,7 +600,7 @@ class ManFormat(OutputFormat):
         sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
 
-        if not self.check_doc(name):
+        if not self.check_doc(name, args):
                 return
 
         self.data += f'.TH "{module}" 9 "{module}" "{self.man_date}" "API Manual" LINUX' + "\n"
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 74b311c8184c..3698ef625367 100755
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -131,23 +131,23 @@ class KernelDoc:
         # Place all potential outputs into an array
         self.entries = []
 
-    def show_warnings(self, dtype, declaration_name):  # pylint: disable=W0613
-        """
-        Allow filtering out warnings
-        """
-
-        # TODO: implement it
-
-        return True
-
     # TODO: rename to emit_message
     def emit_warning(self, ln, msg, warning=True):
         """Emit a message"""
 
+        log_msg = f"{self.fname}:{ln} {msg}"
+
+        if self.entry:
+            # Delegate warning output to output logic, as this way it
+            # will report warnings/info only for symbols that are output
+
+            self.entry.warnings.append((warning, log_msg))
+            return
+
         if warning:
-            self.config.log.warning("%s:%d %s", self.fname, ln, msg)
+            self.config.log.warning(log_msg)
         else:
-            self.config.log.info("%s:%d %s", self.fname, ln, msg)
+            self.config.log.info(log_msg)
 
     def dump_section(self, start_new=True):
         """
@@ -221,10 +221,9 @@ class KernelDoc:
         # For now, we're keeping the same name of the function just to make
         # easier to compare the source code of both scripts
 
-        if "declaration_start_line" not in args:
-            args["declaration_start_line"] = self.entry.declaration_start_line
-
+        args["declaration_start_line"] = self.entry.declaration_start_line
         args["type"] = dtype
+        args["warnings"] = self.entry.warnings
 
         # TODO: use colletions.OrderedDict
 
@@ -257,6 +256,8 @@ class KernelDoc:
         self.entry.struct_actual = ""
         self.entry.prototype = ""
 
+        self.entry.warnings = []
+
         self.entry.parameterlist = []
         self.entry.parameterdescs = {}
         self.entry.parametertypes = {}
@@ -328,7 +329,7 @@ class KernelDoc:
         if param not in self.entry.parameterdescs and not param.startswith("#"):
             self.entry.parameterdescs[param] = self.undescribed
 
-            if self.show_warnings(dtype, declaration_name) and "." not in param:
+            if "." not in param:
                 if decl_type == 'function':
                     dname = f"{decl_type} parameter"
                 else:
@@ -868,16 +869,14 @@ class KernelDoc:
             self.entry.parameterlist.append(arg)
             if arg not in self.entry.parameterdescs:
                 self.entry.parameterdescs[arg] = self.undescribed
-                if self.show_warnings("enum", declaration_name):
-                    self.emit_warning(ln,
-                                      f"Enum value '{arg}' not described in enum '{declaration_name}'")
+                self.emit_warning(ln,
+                                  f"Enum value '{arg}' not described in enum '{declaration_name}'")
             member_set.add(arg)
 
         for k in self.entry.parameterdescs:
             if k not in member_set:
-                if self.show_warnings("enum", declaration_name):
-                    self.emit_warning(ln,
-                                      f"Excess enum value '%{k}' description in '{declaration_name}'")
+                self.emit_warning(ln,
+                                  f"Excess enum value '%{k}' description in '{declaration_name}'")
 
         self.output_declaration('enum', declaration_name,
                                 enum=declaration_name,
-- 
2.49.0

