Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AF51DB124
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747781992; cv=none; b=ioj3m3cJTjzOZ2bhu/4U4QQBo3WDge2ocaALwi0BMolSGahgivtrzBqOU2rqRltPojYLCIn3r2Zz6PaqLjsDlQazk8wz6wd1w4kwbOdaBGe2l+xjts/D/3UAljuNFbgYqLJtxyINYTxKFyBA4jI5CHZqDKB0A1qY1hhouKPrgWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747781992; c=relaxed/simple;
	bh=OXOBd5vzyaN1fcj3HkvVnNwrviGVBXR43nbnx6Bj0zA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hSryURP89qBfbx4mzcp5B1QzJE+wMOd/7/D6tEhvInAyHhn4nNY8I80usS63x8o09jYA1//VwD3+LnjlvjUzY6GUlk8vXxRs25Vll7Tp913qMIaCS6XFknx+Jr3g7BrElO7HHO0NguiV1qjQpi1Lv2pQEpTIb+7hWrvXuIb8Eb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DKaG8zqk; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DKaG8zqk"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-742b01ad1a5so6326792b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747781990; x=1748386790; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yB8aim8HxUp/n3Yxwl7PRfHOraLRugpIEFAuZVn3uCk=;
        b=DKaG8zqkiFKkPUhxU32G/itBx+GGwfvyFkI1fvNXtYliBufWZ8GVGfgM+3RPjvFm+F
         Sh4u2wdUDsIoL7Ht8OR6jT1RiXsyi3G3RT0eJ1HGjWu7H1+VqgUrWrYjBowKanJQiCEB
         wVXvf38gg8EgrRJBDQ0NX1XOhR6uf+qGwzIBVBiHdeHuTh+7H6ZP0aW+KGVnu1jxgi3Y
         F1I37VSngBe8iOehgOb5fIc3kmGsLIYsYS8mw+SKDRuaGQ0pcbfakj72xAnXkAG0jNnz
         C8PWeEb5IdeARmk/XA7VxClDsgd7Zrxzn8OwM5BWLeJNAyWITuQD1djwHRSKsKZURtuh
         wpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747781990; x=1748386790;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yB8aim8HxUp/n3Yxwl7PRfHOraLRugpIEFAuZVn3uCk=;
        b=QK1TFb7T6U4xoFKBloyGdH9UqFEcPGJcWANWMuJ1oUOEKLEIpbEdS4bhQ1LmXGX+FW
         WkyOURupNzdf1UZlq+zXN7pmowReR1hhEPSpBF26NQewT0ONGQtwR6e2puqa5KMPeJpN
         wUC2XTpEf5CVtZL0f+v0OxH7lMMSh3TYCFxSlOB/zyAWUhdgrb7ES+9a5wM/pkdsBQkD
         hIz7JUYW8lL42AqGWM8txr9Re+T68QlQWTHzJFNSS5GPkCcGD9s81slgtIfFKX7oCx1/
         u+ssSW9+JFT2GgPCKskYnB2azSPNvkxE2Ih3AJw+xgdcJMsxy+aqZ60DihlUYeuaJMLN
         2cvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSRe/6JKdP57jdoljLhqlZ1lEZzI3GWW4mBgkUCX8FU9kFffo+622h1XCD36E57FSdmrxxCxwu3F6Hq1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfjp1Ilpf/UcM4QQKEqo1XSzvgRgf+UyIym213LvpYvL9nI4rs
	THM99JMoNmXYXyAsd+prB3RqrX1qkV/tywpFbL9EUgULzjdybr4ngtNbHbyNngRCnDyg/ESnsB0
	9ZevxrWEU6A==
X-Google-Smtp-Source: AGHT+IH6b52t8Y3G9I/VM3O9T3BG3LQ5av9EpjvEbeZWHVReqQ1O01cg1qPmn/VCTv/2ZgjpEWHY5Uby+C28
X-Received: from pfbfb3.prod.google.com ([2002:a05:6a00:2d83:b0:736:9d24:ae31])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a06:b0:736:5c8e:baaa
 with SMTP id d2e1a72fcca58-742acc8e94cmr25591985b3a.2.1747781989947; Tue, 20
 May 2025 15:59:49 -0700 (PDT)
Date: Tue, 20 May 2025 15:59:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250520225945.991229-1-jyescas@google.com>
Subject: [PATCH v6] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
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
   4KiB   |      10        |      10         |  4KiB * (2 ^ 10)  =  4MiB
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
 3 files changed, 54 insertions(+), 4 deletions(-)

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
-- 
2.49.0.1112.g889b7c5bd8-goog

