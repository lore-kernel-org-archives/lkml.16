Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD7428A1EB;
	Fri,  6 Jun 2025 16:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227706; cv=none; b=Nh4nr6kg/W+rLEQPNuV9i63+27LNPMMYq+pO/fgaPZEQ7PLQg0VD3Sa7eeyiaPl0pAjkynY+Kqv4R+7IWmqfBNfHQ39fgMOrsUIridlohnwIDbZX8RpAPzPIRrLLT69i9jeoiyV1QEXwgX/owuKlEQQGZTmzLjIu5bBDjfFINEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227706; c=relaxed/simple;
	bh=zOhYkWW2eaw6pPewowsMdFpcFDDAsaLaiKr3I8KJXf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hR4sNumsu3oyWwNjaraXKIrQaEYiwrYPxB7/HCXtoQaQdNGJuuRkUzG2kgpEmBUjAB4jvpBPPmsQuGHNy/LExC+E3nB+EzifFTnk6Cy0MlVoeRlSgsThfogcPVwE0PUBGg9E4K0xRACDMn+yBhlrs4i6xbsGLiXhKbCH+JhyJTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jQfyjNlP; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jQfyjNlP"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B20FE41F33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749227700; bh=1nWakzCsXOuV29AJeEwLZvEN/YW1RQPl/UjXg6BHgNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jQfyjNlPvmy3+mdTO6xjWp6XkQR85BzjMkYIzsqx0EbFjzfId7deepSF0Ruo7qQTV
	 PZp9CVnWDpTsGOSkANgrdsAfJZW+5Nv2ryeIiINwh0Bz3xK7iYucK4TlS1z07S2j3p
	 bLhqHkv+llN74oKzLAmivC18SiYmjVY5dV2/+4lk/zq8Ggn4oajp/sEm6xTFS67vTG
	 zz897Jlg7LDzXns1KEZTD7COKU3syQkmWpZs+GUh9ADCAMAo5JsLCT4VRwyCOEJlYb
	 cN2A7HH3UJhiXEBvy68dbD7J+84rGYjm3ypAKCBk3ocs2G9kz49CRxqwyvZEp/ANI3
	 28weenwRXg0qQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id B20FE41F33;
	Fri,  6 Jun 2025 16:34:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 9/9] docs: kdoc: some final touches for process_name()
Date: Fri,  6 Jun 2025 10:34:38 -0600
Message-ID: <20250606163438.229916-10-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606163438.229916-1-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some comments to process_name() to cover its broad phases of operation,
and slightly restructure the if/then/else structure to remove some early
returns.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 55f38240d4e5..9a1ce6ed8605 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1219,7 +1219,9 @@ class KernelDoc:
         """
         STATE_NAME: Looking for the "name - description" line
         """
-
+        #
+        # Check for a DOC: block and handle them specially.
+        #
         if doc_block.search(line):
             self.entry.new_start_line = ln
 
@@ -1230,9 +1232,10 @@ class KernelDoc:
 
             self.entry.identifier = self.entry.section
             self.state = state.DOCBLOCK
-            return
-
-        if doc_decl.search(line):
+        #
+        # Otherwise we're looking for a normal kerneldoc declaration line.
+        #
+        elif doc_decl.search(line):
             self.entry.identifier = doc_decl.group(1)
 
             # Test for data declaration
@@ -1253,15 +1256,19 @@ class KernelDoc:
                               f"This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n{line}")
                 self.state = state.NORMAL
                 return
-
-            self.entry.identifier = self.entry.identifier.strip(" ")
-
+            #
+            # OK, set up for a new kerneldoc entry.
+            #
             self.state = state.BODY
-
+            self.entry.identifier = self.entry.identifier.strip(" ")
             # if there's no @param blocks need to set up default section here
             self.entry.section = SECTION_DEFAULT
             self.entry.new_start_line = ln + 1
-
+            #
+            # Find the description portion, which *should* be there but
+            # isn't always.
+            # (We should be able to capture this from the previous parsing - someday)
+            #
             r = KernRe("[-:](.*)")
             if r.search(line):
                 self.entry.declaration_purpose = trim_whitespace(r.group(1))
@@ -1282,11 +1289,11 @@ class KernelDoc:
                 self.emit_msg(ln,
                               f"Scanning doc for {self.entry.decl_type} {self.entry.identifier}",
                                   warning=False)
-
-            return
-
+        #
         # Failed to find an identifier. Emit a warning
-        self.emit_msg(ln, f"Cannot find identifier on line:\n{line}")
+        #
+        else:
+            self.emit_msg(ln, f"Cannot find identifier on line:\n{line}")
 
     def process_body(self, ln, line):
         """
-- 
2.49.0

