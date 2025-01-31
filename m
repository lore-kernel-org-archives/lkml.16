Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22681714B2
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314447; cv=none; b=tgEMOT9aAAHc3FwN/CfFsvwV8HT4vEd/XxxgoSYmXjWj8TSfjGbr07KuFy/6ZkmHaykwrYmnR02EUmpbxCDmi1Jph61L6NLBV3v556qUMsZxlBUdXhivOgPe95ZuijXxk+5PXdwUotuZeOOyw0kqusIAt2dj47GyZABAd56cUOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314447; c=relaxed/simple;
	bh=wPi2H7baNCj6Tz7kl/ktVTPftjIevFwXOVvyQijZJ+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rn38id3AQada/4wmq8JVwIIjmPbwB+fgku9Ji5UTG4Ax3jFDXG8Vr9XiatJZGe3LQ7ObQlKcl52V/zu7yi61P9eBwZIvtwiESLN377K6tenAIHDKTbrAg0jAjGdvivpLTH3/dxkVdp6nmSv/coECp9Jtx7lmDPjgTGX/wuHLJ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h/vX3dtH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h/vX3dtH"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2164b662090so33870025ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314445; x=1738919245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtsIOf/TBIswacsBKgt0lP8Ca9NRj+2uNLPxrfHTdS0=;
        b=h/vX3dtHXDwKY+3w3Ai76lY4Eh4NvDKUcg7uZbMIU9hTc5ZRr2iQMnpxk+1dcI89mm
         MoJEnGlqmOV7TPaUjnRxqXYdTi7kyI0O7cwGlXgnQKplIZJ4jgdo8AeYa6murIrNqoe/
         XYhYVrfk0R5Trui+7KerBZqkFIw5PwiqB4Jtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314445; x=1738919245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtsIOf/TBIswacsBKgt0lP8Ca9NRj+2uNLPxrfHTdS0=;
        b=a/h2Kago9G8JrRr6CCFb6kDjJi7tuUtGg8WZD89/NPWwQmJAmt3FeFRh24rNfufOBo
         bfbrWg+vUFUlgnBMswk5nhCnv4OqVrYzpi/eN9cCI+qIK2mXmgyZddbNDLHdvw235JWv
         LtLdpZ62q2SDSKVB6en2qyOu77rthsJ4HKl6IyZFpqVTZ8DcKoW+tpOn5m9LJefcO7B4
         nie+5Xp+osh5TSaCoEtBRr4AVbV48OxPe3gI4SsK44qQleXR3eppvbJgLL+NDjjgTE9l
         YO4yIS83G1CjToXMy5pkn53W09+YzprvJRckydJj1J8PAk7yO2/0qwhqNK6yVJQUYPxn
         Vj9g==
X-Forwarded-Encrypted: i=1; AJvYcCXJKMQS8UHGEUr6LAhHVrv63+7hYws9nMr5nFee52Jv8Srn0WSar1s04AIah/riqadp9bkT4ECuqVQCGM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxqBUbZqYJquBBK7VNsLaaOAUKWBA5gdN3+xyxd4KCQXHcj3Tm
	iK/Z17WS7M4IiPC9aV3hP6wM9RJkGpoX6/VYOZ+qtfl0/hOHVschJp6xpZ4xIA==
X-Gm-Gg: ASbGncujIw2J85frahYDOLbkN0R4wUwYXflB/l6GwosoWNmJnnBb7mdXRsZ+EML+4PZ
	E8kuRD/0jSutvrsi684zCc1OrkRpwLWf9uAH5K/4TNtis/EeSwlJYtQEDPgJvcTWxg+PY1cGlZv
	fiZO+4XeWK0Pz6wWfiv+Kuqff61Ok2YMcHIwyV4LYJJP41ez/VV1xE1DVIc4LvGR2FGo8lVByq+
	pwUlSS5NdaHhevt+DWj4cOV1w9uH9BKTrtqfvvAZDuUrbYKs2gY0mW03TJ1dRGHyNtJCtJVvsd7
	UM6eBVgiy6aMo7L2Sg==
