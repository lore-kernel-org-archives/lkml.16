Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856E2289E16
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642745; cv=none; b=PCgRX7vcPxkfGOYrbuO6n5DAl4mNj4LJSw+SccEKAugyTKGZl7syt0KXyal7Vt9Xz423JD/Hx3Y/NzZMrQgPrUdA5Q0L14KPsB8Q3O9X+ynKRWgexxhKiOrnknWSuqt6kLPO6OPFCEEnl/CdOuGPiS0oRSLOV9gf4HU4E1fENxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642745; c=relaxed/simple;
	bh=NAaX3YimyE+ipEesLgZwSS1IZCcvgj0M72vfhzONliw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lDHxMOTjUV6iriU7IDlwqgNmSrRxnCRt+4b0epmLuCi7YIChgHmN8K/hKKM21zCBRzxG0YVBrWc7G3POvz3kTeHJY/CB0fpO3v9BFR+cE/h5psyvl80trAUzvQ8+kKA6/cmCdUHWv8pMtyyF9vbRq0bJEsmGx4gJXccYYMl++Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKtqVpKT; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKtqVpKT"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b5165cf5so1473899e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751642741; x=1752247541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwtxqi1fI8oj2HRni4fagzovQZ8CdYGC7q8FkIyF8Ac=;
        b=AKtqVpKTbaGlm0/fo7NgoNh+Bgk/Gl1nnAmr2HlvKTWqidZY/ifOvgMkNS5/EHehki
         EgXXW5kT35BgJFcz4AbHpkqLc/bFuoV2Zq63zACL39UciR9e+38DTJXxGS8JZeQ3A/SQ
         GhTq+jsvopTfvlsfIhRNADxZLwnAapqSILF9nULVKrjycBmaHRLh3Ze0riQ3C+rE0hGv
         MFwJZ8JcCp346blyjk4MHIyR79VY7Pjsw7uSDWV8nrOoCFPwyQ6AXMhHFK1D2WCw2xgE
         byaKqpN6u1l2XwgUQCMTbWaylihJNoc5iol8uEaU5GDwBG/6b+qFylg1N9Jz/UO9SJH9
         ittw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642741; x=1752247541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwtxqi1fI8oj2HRni4fagzovQZ8CdYGC7q8FkIyF8Ac=;
        b=N2WEoB5xMdRjSJItY+YjzSaQBDOdFoSeUhJwuPGs7g1OqwWpWXsJnC/6s17z5ksrL1
         WnMcs55vo/TCyCJOfTL/1wlI/mLex7o42ooyfXj/r1k5dgLWoYizBbtZostUgQrW7cxh
         Y15+aEmBCFo6sEEsFshjqATCvjo9/RkHrgOJwizG60Ioo8tCMgCuki5+0Ta6Bn6NqaMH
         YJCy6S1VI2K9JlaDjJMYjJC2s2rxoK6FeIO0gpyMNh/NTwjo0GFyG8VPFTebY0XFa4SQ
         Nn1jIEHZzIp3rX1d6uA8hrK8cMZukiqL0rQlCKmjo3Vs2PVZ3BRCj4sR2jClLNfuM8mz
         b0xA==
X-Forwarded-Encrypted: i=1; AJvYcCWfso4cK+PkA7wvlWWDCrH5HUAPd4r+tGnx4ZHtraxeeAEYfktsBBd9wyUT+tkwOR8YW0mun51spmm1Dyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwISn+VMt5UGY2X39IChKyBWmzYkiU84apkgebuxB5vc5mRUiTG
	VSHdxZaRWh2sb1u9adkOIuYk63YLUqoPvx7AANtIZjfQba8hjNIG/5kBsJRTmw==
X-Gm-Gg: ASbGncv0je0lPb2thXkWhAhkqMUk/DqOgIqpakLEZwO1gls0pdKmWRIrsfPFHnqQDa/
	H/8Hk4Cxn0m2Um0pDav3ig/QAuZuOwmksU5Z7svSBsZVyi6IAxoqxjp1BlWsxQBPjHMHvjjL31f
	PEGsz7+/r/wgCKRGk4PmQpt3OBh+Wt1OI3BEQlP9b5rGBeZRNJjQGZHR9YM7ubQ750hDbLx+c0v
	TaCGxyacijL5mwXeIkhkrz2zkPBXeyb59lI5o7luPKF8Lp4WduJCFd4VGX9KUpqZ0ohGRsU8627
	ilXIqBP373bfDR3im4wmPpfwuEEnDmbBWTvzp1d3ynBJd1UPAJ/pvCh1Lw==
X-Google-Smtp-Source: AGHT+IG/gMey5ORcyt8GcgwGMk7DIKpx9yC2VyClRNGtmOGQ17WBQ45cD96BcHORchuwDkahDEY86w==
X-Received: by 2002:a05:6512:31ce:b0:553:aa32:4106 with SMTP id 2adb3069b0e04-556dc83e46fmr843287e87.23.1751642741156;
        Fri, 04 Jul 2025 08:25:41 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb113sm281028e87.11.2025.07.04.08.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:25:40 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 2/7] mm/vmalloc: Support non-blocking GFP flags in alloc_vmap_area()
Date: Fri,  4 Jul 2025 17:25:32 +0200
Message-Id: <20250704152537.55724-3-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704152537.55724-1-urezki@gmail.com>
References: <20250704152537.55724-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

alloc_vmap_area() currently assumes that sleeping is allowed during
allocation. This is not true for callers which pass non-blocking
GFP flags, such as GFP_ATOMIC or GFP_NOWAIT.

This patch adds logic to detect whether the given gfp_mask permits
blocking. It avoids invoking might_sleep() or falling back to reclaim
path if blocking is not allowed.

This makes alloc_vmap_area() safer for use in non-sleeping contexts,
where previously it could hit unexpected sleeps, trigger warnings.

Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ab986dd09b6a..8c375b8e269d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2009,6 +2009,7 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 	unsigned long freed;
 	unsigned long addr;
 	unsigned int vn_id;
+	bool allow_block;
 	int purged = 0;
 	int ret;
 
@@ -2018,7 +2019,9 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 	if (unlikely(!vmap_initialized))
 		return ERR_PTR(-EBUSY);
 
-	might_sleep();
+	allow_block = gfpflags_allow_blocking(gfp_mask);
+	if (allow_block)
+		might_sleep();
 
 	/*
 	 * If a VA is obtained from a global heap(if it fails here)
@@ -2030,7 +2033,8 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 	 */
 	va = node_alloc(size, align, vstart, vend, &addr, &vn_id);
 	if (!va) {
-		gfp_mask = gfp_mask & GFP_RECLAIM_MASK;
+		if (allow_block)
+			gfp_mask = gfp_mask & GFP_RECLAIM_MASK;
 
 		va = kmem_cache_alloc_node(vmap_area_cachep, gfp_mask, node);
 		if (unlikely(!va))
@@ -2057,8 +2061,14 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 	 * If an allocation fails, the error value is
 	 * returned. Therefore trigger the overflow path.
 	 */
-	if (IS_ERR_VALUE(addr))
+	if (IS_ERR_VALUE(addr)) {
+		if (!allow_block) {
+			kmem_cache_free(vmap_area_cachep, va);
+			return ERR_PTR(-ENOMEM);
+		}
+
 		goto overflow;
+	}
 
 	va->va_start = addr;
 	va->va_end = addr + size;
-- 
2.39.5

