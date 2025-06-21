Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB5827146D;
	Sat, 21 Jun 2025 20:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750538133; cv=none; b=JaV1p1HbZNoXGS68Im07tIqhkOW1/fD0fYIKg0S2LjBnm9TVU5PMyQVG1T9GqWQU+BfjM8D/JC+Ktjx1B7qTB9ChOu+NIwhLB7XF9oskDt7Hrbo23cGKgT8fzp/cgfXbJhIDF+DUuF6Ij4gQUcsBBW0oAHAl34EM9aAKhIRBid4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750538133; c=relaxed/simple;
	bh=DIzPZ/e60/l8noMEDLFx3LiQtyQoc1JBMRgfRJt8SzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FE7oYA5y/SxQ47dXsDkkYSFbGL1J7QxoZg6y64J41fzRfpzTVQTG4WCE+SoeKuIhJ3UMIYvn760KJxRFo3j9NwuDGJ+fAj9DTznRZoOFSareviC84jLNmRCHod85MYYYvKK1foyhreAFeYa+G1yFmItOvXewwGaBi0YxfhPceFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Nj2BFMAj; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Nj2BFMAj"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 052DC41F2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750538131; bh=igzwgHfO6uct+1CCVP7j6YFnebjHFin2PWnOhANtugQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nj2BFMAj3DjijgU7IIaAPaQgNX4rJKImRCfWslRpYc+Cq8TfeOfTD51iGNLr/cYlB
	 Iu+5MtlH/F1od6OF7AQMasQTkValYA2XmVFtAjmJAqy7Yqf4cP6C0RzJyBPWwkrmG+
	 gdsfyLBEX7SuRMLrQ6Uhwoc3m7KtG/+M/+8YHl9cbUtKPhGdIRrw5u+4ToAAaEm6UI
	 7jbabHg+9VFORNJURl7R1JBzBdnm9eWJrW7ZhV9Ne+4vW1EEX2gsdHqnj8TFsKj+wB
	 klxa3HLAv5SSy2WLDyhDlIBLqOSVr5n40Zx0XHZaG13nAu1gkovKGUsgzkpk6n5n1s
	 AkjZB6ah2WEOw==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	by ms.lwn.net (Postfix) with ESMTPA id 052DC41F2F;
	Sat, 21 Jun 2025 20:35:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 7/9] docs: kdoc: coalesce the end-of-comment processing
Date: Sat, 21 Jun 2025 14:35:10 -0600
Message-ID: <20250621203512.223189-8-corbet@lwn.net>
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

Separate out the end-of-comment logic into its own helper and remove the
duplicated code introduced earlier.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 36 +++++++++++++--------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 5998b02ca3a0..f7a5b85a8ed7 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1351,13 +1351,10 @@ class KernelDoc:
             return True
         return False
 
-    def process_decl(self, ln, line):
-        """
-        STATE_DECLARATION: We've seen the beginning of a declaration
-        """
-        if self.is_new_section(ln, line):
-            return
-
+    #
+    # Helper function to detect (and effect) the end of a kerneldoc comment.
+    #
+    def is_comment_end(self, ln, line):
         if doc_end.search(line):
             self.dump_section()
 
@@ -1370,6 +1367,15 @@ class KernelDoc:
             self.entry.new_start_line = ln + 1
 
             self.state = state.PROTO
+            return True
+        return False
+
+
+    def process_decl(self, ln, line):
+        """
+        STATE_DECLARATION: We've seen the beginning of a declaration
+        """
+        if self.is_new_section(ln, line) or self.is_comment_end(ln, line):
             return
 
         if doc_content.search(line):
@@ -1406,21 +1412,7 @@ class KernelDoc:
         """
         STATE_BODY: the bulk of a kerneldoc comment.
         """
-        if self.is_new_section(ln, line):
-            return
-
-        if doc_end.search(line):
-            self.dump_section()
-
-            # Look for doc_com + <text> + doc_end:
-            r = KernRe(r'\s*\*\s*[a-zA-Z_0-9:\.]+\*/')
-            if r.match(line):
-                self.emit_msg(ln, f"suspicious ending line: {line}")
-
-            self.entry.prototype = ""
-            self.entry.new_start_line = ln + 1
-
-            self.state = state.PROTO
+        if self.is_new_section(ln, line) or self.is_comment_end(ln, line):
             return
 
         if doc_content.search(line):
-- 
2.49.0

