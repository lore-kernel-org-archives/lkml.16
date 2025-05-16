Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7A7CA6B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 23:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747437827; cv=none; b=LWbCEy4Gb7xI5iTvYTkOpje0C5pV8wONp+nUFvHF3Q4PL+ul74kY7DMfDUMeQkJTDoahRoHv7HFCjXs1EfZ5iHSV/MMoEmQlJwJuqqV4IoxtDk1FID4RTopmWSrp5Ol5MbAYGHYq/I81zeGW7UfFHNWzZzDvOEZkKMap/ytQIdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747437827; c=relaxed/simple;
	bh=CvbXUKeS4In5BNmfC7cG82BHB4VXR8B7hpqt4ms4S8U=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=UTbOCrGYQMROikoffxF7s1/auDkTIrLFpHtKYjApzJIqq/fAFUYVjSTwu+eJ2Hzz8UC1zhho550ieFdhijLf9Cqpn2CfJp2qRHWGV4wyRR2UNPRW0/wG+FzCh3L2f93iqC8mKlWOQ+/cDs4DW/WE5kWpLNTvwW1zmQ4hEijD5Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jYLfc4GK; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jYLfc4GK"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742512d307bso4328682b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747437825; x=1748042625; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Qy75UNCDbhvgShF7QirTdkT6HEAxA37LSBHQ4luFaE=;
        b=jYLfc4GKeaRlkVz4jpXBAx0wu3fXjtmLzxBSMtNRYYKRxvHxTVJa+feY7gh63cZwxD
         mpojJ6srFLDsIqWlm4SbTUKe3vN8foyoPdExX5vpWPckEqJ4BmcKBHTLpzmvVxnGXMgw
         qtv7P8AwR0Ab/K9GCwCyt9+Brnp1aq3ZwY1BYqcfAsG8CrCCWfJb0v6stXs+l3OLjlD8
         QpgNCuTvMt1jPS8G4aWmSsAS9NOxv46ooHvN3BmcpZrZvkWqRKFSdVuIXWZXJievBwW3
         hJfaYCF50ggWEV/ZU6hAOtvLAOBwqjuK588HoLCcpS6UThhXgiKiC/+HUu8TVBtUScQ4
         IazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747437825; x=1748042625;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Qy75UNCDbhvgShF7QirTdkT6HEAxA37LSBHQ4luFaE=;
        b=wRfIPqmUIcyf0hAFdFDQx+GXJsqZovCFxffqDn2n4F2xQRVsIR8zq2bAVcxXfrnlxZ
         y2+FMuTsNFA3NL9Zg8smqAEAPnUZYfjW5TmfyaTpoi5YzY/1jZVXcyHAyeeGStykdUoz
         SLqZcFdHjo7T+uXev50Aat8DJPOLRYtOLcLXI5f9xhvL3CT2NyDF2ReyXRzo1elR5nV7
         xw+L+tA9DGUGuMWItWTzkbcYhfqM+vdm6CGAR2Ya+wYcPc0puDXaBugYQoS5El/n76kB
         k/Keua6IWdSWRRuconzqAUvxYHbkqUgBB8597l6TS4aqvzBnpqf+wIkwfakwtFCzDk3C
         YRVA==
X-Forwarded-Encrypted: i=1; AJvYcCU3U/iZL+Bfeg7Y+yQUgizep3F+/73/KUAhYol/TEFbcvRquVWxUwm3i4ETQW49+QUqB4FS+E6E3QeKNEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb1M0mSio+NcmGVirXSZGLaLVJgQyB3f6YOdbYpp66bVgOZwEu
	ReNXNQkvwL5zCAb3LXzYKyCFYjFJ1Z3v+/1rpddpLZIDmoVArwRd/ydfKkLAYatskXctbUlKmBZ
	2m2fNk+cGAg==
X-Google-Smtp-Source: AGHT+IE5elXbSEvAhAu/1u+W1DmV8E5CTaDvcfkH0DVNNds39b3JQLhXRejeRYVGv96d8CPoJ59HFSZvuyk4
X-Received: from pgbdv10.prod.google.com ([2002:a05:6a02:446a:b0:b21:13c5:ed97])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9183:b0:215:dd02:4473
 with SMTP id adf61e73a8af0-2170cde5191mr7338958637.32.1747437824945; Fri, 16
 May 2025 16:23:44 -0700 (PDT)
Date: Fri, 16 May 2025 16:23:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516232341.659513-1-jyescas@google.com>
Subject: [PATCH v5] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
From: Juan Yescas <jyescas@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Juan Yescas <jyescas@google.com>, Zi Yan <ziy@nvidia.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: tjmercier@google.com, isaacmanjarres@google.com, kaleshsingh@google.com, 
	Minchan Kim <minchan@kernel.org>
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
 mm/Kconfig                      | 30 ++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 6ccec1bf2896..6fdb8f7f74d6 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -37,6 +37,22 @@
 
 #define NR_PAGE_ORDERS (MAX_PAGE_ORDER + 1)
 
+/* Defines the order for the number of pages that have a migrate type. */
+#ifndef CONFIG_PAGE_BLOCK_ORDER_MANUAL
+#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
+#else
+#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER_MANUAL
+#endif /* CONFIG_PAGE_BLOCK_ORDER_MANUAL */
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
index e113f713b493..bd8012b30b39 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -989,6 +989,36 @@ config CMA_AREAS
 
 	  If unsure, leave the default value "8" in UMA and "20" in NUMA.
 
+config PAGE_BLOCK_ORDER
+	bool "Allow setting a custom page block order"
+	default n
+	help
+	  This config allows overriding the default page block order when the
+	  page block order is required to be smaller than ARCH_FORCE_MAX_ORDER or
+	  MAX_PAGE_ORDER.
+
+	  If unsure, do not enable it.
+
+#
+# When PAGE_BLOCK_ORDER is not enabled or ARCH_FORCE_MAX_ORDER is not defined,
+# the default page block order is MAX_PAGE_ORDER (10) as per
+# include/linux/mmzone.h.
+#
+config PAGE_BLOCK_ORDER_MANUAL
+	int "Page Block Order"
+	depends on PAGE_BLOCK_ORDER
+	help
+	  The page block order refers to the power of two number of pages that
+	  are physically contiguous and can have a migrate type associated to
+	  them. The maximum size of the page block order is limited by
+	  ARCH_FORCE_MAX_ORDER.
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
2.49.0.1101.gccaa498523-goog

