Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7DE2D3229
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642747; cv=none; b=dK7wwl8igXlQGVtwT1wIFYylNHYMCjNOq7bGL09VuULepTVIOg3+AJZ6OSQIwUfsvaw1hA3yMeUGvAHCG7FPb54USkJ6fDTBGRhpU+ocGajr2USK34GVsOaVTahoUCiiPDRLsc1opVyg2efnZrpYkCS3GgmR/wb+wx93BRmindU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642747; c=relaxed/simple;
	bh=8MPgw+SJjFIBSYmvWK+ubTN4n1htzJkdVdeoDxNgCgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NB560bw97RSag9mKbLf5/7bEfJ5X28EJflTq7JqMDdwkasaT8CmX/ck6X+P8tMvOX6Ox3Y6vcdvszlktdRCmTvtX3D7z3c/ws+vheoGPiI50pKpr8uMxnJKOSum67PPl3EGIurGCQQcDkeMYFz61MrRl/Sc/63hnWiFPPaPZfj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqoQ07qu; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqoQ07qu"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-555163cd09aso1049046e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751642743; x=1752247543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgS0KJaXTfPzzFhO8JiQ2ZNCuUgGHrASYJQSS3SosFc=;
        b=JqoQ07quhRXuik6Nmq0X7Cb+Q7A3PiiTadposGv/644M+OXKm9dQHLHsVnkIcZP60n
         aGAPtTR9DS6PCuZKU1nf7TJPp3ETRCSWHlKrNj6XDedwsWx24U0F7ukC6Myak5QFEPO6
         zE/a/VTDr9t7dZ8Hrx/5266/DBH5GtvqHokWlT3mwwXYGH9tMwO3gUhh+4rIm8ers0ul
         G430WE1hre6j1AuklPH+Gmtasf5jLpy7+/oyoyDIV/tXmdmPRv4BhZtV0PH879uGD64s
         qS00MOCFf6J27kGRYUeqLv0cn2LRPY0A+4sHJqG/AfzJgxx0U7zexlOH+R1uapTwGOOe
         W3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642743; x=1752247543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgS0KJaXTfPzzFhO8JiQ2ZNCuUgGHrASYJQSS3SosFc=;
        b=m6QMNONvPcCfu1rGMdDZxFddX2gXlYFbzELIBmoMYeLHiLHkUZ50rYc3FZO+bgGJ6u
         Y16zAZMSj1Js5zarVl0C7yI+UxLYkne+77kOLn05D60HKAb0qG/iWNVW95LVzTKcBtE/
         xg8LgTCnELCF/iGQtI0gf+r4i3K+tYyRSe5bVxVnMsYrgqWf/w+xEKvdJjKhBRtDNtde
         y7V/fsz8Z2xl/EDgMlPSCO0/o0V+qn7U/7T/C0XkBXEzs+1aTw03CTexd4XxFLauuhVe
         wLFi3rwgwVVBp74VH55k79QLSE5BAVwGKG8cigPc+A51hD7HTZhDBU+FMgKn/io8yftt
         3SOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZlTmECsV/I+QdhfFfsGNnpblUqHyVPNjwEW6mgiN4ej1upYmNU5Y2m1ZVOgTP4gdiRgbFTqGAi8fVjYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgwl6DhagtRQ2X5FiC4mvRNKICZ1/X4hu5khD+bLcOUYJXDFTZ
	KM6XJM5yuTp/pZPCnXi8fkjD67T75qhaywKiZnuCuzUOrDeibt4Lhwpu
X-Gm-Gg: ASbGncu6T6PZZRCGv6oSrblBzIQn6+srugni+vyUZMTrAV99E67UXdLynf+OS4psfD+
	41C4fcziRveio7HuhPjKDW1LLcycRToaiLj8H8FIf51e1f15k8umVeDllCplfC3+R7FYOFh9nBb
	M8bJSFoTtQsLbqM09AIp25nmLvBlXmVQ/u+3mJEQn/OWxWrfZLKVYy0ibAwZ4mbA46hazznh9sN
	RjODUaJpi64cKOXNMSaTsvogakbHA9v4s995u88jUXxC3KPLET9aI4L9ZSLbWX6tUOArLuPmJQF
	jksJJJuM+mHIWv0606bDssWg7mq4bNAxsuNv5lKlYIk6NW/Z6X7bo9hTSByXHUVq4pzP
X-Google-Smtp-Source: AGHT+IF38JqZkPzw0ACXRYTdNdIPx2TOesuSd9rduFFD+CHMcf7TmprM3nkyvPUZKkjtKEYwubd/Jg==
X-Received: by 2002:a05:6512:1246:b0:553:37e7:867a with SMTP id 2adb3069b0e04-556e6e3157cmr1097417e87.49.1751642743323;
        Fri, 04 Jul 2025 08:25:43 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb113sm281028e87.11.2025.07.04.08.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:25:42 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>
Subject: [RFC 4/7] mm/kasan, mm/vmalloc: Respect GFP flags in kasan_populate_vmalloc()
Date: Fri,  4 Jul 2025 17:25:34 +0200
Message-Id: <20250704152537.55724-5-urezki@gmail.com>
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

The function kasan_populate_vmalloc() internally allocates a page using
a hardcoded GFP_KERNEL flag. This is not safe in contexts where non-blocking
allocation flags are required, such as GFP_ATOMIC or GFP_NOWAIT, for example
during atomic vmalloc paths.

This patch modifies kasan_populate_vmalloc() and its helpers to accept a
gfp_mask argument to use it for a page allocation. It allows the caller to
specify the correct allocation context.

