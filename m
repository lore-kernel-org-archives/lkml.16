Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713252727F2;
	Sat, 21 Jun 2025 20:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750538133; cv=none; b=rAZneXyLmcGEsMGiUUgvWjOKzJ9CH0llKarrCrpsMQ/WW4GZyP0h3ACWBaMuQvvSih4hkD2gteEdKDEttkhp6cHne8MIj9RS1bGUOZnEtDtxM1lkmGiKed1upAtDpm0aWKS2xWVmcPIav68ElVHDlzfc06IGmH6iF2PxnYqG3ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750538133; c=relaxed/simple;
	bh=Wfjmd+ywBZv+xvzl7vSnUpl5jf1Ie+l67lrJTU+43cA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3LCdYdU4Zgji0b42BVfPft2qYjus+eWwdMhH2YNoy+G+chHunqHsfrCi/l4Nj2SZ7Vb1HZFY0CYj0GBR2di6wWmo0zZNlBcWjiBUMoOzYD94uZ06XpFkGLLA2Z0OyAXDGI65+d85wlF9NziDhCaii2IiYgWpW0mP5DV6WQnoZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bi8xpYjU; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bi8xpYjU"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 871D341F30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750538131; bh=Rl9BVfHMxyNwzTDlVL5SRCWJsUt7PJhS8xa7wZIJ02w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bi8xpYjUU8puIsuAAbWRj+eEVGeLHTbH0oyg162nLGUEQF6/C4irMhjIHo7XSOCcK
	 IOvysHv3zz/CcPfu9wzy5SQ8RIW2Ox2gsUH5ho9OHgMxPFba6jPGZEJzLWHw6WUDvo
	 PumV3QmbwnqHF58/Co+jxbHzIltseFeKWfMJCF/MmBtEdomeoppAUfkPhuQBXRYY9W
	 PWkA1zm+eX476LXz4g8syzxxA++DgtXXSHRjnQgU4BcCdwYCC1rY8RlpWkXBAyOyI8
	 vVGPEu1uBb2pVfPPKD0H1yj6vZLAO2H0g/cFdVDclRpgY3AutSc4w5/oJJReQIuoPF
	 nmynTzutTL6EQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	by ms.lwn.net (Postfix) with ESMTPA id 871D341F30;
	Sat, 21 Jun 2025 20:35:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 8/9] docs: kdoc: Add some comments to process_decl()
Date: Sat, 21 Jun 2025 14:35:11 -0600
Message-ID: <20250621203512.223189-9-corbet@lwn.net>
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

Now that the function can actually fit into a human brain, add a few
comments.  While I was at it, I switched to the trim_whitespace() helper
rather than open-coding it.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index f7a5b85a8ed7..a6ee8bac378d 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1377,26 +1377,28 @@ class KernelDoc:
         """
         if self.is_new_section(ln, line) or self.is_comment_end(ln, line):
             return
-
+        #
+        # Look for anything with the " * " line beginning.
+        #
         if doc_content.search(line):
             cont = doc_content.group(1)
-
+            #
+            # A blank line means that we have moved out of the declaration
+            # part of the comment (without any "special section" parameter
+            # descriptions).
+            #
             if cont == "":
                 self.state = state.BODY
                 self.entry.contents += "\n"  # needed?
-
+            #
+            # Otherwise we have more of the declaration section to soak up.
+            #
             else:
-                # Continued declaration purpose
-                self.entry.declaration_purpose = self.entry.declaration_purpose.rstrip()
-                self.entry.declaration_purpose += " " + cont
-
-                r = KernRe(r"\s+")
-                self.entry.declaration_purpose = r.sub(' ',
-                                                       self.entry.declaration_purpose)
-            return
-
-        # Unknown line, ignore
-        self.emit_msg(ln, f"bad line: {line}")
+                self.entry.declaration_purpose = \
+                    trim_whitespace(self.entry.declaration_purpose + ' ' + cont)
+        else:
+            # Unknown line, ignore
+            self.emit_msg(ln, f"bad line: {line}")
 
 
     def process_special(self, ln, line):
-- 
2.49.0

