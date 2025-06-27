Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE622EE269;
	Fri, 27 Jun 2025 18:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049620; cv=none; b=LKgBIr49Gv9fUPaJ8HaJziJwpq6uVs20gA191jHI35Me7GZCsCcZi5dbB8nWn7uuEz/lmRqJdREDOWi4zt2ACIwFEFuPJH/f3Myk87ekarjclz1v4YJeY0ffZZxTIGPneNeyfo/7hRcAZ8NQGKpgMnrRQKl8ic0od7ribSYzfbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049620; c=relaxed/simple;
	bh=gRvhyy7wVTzRIRa1gE90PymXg70C2aJ5PrOuzYoaVzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dNJ+WTHZE0yBpsd5A6EPsN7y8e+6R2ByBvio0qjXyi6Ip4ZvpOPnrR11RESZJWFMEZ6gTGtmBz3inPAMvQ51ByH9Q8aCoa384HhltTdO3/cdhL8/bJ7ZUKKsimYahoYq1fk2uuqDydRGSoitpiv1imUsc9U2vA7vUL5lttGD7Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sJBPPUrj; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sJBPPUrj"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7D30440AC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751049617; bh=J/FzKvzFoyxVTHx0W5BXoFXXd1bavPdlVAbQNxM84Po=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sJBPPUrjVQ+MCrSUI4+HWc0JxiVaGQ2wt6giy3Q/ZaLMwKXh8KOVAZ3Dr7E4Y3q/E
	 YwouZuQb7OwcrEXxoOJXwcc0fbKfRoXv7GMHWPjTxPcK3s7OPsNCgze45jRiGn7lMS
	 ttFO7nrT0/Mpq8kYAje/3U0eKkyZxTBukG4EArQeGj6VbOXUTDxJ+pjlPOSVnSUhfi
	 hBwQC8oiKsNAl7DQXKfZQ3mSReeQG1eSUfUWueNV6uBDGw+88LM//XVzf6aIdtz299
	 0HymE6JJIHnj6i6G0uTr/7QquQ5+mGUfKOTj1EyAQOkVNgS7h3U/9aPdJo4iYyncWd
	 fmwsqdq2sK3xw==
Received: from trenco.lwn.net (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	by ms.lwn.net (Postfix) with ESMTPA id 7D30440AC7;
	Fri, 27 Jun 2025 18:40:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 7/8] docs: kdoc: remove the inline states-within-a-state
Date: Fri, 27 Jun 2025 12:39:59 -0600
Message-ID: <20250627184000.132291-8-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627184000.132291-1-corbet@lwn.net>
References: <20250627184000.132291-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The processing of inline kerneldoc comments is a state like the rest, but
it was implemented as a set of separate substates.  Just remove the
substate logic and make the inline states normal ones like the rest.

INLINE_ERROR was never actually used for anything, so just take it out.

No changes to the generated output.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 43 ++++++++++-----------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 03a0e44707a7..a931c1471fa8 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -91,7 +91,8 @@ class state:
     SPECIAL_SECTION = 4      # doc section ending with a blank line
     PROTO         = 5        # scanning prototype
     DOCBLOCK      = 6        # documentation block
-    INLINE        = 7        # gathering doc outside main block
+    INLINE_NAME   = 7        # gathering doc outside main block
+    INLINE_TEXT   = 8	     # reading the body of inline docs
 
     name = [
         "NORMAL",
@@ -101,23 +102,10 @@ class state:
         "SPECIAL_SECTION",
         "PROTO",
         "DOCBLOCK",
-        "INLINE",
+        "INLINE_NAME",
+        "INLINE_TEXT",
     ]
 
-    # Inline documentation state
-    INLINE_NA     = 0 # not applicable ($state != INLINE)
-    INLINE_NAME   = 1 # looking for member name (@foo:)
-    INLINE_TEXT   = 2 # looking for member documentation
-    INLINE_ERROR  = 3 # error - Comment without header was found.
-                      # Spit a warning as it's not
-                      # proper kernel-doc and ignore the rest.
-
-    inline_name = [
-        "",
-        "_NAME",
-        "_TEXT",
-        "_ERROR",
-    ]
 
 SECTION_DEFAULT = "Description"  # default section
 
@@ -246,7 +234,6 @@ class KernelDoc:
 
         # Initial state for the state machines
         self.state = state.NORMAL
-        self.inline_doc_state = state.INLINE_NA
 
         # Store entry currently being processed
         self.entry = None
@@ -323,7 +310,6 @@ class KernelDoc:
 
         # State flags
         self.state = state.NORMAL
-        self.inline_doc_state = state.INLINE_NA
 
     def push_parameter(self, ln, decl_type, param, dtype,
                        org_arg, declaration_name):
@@ -1465,30 +1451,28 @@ class KernelDoc:
     def process_inline(self, ln, line):
         """STATE_INLINE: docbook comments within a prototype."""
 
-        if self.inline_doc_state == state.INLINE_NAME and \
+        if self.state == state.INLINE_NAME and \
            doc_inline_sect.search(line):
             self.entry.begin_section(ln, doc_inline_sect.group(1))
 
             self.entry.add_text(doc_inline_sect.group(2).lstrip())
-            self.inline_doc_state = state.INLINE_TEXT
+            self.state = state.INLINE_TEXT
             # Documentation block end */
             return
 
         if doc_inline_end.search(line):
             self.dump_section()
             self.state = state.PROTO
-            self.inline_doc_state = state.INLINE_NA
             return
 
         if doc_content.search(line):
-            if self.inline_doc_state == state.INLINE_TEXT:
+            if self.state == state.INLINE_TEXT:
                 self.entry.add_text(doc_content.group(1))
 
-            elif self.inline_doc_state == state.INLINE_NAME:
+            elif self.state == state.INLINE_NAME:
                 self.emit_msg(ln,
                               f"Incorrect use of kernel-doc format: {line}")
-
-                self.inline_doc_state = state.INLINE_ERROR
+                self.state = state.PROTO
 
     def syscall_munge(self, ln, proto):         # pylint: disable=W0613
         """
@@ -1664,8 +1648,7 @@ class KernelDoc:
             self.dump_section()
 
         elif doc_inline_start.search(line):
-            self.state = state.INLINE
-            self.inline_doc_state = state.INLINE_NAME
+            self.state = state.INLINE_NAME
 
         elif self.entry.decl_type == 'function':
             self.process_proto_function(ln, line)
@@ -1716,7 +1699,8 @@ class KernelDoc:
         state.BODY:			process_body,
         state.DECLARATION:		process_decl,
         state.SPECIAL_SECTION:		process_special,
-        state.INLINE:			process_inline,
+        state.INLINE_NAME:		process_inline,
+        state.INLINE_TEXT:		process_inline,
         state.PROTO:			process_proto,
         state.DOCBLOCK:			process_docblock,
         }
@@ -1756,9 +1740,8 @@ class KernelDoc:
                             prev = ""
                             prev_ln = None
 
-                    self.config.log.debug("%d %s%s: %s",
+                    self.config.log.debug("%d %s: %s",
                                           ln, state.name[self.state],
-                                          state.inline_name[self.inline_doc_state],
                                           line)
 
                     # This is an optimization over the original script.
-- 
2.49.0

