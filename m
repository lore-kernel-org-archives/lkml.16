Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BBA1CCB40;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182705; cv=none; b=IpJNuKZkpPjikkUFypInyxFZ2WNAI3YaUeA5+zbWtfi/HniS80GP56KIcL+iQbS9DeY1mYr4tPoANpTbrU08jiAPkTbEAUgWji4heFnTlB6fjrmv6e82nMcjt1tCPdII9EX+dxEdQcH7iaxTL7jn+lmSXrJ0DaKpogRIZqzGKLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182705; c=relaxed/simple;
	bh=RqzmVDLNe9DdW+lbrE2RQgi36O2JCG3KESmSozKEG4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V8ht8Wo7JtRsKXZ692q28J3/WwmxMGousRzSf2IDTCm9G7tpKokSuhSFGm2D8q6y6+VDOJzVxZIE5RADLI7Bj0ec+eqsx8qJO8tyaNrlerXxmpCGk7z5149xDhj8AwQi3AMbUvUo3LOovmRAYKsDVXNZEQQ60Dsj7jo/jntErck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G91Fp+XL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G91Fp+XL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189D6C4CEF9;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=RqzmVDLNe9DdW+lbrE2RQgi36O2JCG3KESmSozKEG4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G91Fp+XLtfedHi6Zewz592FKCmP4rMMopCwUIRiPRSh8372fdUOlfikEvMZQuuJXT
	 bGLHa60vFYRdDzxFjRnqd7K8YNe3gX3QiUL/6HB73A9wqju1s/p8Q3dc/VM8JT/H2/
	 Rf3Ha5iPfFiR+z94RBYIAIi2sRCoHWjaflG7gwgaxME4EIr0+MZsXMbv+VNTfAsJVc
	 RCQftOSZatn8xb94lyer5FPXJnyK0gX6RYLRvc5K1YhqXzAV7kOseL8CAnwO+mazA8
	 N4GnmyasNEEOz1kIefNCVwVq+5W0SPOtwfke9sD0O0BEtfHP8udFolHZTqFex2AIVS
	 7vsxURIY3WK7A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006Ciy-0rae;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/27] scripts/lib/abi/abi_parser.py: optimize parse_abi() function
Date: Mon, 10 Feb 2025 11:18:02 +0100
Message-ID: <190dd358897017ed82c56f1e263192215ffbae43.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Instead of using glob, use a recursive function to parse all files.

Such change reduces the total excecution time by 15% with my SSD disks.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/abi/abi_parser.py | 57 +++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/abi/abi_parser.py b/scripts/lib/abi/abi_parser.py
index bea7f1a76165..6052a8aec443 100644
--- a/scripts/lib/abi/abi_parser.py
+++ b/scripts/lib/abi/abi_parser.py
@@ -12,7 +12,6 @@ import logging
 import os
 import re
 
-from glob import glob
 from pprint import pformat
 from random import randrange, seed
 
@@ -46,7 +45,11 @@ class AbiParser:
         self.file_refs = {}
         self.what_refs = {}
 
+        # Ignore files that contain such suffixes
+        self.ignore_suffixes = (".rej", ".org", ".orig", ".bak", "~")
+
         # Regular expressions used on parser
+        self.re_abi_dir = re.compile(r"(.*)" + ABI_DIR)
         self.re_tag = re.compile(r"(\S+)(:\s*)(.*)", re.I)
         self.re_valid = re.compile(self.TAGS)
         self.re_start_spc = re.compile(r"(\s*)(\S.*)")
@@ -322,26 +325,42 @@ class AbiParser:
                 for w in fdata.what:
                     self.add_symbol(what=w, fname=fname, xref=fdata.key)
 
-    def parse_abi(self):
+    def _parse_abi(self, root=None):
+        """Internal function to parse documentation ABI recursively"""
+
+        if not root:
+            root = self.directory
+
+        with os.scandir(root) as obj:
+            for entry in obj:
+                name = os.path.join(root, entry.name)
+
+                if entry.is_dir():
+                    self.parse_abi(name)
+                    continue
+
+                if not entry.is_file():
+                    continue
+
+                basename = os.path.basename(name)
+
+                if basename == "README":
+                    continue
+
+                if basename.startswith("."):
+                    continue
+
+                if basename.endswith(self.ignore_suffixes):
+                    continue
+
+                path = self.re_abi_dir.sub("", os.path.dirname(name))
+
+                self.parse_file(name, path, basename)
+
+    def parse_abi(self, root=None):
         """Parse documentation ABI"""
 
-        ignore_suffixes = ("rej", "org", "orig", "bak", "~")
-        re_abi = re.compile(r".*" + ABI_DIR)
-
-        for fname in glob(os.path.join(self.directory, "**"), recursive=True):
-            if os.path.isdir(fname):
-                continue
-
-            basename = os.path.basename(fname)
-
-            if basename == "README":
-                continue
-            if basename.startswith(".") or basename.endswith(ignore_suffixes):
-                continue
-
-            path = re_abi.sub("", os.path.dirname(fname))
-
-            self.parse_file(fname, path, basename)
+        self._parse_abi(root)
 
         if self.debug & AbiDebug.DUMP_ABI_STRUCTS:
             self.log.debug(pformat(self.data))
-- 
2.48.1