Also, when non-blocking flags are used, memalloc_noreclaim_save/restore()
is used around apply_to_page_range() to suppress potential reclaim behavior
that may otherwise violate atomic constraints.

Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>
Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 include/linux/kasan.h |  6 +++---
 mm/kasan/shadow.c     | 22 +++++++++++++++-------
 mm/vmalloc.c          |  4 ++--
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 890011071f2b..fe5ce9215821 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -562,7 +562,7 @@ static inline void kasan_init_hw_tags(void) { }
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 
 void kasan_populate_early_vm_area_shadow(void *start, unsigned long size);
-int kasan_populate_vmalloc(unsigned long addr, unsigned long size);
+int kasan_populate_vmalloc(unsigned long addr, unsigned long size, gfp_t gfp_mask);
 void kasan_release_vmalloc(unsigned long start, unsigned long end,
 			   unsigned long free_region_start,
 			   unsigned long free_region_end,
@@ -574,7 +574,7 @@ static inline void kasan_populate_early_vm_area_shadow(void *start,
 						       unsigned long size)
 { }
 static inline int kasan_populate_vmalloc(unsigned long start,
-					unsigned long size)
+					unsigned long size, gfp_t gfp_mask)
 {
 	return 0;
 }
@@ -610,7 +610,7 @@ static __always_inline void kasan_poison_vmalloc(const void *start,
 static inline void kasan_populate_early_vm_area_shadow(void *start,
 						       unsigned long size) { }
 static inline int kasan_populate_vmalloc(unsigned long start,
-					unsigned long size)
+					unsigned long size, gfp_t gfp_mask)
 {
 	return 0;
 }
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index d2c70cd2afb1..5edfc1f6b53e 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -335,13 +335,13 @@ static void ___free_pages_bulk(struct page **pages, int nr_pages)
 	}
 }
 
-static int ___alloc_pages_bulk(struct page **pages, int nr_pages)
+static int ___alloc_pages_bulk(struct page **pages, int nr_pages, gfp_t gfp_mask)
 {
 	unsigned long nr_populated, nr_total = nr_pages;
 	struct page **page_array = pages;
 
 	while (nr_pages) {
-		nr_populated = alloc_pages_bulk(GFP_KERNEL, nr_pages, pages);
+		nr_populated = alloc_pages_bulk(gfp_mask, nr_pages, pages);
 		if (!nr_populated) {
 			___free_pages_bulk(page_array, nr_total - nr_pages);
 			return -ENOMEM;
@@ -353,25 +353,33 @@ static int ___alloc_pages_bulk(struct page **pages, int nr_pages)
 	return 0;
 }
 
-static int __kasan_populate_vmalloc(unsigned long start, unsigned long end)
+static int __kasan_populate_vmalloc(unsigned long start, unsigned long end, gfp_t gfp_mask)
 {
 	unsigned long nr_pages, nr_total = PFN_UP(end - start);
+	bool noblock = !gfpflags_allow_blocking(gfp_mask);
 	struct vmalloc_populate_data data;
+	unsigned int flags;
 	int ret = 0;
 
-	data.pages = (struct page **)__get_free_page(GFP_KERNEL | __GFP_ZERO);
+	data.pages = (struct page **)__get_free_page(gfp_mask | __GFP_ZERO);
 	if (!data.pages)
 		return -ENOMEM;
 
 	while (nr_total) {
 		nr_pages = min(nr_total, PAGE_SIZE / sizeof(data.pages[0]));
-		ret = ___alloc_pages_bulk(data.pages, nr_pages);
+		ret = ___alloc_pages_bulk(data.pages, nr_pages, gfp_mask);
 		if (ret)
 			break;
 
 		data.start = start;
+		if (noblock)
+			flags = memalloc_noreclaim_save();
+
 		ret = apply_to_page_range(&init_mm, start, nr_pages * PAGE_SIZE,
 					  kasan_populate_vmalloc_pte, &data);
+		if (noblock)
+			memalloc_noreclaim_restore(flags);
+
 		___free_pages_bulk(data.pages, nr_pages);
 		if (ret)
 			break;
@@ -385,7 +393,7 @@ static int __kasan_populate_vmalloc(unsigned long start, unsigned long end)
 	return ret;
 }
 
-int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
+int kasan_populate_vmalloc(unsigned long addr, unsigned long size, gfp_t gfp_mask)
 {
 	unsigned long shadow_start, shadow_end;
 	int ret;
@@ -414,7 +422,7 @@ int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
 	shadow_start = PAGE_ALIGN_DOWN(shadow_start);
 	shadow_end = PAGE_ALIGN(shadow_end);
 
-	ret = __kasan_populate_vmalloc(shadow_start, shadow_end);
+	ret = __kasan_populate_vmalloc(shadow_start, shadow_end, gfp_mask);
 	if (ret)
 		return ret;
 
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 25d09f753239..5bac15b09b03 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2091,7 +2091,7 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 	BUG_ON(va->va_start < vstart);
 	BUG_ON(va->va_end > vend);
 
-	ret = kasan_populate_vmalloc(addr, size);
+	ret = kasan_populate_vmalloc(addr, size, gfp_mask);
 	if (ret) {
 		free_vmap_area(va);
 		return ERR_PTR(ret);
@@ -4832,7 +4832,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 
 	/* populate the kasan shadow space */
 	for (area = 0; area < nr_vms; area++) {
-		if (kasan_populate_vmalloc(vas[area]->va_start, sizes[area]))
+		if (kasan_populate_vmalloc(vas[area]->va_start, sizes[area], GFP_KERNEL))
 			goto err_free_shadow;
 	}
 
-- 
2.39.5

