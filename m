Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196111E89C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768229; cv=none; b=Pqwv5BXKJ+62kkFYF1rsqUj9G71XBmvDZk8srTwKxOkAusaivQEG3NUZIhHm2jJj5rV01rDKW2ezPCaSUBX428BMj+puIfEF0PoNklfErza4hjCc4mNOnLGsyCFq/D5FZ4WsVcoKqX3tKja/N4yCqJ3By+tHPEQ2/iQrYfkBdo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768229; c=relaxed/simple;
	bh=6JXU90L+Oj3sBAp9u9bCwIFdxjbwqKNeZ/AfVNVXDv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VrU1pCxgvWMNx9CZVSI/vBdBsaLkGQSrK30BAqxl+J9k8iANO9cB9/r4XBmAzFXZaqeb2BBVGR1AbNmuR+uvQrwMVfwvv2s3LZepdcpvdFIutDwN/3H1OxhN3ZbJJqp7gkpEHF5RfTWQI/Rd8nRENa3hrLt/D/4xHjYQtZ79DDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9035D1063;
	Wed,  5 Feb 2025 07:10:48 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 723113F5A1;
	Wed,  5 Feb 2025 07:10:22 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steve Capper <steve.capper@linaro.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/16] hugetlb and vmalloc fixes and perf improvements
Date: Wed,  5 Feb 2025 15:09:40 +0000
Message-ID: <20250205151003.88959-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

This series started out as a few simple bug fixes but evolved into some code
cleanups and useful performance improvements too. It mainly touches arm64 arch
code but there are a couple of supporting mm changes; I'm guessing that going in
through the arm64 tree is the right approach here?

Beyond the bug fixes and cleanups, the 2 key performance improvements are 1)
enabling the use of contpte-mapped blocks in the vmalloc space when appropriate
(which reduces TLB pressure). There were already hooks for this (used by
powerpc) but they required some tidying and extending for arm64. And 2) batching
up barriers when modifying the vmalloc address space for upto 30% reduction in
time taken in vmalloc().

vmalloc() performance was measured using the test_vmalloc.ko module. Tested on
Apple M2 and Ampere Altra. Each test had loop count set to 500000 and the whole
test was repeated 10 times.

legend:
  - p: nr_pages (pages to allocate)
  - h: use_huge (vmalloc() vs vmalloc_huge())
  - (I): statistically significant improvement (95% CI does not overlap)
  - (R): statistically significant regression (95% CI does not overlap)
  - mearements are times; smaller is better

+--------------------------------------------------+-------------+-------------+
| Benchmark                                        |             |             |
|   Result Class                                   |    Apple M2 | Ampere Alta |
+==================================================+=============+=============+
| micromm/vmalloc                                  |             |             |
|   fix_align_alloc_test: p:1, h:0 (usec)          | (I) -12.93% |  (I) -7.89% |
|   fix_size_alloc_test: p:1, h:0 (usec)           |   (R) 4.00% |       1.40% |
|   fix_size_alloc_test: p:1, h:1 (usec)           |   (R) 5.28% |       1.46% |
|   fix_size_alloc_test: p:2, h:0 (usec)           |  (I) -3.04% |      -1.11% |
|   fix_size_alloc_test: p:2, h:1 (usec)           |      -3.24% |      -2.86% |
|   fix_size_alloc_test: p:4, h:0 (usec)           | (I) -11.77% |  (I) -4.48% |
|   fix_size_alloc_test: p:4, h:1 (usec)           |  (I) -9.19% |  (I) -4.45% |
|   fix_size_alloc_test: p:8, h:0 (usec)           | (I) -19.79% | (I) -11.63% |
|   fix_size_alloc_test: p:8, h:1 (usec)           | (I) -19.40% | (I) -11.11% |
|   fix_size_alloc_test: p:16, h:0 (usec)          | (I) -24.89% | (I) -15.26% |
|   fix_size_alloc_test: p:16, h:1 (usec)          | (I) -11.61% |   (R) 6.00% |
|   fix_size_alloc_test: p:32, h:0 (usec)          | (I) -26.54% | (I) -18.80% |
|   fix_size_alloc_test: p:32, h:1 (usec)          | (I) -15.42% |   (R) 5.82% |
|   fix_size_alloc_test: p:64, h:0 (usec)          | (I) -30.25% | (I) -20.80% |
|   fix_size_alloc_test: p:64, h:1 (usec)          | (I) -16.98% |   (R) 6.54% |
|   fix_size_alloc_test: p:128, h:0 (usec)         | (I) -32.56% | (I) -21.79% |
|   fix_size_alloc_test: p:128, h:1 (usec)         | (I) -18.39% |   (R) 5.91% |
|   fix_size_alloc_test: p:256, h:0 (usec)         | (I) -33.33% | (I) -22.22% |
|   fix_size_alloc_test: p:256, h:1 (usec)         | (I) -18.82% |   (R) 5.79% |
|   fix_size_alloc_test: p:512, h:0 (usec)         | (I) -33.27% | (I) -22.23% |
|   fix_size_alloc_test: p:512, h:1 (usec)         |       0.86% |      -0.71% |
|   full_fit_alloc_test: p:1, h:0 (usec)           |       2.49% |      -0.62% |
|   kvfree_rcu_1_arg_vmalloc_test: p:1, h:0 (usec) |       1.79% |      -1.25% |
|   kvfree_rcu_2_arg_vmalloc_test: p:1, h:0 (usec) |      -0.32% |       0.61% |
|   long_busy_list_alloc_test: p:1, h:0 (usec)     | (I) -31.06% | (I) -19.62% |
|   pcpu_alloc_test: p:1, h:0 (usec)               |       0.06% |       0.47% |
|   random_size_align_alloc_test: p:1, h:0 (usec)  | (I) -14.94% |  (I) -8.68% |
|   random_size_alloc_test: p:1, h:0 (usec)        | (I) -30.22% | (I) -19.59% |
|   vm_map_ram_test: p:1, h:0 (usec)               |       2.65% |   (R) 7.22% |
+--------------------------------------------------+-------------+-------------+

