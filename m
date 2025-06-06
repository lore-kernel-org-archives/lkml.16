Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE0A1B042E;
	Fri,  6 Jun 2025 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749220629; cv=none; b=II9DhLD3bYBQ/8wp1jkc9FpDUnAv0VFA2fl7LG8Oq4rltT/1lzPt6BV7ypQYzOHsWYXZDOxA4gFZFYEqdNieKah5xhpDCa8EfxlSZA+nxOPEaAqjYpi7jz0lTJRUAyCwunZ7Mf9wmTJJJt84p2z0LlGUJ+/NVDE1uYyM0ZqtLwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749220629; c=relaxed/simple;
	bh=Coej6v2A4pdxAijinrBKdR581+xkqF9c8/CwSsr5axc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PKGiMf8Wa3WNEpKz26v3Xeo7MWNE+AuiQOFk+5lvCaAuVvZ6YR7GJucHDqMc+UO9KjgTf71ltc0ljNpE1CmcccpUOmWEqy6cOvvVfYZ/Hyhzmv7uwAH+kCEZmk0H429WOZ0ZLYyPJRZwU79PEc/4o5Xd1mardsOc/5qhoE+83vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OU2ckOIv; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OU2ckOIv"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f0ad744811so15575366d6.1;
        Fri, 06 Jun 2025 07:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749220627; x=1749825427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AaEwI0xQjMrdshuvrU/B5Cob4sYuRWx9gxQZpiMO6so=;
        b=OU2ckOIvHeKo8G6h+WkeI2RB/bE+hI6KoX6HjrXDckMi9d8LGl85KOj4uX+dTl30cf
         a+3/W2Agiz672Q/+5z9Y1mG924dGzjsgez9w4OPXiphksGVzL4IlQWnBhda9zVvR6m3s
         NrjMAB9+AhL1f2T0SMriB56ZIaj9XcP3DPuLnKOalrwICNrxQu4xL5IcGc6R0gYyA5t1
         TDu1KdTLJZE3DAcypmsyCti805lyOud1MwylVfwgckWCTMzzKupbDmxq/83VIaN6P5Bf
         kDzyNYQp4sDzJmbh9AUFo0rI2Ix49k0Tt0JZoy+umLrtBGSFVuKM1gKaHBboEEVpS9nx
         BG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749220627; x=1749825427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaEwI0xQjMrdshuvrU/B5Cob4sYuRWx9gxQZpiMO6so=;
        b=uQ+t1XQRzN8daNzSmC3mxk/pi2FJmxskUEkDuyQvqWKdIBBmkymvYuq9ibHcWJCy9D
         tF0D/klrO/A+VG+JARSvYsr3T2g9cPJ+aguUtQDtx5QZEUQi/BHVzELtRyCVPL6L6RYl
         ii6yYQIyMYQQ2VZW+FGjEPvnXn/6a+xkTnkQ0B5OAK3fJzxWuf1zW+bGscu0JaT395X9
         uT2PEtA7vO1OWuGXvJLIZZ6JycXKmHoRHqhcm18G/tgZEB4e+bPePMQF32F5EpdpNxiz
         ofVYmM+L5yYBngM3Ui0NVCdRjhSv4KJV/LTKTtxvPQ2zkUdB4xTBQwC3f6z+rMyclNsk
         +NKA==
X-Forwarded-Encrypted: i=1; AJvYcCVuurcmNgk4VKbPGDW4765IRu6oMvp/kwMHH+MXAH46UkDIAasZiuH4xxy+RqwApzZqpaRVVh5n3ArWD5M+@vger.kernel.org, AJvYcCXvadtSojyp05FT4EFw4Te5x5ZbTlrbE+UDAI7RglzfqP+pTGeBahGSqZshSNz9sd6WqZxv4SS5Uug=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQh/wgdwO2aNo4D/J5xs1nbJew3GXKmZm7llIGR23VsuXc/wli
	/IhN/06U8oUTzjowkc06UfJSynkt7QKwBfIzqbJaSNXkt60A6aCHQnqO
X-Gm-Gg: ASbGncvR8eHEqqLWz7g4DPb7xUi/879ll0sk/BcQ+YD1cT+NaRp8DymCUls5Bo+aLIy
	GFmfyJcOUpntRgl5wMozH9Cvb1EFserl4B8/A2/YAmobZTaPX46YeHixJrhfSpO5JL3D8iQkzYC
	UTvkL2dt68G6voWUka806kUoSEtnGSdc41fWs0V8I+wFIi7x8BBjCSOqTAUtNGy7GpJM3/re13V
	Fd4udNbeLZbQ3PurJmmDu6PXtGbi35jEUnVu9asPPUsh1SsrmmUxha5eRMU8yW6CN6V7STzxJG2
	Gvb2LWAB4kd/v/tNNYO+W5PneRmC9HakvjqnPT4s59zN3uyWMcggEx7HDjc=
