Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4AA27054B;
	Sat, 21 Jun 2025 20:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750538131; cv=none; b=a4zZZBEK9DpUOypBGRkIywfYBJR20VNS9qNF1Nck5Vv6GD4E6CdoHCTtE77n0Au30p8RpXxnEw1L9XVLrppxPJaUQbRQ/nRTmVEc0h5ze7JQ/KZTCPvI/zm6Ur14RiTtuZwmsCxfoo5flDlCe6TLWiwNxGwhy8ZnWDcqPLCj1uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750538131; c=relaxed/simple;
	bh=O0CUyK50FgOTsjRuQq2n40FMPsir8dSq5R3XD3XXlXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TiWxuqOaQ8gYkPfP53P6Hn/Ss5TAa+KrGTseETppa+Hxjvq2ZutLq+nCzJqzHmTT+XL1T0jyuNRrTM3R+x5bVsFOazXfRHXMC5jV9+gNc1aV7VoTvPF8yKoHd+6R7MjCnrcP3+4f3JqPCq35XEI3uUA1DGIz4BFaW9zFwAEi+mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=G21Hr1gx; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="G21Hr1gx"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 63F2B41F33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750538129; bh=oEr6nuzMBz/c+VtKctlDDd8uhHmdT8aD/TJ5fWa+6dY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G21Hr1gxsX1ou4Y3AUcWf1kAdoTzeKMdGp+8y2v9qg/ElcUgPIaGzPRQ4g4DCqZAM
	 JM6xCB6j9dCozlh0KjOKg5NflfhoLVdi6KtRzsFo9tOgAq708SEYZ73T2Fb0Bx9mQg
	 3xrgWsLv6CRmPUO19/3zEl/mAmwBGcRfM8Amo4QYLSl8nZnKnJtU8jCidTWjXfGyta
	 OR0urqcq8mSZ52XndkxNs3cgO1VWT7vTT6WXUXLvqJAJ3jv9KG6dAajGFhYWEou9lJ
	 WC7LN/e9+gztc3W46e/fFfu7tbfF/Vrkx8bkSc1uWoMKDVr+hnMsKLrHKt012cqvnH
	 QCXQeIetz8Trg==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	by ms.lwn.net (Postfix) with ESMTPA id 63F2B41F33;
	Sat, 21 Jun 2025 20:35:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 4/9] docs: kdoc: split out the special-section state
Date: Sat, 21 Jun 2025 14:35:07 -0600
Message-ID: <20250621203512.223189-5-corbet@lwn.net>
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

The state known as BODY_WITH_BLANK_LINE really, in a convoluted way,
indicates a "special section" that is terminated by a blank line or the
beginning of a new section.  That is either "@param: desc" sections, or the
weird "context" section that plays by the same rules.

Rename the state to SPECIAL_SECTION and split its processing into a
separate function; no real changes to the logic yet.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index f1491f8c88e7..185ffe4e1469 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -88,7 +88,7 @@ class state:
     NAME          = 1        # looking for function name
     DECLARATION   = 2        # We have seen a declaration which might not be done
     BODY          = 3        # the body of the comment
-    BODY_WITH_BLANK_LINE = 4 # the body which has a blank line
+    SPECIAL_SECTION = 4      # doc section ending with a blank line
     PROTO         = 5        # scanning prototype
     DOCBLOCK      = 6        # documentation block
     INLINE        = 7        # gathering doc outside main block
@@ -98,7 +98,7 @@ class state:
         "NAME",
         "DECLARATION",
         "BODY",
-        "BODY_WITH_BLANK_LINE",
+        "SPECIAL_SECTION",
         "PROTO",
         "DOCBLOCK",
         "INLINE",
@@ -1383,18 +1383,18 @@ class KernelDoc:
         self.emit_msg(ln, f"bad line: {line}")
 
 
+    def process_special(self, ln, line):
+        """
+        STATE_SPECIAL_SECTION: a section ending with a blank line
+        """
+        if KernRe(r"\s*\*\s*\S").match(line):
+            self.entry.begin_section(ln, dump = True)
+        self.process_body(ln, line)
+
     def process_body(self, ln, line):
         """
         STATE_BODY: the bulk of a kerneldoc comment.
         """
-
-        if self.state == state.BODY_WITH_BLANK_LINE:
-            r = KernRe(r"\s*\*\s*\S")
-            if r.match(line):
-                self.dump_section()
-                self.entry.begin_section(ln)
-                self.entry.contents = ""
-
         if doc_sect.search(line):
             self.entry.in_doc_sect = True
             newsection = doc_sect.group(1)
@@ -1452,7 +1452,7 @@ class KernelDoc:
                     self.state = state.BODY
                 else:
                     if self.entry.section != SECTION_DEFAULT:
-                        self.state = state.BODY_WITH_BLANK_LINE
+                        self.state = state.SPECIAL_SECTION
                     else:
                         self.state = state.BODY
 
@@ -1751,7 +1751,7 @@ class KernelDoc:
         state.NAME:			process_name,
         state.BODY:			process_body,
         state.DECLARATION:		process_decl,
-        state.BODY_WITH_BLANK_LINE:	process_body,
+        state.SPECIAL_SECTION:		process_special,
         state.INLINE:			process_inline,
         state.PROTO:			process_proto,
         state.DOCBLOCK:			process_docblock,
-- 
2.49.0

