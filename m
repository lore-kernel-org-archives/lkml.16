Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93FA26770C;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=S/9QI85oCRPB8NPvRTrLCpzFLYFjkwb7btBIIWS08UwM0U4bxHRO55kKwBCb71BF19m/zQrXIge0RjMidskNvSFteNiBgN2d17DGMEA2sIuazWk/A6H9h/X9Ja3wnNpI7AArq2fPiQOAJjm8gpWNTTLNnHIgGaIM/9RwTSbpTjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=lPtO1RqP5P/ODzspQp2bbNZnI7e6MrRf9tkdCuK9ZV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCaiIFgGk18e+04yCUY1jQ8qfBJir9CDpDM6+N5vf53RIplTDMYI6SsctpSjzxvq6whxPozKNMDKaJAbXDg0+62iVSkuV0o9bFLsQ0wCSxunYvFq7XT3w5kEmw+JNkWzfRnvoGbLu+DlZ8cVzFaPSTmNG3MKNQP+OnQXm5kPBN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkxOToIJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkxOToIJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CA1C4CEEF;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106996;
	bh=lPtO1RqP5P/ODzspQp2bbNZnI7e6MrRf9tkdCuK9ZV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UkxOToIJclfShZ90nFctm4gtpZLshGPh16Wso5iAg9o5NSYP2ZF8KD7iVIAFI7y2a
	 +qTEQVBJQZVKrsvZCAwjfvSVJH08yNDV73fOFpVDLLe3MnYA22PaXD5AxHq6ILKiyg
	 +FS3zK5/BvOTXf8Y7Ll5WmzBrXTvG3yHxdp+1ziVJTup4y1yVmhM7lj+h3IaJJswUM
	 nB1f6rHUGf76eDQXhdN2TrIQ9gev2a/T0sFyslLLwLOKxlniDljpIfCM86tql+yS3q
	 GLM2xr4ZKR/pgklX5hM9OIKKXaKAKBQs/Qpg2tuNBT5U7N3VAZ9l1I/3DAi9WybVuk
	 23N/mlpceHShA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RWb-2Vh2;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 28/33] scripts/kernel-doc.py: Properly handle Werror and exit codes
Date: Tue,  8 Apr 2025 18:09:31 +0800
Message-ID: <de33b0cebd9fdf82d8b221bcfe41db7269286222.1744106242.git.mchehab+huawei@kernel.org>
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

The original kernel-doc script has a logic to return warnings
as errors, and to report the number of warnings found, if in
verbose mode.

Implement it to be fully compatible with the original script.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py           | 18 ++++++++++++++++--
 scripts/lib/kdoc/kdoc_files.py  | 12 ++++++++++--
 scripts/lib/kdoc/kdoc_output.py |  8 +++-----
 scripts/lib/kdoc/kdoc_parser.py | 15 ++++++---------
 4 files changed, 35 insertions(+), 18 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 6a6bc81efd31..2f2fad813024 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -78,8 +78,6 @@
 #    Yacine Belkadi <yacine.belkadi.1@gmail.com>
 #    Yujie Liu <yujie.liu@intel.com>
 
-# TODO: implement warning filtering
-
 """
 kernel_doc
 ==========
@@ -295,6 +293,22 @@ def main():
         if msg:
             print(msg)
 
+    error_count = kfiles.errors
+    if not error_count:
+        sys.exit(0)
+
+    if args.werror:
+        print(f"{error_count} warnings as errors")
+        sys.exit(error_count)
+
+    if args.verbose:
+        print(f"{error_count} errors")
+
+    if args.none:
+        sys.exit(0)
+
+    sys.exit(error_count)
+
 
 # Call main method
 if __name__ == "__main__":
diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
index e52a6d05237e..182d9ed58a72 100644
--- a/scripts/lib/kdoc/kdoc_files.py
+++ b/scripts/lib/kdoc/kdoc_files.py
@@ -12,7 +12,6 @@ import argparse
 import logging
 import os
 import re
-import sys
 
 from kdoc_parser import KernelDoc
 from kdoc_output import OutputFormat
@@ -109,7 +108,7 @@ class KernelFiles():
                     KernelDoc.process_export(self.config.function_table, line)
 
         except IOError:
-            print(f"Error: Cannot open fname {fname}", fname=sys.stderr)
+            self.config.log.error("Error: Cannot open fname %s", fname)
             self.config.errors += 1
 
     def file_not_found_cb(self, fname):
@@ -262,3 +261,12 @@ class KernelFiles():
                                             fname, ln, dtype)
             if msg:
                 yield fname, msg
+
+    @property
+    def errors(self):
+        """
+        Return a count of the number of warnings found, including
+        the ones displayed while interacting over self.msg.
+        """
+
+        return self.config.errors
diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index eb013075da84..e9b4d0093084 100755
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -128,11 +128,9 @@ class OutputFormat:
 
         warnings = args.get('warnings', [])
 
-        for warning, log_msg in warnings:
-            if warning:
-                self.config.log.warning(log_msg)
-            else:
-                self.config.log.info(log_msg)
+        for log_msg in warnings:
+            self.config.log.warning(log_msg)
+            self.config.errors += 1
 
     def check_doc(self, name, args):
         """Check if DOC should be output"""
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 77e8bfeccc8e..43e6ffbdcc2c 100755
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -137,17 +137,18 @@ class KernelDoc:
 
         log_msg = f"{self.fname}:{ln} {msg}"
 
+        if not warning:
+            self.config.log.info(log_msg)
+            return
+
         if self.entry:
             # Delegate warning output to output logic, as this way it
             # will report warnings/info only for symbols that are output
 
-            self.entry.warnings.append((warning, log_msg))
+            self.entry.warnings.append(log_msg)
             return
 
-        if warning:
-            self.config.log.warning(log_msg)
-        else:
-            self.config.log.info(log_msg)
+        self.config.log.warning(log_msg)
 
     def dump_section(self, start_new=True):
         """
@@ -556,7 +557,6 @@ class KernelDoc:
 
         if not members:
             self.emit_warning(ln, f"{proto} error: Cannot parse struct or union!")
-            self.config.errors += 1
             return
 
         if self.entry.identifier != declaration_name:
@@ -831,7 +831,6 @@ class KernelDoc:
 
         if not members:
             self.emit_warning(ln, f"{proto}: error: Cannot parse enum!")
-            self.config.errors += 1
             return
 
         if self.entry.identifier != declaration_name:
@@ -1132,7 +1131,6 @@ class KernelDoc:
             return
 
         self.emit_warning(ln, "error: Cannot parse typedef!")
-        self.config.errors += 1
 
     @staticmethod
     def process_export(function_table, line):
@@ -1677,4 +1675,3 @@ class KernelDoc:
                         self.process_docblock(ln, line)
         except OSError:
             self.config.log.error(f"Error: Cannot open file {self.fname}")
-            self.config.errors += 1
-- 
2.49.0

