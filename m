Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596A81C1F1D
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235499; cv=none; b=tkBCNM0atkJyaOXPC+rzp/Ps04YYWsDPf8F4jkT9dpoZK0FQx9T/WGaP9aymhyB3otsg28m1NsvJ3sAf0NuwEJDLxlos+fMAq//ohb6fyek2vwd3j9EqRtYit1a84VM01x7tkHtYFRutLuIRggLO7KZqqa7mSt33M1/Or4asUS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235499; c=relaxed/simple;
	bh=NrPXlIDNWrXWtLZ0f9UduK7J6HixgLH7eyRTETmv8ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r57ZvQqY7fZUXGCAS4msYVpTv3MMkzt/GQpA5KkJyHMZ4/9IzN7WKnDptbZ2OISWL9zeD/6UeYXUeTvW3pyYQ1azZvTwKjWAQLUgIlaq/ozZ0th+IkTzxrDD68G1v4J6QpRHbqVdh21fQ65XvBZHCyGIVqTPl4AQoi2gDWnu3KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dWcR1wOw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dWcR1wOw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2167141dfa1so9626135ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738235497; x=1738840297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujanKWetHL+pQynH0HIAEO2xKM/XaqicaLx2SNCooQM=;
        b=dWcR1wOwcJ6yFGW6/N9GgqbyoN067b4Rh5gdC/oygDviHzcFGsJ3l+81SGWOTxO8QB
         vk1IObGFq3roZgQvR2am5GI3YVGvhVc62Qweun2o36NnCWvKGouQMydfnPEna0KExmnA
         yEjECJGYKIJ3QyjQvDdDu10jSXyWF0oO/WPHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235497; x=1738840297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujanKWetHL+pQynH0HIAEO2xKM/XaqicaLx2SNCooQM=;
        b=mcIB1AAcZA8ldM5c8J35Rk5NHqbz5/lnp2/ARYBjYcV9GhHI/+aNtZ86fszBEvpu9L
         WkBlT8kKFcZdAOC8t3kMCRsphAY1HW/8naPFYIOyy25ONPzfG8oDUF/QqLNC7b2GskEB
         KDO8Y9jl1cS3GrZHSNg29yQM4FrM+sQRjNMrsFOQvRDrXnz14z1y5mm4qDJ9Ta82BGmW
         IXhB7lQZWtNKiD4cyoDHu3l4fxKutMf210NB4fUpx1jRBR6yDBj/nlXQ2hljF0DrKMO7
         LhMwSgyEEd9l2Jk4GnYbOe+zqSIpeNSbF/ubwu4pFyMBM6vOkNam2TbGk8FkF5b4dUyx
         cXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf+S4GiS332WvPrQJYy6/6RWbd3stepIqkM7qMODycWG6bBNR+ouvy8jXKxZIaw4ENqfCpDdvTHCYw29I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbeioe6VIWiKBAE02tkRRksvcyJ3dVq9dWDp5nxQpsvkITz3Vw
	7LsFJCaZQWP8hRH00/oFsEa2Rtiaoc9SIeawtxO91phi77UOm8H5+ZIuh3pyUqCr+pC4nzKxHKA
	=
X-Gm-Gg: ASbGncvYhKDa1TX0MEXYRCz9bXFd0DQNIXvoS0VdFs654ub1xBxcdcose7Ou4siUFaK
	8pHD8Bf5umECBDg+UzSGXKtCD6e2Oclqp3vPhdeyTuWUxZB+UWe/4lAfSlqiR7PysrTt0+EnUix
	8i67fUygytixwwWUlYwWzjT5UiQUNrKqoJoovKWxXgnW2W3lIpTzeUf998FKV845lH605y+8Sxb
	aFAIlyr+mCJC/ZBxrbKRWbku3v5e4mj+b4VO//OzV78Z6IoKzvAVzowmgcw64It11jjhI/5Ld3H
	w+vyalyosW2QD9eQ
X-Google-Smtp-Source: AGHT+IGoJPBvbRFKgcHes3aZpqhjq0bpB3vf3UMoxOpT1s+vDvy+5JFl5BGgTN400Fd1/JslRst1fw==
X-Received: by 2002:a17:902:c946:b0:216:14fb:d277 with SMTP id d9443c01a7336-21de196fb0amr42131665ad.22.1738235497536;
        Thu, 30 Jan 2025 03:11:37 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d4ce:e744:f46b:4fb])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21de31f836csm11410515ad.93.2025.01.30.03.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 03:11:37 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 05/11] zram: remove two-staged handle allocation
Date: Thu, 30 Jan 2025 20:10:50 +0900
Message-ID: <20250130111105.2861324-6-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
In-Reply-To: <20250130111105.2861324-1-senozhatsky@chromium.org>
References: <20250130111105.2861324-1-senozhatsky@chromium.org>
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
index 0c9b68fa8783..28e5b02dc3a1 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1718,11 +1718,11 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
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
@@ -1736,7 +1736,6 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 	if (same_filled)
 		return write_same_filled_page(zram, element, index);
 
-compress_again:
 	zstrm = zcomp_stream_get(zram->comps[ZRAM_PRIMARY_COMP]);
 	mem = kmap_local_page(page);
 	ret = zcomp_compress(zram->comps[ZRAM_PRIMARY_COMP], zstrm,
@@ -1745,8 +1744,6 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 
 	if (unlikely(ret)) {
 		zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP], zstrm);
-		pr_err("Compression failed! err=%d\n", ret);
-		zs_free(zram->mem_pool, handle);
 		return ret;
 	}
 
@@ -1755,36 +1752,10 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
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
2.48.1.262.g85cc9f2d1e-goog

