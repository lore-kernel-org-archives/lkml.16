Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1902367CF
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 21:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747864693; cv=none; b=toxEln9g9yO3nqIySWB7KgRWlVfHHf4AQt+rujfHGyCJSfMoSmeRRTzc/SNegakBH5I4SFHQxGuCBForVF8lRiGB+Ry2Vxp/ZRS3LMv2yS4O16vSz7/OOi8rgi059Dd4kbiwdjZ7cE9rZICRct4X27nDTjFTUESr7oNZWaq0sCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747864693; c=relaxed/simple;
	bh=F8ldumZNG6TdtaLY0kXWVWu78ZAGFEBcpDQNxt/iU2w=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=c3Q2lt8H+RkFPjWbZO4tA9ysM7FMfB36N04RmcxIQg04tP+GZgfiGZd+SV4bmE+gohOCCLNFWiSjvYTFAG3KiXfCHWgO/q8FTIuueE/bMBvKsbeuo11h+2MEqWHrs6MU+T8Dh3oXLYm1/Qnx89QFFfGEvVCMmwahmnVpYjwEZ9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xWbinlM3; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xWbinlM3"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7394772635dso5363892b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747864691; x=1748469491; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=el4Dd0m8a/fOGplojvOcuXYWIbG/ywyVgqHsfpMvSSI=;
        b=xWbinlM3F/iuyuZX5DnXw6iX3BRCwQuLCZmXyQVWfdQVaCmuc9gNnHBrpXIZSWpyKO
         FleFB+u/St+G/xAgTMt24cH/uOkHLVIK06ydV5/p6T7potWxbxwbyEK3PUvNJB+iW+hh
         RPD3UgUXr3Ry8gaShgrDJmiExij5UTR+p76Uyb2teJY/+/Wz/InS+qZdglhLpGMvSwn6
         BAkWVUumG3KzAGXRz1TntubAN+SnJZJ7oT+Q0ju9LE7kcMhJ48RHaRn1VUmapx4G8hT4
         xocwSMMOXYNouAajHq9cWbpsGvsHy0gc3KSWcLVQZcUHo/q1Wq4y/QgbhQ6xAStBUJ5E
         Ba1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747864691; x=1748469491;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=el4Dd0m8a/fOGplojvOcuXYWIbG/ywyVgqHsfpMvSSI=;
        b=SFguLnn2cJndcJSjkwxbBq2Dt6i6iboG3aZSHhN/cQfamrYE6H+0Wst7SE3m5tvp++
         QU1XEszIBaw2U8KdosvFIzDN/2wI9F663RVi6z6hXxoDnEaaljcstpxRbYi8vOl9IoZX
         LSJ2WS2aY8uSFe2s0K5CqC73XcKYW3za8Bv6R8fZEaeAhoKOj5G5B+2Q8qaaD9wXBt33
         wuUan6+5tKLV6eCYqXf7F9wl+I40Q+LknE2oY7xXfIVgrgWYPuHVVxmoEl+Ryc0q622p
         2y6DljVohFy25XJSWOLIURXf5zWquvZsMflfybVQXVvf+dM5AnI0QJnggcTduzm6gbl6
         eIRg==
X-Forwarded-Encrypted: i=1; AJvYcCWOivrEwCRUD63AUBaZ8QJ2kR9VmdIDdbhlHYeu5fhzgZkT2gSYTF+ZcV+6orHwwFmAMQFsEacQZ4MfMiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6qz96ToUNyAhVadrVMqvrejb6f6HUIZSUBtPKRe+KZXYCxyek
	3HyQc6eholDTYAMmAmOtOJ4A77OSyjFBVD0Ilxw5NcrNgvtyqnJmkJt4XwzJvIAWPmnJcJ+/p/z
	cnrKvb0VxXw==
