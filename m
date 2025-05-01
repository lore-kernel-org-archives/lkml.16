Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A41E20C461
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 05:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746077318; cv=none; b=Ud1p7/dynOQBPR81/08VUqCSF0QGBouBSpUrWMVfQb4icXNkcvGEjcNhpJJczDS3ifkMYLtE+dmjiTp8TQ68rvIIRfKWioJ5G8BISFxxyJMdelsZ01S+bKQx/GbgV/Bwne4YxJ/d1boQuFpDDJ35AdeIYudpOSvRjYfTAVimWNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746077318; c=relaxed/simple;
	bh=X7vjKL5dByzMXed0KqedOXrqIZw/hJfE00go51uQW+4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=h31ZHCc72FtQJL4W4XrP4ZUsAsK22HwDoL4C4Xf2EnG/f7BoP9+nmyhoUEQEc/VJt8aeCdkZBnJuTZ1IejjLUiFeXSrGHXAkNz6yZMRGL6TjO58KXpWtFocusauxVi/Dt9TCq2dLsBcnXEFJ1+/gDqw/c1vM5LLlW9OId+PxrSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ierSyAEm; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jyescas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ierSyAEm"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff68033070so591589a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746077315; x=1746682115; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WHj8Cwb8q2VjJ9Dtv2wOEvSjJNxf/JSEJossLrlxFWk=;
        b=ierSyAEmDoCHB5Lle2c0yEM/KuKzlYXACgqFHXfjHu3+4+prLRlWtBNzSBSkt77MwF
         skSWOY6Q2e/c+YyD2Dn7ljCf88gyCpdWK42fiyEOwSPXCWN0nqoRzoLM2rvhz2N4hRI/
         UNEojHsR6lCTZ4Q9zAzxwr/jZmVllqjp3csXN0PZMWGwwBDUiOGzeauSguITbtRR2o8e
         x/gHPjVlcaGjoEh0JESCPtW2APYq/shACH+tECig6osaw5Fx9q8gLo+b0WU9BlXQ3ujt
         wIiL3PJjF70SoLmVjMV07osxjZ27zQ5Tzo4SAXT/7BHFC1rxlGxK/cfmnysyShWAqbka
         PMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746077315; x=1746682115;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WHj8Cwb8q2VjJ9Dtv2wOEvSjJNxf/JSEJossLrlxFWk=;
        b=hDTaZlbgIjjnK977nNi10RwWAqT4PbQh1DoXUOe8pvfmYEZR1Vx04dRb9mTxR3i/pz
         znsQzPDpZIQBLcyv9+gav6t6eAvvhZHe1EObWtb2WqSHsNXKbTT2SJDKCgXsyqZpl5i6
         jTPvwDA4a5BavLjlz6QBRGjgjr5XrKmMVb4PWjP2Bz7tyfih57rkzW3kzXd97U3Tnw+l
         gA9fRS6WYEQXnzkh9Sm8Pt+WBR+PiH9ui0gr9I6yxEB0TzF226tj8p/Y3YSHQkeHPE4w
         svism7CNvFXn93f8VGwNzfIxC/zv0aTVl5Qss1ex2Q6ksi5/YGXs5DIXRSKeD5VV+Mby
         OEtw==
X-Forwarded-Encrypted: i=1; AJvYcCUy2RI43MPY1u9XU59Pcuc9U7WSy4nfEf9AToWIC+nqt6IkkTZ1FIVvz72UKERqArIfbtY9nOILoEZitz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMjrxzSZgYzl8Vsn2skFHjAeuvwlQ8S+KpBadIim9TDou8xaIe
	MuDDiWJYcBkgnl2Rud0MDEWGbG4EqKoxhA4Ho6YXmLWdXqZG2D/xABw7oqUn5M0DIScTmZI+R5B
	MSjk80w==
X-Google-Smtp-Source: AGHT+IEaXbmSVO/94V1Xc1oJJpIXquwO+RqB8A6EJq35zMnuc9249NpxOc3xG1uRj7oTqBDZbv2KgBoM5UKh
X-Received: from pjbee8.prod.google.com ([2002:a17:90a:fc48:b0:2f4:465d:5c61])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5290:b0:2ff:5e4e:861
 with SMTP id 98e67ed59e1d1-30a4335de2fmr1991820a91.24.1746077314864; Wed, 30
 Apr 2025 22:28:34 -0700 (PDT)
Date: Wed, 30 Apr 2025 22:25:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501052532.1903125-1-jyescas@google.com>
Subject: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order
From: Juan Yescas <jyescas@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Juan Yescas <jyescas@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
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

For example, the CMA alignment requirement when:

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
allows to set the page block order. The maximum page block
order will be given by ARCH_FORCE_MAX_ORDER.

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
---
 arch/arm64/Kconfig              | 14 ++++++++++++++
 include/linux/pageblock-flags.h | 12 +++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08..d784049e1e01 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1658,6 +1658,20 @@ config ARCH_FORCE_MAX_ORDER
 
 	  Don't change if unsure.
 
+config ARCH_FORCE_PAGE_BLOCK_ORDER
+	int "Page Block Order"
+	range 1 ARCH_FORCE_MAX_ORDER
+	default ARCH_FORCE_MAX_ORDER
+	help
+	  The page block order refers to the power of two number of pages that
+	  are physically contiguous and can have a migrate type associated to them.
+	  The maximum size of the page block order is limited by ARCH_FORCE_MAX_ORDER.
+
+	  This option allows overriding the default setting when the page
+	  block order requires to be smaller than ARCH_FORCE_MAX_ORDER.
+
+	  Don't change if unsure.
+
 config UNMAP_KERNEL_AT_EL0
 	bool "Unmap kernel when running in userspace (KPTI)" if EXPERT
 	default y
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
 
-- 
2.49.0.906.g1f30a19c02-goog

