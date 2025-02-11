Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B881C9EAA
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272428; cv=none; b=cvC1URjn9m8zVuzWcx71YEw6D8jbDqs31u5lljQvKLsLaeF4g/NFuv9tvqYCO/KjSy0YTv/rw/BIbs4uHrnM9pahjQxqrbjd2zWaAIHJ3qpvaLa0i7bk9T5EgaAQaRM+hHq1Mswp5UGjKyaUs6Js0sWPuTUDOu3CyCWHuej377M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272428; c=relaxed/simple;
	bh=blz7weydyN8dxmWjRgrAj9EmCuKMrRIL0qAty7EYsps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Et2Bn9JU1U3CBp2tH9KI1KYkZMo7R2eFC1Ys1OOVaTyks+KI9YgZGcN1oyMJ+rT6M5H1w934Tycp/MqJk+awctt5V9ouC/DzS5WMGCslMxkAPdLPhDDVVYb/KW5Le7bzAMVDflDp+MjXk62tn8wSbYzVT4NBN4rnbjvBpZM51ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF0F113D5;
	Tue, 11 Feb 2025 03:14:05 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E9B623F5A1;
	Tue, 11 Feb 2025 03:13:33 -0800 (PST)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	willy@infradead.org,
	kirill.shutemov@linux.intel.com
Cc: npache@redhat.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	cl@gentwo.org,
	vbabka@suse.cz,
	mhocko@suse.com,
	apopple@nvidia.com,
	dave.hansen@linux.intel.com,
	will@kernel.org,
	baohua@kernel.org,
	jack@suse.cz,
	srivatsa@csail.mit.edu,
	haowenchao22@gmail.com,
	hughd@google.com,
	aneesh.kumar@kernel.org,
	yang@os.amperecomputing.com,
	peterx@redhat.com,
	ioworker0@gmail.com,
	wangkefeng.wang@huawei.com,
	ziy@nvidia.com,
	jglisse@google.com,
	surenb@google.com,
	vishal.moola@gmail.com,
	zokeefe@google.com,
	zhengqi.arch@bytedance.com,
	jhubbard@nvidia.com,
	21cnbao@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2 00/17] khugepaged: Asynchronous mTHP collapse
Date: Tue, 11 Feb 2025 16:43:09 +0530
Message-Id: <20250211111326.14295-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset extends khugepaged from collapsing only PMD-sized THPs to
collapsing anonymous mTHPs.

mTHPs were introduced in the kernel to improve memory management by allocating
chunks of larger memory, so as to reduce number of page faults, TLB misses (due
to TLB coalescing), reduce length of LRU lists, etc. However, the mTHP property
is often lost due to CoW, swap-in/out, and when the kernel just cannot find
enough physically contiguous memory to allocate on fault. Henceforth, there is a
need to regain mTHPs in the system asynchronously. This work is an attempt in
this direction, starting with anonymous folios.

In the fault handler, we select the THP order in a greedy manner; the same has
been used here, along with the same sysfs interface to control the order of
collapse. In contrast to PMD-collapse, we (hopefully) get rid of the mmap_write_lock().

---------------------------------------------------------
Testing
---------------------------------------------------------

The set has been build tested on x86_64.
For Aarch64,
1. mm-selftests: No regressions.
2. Analyzing with tools/mm/thpmaps on different userspace programs mapping
   aligned VMAs of a large size, faulting in basepages/mTHPs (according to sysfs),
   and then madvise()'ing the VMA, khugepaged is able to 100% collapse the VMAs.

This patchset is rebased on mm-unstable (4637fa5d47a49c977116321cc575ea22215df22d).

v1->v2:
 - Handle VMAs less than PMD size (patches 12-15)
 - Do not add mTHP into deferred split queue
 - Drop lock optimization and collapse mTHP under mmap_write_lock()
 - Define policy on what to do when we encounter a folio order larger than
   the order we are scanning for
 - Prevent the creep problem by enforcing tunable simplification
 - Update Documentation
 - Drop patch 12 from v1 updating selftest w.r.t the creep problem
 - Drop patch 1 from v1

 v1:
 https://lore.kernel.org/all/20241216165105.56185-1-dev.jain@arm.com/

Dev Jain (17):
  khugepaged: Generalize alloc_charge_folio()
  khugepaged: Generalize hugepage_vma_revalidate()
  khugepaged: Generalize __collapse_huge_page_swapin()
  khugepaged: Generalize __collapse_huge_page_isolate()
  khugepaged: Generalize __collapse_huge_page_copy()
  khugepaged: Abstract PMD-THP collapse
  khugepaged: Scan PTEs order-wise
  khugepaged: Introduce vma_collapse_anon_folio()
  khugepaged: Define collapse policy if a larger folio is already mapped
  khugepaged: Exit early on fully-mapped aligned mTHP
  khugepaged: Enable sysfs to control order of collapse
  khugepaged: Enable variable-sized VMA collapse
  khugepaged: Lock all VMAs mapping the PTE table
  khugepaged: Reset scan address to correct alignment
  khugepaged: Delay cond_resched()
  khugepaged: Implement strict policy for mTHP collapse
  Documentation: transhuge: Define khugepaged mTHP collapse policy

 Documentation/admin-guide/mm/transhuge.rst |  49 +-
 include/linux/huge_mm.h                    |   2 +
 mm/huge_memory.c                           |   4 +
 mm/khugepaged.c                            | 603 ++++++++++++++++-----
 4 files changed, 511 insertions(+), 147 deletions(-)

-- 
2.30.2