X-Google-Smtp-Source: AGHT+IEZn6rur6/gnO9De4Zq3up1HMcj0eMjKblw43oh13iMWFKMc9F0JoX/YucCsBiBQbky93ivlA4HozSw
X-Received: from pfbeg26.prod.google.com ([2002:a05:6a00:801a:b0:742:a83f:bc00])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3492:b0:740:596e:1489
 with SMTP id d2e1a72fcca58-742acd736e4mr28533320b3a.23.1747864691174; Wed, 21
 May 2025 14:58:11 -0700 (PDT)
Date: Wed, 21 May 2025 14:57:45 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <20250521215807.1860663-1-jyescas@google.com>
Subject: [PATCH v7] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
From: Juan Yescas <jyescas@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Juan Yescas <jyescas@google.com>, Zi Yan <ziy@nvidia.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: tjmercier@google.com, isaacmanjarres@google.com, kaleshsingh@google.com, 
	masahiroy@kernel.org, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Problem: On large page size configurations (16KiB, 64KiB), the CMA
alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
and this causes the CMA reservations to be larger than necessary.
This means that system will have less available MIGRATE_UNMOVABLE and
MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to them.

The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.

For example, in ARM, the CMA alignment requirement when:

- CONFIG_ARCH_FORCE_MAX_ORDER default value is used
- CONFIG_TRANSPARENT_HUGEPAGE is set:

PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTES
-----------------------------------------------------------------------
   4KiB   |      10        |       9         |  4KiB * (2 ^  9) =   2MiB
  16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =  32MiB
  64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB

There are some extreme cases for the CMA alignment requirement when:

- CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
- CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
- CONFIG_HUGETLB_PAGE is NOT set

PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYTES
------------------------------------------------------------------------
   4KiB   |      15        |      15         |  4KiB * (2 ^ 15) = 128MiB
  16Kib   |      13        |      13         | 16KiB * (2 ^ 13) = 128MiB
  64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB

This affects the CMA reservations for the drivers. If a driver in a
4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
reservation has to be 32MiB due to the alignment requirements:

reserved-memory {
    ...
    cma_test_reserve: cma_test_reserve {
        compatible = "shared-dma-pool";
        size = <0x0 0x400000>; /* 4 MiB */
        ...
    };
};

reserved-memory {
    ...
    cma_test_reserve: cma_test_reserve {
        compatible = "shared-dma-pool";
        size = <0x0 0x2000000>; /* 32 MiB */
        ...
    };
};

Solution: Add a new config CONFIG_PAGE_BLOCK_ORDER that
allows to set the page block order in all the architectures.
The maximum page block order will be given by
ARCH_FORCE_MAX_ORDER.

By default, CONFIG_PAGE_BLOCK_ORDER will have the same
value that ARCH_FORCE_MAX_ORDER. This will make sure that
current kernel configurations won't be affected by this
change. It is a opt-in change.

This patch will allow to have the same CMA alignment
requirements for large page sizes (16KiB, 64KiB) as that
in 4kb kernels by setting a lower pageblock_order.

Tests:

- Verified that HugeTLB pages work when pageblock_order is 1, 7, 10
on 4k and 16k kernels.

- Verified that Transparent Huge Pages work when pageblock_order
is 1, 7, 10 on 4k and 16k kernels.

- Verified that dma-buf heaps allocations work when pageblock_order
is 1, 7, 10 on 4k and 16k kernels.

Benchmarks:

The benchmarks compare 16kb kernels with pageblock_order 10 and 7. The
reason for the pageblock_order 7 is because this value makes the min
CMA alignment requirement the same as that in 4kb kernels (2MB).