X-Google-Smtp-Source: AGHT+IFR13sAgZh2AfNd6UskGQ4hRF6QlKjuipPT65vrhMI6mbut6Ono5sI0auy2R1DSgPK/Ap9C0w==
X-Received: by 2002:a05:6214:1d2c:b0:6fa:cbe8:b873 with SMTP id 6a1803df08f44-6fb08f54d0fmr55768976d6.14.1749220626725;
        Fri, 06 Jun 2025 07:37:06 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:1::])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b366easm11829636d6.114.2025.06.06.07.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:37:06 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@redhat.com,
	linux-mm@kvack.org
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	riel@surriel.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	hughd@google.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [RFC] mm: khugepaged: use largest enabled hugepage order for min_free_kbytes
Date: Fri,  6 Jun 2025 15:37:00 +0100
Message-ID: <20250606143700.3256414-1-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
watermarks are evaluated to extremely high values, for e.g. a server with
480G of memory, only 2M mTHP hugepage size set to madvise, with the rest
of the sizes set to never, the min, low and high watermarks evaluate to
11.2G, 14G and 16.8G respectively.
In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP hugepage
size set to madvise, the min, low and high watermarks evaluate to 86M, 566M
and 1G respectively.
This is because set_recommended_min_free_kbytes is designed for PMD
hugepages (pageblock_order = min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).
Such high watermark values can cause performance and latency issues in
memory bound applications on arm servers that use 64K PAGE_SIZE, eventhough
most of them would never actually use a 512M PMD THP.

Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest large
folio order enabled in set_recommended_min_free_kbytes.
With this patch, when only 2M THP hugepage size is set to madvise for the
same machine with 64K page size, with the rest of the sizes set to never,
the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
respectively. When 512M THP hugepage size is set to madvise for the same
machine with 64K page size, the min, low and high watermarks evaluate to
11.2G, 14G and 16.8G respectively, the same as without this patch.

An alternative solution would be to change PAGE_BLOCK_ORDER by changing
ARCH_FORCE_MAX_ORDER to a lower value for ARM64_64K_PAGES. However, this
is not dynamic with hugepage size, will need different kernel builds for
different hugepage sizes and most users won't know that this needs to be
done as it can be difficult to detmermine that the performance and latency
issues are coming from the high watermark values.

All watermark numbers are for zones of nodes that had the highest number
of pages, i.e. the value for min size for 4K is obtained using:
cat /proc/zoneinfo  | grep -i min | awk '{print $2}' | sort -n  | tail -n 1 | awk '{print $1 * 4096 / 1024 / 1024}';
and for 64K using:
cat /proc/zoneinfo  | grep -i min | awk '{print $2}' | sort -n  | tail -n 1 | awk '{print $1 * 65536 / 1024 / 1024}';

An arbirtary min of 128 pages is used for when no hugepage sizes are set
enabled.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 include/linux/huge_mm.h | 25 +++++++++++++++++++++++++
 mm/khugepaged.c         | 32 ++++++++++++++++++++++++++++----
 mm/shmem.c              | 29 +++++------------------------
 3 files changed, 58 insertions(+), 28 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 2f190c90192d..fb4e51ef0acb 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -170,6 +170,25 @@ static inline void count_mthp_stat(int order, enum mthp_stat_item item)
 }
 #endif
 
+/*
+ * Definitions for "huge tmpfs": tmpfs mounted with the huge= option
+ *
+ * SHMEM_HUGE_NEVER:
+ *	disables huge pages for the mount;
+ * SHMEM_HUGE_ALWAYS:
+ *	enables huge pages for the mount;
+ * SHMEM_HUGE_WITHIN_SIZE:
+ *	only allocate huge pages if the page will be fully within i_size,
+ *	also respect madvise() hints;
+ * SHMEM_HUGE_ADVISE:
+ *	only allocate huge pages if requested with madvise();
+ */
+
+ #define SHMEM_HUGE_NEVER	0
+ #define SHMEM_HUGE_ALWAYS	1
+ #define SHMEM_HUGE_WITHIN_SIZE	2
+ #define SHMEM_HUGE_ADVISE	3
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 
 extern unsigned long transparent_hugepage_flags;
@@ -177,6 +196,12 @@ extern unsigned long huge_anon_orders_always;
 extern unsigned long huge_anon_orders_madvise;
 extern unsigned long huge_anon_orders_inherit;
 
