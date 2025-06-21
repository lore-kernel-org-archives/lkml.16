Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC25926FD8E;
	Sat, 21 Jun 2025 20:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750538131; cv=none; b=jLc8mXA9lO+Ab9C9RGdUSgrgAGceJpdptTjVZxzR0xhHzOrlsifKS8EVs5xzhf9OTLm+2+A2Lp3Xzg3HAwv7LtjeoNCS369lMnIazsBwU8P83FmDpoa+6jF3CQvpANeiafl0IbmXczk1jsdvZXGXRYgiJ4hBAfF8IBHLLWG2p3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750538131; c=relaxed/simple;
	bh=9IHMMT5ypODexH2PM/uQIE+G0IbtBkxfFwsgKLeyQww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqMLn6dfOPbgeBbxxdLq7vBAMFbsvHhgX6NxbOcpAvpFqHWwtNhGcK8rt/fJo7+hFkAIFIJpABO+clFqN6l8CRUcg3n85v0sTLrLCnFfQkF5Vo7vRV/e/c8W5L9qYdAfTOX5VY9wUw+B+kjSnJ43TQmnrnXkzTfL1/Or1gsVJYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ODw9ppL3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ODw9ppL3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D538441F30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750538129; bh=mlDZRfSBfR9P22HI7T1naTG3fh1siu5biEocXS2vcq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ODw9ppL3B1FBkqBE8eWKNBdoJ9ZuvuWm0QAbqCmBBxABfPq7DvpKg6sYtL7sTT/i4
	 6+zfSuXXFPA6+dxUsYRGE8gJFuLyNNOxZ+JL5NuLVUJxCyD8Dt1/fMLhzQ5vrwI7+h
	 NqheAWrsDA5vocf8S5t5md4i9sqVnL4QlJY4p5MKES86sebV/Ewg8UVen9kuloA5mm
	 EA/O64H6ovPwx460vPmbo98QNVgWcLijZSU4VL8XEZj9PnAe5fwpL6VF6rV1QwmAAW
	 KlDsVxOADC7H8b2R+BsaodpfuIXo0KdhF+RFTT4zaChio9MOS6O3DPycg+pf8H2t4j
	 H6eX6fttuLvyg==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	by ms.lwn.net (Postfix) with ESMTPA id D538441F30;
	Sat, 21 Jun 2025 20:35:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 3/9] docs: kdoc: separate out the handling of the declaration phase
Date: Sat, 21 Jun 2025 14:35:06 -0600
Message-ID: <20250621203512.223189-4-corbet@lwn.net>
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

The BODY_MAYBE state really describes the "we are in a declaration" state.
Rename it accordingly, and split the handling of this state out from that
of the other BODY* states.  This change introduces a fair amount of
duplicated code that will be coalesced in a later patch.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 93 +++++++++++++++++++++++++++------
 1 file changed, 78 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index d29a61a06f6d..f1491f8c88e7 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -86,7 +86,7 @@ class state:
     # Parser states
     NORMAL        = 0        # normal code
     NAME          = 1        # looking for function name
-    BODY_MAYBE    = 2        # body - or maybe more description
+    DECLARATION   = 2        # We have seen a declaration which might not be done
     BODY          = 3        # the body of the comment
     BODY_WITH_BLANK_LINE = 4 # the body which has a blank line
     PROTO         = 5        # scanning prototype
@@ -96,7 +96,7 @@ class state:
     name = [
         "NORMAL",
         "NAME",
-        "BODY_MAYBE",
+        "DECLARATION",
         "BODY",
         "BODY_WITH_BLANK_LINE",
         "PROTO",
@@ -1287,7 +1287,7 @@ class KernelDoc:
             r = KernRe("[-:](.*)")
             if r.search(line):
                 self.entry.declaration_purpose = trim_whitespace(r.group(1))
-                self.state = state.BODY_MAYBE
+                self.state = state.DECLARATION
             else:
                 self.entry.declaration_purpose = ""
 
@@ -1310,9 +1310,82 @@ class KernelDoc:
         else:
             self.emit_msg(ln, f"Cannot find identifier on line:\n{line}")
 
+    def process_decl(self, ln, line):
+        """
+        STATE_DECLARATION: We've seen the beginning of a declaration
+        """
+        if doc_sect.search(line):
+            self.entry.in_doc_sect = True
+            newsection = doc_sect.group(1)
+
+            if newsection.lower() in ["description", "context"]:
+                newsection = newsection.title()
+
+            # Special case: @return is a section, not a param description
+            if newsection.lower() in ["@return", "@returns",
+                                      "return", "returns"]:
+                newsection = "Return"
+
+            # Perl kernel-doc has a check here for contents before sections.
+            # the logic there is always false, as in_doc_sect variable is
+            # always true. So, just don't implement Wcontents_before_sections
+
+            # .title()
+            newcontents = doc_sect.group(2)
+            if not newcontents:
+                newcontents = ""
+
+            if self.entry.contents.strip("\n"):
+                self.dump_section()
+
+            self.entry.begin_section(ln, newsection)
+            self.entry.leading_space = None
+
+            self.entry.contents = newcontents.lstrip()
+            if self.entry.contents:
+                self.entry.contents += "\n"
+
+            self.state = state.BODY
+            return
+
+        if doc_end.search(line):
+            self.dump_section()
+
+            # Look for doc_com + <text> + doc_end:
+            r = KernRe(r'\s*\*\s*[a-zA-Z_0-9:\.]+\*/')
+            if r.match(line):
+                self.emit_msg(ln, f"suspicious ending line: {line}")
+
+            self.entry.prototype = ""
+            self.entry.new_start_line = ln + 1
+
+            self.state = state.PROTO
+            return
+
+        if doc_content.search(line):
+            cont = doc_content.group(1)
+
+            if cont == "":
+                self.state = state.BODY
+                self.entry.contents += "\n"  # needed?
+
+            else:
+                # Continued declaration purpose
+                self.entry.declaration_purpose = self.entry.declaration_purpose.rstrip()
+                self.entry.declaration_purpose += " " + cont
+
+                r = KernRe(r"\s+")
+                self.entry.declaration_purpose = r.sub(' ',
+                                                       self.entry.declaration_purpose)
+            return
+
+        # Unknown line, ignore
+        self.emit_msg(ln, f"bad line: {line}")
+
+
     def process_body(self, ln, line):
         """
-        STATE_BODY and STATE_BODY_MAYBE: the bulk of a kerneldoc comment.
+        STATE_BODY: the bulk of a kerneldoc comment.
         """
 
         if self.state == state.BODY_WITH_BLANK_LINE:
@@ -1385,16 +1458,6 @@ class KernelDoc:
 
                     self.entry.contents += "\n"
 
-            elif self.state == state.BODY_MAYBE:
-
-                # Continued declaration purpose
-                self.entry.declaration_purpose = self.entry.declaration_purpose.rstrip()
-                self.entry.declaration_purpose += " " + cont
-
-                r = KernRe(r"\s+")
-                self.entry.declaration_purpose = r.sub(' ',
-                                                       self.entry.declaration_purpose)
-
             else:
                 if self.entry.section.startswith('@') or        \
                    self.entry.section == self.section_context:
@@ -1687,7 +1750,7 @@ class KernelDoc:
         state.NORMAL:			process_normal,
         state.NAME:			process_name,
         state.BODY:			process_body,
-        state.BODY_MAYBE:		process_body,
+        state.DECLARATION:		process_decl,
         state.BODY_WITH_BLANK_LINE:	process_body,
         state.INLINE:			process_inline,
         state.PROTO:			process_proto,
-- 
2.49.0

