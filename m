Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E381E833F
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 01:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746839025; cv=none; b=KOiQ/v1dsaXWfQClWx/hYZ4ggJVpsJGkPUZzyc24xxUwKRylKXsROtPrkzmUc/7MROCaQ2W+LW57mBoI64QCg0PoMQ9BViGM4ufuMpsHcg/XX8XjQXf0yQbiJlqyySmY2AgELFbvEQ+f0XhcRzw4JTTPeYRtW4fHIhXMIzqoI2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746839025; c=relaxed/simple;
	bh=GzbBa7N5yioToJ4n7rsYK0dpCrTxbABqXRKGcBd0gPY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mVWnhLALZL4bmqYz1/cuhDOkBI1m6paynh9K6T/vIFHAUlKUZIJJi/McbTx2KR5MblczOgH4GLgW3eMouSsFN9+/80IdgrUvOJuJFQOhwPon2F6XDZU5rlYSLku/1qn1MLi7pzEIYg31a422BuDzZpF4+njp2lGQb3APxByMu2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mjq1GyCF; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mjq1GyCF"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b19226b5f7dso2007422a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 18:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746839023; x=1747443823; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Tvo3FZoXlad3NYzgpQbzOd0YMDZcfajMFd6LAU0Xdw=;
        b=Mjq1GyCFtVtO0SezWYm+HMW47JfPC//3PCOo9C8drpmIc5EU4/ecjMvfJsRKggx5VS
         +7VS600Nw6zhqGzSk37DxEQErjiVMwe11drA9qM4ncQ+dsX9mqi8HRJKn7fC3kOHF4OE
         Vaz/u9dr5m5qBeHUxQVcZBECr9Y2FtsoowvKZvrxYIL1/Yy4naZpbv2hm8PqbbOTkg+Q
         bErhfIEjgbDjWlvfH3alzGK8MhmQqmVhNkRNJckzin02qxmNwMbzuMLqtSOHIPfz/3E2
         BsXdlBDNtpijHlzd4UChDWD1ScsYsgyeWRKlw+TYcC1IUCVjZOELD4qEsoQlEwrVpQ10
         kSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746839023; x=1747443823;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Tvo3FZoXlad3NYzgpQbzOd0YMDZcfajMFd6LAU0Xdw=;
        b=GzYBYKnMtVMxpWFO6WJ0Pv6BfWrb6o6j6DpXu//1bbvcsPgsTl9ciCkuYqo76+J+MV
         9GPuSQVZ+FldqLz6yeDF8dwWHZXoJx8J+gLMdgWTu+ITl0La9WL+Wv5v0B5gCOoHmtdr
         4HNc7XahDVVN80WZ5ql0V6qJ+ZtxYMEc6LIFzoxskQ2auOG85MJNSmOn2kwzPkMYr4sE
         oua+wTrBrjVQNVEHuhnThkVJkSA1OONgYzWiuiySJa1j1B+UUCbiNGD2QQYyanSbFK82
         EGppajC/l6HNkFa8s4oQ0wgRsjCQhrXrhaRoxD/4ucyxun1lvENo8rPN1iuoeL8CGGDb
         2WAg==
X-Forwarded-Encrypted: i=1; AJvYcCV8HgApPcUZSdX/lM2tpIzI6Sd6HflQ0SlaE5rSdJPUZEVsLdvzkBolzTZ69cI8GQLk98QCJQEaJDr2sFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg/KXaMgFXS3rkL4JEhrqugEsmy47U+XGWm0agZ8uALQT4yNMl
	/EKfq13ceGcMiHfUX1WSf+smPEFZO7MLJGfq7IoITQf1prvs8W7V9yAorJCT3/SmZnlfN9xfR4a
	YvMDXhg==
X-Google-Smtp-Source: AGHT+IF2wiZPCkqJCWx2fKTw90ICi2I3OYtZL9JzuUZH2RjwlOPm82b+qZXAy4OJs6kosFPmwtMr/uUiQH20
X-Received: from pgbck5.prod.google.com ([2002:a05:6a02:905:b0:b15:3ae4:b427])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a2c:b0:1fe:61a4:7210
 with SMTP id adf61e73a8af0-21599f766b2mr13981425637.2.1746839022955; Fri, 09
 May 2025 18:03:42 -0700 (PDT)
Date: Fri,  9 May 2025 18:02:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250510010338.3978696-1-jyescas@google.com>
Subject: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
From: Juan Yescas <jyescas@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Juan Yescas <jyescas@google.com>, 
	Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: tjmercier@google.com, isaacmanjarres@google.com, surenb@google.com, 
	kaleshsingh@google.com, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
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
 mm/Kconfig                      | 31 +++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 4 deletions(-)

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
index e113f713b493..c52be3489aa3 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -989,6 +989,37 @@ config CMA_AREAS
 
 	  If unsure, leave the default value "8" in UMA and "20" in NUMA.
 
+#
+# Select this config option from the architecture Kconfig, if available, to set
+# the max page order for physically contiguous allocations.
+#
+config ARCH_FORCE_MAX_ORDER
+	int
+
+# When ARCH_FORCE_MAX_ORDER is not defined, the default page block order is 10,
+# as per include/linux/mmzone.h.
+config PAGE_BLOCK_ORDER
+	int "Page Block Order"
+	range 1 10 if !ARCH_FORCE_MAX_ORDER
+	default 10 if !ARCH_FORCE_MAX_ORDER
+	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
+	default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
+
+	help
+	  The page block order refers to the power of two number of pages that
+	  are physically contiguous and can have a migrate type associated to
+	  them. The maximum size of the page block order is limited by
+	  ARCH_FORCE_MAX_ORDER.
+
+	  This option allows overriding the default setting when the page
+	  block order requires to be smaller than ARCH_FORCE_MAX_ORDER.
+
+	  Reducing pageblock order can negatively impact THP generation
+	  successful rate. If your workloads uses THP heavily, please use this
+	  option with caution.
+
+	  Don't change if unsure.
+
 config MEM_SOFT_DIRTY
 	bool "Track memory changes"
 	depends on CHECKPOINT_RESTORE && HAVE_ARCH_SOFT_DIRTY && PROC_FS
-- 
2.49.0.1015.ga840276032-goog

