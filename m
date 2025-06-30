Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971BC2417D9
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289852; cv=none; b=LuaUwUeq7iu7ntOaRH4ONa420UA5Agt7BsFXMaKqW2z0Wid5MFr0R2jQLWF+3rdQ3Svu5sMCtCT6wzIhFFgvL+DeuXGEFzq/zZvq3RBu+YFmbFR8nsb5KPPf0tM9WfYr9BOkf0NsWTuMvfjcwnk+/adQcfrQKTjz5cz3xKsh39M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289852; c=relaxed/simple;
	bh=iFaywVTC8M4T+NJ2ZyVyZRGTl3ldMd0MMtrsUGsqZUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EntoZvbRyci61v0cJJECiiGNuItgkjuzTysHBlQyTXKnd8xDrdSRRpeHdOp6LxaSzdYY3bElyIIhqqTHgE5fswezkS+75S13EsCDKsP6a9wdZ8HESrbmDC5OW0JtMYoBZjRh0y4tASGDRxryJsYrr2TwU09nCBb48nwT6Wr5R54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AcTKM6Bu; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AcTKM6Bu"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751289847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qAGlzeWXRlMA2Zij8Qp03D2CGSSdLuFgwBSG6gDWPG8=;
	b=AcTKM6BuqAY3kgrIzG/gg9kzJvLwnPRd8XO/VZDatCB/hIsFPIkSKia5dvTuIBHA+CKCfe
	lnohH5xqW8rcVJKUI9VwpHIwLq7frob2pgU8+80Bua68KHsDZH5osZcew0iOJlKvHX8E1G
	LyWbh89spp1PFk+JbgoN6Qd5uTp82pg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/cma: Use str_plural() in cma_declare_contiguous_multi()
Date: Mon, 30 Jun 2025 15:23:18 +0200
Message-ID: <20250630132318.41339-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use the string choice helper function str_plural() to simplify the code
and to fix the following Coccinelle/coccicheck warning reported by
string_choices.cocci:

  opportunity for str_plural(nr)

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 mm/cma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index c0b2630a1b81..c40d53298801 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -22,6 +22,7 @@
 #include <linux/mm.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/log2.h>
 #include <linux/cma.h>
 #include <linux/highmem.h>
@@ -548,8 +549,7 @@ int __init cma_declare_contiguous_multi(phys_addr_t total_size,
 			(unsigned long)total_size / SZ_1M);
 	else
 		pr_info("Reserved %lu MiB in %d range%s\n",
-			(unsigned long)total_size / SZ_1M, nr,
-			nr > 1 ? "s" : "");
+			(unsigned long)total_size / SZ_1M, nr, str_plural(nr));
 	return ret;
 }
 
-- 
2.50.0

