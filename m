Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC9F272E42;
	Sat, 21 Jun 2025 20:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750538134; cv=none; b=T6f4mDgv/shnNjmdPQe9WKh/kl6m7pgUwse3vjzGV/oNC7x8hieYKPwJgtcix8DR7hahga4m40wbyqwXoxBAM3YZyhNYiuspF8LiNCW+e0KhXngG5YdhskmL8XXDU4LYAfyGK3SZ4gbld0I0qDu7A2xpODXCDCgaSGL9XBCejk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750538134; c=relaxed/simple;
	bh=ozdZY6KDzV6ie0g+Vi70jxsyCl/MWPzeGOSBtx/vfqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dd0rM5XjSCiMdaChBWJrZSACB0choOriEBX+HBLD12fQBMeD+W1lVp1AVIzKn4Wcu8KT8mocDhfQv8fzXcrdAafCybJRi4nfeQXn6dnH4ZKXwXHUPqd6Fg76SM47mb9akEaWsIo5N0w4YCVlB4FWRA879wKICw7nqWKllCNVhss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bVRh2zv5; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bVRh2zv5"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 18C8F41F33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750538132; bh=lxJdgmDPCnFc/wdxyRX/baI+nLdfvPrKONhfAX9HTxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bVRh2zv50ruq9t+3JB7R/Txc4s7Aapvz2onZp3z8EmhIg2LRdBpxAghjmwf2P6PNJ
	 PxWpM2lYfxSfcFG3l7/UW028EqzvbBw/6OUttnlRGQpJ/IXZ45JKYScBQPmok9uLTW
	 8SPv2tnWp7RYITqzYh0Y5OSkxoVgHu2XVDkW530xiL4SiMdSDY2MuEyBNFmBf8E8gM
	 goYbbhbvRFKRfldJLAX15mGMibMmZHS2ZkbMM7IfUODogMLTyr5bxwDG7MkfuMiNGz
	 /S839Dt2naqAQ+oAuXR5OSyPwwPnHenZT74W3sV2x5PeDoSb8MfrNo+0798rUOpM3Y
	 uNH4JlsmJfLgQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	by ms.lwn.net (Postfix) with ESMTPA id 18C8F41F33;
	Sat, 21 Jun 2025 20:35:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 9/9] docs: kdoc: finish disentangling the BODY and SPECIAL_SECTION states
Date: Sat, 21 Jun 2025 14:35:12 -0600
Message-ID: <20250621203512.223189-10-corbet@lwn.net>
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

Move the last SPECIAL_SECTION special case into the proper handler
function, getting rid of more if/then/else logic.  The leading-space
tracking was tightened up a bit in the move.  Add some comments describing
what is going on.

No changes to the generated output.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 80 ++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 32 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index a6ee8bac378d..3557c512c85a 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1405,10 +1405,53 @@ class KernelDoc:
         """
         STATE_SPECIAL_SECTION: a section ending with a blank line
         """
+        #
+        # If we have hit a blank line (only the " * " marker), then this
+        # section is done.
+        #
         if KernRe(r"\s*\*\s*$").match(line):
             self.entry.begin_section(ln, dump = True)
+            self.entry.contents += '\n'
             self.state = state.BODY
-        self.process_body(ln, line)
+            return
+        #
+        # Not a blank line, look for the other ways to end the section.
+        #
+        if self.is_new_section(ln, line) or self.is_comment_end(ln, line):
+            return
+        #
+        # OK, we should have a continuation of the text for this section.
+        #
+        if doc_content.search(line):
+            cont = doc_content.group(1)
+            #
+            # If the lines of text after the first in a special section have
+            # leading white space, we need to trim it out or Sphinx will get
+            # confused.  For the second line (the None case), see what we
+            # find there and remember it.
+            #
+            if self.entry.leading_space is None:
+                r = KernRe(r'^(\s+)')
+                if r.match(cont):
+                    self.entry.leading_space = len(r.group(1))
+                else:
+                    self.entry.leading_space = 0
+            #
+            # Otherwise, before trimming any leading chars, be *sure*
+            # that they are white space.  We should maybe warn if this
+            # isn't the case.
+            #
+            for i in range(0, self.entry.leading_space):
+                if cont[i] != " ":
+                    self.entry.leading_space = i
+                    break
+            #
+            # Add the trimmed result to the section and we're done.
+            #
+            self.entry.contents += cont[self.entry.leading_space:] + '\n'
+        else:
+            # Unknown line, ignore
+            self.emit_msg(ln, f"bad line: {line}")
 
     def process_body(self, ln, line):
         """
@@ -1419,37 +1462,10 @@ class KernelDoc:
 
         if doc_content.search(line):
             cont = doc_content.group(1)
-
-            if cont == "":
-                    self.entry.contents += "\n"
-            else:
-                if self.state == state.SPECIAL_SECTION:
-                    if self.entry.leading_space is None:
-                        r = KernRe(r'^(\s+)')
-                        if r.match(cont):
-                            self.entry.leading_space = len(r.group(1))
-                        else:
-                            self.entry.leading_space = 0
-
-                    # Double-check if leading space are realy spaces
-                    pos = 0
-                    for i in range(0, self.entry.leading_space):
-                        if cont[i] != " ":
-                            break
-                        pos += 1
-
-                    cont = cont[pos:]
-
-                    # NEW LOGIC:
-                    # In case it is different, update it
-                    if self.entry.leading_space != pos:
-                        self.entry.leading_space = pos
-
-                self.entry.contents += cont + "\n"
-            return
-
-        # Unknown line, ignore
-        self.emit_msg(ln, f"bad line: {line}")
+            self.entry.contents += cont + "\n"
+        else:
+            # Unknown line, ignore
+            self.emit_msg(ln, f"bad line: {line}")
 
     def process_inline(self, ln, line):
         """STATE_INLINE: docbook comments within a prototype."""
-- 
2.49.0

