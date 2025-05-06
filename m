Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF15C321ACE
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 00:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746491008; cv=none; b=uExtqRa/MHkU9j3tMxko1Khk/k8JQ2wFRFEipezaO8E2TkIl0TCa77zlHcwjhVDBYReYRBxyixuDGikuPxQKaQqk0ZiByX0q2TZhvzueaIhsWf1ViHhtfugskgTnR42b8hI81rXy/GtYLq1KJ/aPZoThBQjg4l9MUdhiLkxIPgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746491008; c=relaxed/simple;
	bh=bq3mLkGFG4qJT2rFNJJU+2sz284BYbzKvlS4JglvI9A=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rJvWdHekiUzvv51kHsJbiFc+kb1tLN6ezntM0h1NS2PzqpGAvWidGgl9nq1rVuKhZLaFUIP01Uq9zX5sT5SpNboRWZxjRTTBdjvxg1IlPezIPmTP0zGFnuHl1CjBZIXqv8Ot/9AtVjFM56OL580MWve3Bg9JTKoqB3bDEMH5WEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XhB1xJ7x; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XhB1xJ7x"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-72b90565341so1210364a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 17:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746491005; x=1747095805; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ky7Ox4614Ju9ch/TWPsIUc4fTfh+nlNJiyC+j1YiieA=;
        b=XhB1xJ7x19esM0G2SoCL9QUC7y77cy1CZey7254wqoBoVjyo+3ms5/CZT5D4vk3MA5
         OJ1mRrXL1pS0BHrA3WDtKA1FgY8hwDMX9kW3BajY8a+Y8fsaywYV/JKF6W475MVUxuVC
         9OXNhDj8uAqAZoxR5fxjSE+eQVq/YW30YWnytdQT/iSq4hk+w1f/IRhtIzLSKj9vbIxV
         lccpLv+XarX21l9XODdYlZ99yZTB+qyPa66xPsNTRK78S/2RPpMGB3WPILo3PFXqkZ6h
         XrnxJNMPal/+uDHgBce+ULSeAxeiAU1tdxra81UbH13WCH1D53OGz/7A90LMEh4GkjuC
         n47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746491005; x=1747095805;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ky7Ox4614Ju9ch/TWPsIUc4fTfh+nlNJiyC+j1YiieA=;
        b=sYB0ihdq/d8mpm6m97vygQmdZY9mHDDP/FZXgKcLfm9blP3MDgXGuaFBRMZCkmEOJG
         TVo8yfmnCqNjHCujo0io4s/IwuuPRiKgUrCIgKly5cw8Z9FoDB15FtzWzfy5ZtVOx4Bw
         KyGgQiCrY5pImZPGjjxBnK0i178rPoTDgGNUw5iihtsQlPt81U+ugfQUcnJm98BjCKrJ
         6NggvkPe4ZM7kz23t5TLNKdHWJ99V6nN1btt8HbinkftuMHc/w3GTsBUUX+iMSWhvMDC
         k5Xzi5Ik++bv1FSxa2RQsRpbrAKjvK1QpGy6UyKRH1evXkk0ket4wA3c09nR6E+uRnWI
         vcOw==
X-Forwarded-Encrypted: i=1; AJvYcCXeZrnQKc23gWkmEkW8S3/GZ/NNl180s7B0Z6YUmTP0Fd7sNfQcJlth8ayjnuOO2wXzw5PFMR5J6h9xQi4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2X/ljhLHkE4GGuGid9JJrC0fklMKp1xi1Jcl57EPPgV/xhsKC
	MPxyICbbXzWgxcjHwK1cUcmIGTt8kUkGwTVccOKNCCJcvJQIH+LklY8mLhiYjWHtUlNmVUDiXfF
	hOHmmPg==
X-Google-Smtp-Source: AGHT+IGTYWrQCtVFnG6Sm8ybMYB3XLNPBp4NAwjj+gz5NG9EEwQSQh0InXP3Bp6+FcM/pbAkgkD7sZ0K8zNF
X-Received: from oabwq2.prod.google.com ([2002:a05:6871:aa02:b0:2b7:fdc9:21f4])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:6aa:b0:2bd:456c:92a
 with SMTP id 586e51a60fabf-2db38be6b1dmr1020715fac.10.1746491004738; Mon, 05
 May 2025 17:23:24 -0700 (PDT)
Date: Mon,  5 May 2025 17:22:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506002319.513795-1-jyescas@google.com>
Subject: [PATCH v3] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block order
From: Juan Yescas <jyescas@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Juan Yescas <jyescas@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
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




 include/linux/pageblock-flags.h | 14 ++++++++++----
 mm/Kconfig                      | 31 +++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index fc6b9c87cb0a..0c4963339f0b 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -28,6 +28,12 @@ enum pageblock_bits {
 	NR_PAGEBLOCK_BITS
 };
 
+#if defined(CONFIG_PAGE_BLOCK_ORDER)
+#define PAGE_BLOCK_ORDER CONFIG_PAGE_BLOCK_ORDER
+#else
+#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
+#endif /* CONFIG_PAGE_BLOCK_ORDER */
+
 #if defined(CONFIG_HUGETLB_PAGE)
 
 #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
@@ -41,18 +47,18 @@ extern unsigned int pageblock_order;
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
2.49.0.967.g6a0df3ecc3-goog

