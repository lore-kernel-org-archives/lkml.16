Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404412918E6;
	Wed,  4 Jun 2025 14:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047841; cv=none; b=eo93+rwIUMF6OvpNr+HqspbXeHI47O6e8YeBuZwCjAQN1zCE00fZcJhzUHBDCWTjfb/ffZZICjE+y4wVKXyz9aTrSmwWYnNnUlN7Z1xIsyL5BpoV9F5tGR9m1EbTZoKMxsX3+p735kvyRczKJ4qcbiw8p1zZ+rYRV9LeSQMq000=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047841; c=relaxed/simple;
	bh=xr4uTdRiZCNdMn3W5qWwwPpYDscXYuir3me+H8XQdC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3eyZ7wLPywXcmZHrxGGhXXpFPPcK5f1jqClPAYefV3KqMdcssP3NmgMdd5Vgrbhusf9DLfLz3v7ZHLfereU1aX3abQUlXk4KN8yB438FgNGnHfT40heQT/75fOfu/v6eUFni+XLVrgAn/Cd5PBCoE+5nyFxMw6Mc1pcTPPlSBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=iTEIGDQ8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="iTEIGDQ8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A54A441F2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749047839; bh=lQCobccnQ6ihUHwgNMz6oxJnLailFhApTPbx4Ru7zAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iTEIGDQ8EuL9sG1212muriZArVDE7cLPYUI4khVzmAqhIQiD6wxTsm7BavqVwXaS1
	 WIJ0chjYgqQjFbQUeB7ZSp35XJ6epRGR2Q9i/Js3XpETm+KPlRFoDxJ6VdPKj0seHV
	 rHGZN1ct9xEHIF6gIymoGKSUqFoPVO+UTM7/D0kKBtPzy05NWfoSU6ObH19GSEkoKm
	 fZoCKMOJ12FgoUTom5CsMw0+lffXEZEWY7Y0Q94RJnspP3X7ezLHGLfAY92EOy9Ixw
	 fSgQz8ZDC7lBznw7IulEMlfcszDHiExmuW/h5vYWNNKto0tlO1gqGmxD/RMnqA2vXS
	 9IBf2WRFNhYgw==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id A54A441F2A;
	Wed,  4 Jun 2025 14:37:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 2/3] docs: automarkup: Mark up undocumented entities too
Date: Wed,  4 Jun 2025 08:36:44 -0600
Message-ID: <20250604143645.78367-3-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604143645.78367-1-corbet@lwn.net>
References: <20250604143645.78367-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The automarkup code generates markup and a cross-reference link for
functions, structs, etc. for which it finds kerneldoc documentation.
Undocumented entities are left untouched; that creates an inconsistent
reading experience and has caused some writers to go to extra measures to
cause the markup to happen.

Mark up detected C entities regardless of whether they are documented.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
v2: Split out the CSS changes into a separate patch

 Documentation/sphinx/automarkup.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index 7828aeac92e7..e67eb8e19c22 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -235,8 +235,13 @@ def add_and_resolve_xref(app, docname, domain, reftype, target, contnode=None):
 
     if xref:
         return xref
-
-    return None
+    #
+    # We didn't find the xref; if a container node was supplied,
+    # mark it as a broken xref
+    #
+    if contnode:
+        contnode.set_class("broken_xref")
+    return contnode
 
 #
 # Variant of markup_abi_ref() that warns whan a reference is not found
-- 
2.49.0