+extern int shmem_huge __read_mostly;
+extern unsigned long huge_shmem_orders_always;
+extern unsigned long huge_shmem_orders_madvise;
+extern unsigned long huge_shmem_orders_inherit;
+extern unsigned long huge_shmem_orders_within_size;
+
 static inline bool hugepage_global_enabled(void)
 {
 	return transparent_hugepage_flags &
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 15203ea7d007..e64cba74eb2a 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2607,6 +2607,26 @@ static int khugepaged(void *none)
 	return 0;
 }
 
+static int thp_highest_allowable_order(void)
+{
+	unsigned long orders = READ_ONCE(huge_anon_orders_always)
+			       | READ_ONCE(huge_anon_orders_madvise)
+			       | READ_ONCE(huge_shmem_orders_always)
+			       | READ_ONCE(huge_shmem_orders_madvise)
+			       | READ_ONCE(huge_shmem_orders_within_size);
+	if (hugepage_global_enabled())
+		orders |= READ_ONCE(huge_anon_orders_inherit);
+	if (shmem_huge != SHMEM_HUGE_NEVER)
+		orders |= READ_ONCE(huge_shmem_orders_inherit);
+
+	return orders == 0 ? 0 : fls(orders) - 1;
+}
+
+static unsigned long min_thp_pageblock_nr_pages(void)
+{
+	return (1UL << min(thp_highest_allowable_order(), PAGE_BLOCK_ORDER));
+}
+
 static void set_recommended_min_free_kbytes(void)
 {
 	struct zone *zone;
@@ -2638,12 +2658,16 @@ static void set_recommended_min_free_kbytes(void)
 	 * second to avoid subsequent fallbacks of other types There are 3
 	 * MIGRATE_TYPES we care about.
 	 */
-	recommended_min += pageblock_nr_pages * nr_zones *
+	recommended_min += min_thp_pageblock_nr_pages() * nr_zones *
 			   MIGRATE_PCPTYPES * MIGRATE_PCPTYPES;
 
-	/* don't ever allow to reserve more than 5% of the lowmem */
-	recommended_min = min(recommended_min,
-			      (unsigned long) nr_free_buffer_pages() / 20);
+	/*
+	 * Don't ever allow to reserve more than 5% of the lowmem.
+	 * Use a min of 128 pages when all THP orders are set to never.
+	 */
+	recommended_min = clamp(recommended_min, 128,
+				(unsigned long) nr_free_buffer_pages() / 20);
+
 	recommended_min <<= (PAGE_SHIFT-10);
 
 	if (recommended_min > min_free_kbytes) {
diff --git a/mm/shmem.c b/mm/shmem.c
index 0c5fb4ffa03a..8e92678d1175 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -136,10 +136,10 @@ struct shmem_options {
 };
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-static unsigned long huge_shmem_orders_always __read_mostly;
-static unsigned long huge_shmem_orders_madvise __read_mostly;
-static unsigned long huge_shmem_orders_inherit __read_mostly;
-static unsigned long huge_shmem_orders_within_size __read_mostly;
+unsigned long huge_shmem_orders_always __read_mostly;
+unsigned long huge_shmem_orders_madvise __read_mostly;
+unsigned long huge_shmem_orders_inherit __read_mostly;
+unsigned long huge_shmem_orders_within_size __read_mostly;
 static bool shmem_orders_configured __initdata;
 #endif
 
@@ -516,25 +516,6 @@ static bool shmem_confirm_swap(struct address_space *mapping,
 	return xa_load(&mapping->i_pages, index) == swp_to_radix_entry(swap);
 }
 
-/*
- * Definitions for "huge tmpfs": tmpfs mounted with the huge= option
- *
- * SHMEM_HUGE_NEVER:
- *	disables huge pages for the mount;
- * SHMEM_HUGE_ALWAYS:
- *	enables huge pages for the mount;
- * SHMEM_HUGE_WITHIN_SIZE:
- *	only allocate huge pages if the page will be fully within i_size,
- *	also respect madvise() hints;
- * SHMEM_HUGE_ADVISE:
- *	only allocate huge pages if requested with madvise();
- */
-
-#define SHMEM_HUGE_NEVER	0
-#define SHMEM_HUGE_ALWAYS	1
-#define SHMEM_HUGE_WITHIN_SIZE	2
-#define SHMEM_HUGE_ADVISE	3
-
 /*
  * Special values.
  * Only can be set via /sys/kernel/mm/transparent_hugepage/shmem_enabled:
@@ -551,7 +532,7 @@ static bool shmem_confirm_swap(struct address_space *mapping,
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 /* ifdef here to avoid bloating shmem.o when not necessary */
 
-static int shmem_huge __read_mostly = SHMEM_HUGE_NEVER;
+int shmem_huge __read_mostly = SHMEM_HUGE_NEVER;
 static int tmpfs_huge __read_mostly = SHMEM_HUGE_NEVER;
 
 /**
-- 
2.47.1

