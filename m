Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243AF1D6DB8
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190540; cv=none; b=oZ/yxdEke+v7c+S5Ow8bkYyQlvgq+kBxaoiVbMye1/WAeINXXN5J9MdkYeEnMG0dl5UuD2gclo+CEvNkGLldP3Vg6UGVZhj4DADxraEHE2IUL4MgxURLRWIQidudKRerjMOmPrnHC9QRP+sIENqbVqfUXu32oAsF1IC0T9QjHt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190540; c=relaxed/simple;
	bh=GHBWu9lNt2ri18ecsXuz9716IJyH4boBN0tW9QvMgJU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WgTRjQBgkwEMYLlgeRMlBqZXDqhw9QqX3zHMTud8XQTpSMMQc03XLdYMTpAISm7GROkEA9kpV3sHKcJ4KchMorzgnFsMBhFlJ0tiRzTCCN6G6tuSeRnv8rV2wRv1noVkC98V8LNum2WTGCXD6lTmpTEXW6sts2+o38wUxcW6pyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TdqqxF4/; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TdqqxF4/"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef79403c5eso377575a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190538; x=1738795338; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=juYA+sItEByN7zxk1dgdSJwdSPC9Jk78U+kCT9wOvNQ=;
        b=TdqqxF4/UfxRFdR3RbnszZmSVfmb3sTHGqSffQgMDxyQrbbsuITuTRnm3VQ/iswe0x
         Gtzvv3Emu7+aSygfy9hc4tjxzEe/BIMEPUn2HFb6eTsbzqvU3kw1ME6UDtdFheUmR9c5
         zPKsCQCBdyVkFbJrzUJWNKEm9Ct3wV69Lt0xgiQY09D2jxkllLrWy274sjF8QvF97Ffx
         D+ohrq561zLgCUBIOZJppuSwtPHnjWJJyU0tY8gLo99+V9zzu279tJjce998dFHjaqZO
         CMX54L3W2sTgww5yH3sxAg5v5Kz9Gt4lPW0Ud/4pBhOV+l15MZdWebYkqanGEGpL7eBS
         UtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190538; x=1738795338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juYA+sItEByN7zxk1dgdSJwdSPC9Jk78U+kCT9wOvNQ=;
        b=NAaxLiQR10hk7RoxWfvAVZSIs051e1Xd2jET1ncH2pbBpJMi9BRcAb8bBG081mtRVJ
         XAcuGOjLd5BwgQcTLGO8udOHk/ifaLx4XzAxOozq4guRHZKnMzmDs3k4PmUViiGMD/JO
         h7XdX9aL27vYUMYbiXbguNqI9h4NMaOBjrF0Qh2HuGZRmE+wlcAQdvKsLmRdsZPa56L3
         mhPROC1+OUl9U6cNww89Mev89ImDPxJ8HdUcimau4C1Oun85AEKg+VXHuGsWWyDH+WYv
         7kPFFNGFqY/Ugy6tomSmI6eVMaiZdfv/3Gqq5nLwg1j9UDCZrPZR745iiCaUE61DZexc
         plMw==
X-Forwarded-Encrypted: i=1; AJvYcCVuYyIJEh8u3WQaWYJA8hpqU7h/yjfYt5UALacLJJVkBmtreGxjcdNHdjUdfvXiCKlGdLyeKcSOEp972ic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2uafIkSmcKORTwi7wF8PPv7ROVBjbGtz8tbCTp+HsYx+MGqiO
	5Oza5/v/TX31A9/J2RBluOzue2xP/03o9CRUDlY9acrw6Mp9tAv/EckTJf0Ty4E36YpXng==
X-Google-Smtp-Source: AGHT+IEg9BYYPtNubsZcQ0Mno7chp+fxxke+KJ5TxIoSy9tvDjU8NGhzVm6RSWY3Cmxnn4PyjSXyESpN
X-Received: from pfwz41.prod.google.com ([2002:a05:6a00:1da9:b0:72d:5313:d4ab])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e14:b0:71e:4cff:2654
 with SMTP id d2e1a72fcca58-72fd0bf7126mr6635395b3a.6.1738190538358; Wed, 29
 Jan 2025 14:42:18 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:30 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-2-fvdl@google.com>