So there are some nice improvements but also some regressions to explain:

First fix_size_alloc_test with h:1 and p:16,32,64,128,256 regress by ~6% on
Altra. The regression is actually introduced by enabling contpte-mapped 64K
blocks in these tests, and that regression is reduced (from about 8% if memory
serves) by doing the barrier batching. I don't have a definite conclusion on the
root cause, but I've ruled out the differences in the mapping paths in vmalloc.
I strongly believe this is likely due to the difference in the allocation path;
64K blocks are not cached per-cpu so we have to go all the way to the buddy. I'm
not sure why this doesn't show up on M2 though. Regardless, I'm going to assert
that it's better to choose 16x reduction in TLB pressure vs 6% on the vmalloc
allocation call duration.

Next we have ~4% regression on M2 when vmalloc'ing a single page. (h is
irrelevant because a single page is too small for contpte). I assume this is
because there is some minor overhead in the barrier deferral mechanism and we
are not getting to amortize it over multiple pages here. But I would assume
vmalloc'ing 1 page is uncommon because it doesn't buy you anything over
kmalloc?

Applies on top of v6.14-rc1. All mm selftests run and pass.

Thanks,
Ryan

Ryan Roberts (16):
  mm: hugetlb: Add huge page size param to huge_ptep_get_and_clear()
  arm64: hugetlb: Fix huge_ptep_get_and_clear() for non-present ptes
  arm64: hugetlb: Fix flush_hugetlb_tlb_range() invalidation level
  arm64: hugetlb: Refine tlb maintenance scope
  mm/page_table_check: Batch-check pmds/puds just like ptes
  arm64/mm: Refactor __set_ptes() and __ptep_get_and_clear()
  arm64: hugetlb: Use ___set_ptes() and ___ptep_get_and_clear()
  arm64/mm: Hoist barriers out of ___set_ptes() loop
  arm64/mm: Avoid barriers for invalid or userspace mappings
  mm/vmalloc: Warn on improper use of vunmap_range()
  mm/vmalloc: Gracefully unmap huge ptes
  arm64/mm: Support huge pte-mapped pages in vmap
  mm: Don't skip arch_sync_kernel_mappings() in error paths
  mm/vmalloc: Batch arch_sync_kernel_mappings() more efficiently
  mm: Generalize arch_sync_kernel_mappings()
  arm64/mm: Defer barriers when updating kernel mappings

 arch/arm64/include/asm/hugetlb.h     |  33 +++-
 arch/arm64/include/asm/pgtable.h     | 225 ++++++++++++++++++++-------
 arch/arm64/include/asm/thread_info.h |   2 +
 arch/arm64/include/asm/vmalloc.h     |  40 +++++
 arch/arm64/kernel/process.c          |  20 ++-
 arch/arm64/mm/hugetlbpage.c          | 114 ++++++--------
 arch/loongarch/include/asm/hugetlb.h |   6 +-
 arch/mips/include/asm/hugetlb.h      |   6 +-
 arch/parisc/include/asm/hugetlb.h    |   2 +-
 arch/parisc/mm/hugetlbpage.c         |   2 +-
 arch/powerpc/include/asm/hugetlb.h   |   6 +-
 arch/riscv/include/asm/hugetlb.h     |   3 +-
 arch/riscv/mm/hugetlbpage.c          |   2 +-
 arch/s390/include/asm/hugetlb.h      |  12 +-
 arch/s390/mm/hugetlbpage.c           |  10 +-
 arch/sparc/include/asm/hugetlb.h     |   2 +-
 arch/sparc/mm/hugetlbpage.c          |   2 +-
 include/asm-generic/hugetlb.h        |   2 +-
 include/linux/hugetlb.h              |   4 +-
 include/linux/page_table_check.h     |  30 ++--
 include/linux/pgtable.h              |  24 +--
 include/linux/pgtable_modmask.h      |  32 ++++
 include/linux/vmalloc.h              |  55 +++++++
 mm/hugetlb.c                         |   4 +-
 mm/memory.c                          |  11 +-
 mm/page_table_check.c                |  34 ++--
 mm/vmalloc.c                         |  97 +++++++-----
 27 files changed, 530 insertions(+), 250 deletions(-)
 create mode 100644 include/linux/pgtable_modmask.h

--
2.43.0

