Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7A0271454;
	Sat, 21 Jun 2025 20:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750538132; cv=none; b=HCJ4Q1pJxPBAdHsvGfJ/z872phBfty/ipKFnzgEsSshfjozzjKUZgk9AymuNovLozCTMRBLfzERXI2VIwYHf+9TTiNavVVaWjIzGhH2ZHZsF3neu8CYUe0eQkJfyD2Qwwo4vwSJ1vgfztgClrcILGeuOG4z1d54aLhldG0BViAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750538132; c=relaxed/simple;
	bh=hgyF5qXQdsldMVeKTROkq4cIqxZZPrXcb24sgEudAuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kZy6yJQxpMo9pvXOYvoEOEsbgrm47FH8ZPNq8GNeoepDLwIaHBKQtZ8PSxmnbzB2memWbZF9iNDGTE0VfbN9k0uEMH7kFKLa6cRNx041Paf7rbA+OyTmi9GMbO417BUJKBCepMwkQmYNQWFZYFgE61hBOsUqJYswri+x67Uvq4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=L8VdigIi; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="L8VdigIi"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 757B441F2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750538130; bh=t5O6xZ0asJB+PqlMyDbZnxO5S+2Br3NznwxuBU17ipc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L8VdigIi2YeigH9E6OnEpO551bOSOSz+jABgghdJX9mJGQWzmB0rxwrKeMjGk8Fd6
	 /CxU5z2SXq7tpYBxe2IQ5xmgj47UD/TimGVAGtD/bFwxkSBsp1dDGOw9rKXryNh4KH
	 q6yjBAWkHOYYOO/Q70hZ2Htw0G0Y07tuUIBOvpu4NGLCm61f7nzcd1x0b1y7X/YH8K
	 a2nTuEPBPQyt9yGUQwDCMQXeH3+8JIK/ptLyXD8i9k/f936JW84NxRYyffBauUUKHG
	 qIRyO7F9cCwtYmMoBjamqCHcYQMPuC21XAGtgAQyFkIb1I+kX4mQHi8RIsJgK6B4/r
	 jQISqHclwTTpQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	by ms.lwn.net (Postfix) with ESMTPA id 757B441F2B;
	Sat, 21 Jun 2025 20:35:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 6/9] docs: kdoc: rework the handling of SPECIAL_SECTION
Date: Sat, 21 Jun 2025 14:35:09 -0600
Message-ID: <20250621203512.223189-7-corbet@lwn.net>
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

Move the recognition of this state to when we enter it, rather than when we
exit, eliminating some twisty logic along the way.

Some changes in output do result from this shift, generally for kerneldoc
comments that do not quite fit the format.  See, for example,
struct irqdomain.  As far as I can tell, the new behavior is more correct
in each case.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 48 ++++++++++++++-------------------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index a336d543e72b..5998b02ca3a0 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1316,21 +1316,25 @@ class KernelDoc:
     def is_new_section(self, ln, line):
         if doc_sect.search(line):
             self.entry.in_doc_sect = True
+            self.state = state.BODY
+            #
+            # Pick out the name of our new section, tweaking it if need be.
+            #
             newsection = doc_sect.group(1)
-
-            if newsection.lower() in ["description", "context"]:
-                newsection = newsection.title()
-
-            # Special case: @return is a section, not a param description
-            if newsection.lower() in ["@return", "@returns",
-                                      "return", "returns"]:
+            if newsection.lower() == 'description':
+                newsection = 'Description'
+            elif newsection.lower() == 'context':
+                newsection = 'Context'
+                self.state = state.SPECIAL_SECTION
+            elif newsection.lower() in ["@return", "@returns",
+                                        "return", "returns"]:
                 newsection = "Return"
-
-            # Perl kernel-doc has a check here for contents before sections.
-            # the logic there is always false, as in_doc_sect variable is
-            # always true. So, just don't implement Wcontents_before_sections
-
-            # .title()
+                self.state = state.SPECIAL_SECTION
+            elif newsection[0] == '@':
+                self.state = state.SPECIAL_SECTION
+            #
+            # Initialize the contents, and get the new section going.
+            #
             newcontents = doc_sect.group(2)
             if not newcontents:
                 newcontents = ""
@@ -1344,8 +1348,6 @@ class KernelDoc:
             self.entry.contents = newcontents.lstrip()
             if self.entry.contents:
                 self.entry.contents += "\n"
-
-            self.state = state.BODY
             return True
         return False
 
@@ -1395,8 +1397,9 @@ class KernelDoc:
         """
         STATE_SPECIAL_SECTION: a section ending with a blank line
         """
-        if KernRe(r"\s*\*\s*\S").match(line):
+        if KernRe(r"\s*\*\s*$").match(line):
             self.entry.begin_section(ln, dump = True)
+            self.state = state.BODY
         self.process_body(ln, line)
 
     def process_body(self, ln, line):
@@ -1424,20 +1427,9 @@ class KernelDoc:
             cont = doc_content.group(1)
 
             if cont == "":
-                if self.entry.section == self.section_context:
-                    self.entry.begin_section(ln, dump = True)
-                    self.state = state.BODY
-                else:
-                    if self.entry.section != SECTION_DEFAULT:
-                        self.state = state.SPECIAL_SECTION
-                    else:
-                        self.state = state.BODY
-
                     self.entry.contents += "\n"
-
             else:
-                if self.entry.section.startswith('@') or        \
-                   self.entry.section == self.section_context:
+                if self.state == state.SPECIAL_SECTION:
                     if self.entry.leading_space is None:
                         r = KernRe(r'^(\s+)')
                         if r.match(cont):
-- 
2.49.0