Subject: [PATCH v2 01/28] mm/cma: export total and free number of pages for
 CMA areas
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

In addition to the number of allocations and releases, system
management software may like to be aware of the size of CMA
areas, and how many pages are available in it. This information
is currently not available, so export it in total_page and
available_pages, respectively.

The name 'available_pages' was picked over 'free_pages' because
'free' implies that the pages are unused. But they might not
be, they just haven't been used by cma_alloc

The number of available pages is tracked regardless of
CONFIG_CMA_SYSFS, allowing for a few minor shortcuts in
the code, avoiding bitmap operations.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 Documentation/ABI/testing/sysfs-kernel-mm-cma | 13 +++++++++++
 mm/cma.c                                      | 22 ++++++++++++++-----
 mm/cma.h                                      |  1 +
 mm/cma_debug.c                                |  5 +----
 mm/cma_sysfs.c                                | 20 +++++++++++++++++
 5 files changed, 51 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-cma b/Documentation/ABI/testing/sysfs-kernel-mm-cma
index dfd755201142..aaf2a5d8b13b 100644
--- a/Documentation/ABI/testing/sysfs-kernel-mm-cma
+++ b/Documentation/ABI/testing/sysfs-kernel-mm-cma
@@ -29,3 +29,16 @@ Date:		Feb 2024
 Contact:	Anshuman Khandual <anshuman.khandual@arm.com>
 Description:
 		the number of pages CMA API succeeded to release
+
+What:		/sys/kernel/mm/cma/<cma-heap-name>/total_pages
+Date:		Jun 2024
+Contact:	Frank van der Linden <fvdl@google.com>
+Description:
+		The size of the CMA area in pages.
+
+What:		/sys/kernel/mm/cma/<cma-heap-name>/available_pages
+Date:		Jun 2024
+Contact:	Frank van der Linden <fvdl@google.com>
+Description:
+		The number of pages in the CMA area that are still
+		available for CMA allocation.
diff --git a/mm/cma.c b/mm/cma.c
index de5bc0c81fc2..95a8788e54d3 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -86,6 +86,7 @@ static void cma_clear_bitmap(struct cma *cma, unsigned long pfn,
 
 	spin_lock_irqsave(&cma->lock, flags);
 	bitmap_clear(cma->bitmap, bitmap_no, bitmap_count);
+	cma->available_count += count;
 	spin_unlock_irqrestore(&cma->lock, flags);
 }
 
@@ -133,7 +134,7 @@ static void __init cma_activate_area(struct cma *cma)
 			free_reserved_page(pfn_to_page(pfn));
 	}
 	totalcma_pages -= cma->count;
-	cma->count = 0;
+	cma->available_count = cma->count = 0;
 	pr_err("CMA area %s could not be activated\n", cma->name);
 }
 
@@ -206,7 +207,7 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 		snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_count);
 
 	cma->base_pfn = PFN_DOWN(base);
-	cma->count = size >> PAGE_SHIFT;
+	cma->available_count = cma->count = size >> PAGE_SHIFT;
 	cma->order_per_bit = order_per_bit;
 	*res_cma = cma;
 	cma_area_count++;
@@ -390,7 +391,7 @@ static void cma_debug_show_areas(struct cma *cma)
 {
 	unsigned long next_zero_bit, next_set_bit, nr_zero;
 	unsigned long start = 0;
-	unsigned long nr_part, nr_total = 0;
+	unsigned long nr_part;
 	unsigned long nbits = cma_bitmap_maxno(cma);
 
 	spin_lock_irq(&cma->lock);
@@ -402,12 +403,12 @@ static void cma_debug_show_areas(struct cma *cma)
 		next_set_bit = find_next_bit(cma->bitmap, nbits, next_zero_bit);
 		nr_zero = next_set_bit - next_zero_bit;
 		nr_part = nr_zero << cma->order_per_bit;
-		pr_cont("%s%lu@%lu", nr_total ? "+" : "", nr_part,
+		pr_cont("%s%lu@%lu", start ? "+" : "", nr_part,
 			next_zero_bit);
-		nr_total += nr_part;
 		start = next_zero_bit + nr_zero;
 	}
-	pr_cont("=> %lu free of %lu total pages\n", nr_total, cma->count);
+	pr_cont("=> %lu free of %lu total pages\n", cma->available_count,
+			cma->count);
 	spin_unlock_irq(&cma->lock);
 }
 
