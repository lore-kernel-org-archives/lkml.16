Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0DC19F111
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867881; cv=none; b=FJuBTpse4wvW9X+UtbleFu40DZt43O2odh1TQZ+2Pcejj7zusCGwJ37EJvYEuLKlvw1u5c4elWk871UMc1aeSIe6dcvcEZmenZaMY+Cvdff0CUacUA/TV4uaB79M8PyhsZ8toNqd07ZbS7gYBqy0KRYRLKXx/oLeSGP7Eu4Ex/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867881; c=relaxed/simple;
	bh=9hPlj4yoVVV9qBroz6ro/IRU562jbhtoFg2bawGSkqE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DHEw+5Xoi7ic4+FBOsvx4ZsCaLAlQtUnHmhgFZ68L+eelh8hpJuGvtAi7LhetsvHBv7M1pGO238zVkBepDmemTuDQiMv04XfqFkTuv3fkYckxt7MgNAQvAJNSTh1A21ZcjVAtUZ/p9hVaS6iY8JAGRkP8vIBdyl3L5bIuqYWLLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FM3EDDtQ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FM3EDDtQ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fa1c093f12so1067931a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867878; x=1739472678; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NJPFpuaCa1L0JdfMq2mnIjylFDa72i51MvIbj3cBAAk=;
        b=FM3EDDtQtyyjLLy6s8Og9G4+WMur9/XFQvpYDFJxJlLwdl37yeCzYN6ZBdzYSfcamk
         geLAyQrwI2d0AaQNLgYGjKVYZNGMy4BkTSwMnYx0CORZp+YrCRfvux1ZD8f4vSCKP9Wy
         BLLL6DRaNqyZurwfya01OkQfQPRh6kmzCQs26FxyHzOUfQDewSTiWGFML6CdzAgp2Wq1
         0zPtWJ2Y7bSOLHLgzjFC6Mx5YtN1dWels6dPQAYYMw1T/PqMUby1ooxy08whSp3KALZp
         n54LlyuoxI5lYaPE/pnsD/C5PElfAzb97KjL7al+pyWtqAHtKS4IEIDsSpaurBy7kaAP
         Qa5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867878; x=1739472678;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJPFpuaCa1L0JdfMq2mnIjylFDa72i51MvIbj3cBAAk=;
        b=VGGAGNnKMf5SPPpmsa4fWrM6Jo2c8HXxZQWI/4Q2mRi1YvyPXZdj89srQdPzBqxx4f
         23fKs5PWIJPga9m9IZBlfR4am44GDofbOwQkvXqfs9LxWM27Sa0lLTskOXMuLb0QXESV
         GQ8TX/umPAkTSBgaMT/8O/+bJ0p6zkIG3K8W2bzDHMIqbeg0UGQ4cvBMYKyVybNUC3nl
         OSycgkhCK1AAQFKTROgHoQVFMcrk2wwzBuQpckgWghuaKwf8lN4ZXPiCC87QXZyDONOd
         IraobJn4tCGEElisKNyiinzKS/Bg1GwPsNNQf1HHDb9K81JmYA4TmiCn7iB4f/MEDQEu
         znZg==
X-Forwarded-Encrypted: i=1; AJvYcCUUxLZwpEmyClngZkmFnOlu6d1l9gpQ1SuUMpfExRwR7NBmkxcfei9wwqIRGgCVHN/z9qvGBt2zfTJgRbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ng22rRmW7WdtI9U6RX3ZEISCONjuXbKl+wWN8PwtZijNK+dY
	14hdD3gnfMSs0D3NW9eDzh/wb11bncMAV+WxteJriyDPensgoYt7W+GCEAosZXUz7ZVozA==
X-Google-Smtp-Source: AGHT+IE32zObckxQH9j+bb16bIAOnvT1L5KvON9aMD8I/isc7mdoYBPbnHRBSRCen9t4NlEX4I7KXcS/
X-Received: from pjbpm18.prod.google.com ([2002:a17:90b:3c52:b0:2ea:448a:8cd1])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d03:b0:2ea:bf1c:1e3a
 with SMTP id 98e67ed59e1d1-2fa24069ec6mr240439a91.12.1738867878036; Thu, 06
 Feb 2025 10:51:18 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:41 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-2-fvdl@google.com>
Subject: [PATCH v3 01/28] mm/cma: export total and free number of pages for
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
2.48.1.502.g6dc24dfdaf-goog