- Perform 100K dma-buf heaps (/dev/dma_heap/system) allocations of
SZ_8M, SZ_4M, SZ_2M, SZ_1M, SZ_64, SZ_8, SZ_4. Use simpleperf
(https://developer.android.com/ndk/guides/simpleperf) to measure
the # of instructions and page-faults on 16k kernels.
The benchmark was executed 10 times. The averages are below:

           # instructions         |     #page-faults
    order 10     |  order 7       | order 10 | order 7
--------------------------------------------------------
 13,891,765,770	 | 11,425,777,314 |    220   |   217
 14,456,293,487	 | 12,660,819,302 |    224   |   219
 13,924,261,018	 | 13,243,970,736 |    217   |   221
 13,910,886,504	 | 13,845,519,630 |    217   |   221
 14,388,071,190	 | 13,498,583,098 |    223   |   224
 13,656,442,167	 | 12,915,831,681 |    216   |   218
 13,300,268,343	 | 12,930,484,776 |    222   |   218
 13,625,470,223	 | 14,234,092,777 |    219   |   218
 13,508,964,965	 | 13,432,689,094 |    225   |   219
 13,368,950,667	 | 13,683,587,37  |    219   |   225
-------------------------------------------------------------------
 13,803,137,433  | 13,131,974,268 |    220   |   220    Averages

There were 4.85% #instructions when order was 7, in comparison
with order 10.

     13,803,137,433 - 13,131,974,268 = -671,163,166 (-4.86%)

The number of page faults in order 7 and 10 were the same.

These results didn't show any significant regression when the
pageblock_order is set to 7 on 16kb kernels.

- Run speedometer 3.1 (https://browserbench.org/Speedometer3.1/) 5 times
 on the 16k kernels with pageblock_order 7 and 10.

order 10 | order 7  | order 7 - order 10 | (order 7 - order 10) %
-------------------------------------------------------------------
  15.8	 |  16.4    |         0.6        |     3.80%
  16.4	 |  16.2    |        -0.2        |    -1.22%
  16.6	 |  16.3    |        -0.3        |    -1.81%
  16.8	 |  16.3    |        -0.5        |    -2.98%
  16.6	 |  16.8    |         0.2        |     1.20%
-------------------------------------------------------------------
  16.44     16.4            -0.04	          -0.24%   Averages

The results didn't show any significant regression when the
pageblock_order is set to 7 on 16kb kernels.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>
CC: Mike Rapoport <rppt@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Minchan Kim <minchan@kernel.org>
Signed-off-by: Juan Yescas <jyescas@google.com>
Acked-by: Zi Yan <ziy@nvidia.com>
---
Changes in v7:
  - Update alignment calculation to 2MiB as per David's
    observation.
  - Update page block order calculation in mm/mm_init.c for
    powerpc when CONFIG_HUGETLB_PAGE_SIZE_VARIABLE is set.

Changes in v6:
  - Applied the change provided by Zi Yan to fix
    the Kconfig. The change consists in evaluating
    to true or false in the if expression for range:
    range 1 <symbol> if <expression to eval true/false>.

Changes in v5:
  - Remove the ranges for CONFIG_PAGE_BLOCK_ORDER. The
    ranges with config definitions don't work in Kconfig,
    for example (range 1 MY_CONFIG).
  - Add PAGE_BLOCK_ORDER_MANUAL config for the
    page block order number. The default value was not
    defined.
  - Fix typos reported by Andrew.
  - Test default configs in powerpc. 

Changes in v4:
  - Set PAGE_BLOCK_ORDER in incluxe/linux/mmzone.h to
    validate that MAX_PAGE_ORDER >= PAGE_BLOCK_ORDER at
    compile time.
  - This change fixes the warning in:
    https://lore.kernel.org/oe-kbuild-all/202505091548.FuKO4b4v-lkp@intel.com/

Changes in v3:
  - Rename ARCH_FORCE_PAGE_BLOCK_ORDER to PAGE_BLOCK_ORDER
    as per Matthew's suggestion.
  - Update comments in pageblock-flags.h for pageblock_order
    value when THP or HugeTLB are not used.

Changes in v2:
  - Add Zi's Acked-by tag.
  - Move ARCH_FORCE_PAGE_BLOCK_ORDER config to mm/Kconfig as
    per Zi and Matthew suggestion so it is available to
    all the architectures.
  - Set ARCH_FORCE_PAGE_BLOCK_ORDER to 10 by default when
    ARCH_FORCE_MAX_ORDER is not available.

 include/linux/mmzone.h          | 16 ++++++++++++++++
 include/linux/pageblock-flags.h |  8 ++++----
 mm/Kconfig                      | 34 +++++++++++++++++++++++++++++++++
 mm/mm_init.c                    |  2 +-
 4 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 6ccec1bf2896..05610337bbb6 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -37,6 +37,22 @@
 
 #define NR_PAGE_ORDERS (MAX_PAGE_ORDER + 1)
 
+/* Defines the order for the number of pages that have a migrate type. */
+#ifndef CONFIG_PAGE_BLOCK_ORDER
+#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
+#else
+#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
+#endif /* CONFIG_PAGE_BLOCK_ORDER */
+
+/*
+ * The MAX_PAGE_ORDER, which defines the max order of pages to be allocated
+ * by the buddy allocator, has to be larger or equal to the PAGE_BLOCK_ORDER,
+ * which defines the order for the number of pages that can have a migrate type
+ */
+#if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
+#error MAX_PAGE_ORDER must be >= PAGE_BLOCK_ORDER
+#endif
+
 /*
  * PAGE_ALLOC_COSTLY_ORDER is the order at which allocations are deemed
  * costly to service.  That is between allocation orders which should
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index fc6b9c87cb0a..e73a4292ef02 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -41,18 +41,18 @@ extern unsigned int pageblock_order;
  * Huge pages are a constant size, but don't exceed the maximum allocation
  * granularity.
  */
-#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, MAX_PAGE_ORDER)
+#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, PAGE_BLOCK_ORDER)
 
 #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
 
 #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
 
-#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, MAX_PAGE_ORDER)
+#define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)
 
 #else /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-/* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
-#define pageblock_order		MAX_PAGE_ORDER
+/* If huge pages are not used, group by PAGE_BLOCK_ORDER */
+#define pageblock_order		PAGE_BLOCK_ORDER
 
 #endif /* CONFIG_HUGETLB_PAGE */
 
diff --git a/mm/Kconfig b/mm/Kconfig
index e113f713b493..13a5c4f6e6b6 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -989,6 +989,40 @@ config CMA_AREAS
 
 	  If unsure, leave the default value "8" in UMA and "20" in NUMA.
 
+#
+# Select this config option from the architecture Kconfig, if available, to set
+# the max page order for physically contiguous allocations.
+#
+config ARCH_FORCE_MAX_ORDER
+	int
+
+#
+# When ARCH_FORCE_MAX_ORDER is not defined,
+# the default page block order is MAX_PAGE_ORDER (10) as per
+# include/linux/mmzone.h.
+#
+config PAGE_BLOCK_ORDER
+	int "Page Block Order"
+	range 1 10 if ARCH_FORCE_MAX_ORDER = 0
+	default 10 if ARCH_FORCE_MAX_ORDER = 0
+	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER != 0
+	default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER != 0
+	help
+	  The page block order refers to the power of two number of pages that
+	  are physically contiguous and can have a migrate type associated to
+	  them. The maximum size of the page block order is limited by
+	  ARCH_FORCE_MAX_ORDER.
+
+	  This config allows overriding the default page block order when the
+	  page block order is required to be smaller than ARCH_FORCE_MAX_ORDER
+	  or MAX_PAGE_ORDER.
+
+	  Reducing pageblock order can negatively impact THP generation
+	  success rate. If your workloads uses THP heavily, please use this
+	  option with caution.
+
+	  Don't change if unsure.
+
 config MEM_SOFT_DIRTY
 	bool "Track memory changes"
 	depends on CHECKPOINT_RESTORE && HAVE_ARCH_SOFT_DIRTY && PROC_FS
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 327764ca0ee4..ada5374764e4 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1511,7 +1511,7 @@ static inline void setup_usemap(struct zone *zone) {}
 /* Initialise the number of pages represented by NR_PAGEBLOCK_BITS */
 void __init set_pageblock_order(void)
 {
-	unsigned int order = MAX_PAGE_ORDER;
+	unsigned int order = PAGE_BLOCK_ORDER;
 
 	/* Check that pageblock_nr_pages has not already been setup */
 	if (pageblock_order)
-- 
2.49.0.1143.g0be31eac6b-goog