@@ -444,6 +445,14 @@ static struct page *__cma_alloc(struct cma *cma, unsigned long count,
 
 	for (;;) {
 		spin_lock_irq(&cma->lock);
+		/*
+		 * If the request is larger than the available number
+		 * of pages, stop right away.
+		 */
+		if (count > cma->available_count) {
+			spin_unlock_irq(&cma->lock);
+			break;
+		}
 		bitmap_no = bitmap_find_next_zero_area_off(cma->bitmap,
 				bitmap_maxno, start, bitmap_count, mask,
 				offset);
@@ -452,6 +461,7 @@ static struct page *__cma_alloc(struct cma *cma, unsigned long count,
 			break;
 		}
 		bitmap_set(cma->bitmap, bitmap_no, bitmap_count);
+		cma->available_count -= count;
 		/*
 		 * It's safe to drop the lock here. We've marked this region for
 		 * our exclusive use. If the migration fails we will take the
diff --git a/mm/cma.h b/mm/cma.h
index 8485ef893e99..3dd3376ae980 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -13,6 +13,7 @@ struct cma_kobject {
 struct cma {
 	unsigned long   base_pfn;
 	unsigned long   count;
+	unsigned long	available_count;
 	unsigned long   *bitmap;
 	unsigned int order_per_bit; /* Order of pages represented by one bit */
 	spinlock_t	lock;
diff --git a/mm/cma_debug.c b/mm/cma_debug.c
index 602fff89b15f..89236f22230a 100644
--- a/mm/cma_debug.c
+++ b/mm/cma_debug.c
@@ -34,13 +34,10 @@ DEFINE_DEBUGFS_ATTRIBUTE(cma_debugfs_fops, cma_debugfs_get, NULL, "%llu\n");
 static int cma_used_get(void *data, u64 *val)
 {
 	struct cma *cma = data;
-	unsigned long used;
 
 	spin_lock_irq(&cma->lock);
-	/* pages counter is smaller than sizeof(int) */
-	used = bitmap_weight(cma->bitmap, (int)cma_bitmap_maxno(cma));
+	*val = cma->count - cma->available_count;
 	spin_unlock_irq(&cma->lock);
-	*val = (u64)used << cma->order_per_bit;
 
 	return 0;
 }
diff --git a/mm/cma_sysfs.c b/mm/cma_sysfs.c
index f50db3973171..97acd3e5a6a5 100644
--- a/mm/cma_sysfs.c
+++ b/mm/cma_sysfs.c
@@ -62,6 +62,24 @@ static ssize_t release_pages_success_show(struct kobject *kobj,
 }
 CMA_ATTR_RO(release_pages_success);
 
+static ssize_t total_pages_show(struct kobject *kobj,
+					  struct kobj_attribute *attr, char *buf)
+{
+	struct cma *cma = cma_from_kobj(kobj);
+
+	return sysfs_emit(buf, "%lu\n", cma->count);
+}
+CMA_ATTR_RO(total_pages);
+
+static ssize_t available_pages_show(struct kobject *kobj,
+					  struct kobj_attribute *attr, char *buf)
+{
+	struct cma *cma = cma_from_kobj(kobj);
+
+	return sysfs_emit(buf, "%lu\n", cma->available_count);
+}
+CMA_ATTR_RO(available_pages);
+
 static void cma_kobj_release(struct kobject *kobj)
 {
 	struct cma *cma = cma_from_kobj(kobj);
@@ -75,6 +93,8 @@ static struct attribute *cma_attrs[] = {
 	&alloc_pages_success_attr.attr,
 	&alloc_pages_fail_attr.attr,
 	&release_pages_success_attr.attr,
+	&total_pages_attr.attr,
+	&available_pages_attr.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(cma);
-- 
2.48.1.262.g85cc9f2d1e-goog

