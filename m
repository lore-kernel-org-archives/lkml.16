Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9E2267F55;
	Tue,  8 Apr 2025 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106999; cv=none; b=Jg8uV4uyR6oCoOg+NtPZWYZLMekb2ueIEKqeBd1sLHM9pgYF7kknLmhYy6KfW0H7SVhw73lhHvd2XkNXBgz/+fgZptjovWM0PPalrQxf7mwGhLhlGDnCnGQMyohQ6etFh+C/UMk+oyd42S8e3y5z4zvwDvBZQGyyk2FOFR2rCgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106999; c=relaxed/simple;
	bh=iHwJIWf+EpApsxQknvppsFpmD/7QpWJ0mtVTdwRXEsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRSItDdCi6bqV44pkRt6VsWf0ZoIcHA/vcXfDq3q5OF6YTCRu3T2ThATCG2oksluDEMsMvs/hk6JxyQXJa4sdxoAJs0p8emx5a0JBmyup0dcoIpy16iirqZITnF5CeQq8DdSWCKcJMIwuk34RdR0yVdUB+ywRDCpBMjZkrvYkSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o8YedC33; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o8YedC33"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8373DC4CEE5;
	Tue,  8 Apr 2025 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106997;
	bh=iHwJIWf+EpApsxQknvppsFpmD/7QpWJ0mtVTdwRXEsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o8YedC33i8tsSrK0yDhUBlA6CUcSx6KQiR3tVpiqhdxWtXw4Qim5VVCBRFoX/jZb3
	 mAiY4M3nbxvwkTqLEg2VrLlIV3JnejtUJm+ur/xIoa04lYFnTNyZ1hCXoe25A40Z04
	 77FyeQVkpkzCy4EUd7sIiu7slY83WQQO3NVRiOWqXZqbN175T74gBWI0oVoZPIlR3M
	 IJgaCIYUWzZimla1cZsHXZJMATxORKiCIpzG1vtl9ckQIlxSpkbcg260KskzoV5pn9
	 WTKzQrJ2HS0rMIkJPRDfUjU+finLARH7fCxeE3j2m/SDEK/4VViJITmTROj95l2ecp
	 0HWYVtjiRD4Aw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RVy-1HDy;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/33] scripts/kernel-doc.py: fix handling of doc output check
Date: Tue,  8 Apr 2025 18:09:18 +0800
Message-ID: <6d8b77af85295452c0191863ea1041f4195aeaaf.1744106242.git.mchehab+huawei@kernel.org>
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

The filtering logic was seeking for the DOC name to check for
symbols, but such data is stored only inside a section. Add it
to the output_declaration, as it is quicker/easier to check
the declaration name than to check inside each section.

While here, make sure that the output for both ReST and man
after filtering will be similar to what kernel-doc Perl
version does.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_output.py | 29 ++++++++++++-----------------
 scripts/lib/kdoc/kdoc_parser.py |  3 ++-
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index 6a7187980bec..7a945dd80c9b 100755
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -122,13 +122,13 @@ class OutputFormat:
         if self.no_doc_sections:
             return False
 
+        if name in self.nosymbol:
+            return False
+
         if self.out_mode == self.OUTPUT_ALL:
             return True
 
         if self.out_mode == self.OUTPUT_INCLUDE:
-            if name in self.nosymbol:
-                return False
-
             if name in self.function_table:
                 return True
 
@@ -154,15 +154,6 @@ class OutputFormat:
 
         return False
 
-    def check_function(self, fname, name, args):
-        return True
-
-    def check_enum(self, fname, name, args):
-        return True
-
-    def check_typedef(self, fname, name, args):
-        return True
-
     def msg(self, fname, name, args):
         self.data = ""
 
@@ -306,7 +297,7 @@ class RestFormat(OutputFormat):
         for line in output.strip("\n").split("\n"):
             self.data += self.lineprefix + line + "\n"
 
-    def out_section(self, args, out_reference=False):
+    def out_section(self, args, out_docblock=False):
         """
         Outputs a block section.
 
@@ -325,7 +316,7 @@ class RestFormat(OutputFormat):
                 continue
 
             if not self.out_mode == self.OUTPUT_INCLUDE:
-                if out_reference:
+                if out_docblock:
                     self.data += f".. _{section}:\n\n"
 
                 if not self.symbol:
@@ -339,8 +330,7 @@ class RestFormat(OutputFormat):
     def out_doc(self, fname, name, args):
         if not self.check_doc(name):
             return
-
-        self.out_section(args, out_reference=True)
+        self.out_section(args, out_docblock=True)
 
     def out_function(self, fname, name, args):
 
@@ -583,8 +573,10 @@ class ManFormat(OutputFormat):
 
         for line in contents.strip("\n").split("\n"):
             line = Re(r"^\s*").sub("", line)
+            if not line:
+                continue
 
-            if line and line[0] == ".":
+            if line[0] == ".":
                 self.data += "\\&" + line + "\n"
             else:
                 self.data += line + "\n"
@@ -594,6 +586,9 @@ class ManFormat(OutputFormat):
         sectionlist = args.get('sectionlist', [])
         sections = args.get('sections', {})
 
+        if not self.check_doc(name):
+                return
+
         self.data += f'.TH "{module}" 9 "{module}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
         for section in sectionlist:
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index e8c86448d6b5..74b311c8184c 100755
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1198,6 +1198,7 @@ class KernelDoc:
             else:
                 self.entry.section = doc_block.group(1)
 
+            self.entry.identifier = self.entry.section
             self.state = self.STATE_DOCBLOCK
             return
 
@@ -1628,7 +1629,7 @@ class KernelDoc:
 
         if doc_end.search(line):
             self.dump_section()
-            self.output_declaration("doc", None,
+            self.output_declaration("doc", self.entry.identifier,
                                     sectionlist=self.entry.sectionlist,
                                     sections=self.entry.sections,
                                     section_start_lines=self.entry.section_start_lines,
-- 
2.49.0

