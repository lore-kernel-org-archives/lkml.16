Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059EE2EE5E6;
	Fri, 27 Jun 2025 18:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049620; cv=none; b=d4MNXmSeKBMXBBq0oot9aBFmOutRuD11aaCv2Box4h+klsJsoXgTiIXV9QSNsr+hyBamzvvjZVhLczFHB4KOz4BRE3hDO1LEDny1a3A4t6WQn09pMRKlLGmW6T50kZkL3EXTyarcI0ApVjmWL99KOkh7xKxa5MKCsB9CDWme6pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049620; c=relaxed/simple;
	bh=OG3Vi3/fNl/c04UvhGfqGhF0Tv6V5jD1gvt/Ro3R3vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XToX0qZSC9mfzgP94fGFMcpwoInjvEfvEUEn+k8U0DKdS7F4/8/PJwzibiB8w+16/VZMm2bFDXl+pfB4UyxME5UUcSbpxfFj/KzNTKwrascVUPmG4EFRcAMH24cpfOyu2FGH6gc5MkiboTliyAJEKGlibBbx0MI85Z85fMKx5/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=epbttpUh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="epbttpUh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0ED7E40AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751049618; bh=+iEYvlkxgBTH8QTIpp2nezk4u73s3MZGF2/w6ybXQoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=epbttpUhMhLNmuPyKN6n7RmlJhrpM8hw/XXdJ1NFCj6s1S0zOxPEVxi/m80+ErKpf
	 jjeD1Hx4TmacvVb4jSy86nFKe/SAgfemjPVwRKRpM8Z97fLQEsxQu4h5a/NBNQUvei
	 pW2MidsrTMiu+f1Tke0tTdVTWTtw71BQb7Edlk06ov99GEbokEJZunDyPJ+N2rg8ZA
	 avFgyIEqzDAqFwSCK9T2NzRCSEJLO0fw7Vy4+CSjaGkp8TGH0jkz9eg1BJcu2aX+Eg
	 0+1vsBHqXSOnZBs52U+ZnZISL8t6KN/h4aIQeB4MUyy/GJdwR/HzxfJ1UmsZOzYumz
	 jq7139oGWxdzQ==
Received: from trenco.lwn.net (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	by ms.lwn.net (Postfix) with ESMTPA id 0ED7E40AD2;
	Fri, 27 Jun 2025 18:40:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 8/8] docs: kdoc: split the processing of the two remaining inline states
Date: Fri, 27 Jun 2025 12:40:00 -0600
Message-ID: <20250627184000.132291-9-corbet@lwn.net>
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

Now that "inline_*" are just ordinary parser states, split them into two
separate functions, getting rid of some nested conditional logic.

The original process_inline() would simply ignore lines that didn't match
any of the regexes (those lacking the initial " * " marker).  I have
preserved that behavior, but we should perhaps emit a warning instead.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 37 ++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index a931c1471fa8..93938155fce2 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1448,31 +1448,30 @@ class KernelDoc:
             # Unknown line, ignore
             self.emit_msg(ln, f"bad line: {line}")
 
-    def process_inline(self, ln, line):
-        """STATE_INLINE: docbook comments within a prototype."""
+    def process_inline_name(self, ln, line):
+        """STATE_INLINE_NAME: beginning of docbook comments within a prototype."""
 
-        if self.state == state.INLINE_NAME and \
-           doc_inline_sect.search(line):
+        if doc_inline_sect.search(line):
             self.entry.begin_section(ln, doc_inline_sect.group(1))
-
             self.entry.add_text(doc_inline_sect.group(2).lstrip())
             self.state = state.INLINE_TEXT
-            # Documentation block end */
-            return
-
-        if doc_inline_end.search(line):
+        elif doc_inline_end.search(line):
             self.dump_section()
             self.state = state.PROTO
-            return
+        elif doc_content.search(line):
+            self.emit_msg(ln, f"Incorrect use of kernel-doc format: {line}")
+            self.state = state.PROTO
+        # else ... ??
 
-        if doc_content.search(line):
-            if self.state == state.INLINE_TEXT:
-                self.entry.add_text(doc_content.group(1))
+    def process_inline_text(self, ln, line):
+        """STATE_INLINE_TEXT: docbook comments within a prototype."""
 
-            elif self.state == state.INLINE_NAME:
-                self.emit_msg(ln,
-                              f"Incorrect use of kernel-doc format: {line}")
-                self.state = state.PROTO
+        if doc_inline_end.search(line):
+            self.dump_section()
+            self.state = state.PROTO
+        elif doc_content.search(line):
+            self.entry.add_text(doc_content.group(1))
+        # else ... ??
 
     def syscall_munge(self, ln, proto):         # pylint: disable=W0613
         """
@@ -1699,8 +1698,8 @@ class KernelDoc:
         state.BODY:			process_body,
         state.DECLARATION:		process_decl,
         state.SPECIAL_SECTION:		process_special,
-        state.INLINE_NAME:		process_inline,
-        state.INLINE_TEXT:		process_inline,
+        state.INLINE_NAME:		process_inline_name,
+        state.INLINE_TEXT:		process_inline_text,
         state.PROTO:			process_proto,
         state.DOCBLOCK:			process_docblock,
         }
-- 
2.49.0

