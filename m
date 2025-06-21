Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4741C1865EB;
	Sat, 21 Jun 2025 20:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750538130; cv=none; b=aJvf1WxdpG4xZcjLFHHMmuS1VrcYU4rDRkCBdc2aWTXsUZg7ig50c54WuLtgT49EmA+ruvLLQdwYz9mP7bPdDsqfY9rcRLKaoDBIWXWKb610eqkxYYlxlYVxE3w9EFBlgQ+B2HPfdNTHBeLZ+buAKHCgZv0kmUdjuPvbDkz/QVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750538130; c=relaxed/simple;
	bh=5b38RPJ//eThz4XG3UGkeE0z0kHG07y+zKvKopTT4YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c8GqmBmLw6Kj4m2kFgV4rUHjunx6aoo1mC0E0jOiNhGhjXQnne/TlicvVsSiS27ETNjNStT17nRagffdFa6uY9dJamKAEMIfODyFlqyGsKDNGbA/e10jhlLbbxChOFN/s9n9n1TdqV4w2m9pYth9GC3SJ2Wfoae5aHvpEONXmIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IxlMR5dd; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IxlMR5dd"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5157441F2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750538128; bh=ySfGZziezFZvQWxqd0tnXEAmNLxr6M/Rt7g7yarGNiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IxlMR5dd6FlQZno6reMhNvPm0ABAmn6ZwrhrmMe6wYi3ge4VEgLPQq7XBB9YRYzO8
	 AUfzTzrQb8ZKwnrJEABzy8LfNQy/wXeNirKrbbxohpG4+Vzixeu818Iy+iixCWB8yU
	 PFxugBmCKpcp1FTu8csNl5vGIg0+VEmwsU7CQOLJffC+0gz/OuIFl544ccsrAtd9Lr
	 HW5GcE1aoYeROcOhXGkPFaVsp6ixnrGFtLJRTR3F090ZeSMYDBTMghu6v1oTjvTnbi
	 HeUqznvX44/9y4tEAvHHQ1ZqimdetfG9adphMMh6oRItVlEte2XmbgUGQGSH2I8MFp
	 IYNiD+Vl1NOQA==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	by ms.lwn.net (Postfix) with ESMTPA id 5157441F2F;
	Sat, 21 Jun 2025 20:35:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/9] docs: kdoc: consolidate the "begin section" logic
Date: Sat, 21 Jun 2025 14:35:05 -0600
Message-ID: <20250621203512.223189-3-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250621203512.223189-1-corbet@lwn.net>
References: <20250621203512.223189-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pull the repeated "begin a section" logic into a single place and hide it
within the KernelEntry class.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index c46e1b6a7d4b..d29a61a06f6d 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -169,6 +169,15 @@ class KernelEntry:
         self.warnings.append(log_msg)
         return
 
+    #
+    # Begin a new section.
+    #
+    def begin_section(self, line_no, title = SECTION_DEFAULT, dump = False):
+        if dump:
+            self.dump_section(start_new = True)
+        self.section = title
+        self.new_start_line = line_no
+
     def dump_section(self, start_new=True):
         """
         Dumps section contents to arrays/hashes intended for that purpose.
@@ -1231,12 +1240,11 @@ class KernelDoc:
         # Check for a DOC: block and handle them specially.
         #
         if doc_block.search(line):
-            self.entry.new_start_line = ln
 
             if not doc_block.group(1):
-                self.entry.section = "Introduction"
+                self.entry.begin_section(ln, "Introduction")
             else:
-                self.entry.section = doc_block.group(1)
+                self.entry.begin_section(ln, doc_block.group(1))
 
             self.entry.identifier = self.entry.section
             self.state = state.DOCBLOCK
@@ -1270,8 +1278,7 @@ class KernelDoc:
             self.state = state.BODY
             self.entry.identifier = self.entry.identifier.strip(" ")
             # if there's no @param blocks need to set up default section here
-            self.entry.section = SECTION_DEFAULT
-            self.entry.new_start_line = ln + 1
+            self.entry.begin_section(ln + 1)
             #
             # Find the description portion, which *should* be there but
             # isn't always.
@@ -1312,8 +1319,7 @@ class KernelDoc:
             r = KernRe(r"\s*\*\s*\S")
             if r.match(line):
                 self.dump_section()
-                self.entry.section = SECTION_DEFAULT
-                self.entry.new_start_line = ln
+                self.entry.begin_section(ln)
                 self.entry.contents = ""
 
         if doc_sect.search(line):
@@ -1340,8 +1346,7 @@ class KernelDoc:
             if self.entry.contents.strip("\n"):
                 self.dump_section()
 
-            self.entry.new_start_line = ln
-            self.entry.section = newsection
+            self.entry.begin_section(ln, newsection)
             self.entry.leading_space = None
 
             self.entry.contents = newcontents.lstrip()
@@ -1370,9 +1375,7 @@ class KernelDoc:
 
             if cont == "":
                 if self.entry.section == self.section_context:
-                    self.dump_section()
-
-                    self.entry.new_start_line = ln
+                    self.entry.begin_section(ln, dump = True)
                     self.state = state.BODY
                 else:
                     if self.entry.section != SECTION_DEFAULT:
@@ -1427,8 +1430,7 @@ class KernelDoc:
 
         if self.inline_doc_state == state.INLINE_NAME and \
            doc_inline_sect.search(line):
-            self.entry.section = doc_inline_sect.group(1)
-            self.entry.new_start_line = ln
+            self.entry.begin_section(ln, doc_inline_sect.group(1))
 
             self.entry.contents = doc_inline_sect.group(2).lstrip()
             if self.entry.contents != "":
@@ -1627,7 +1629,7 @@ class KernelDoc:
         """STATE_PROTO: reading a function/whatever prototype."""
 
         if doc_inline_oneline.search(line):
-            self.entry.section = doc_inline_oneline.group(1)
+            self.entry.begin_section(ln, doc_inline_oneline.group(1))
             self.entry.contents = doc_inline_oneline.group(2)
 
             if self.entry.contents != "":
-- 
2.49.0