X-Google-Smtp-Source: AGHT+IG1fS5h4JbjO4Mc37VY88UPXs9TdEujSTlHdi2szESpBE3nfr8tk5rye/+mNhmuHHPPmpGn9w==
X-Received: by 2002:a17:902:c40a:b0:212:63c0:d9e7 with SMTP id d9443c01a7336-21dd7b61a82mr166145155ad.0.1738314444996;
        Fri, 31 Jan 2025 01:07:24 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21de32eb9f1sm25752285ad.115.2025.01.31.01.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:07:24 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 05/17] zram: remove two-staged handle allocation
Date: Fri, 31 Jan 2025 18:06:04 +0900
Message-ID: <20250131090658.3386285-6-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
In-Reply-To: <20250131090658.3386285-1-senozhatsky@chromium.org>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously zram write() was atomic which required us to pass
__GFP_KSWAPD_RECLAIM to zsmalloc handle allocation on a fast
path and attempt a slow path allocation (with recompression)
when the fast path failed.

Since it's not atomic anymore we can permit direct reclaim
during allocation, and remove fast allocation path and, also,
drop the recompression path (which should reduce CPU/battery
usage).

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 41 +++++------------------------------
 1 file changed, 6 insertions(+), 35 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index dd987e3942c7..0404f5e35cb4 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1716,11 +1716,11 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 {
 	int ret = 0;
-	unsigned long handle = -ENOMEM;
-	unsigned int comp_len = 0;
+	unsigned long handle;
+	unsigned int comp_len;
 	void *dst, *mem;
 	struct zcomp_strm *zstrm;
-	unsigned long element = 0;
+	unsigned long element;
 	bool same_filled;
 
 	/* First, free memory allocated to this slot (if any) */
@@ -1734,7 +1734,6 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 	if (same_filled)
 		return write_same_filled_page(zram, element, index);
 
-compress_again:
 	zstrm = zcomp_stream_get(zram->comps[ZRAM_PRIMARY_COMP]);
 	mem = kmap_local_page(page);
 	ret = zcomp_compress(zram->comps[ZRAM_PRIMARY_COMP], zstrm,
@@ -1743,8 +1742,6 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 
 	if (unlikely(ret)) {
 		zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
-		pr_err("Compression failed! err=%d\n", ret);
-		zs_free(zram->mem_pool, handle);
 		return ret;
 	}
 
@@ -1753,36 +1750,10 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 		return write_incompressible_page(zram, page, index);
 	}
 
-	/*
-	 * handle allocation has 2 paths:
-	 * a) fast path is executed with preemption disabled (for
-	 *  per-cpu streams) and has __GFP_DIRECT_RECLAIM bit clear,
-	 *  since we can't sleep;
-	 * b) slow path enables preemption and attempts to allocate
-	 *  the page with __GFP_DIRECT_RECLAIM bit set. we have to
-	 *  put per-cpu compression stream and, thus, to re-do
-	 *  the compression once handle is allocated.
-	 *
-	 * if we have a 'non-null' handle here then we are coming
-	 * from the slow path and handle has already been allocated.
-	 */
+	handle = zs_malloc(zram->mem_pool, comp_len,
+			   GFP_NOIO | __GFP_HIGHMEM | __GFP_MOVABLE);
 	if (IS_ERR_VALUE(handle))
-		handle = zs_malloc(zram->mem_pool, comp_len,
-				   __GFP_KSWAPD_RECLAIM |
-				   __GFP_NOWARN |
-				   __GFP_HIGHMEM |
-				   __GFP_MOVABLE);
-	if (IS_ERR_VALUE(handle)) {
-		zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
-		atomic64_inc(&zram->stats.writestall);
-		handle = zs_malloc(zram->mem_pool, comp_len,
-				   GFP_NOIO | __GFP_HIGHMEM |
-				   __GFP_MOVABLE);
-		if (IS_ERR_VALUE(handle))
-			return PTR_ERR((void *)handle);
-
-		goto compress_again;
-	}
+		return PTR_ERR((void *)handle);
 
 	if (!zram_can_store_page(zram)) {
 		zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
-- 
2.48.1.362.g079036d154-goog

