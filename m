Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3625680
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746471409; cv=none; b=R0p2+wlgAVIxEyfSBRtJeM7S6KQfU16JUnF67otQDInEJ02xaMtQu08/6MIk4NJz9gzclDeeynmFV5ajXrmAOkoxt5FNlK+oqSJRIgiDx0G9FId3i3lJ4YHuJL51GWlvBFZrmDJh9on5XVe7AQorJY8S+J87SfTsn4UsgJUBZNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746471409; c=relaxed/simple;
	bh=cywvJlGq8YiX76fb6CHleawHs766IY9MRthPt6ppZNo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pmjiGZjaPs+CJQOKxQxIIxVGcAPRHnoqEgH/yirWwpSNWbQla0JlGYkmbbO/ntT/+m2OjwlR9PvoY7s0doX5CliAtNa04IpilcT2puSLMCg/hfNgf17xndiECfRmapDjf3BpG8RFz3QwNFK1k6pDrdVDQcei27shcGBgTjPxi04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bw9RTNEd; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bw9RTNEd"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-227ed471999so39936375ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 11:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746471407; x=1747076207; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6BNCNLNBqTLFiZABlKrrM/g6NMQdulKPbXBoMUL/JjY=;
        b=Bw9RTNEdi+8fA+2+HKORPNelTEGZZ0hvnhMP+90L7TAwefMfFpxIHrg62LgM35jfxR
         UiJdu6yIrFf4swvXjZyqgUII1T3eHh7sw1BIYLtaEc0J5PT1G5nTs4y/Y7zSeMMLfoz6
         6aGJcjp3nfqTyXC6eJK6+cI9WLjP6FwOu0FuGWhnXd2pDfxIb8YG+rNt5bAk6m/aj9Y0
         4Bis68J1eH59Ym8V7SvkudHkBdjsfqaEY2O/UFu15/FypbRwc5nBTHAoRm+3m3RUQpUx
         5wUA6Rd8/FFhSsrRRPamhHzvZx/JBE2QWubySNlBd6ntaSRb7KxRnXCpU+PRNedn3cg8
         NGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746471407; x=1747076207;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6BNCNLNBqTLFiZABlKrrM/g6NMQdulKPbXBoMUL/JjY=;
        b=M7Y0ff3Rmrn5jtFYpgc8D4AUsrkZSkdS6itjtDQwdo9AsZHm4fK99UE/K39+DSPDhR
         I4PjLOilS7AvUqLyTB8PPWOIcK2/gTNZfyW9yBBrfoeQrwregezeVmkkBpnuu/IS/52+
         DCoCkMZ40XpmTlSgZfNGvj3AGCMkED8A0+5lq4fmtz3W89+n/t1yA8qFQF58Ol0m7v4h
         2f8qjutxt/ddIEzxInexk0xzwCfPMl6F/Xs4iMrHVn/2VYbxRhrnV5bEiNEFjNfShHbl
         NZoBHpxyOs3bwjDx2YiDv5Ayt+Fulo+CL8vrzRube1OzRxM8yrHEgvR6XevdunwKwWVh
         WJYg==
X-Forwarded-Encrypted: i=1; AJvYcCUKjjmHkenPhY2l5xsSzdGhoa/bsfSejCpvnFl6QhjS51fXHUjvqzhEqGmTWU3YrQ++VhDefKtN776F2UQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+IT2dpOpgiV/DkiOlNxluBJzaUwkxnVpNURZX7nSwhc0vZE+H
	Fe4u68oRzQ8oi8qTfpyii2+j7gEounG9hb16cxREmL3R35ShRc1i0x0Tm8fRgAZbALXuKI4nDKm
	8DHLhSw==
X-Google-Smtp-Source: AGHT+IHbATH+UFKHmuflnNXF6L3MKgptfzvwV0w7sgXiMV/YNyXmoNWn04iFlytUbCgy7zpCzKr6OoOJpDdR
X-Received: from plrs15.prod.google.com ([2002:a17:902:b18f:b0:223:49cb:8f99])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1c3:b0:223:7006:4db2
 with SMTP id d9443c01a7336-22e1031fc0emr257429655ad.31.1746471407328; Mon, 05
 May 2025 11:56:47 -0700 (PDT)
Date: Mon,  5 May 2025 11:56:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505185642.2377724-1-jyescas@google.com>
Subject: [PATCH v2] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order
From: Juan Yescas <jyescas@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Juan Yescas <jyescas@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: tjmercier@google.com, isaacmanjarres@google.com, surenb@google.com, 
	kaleshsingh@google.com, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>, 
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

Solution: Add a new config ARCH_FORCE_PAGE_BLOCK_ORDER that
allows to set the page block order in all the architectures.
The maximum page block order will be given by
ARCH_FORCE_MAX_ORDER.

By default, ARCH_FORCE_PAGE_BLOCK_ORDER will have the same
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
Changes in v2:
  - Add Zi's Acked-by tag.
  - Move ARCH_FORCE_PAGE_BLOCK_ORDER config to mm/Kconfig as
    per Zi and Matthew suggestion so it is available to
    all the architectures.
  - Set ARCH_FORCE_PAGE_BLOCK_ORDER to 10 by default when
    ARCH_FORCE_MAX_ORDER is not available.


 include/linux/pageblock-flags.h | 12 +++++++++---
 mm/Kconfig                      | 31 +++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index fc6b9c87cb0a..ab3de96bb50c 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -28,6 +28,12 @@ enum pageblock_bits {
 	NR_PAGEBLOCK_BITS
 };
 
+#if defined(CONFIG_ARCH_FORCE_PAGE_BLOCK_ORDER)
+#define PAGE_BLOCK_ORDER CONFIG_ARCH_FORCE_PAGE_BLOCK_ORDER
+#else
+#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
+#endif /* CONFIG_ARCH_FORCE_PAGE_BLOCK_ORDER */
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
 
 /* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
-#define pageblock_order		MAX_PAGE_ORDER
+#define pageblock_order		PAGE_BLOCK_ORDER
 
 #endif /* CONFIG_HUGETLB_PAGE */
 
diff --git a/mm/Kconfig b/mm/Kconfig
index e113f713b493..a118d187a3bf 100644
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
+# When ARCH_FORCE_MAX_ORDER is not defined, the default order is 10, as per
+# include/linux/mmzone.h.
+config ARCH_FORCE_PAGE_BLOCK_ORDER
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

