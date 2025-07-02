Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84647E0E4;
	Wed,  2 Jul 2025 22:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495767; cv=none; b=ns87/ly8XaRBpOmTjJ4GNmMPOGtk4IXHTbjOvC2QV27FIccNuLUBYQsjzNEl1aNKZwE2lsJZbSbMY5sDGpmY2suo8LgB9Ii/1apjCEnYRy0L9dqVF//PLFnwW6pBdwe14CgNAfZ4PYfhVFc7QKJNUp/zKUqojdm6UhAYgKYUaK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495767; c=relaxed/simple;
	bh=FwhImwbafGh/zSIx/tFbbpugx28qhWcgTkn8+5R/NgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=itOXmXqSPeyyYnnQyKgCr80yxeGQ+ZAvjWqUXgo4A2e62fhAk1TK/joJYz+osPfMRDa/zHn8BnDbWdFZkgJvPmfEvqXM8B3awkVXZglTxRIyEnszt3WkShlkm6kx89dpUCIsdR6rfHmZ/AJv+la8reN3tlenCFIgUXH0n/+YMO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JgeSRHRT; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="JgeSRHRT"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EF6F040AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751495762; bh=DTvXcrbBitRgXHw7xikNWkgt0Dd2ojvGet8pYn6xCbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JgeSRHRTh7KmdIczkY+8jBtbz2xFOEH7ldbEQ0Y3jVA3k5r28AnX5OL9rGH4Hu4MP
	 QKeQPhjetk2ylXHZGc63iCApJp57z5MAD0b3CR34jrdl3C94PAKJIIL721opT9Wj5/
	 8V73PGGD8RnNllEAlWJI3tzk97+9i8YG8ZxiAvRkd6f89nl2wCzBNV95VkIuJGY0LO
	 3uZxQyZ4t8oFayLvtdxG4B5a5I08MPjmQamrfXSXzRZtBs9/rlH676/Abjovz8d6Hv
	 4Y2aYeCleYvhZj9Cc4aAf/w3Z35Ol9Zqh2TxMbSqRSVInkNFS5yTrPbJmdY6VqPIO0
	 szkrUKslj9nmA==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id EF6F040AD8;
	Wed,  2 Jul 2025 22:36:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 06/12] docs: kdoc: use self.entry.parameterlist directly in check_sections()
Date: Wed,  2 Jul 2025 16:35:18 -0600
Message-ID: <20250702223524.231794-7-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702223524.231794-1-corbet@lwn.net>
References: <20250702223524.231794-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Callers of check_sections() join parameterlist into a single string, which
is then immediately split back into the original list.  Rather than do all
that, just use parameterlist directly in check_sections().

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index b28f056365cb..ffd49f9395ae 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -476,19 +476,18 @@ class KernelDoc:
                         self.push_parameter(ln, decl_type, param, dtype,
                                             arg, declaration_name)
 
-    def check_sections(self, ln, decl_name, decl_type, sectcheck, prmscheck):
+    def check_sections(self, ln, decl_name, decl_type, sectcheck):
         """
         Check for errors inside sections, emitting warnings if not found
         parameters are described.
         """
 
         sects = sectcheck.split()
-        prms = prmscheck.split()
 
         for sx in range(len(sects)):                  # pylint: disable=C0200
             err = True
-            for px in range(len(prms)):               # pylint: disable=C0200
-                if prms[px] == sects[sx]:
+            for param in self.entry.parameterlist:
+                if param == sects[sx]:
                     err = False
                     break
 
@@ -753,8 +752,7 @@ class KernelDoc:
 
         self.create_parameter_list(ln, decl_type, members, ';',
                                    declaration_name)
-        self.check_sections(ln, declaration_name, decl_type,
-                            self.entry.sectcheck, ' '.join(self.entry.parameterlist))
+        self.check_sections(ln, declaration_name, decl_type, self.entry.sectcheck)
 
         # Adjust declaration for better display
         declaration = KernRe(r'([\{;])').sub(r'\1\n', declaration)
@@ -1032,9 +1030,7 @@ class KernelDoc:
                           f"expecting prototype for {self.entry.identifier}(). Prototype was for {declaration_name}() instead")
             return
 
-        prms = " ".join(self.entry.parameterlist)
-        self.check_sections(ln, declaration_name, "function",
-                            self.entry.sectcheck, prms)
+        self.check_sections(ln, declaration_name, "function", self.entry.sectcheck)
 
         self.check_return_section(ln, declaration_name, return_type)
 
-- 
2.49.0

