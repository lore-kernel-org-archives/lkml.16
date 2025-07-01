Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0B826D4C3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359278; cv=none; b=ijLKrBZvxZ7j8GMwgd/u+GAKmp/j3QS0rZwTZZFSTR1UZqz2BDtuQkMJ4zH9/xH79+AzEiHQva0Z2sPFWJSPb1w1ACEtB9UXNGtFSDJGRpvS/p3fouMezp5k3hA53AN+zhfgwSoy7U6rtTvJbnPgCe8RSwSakjcIpJhqkM+iuN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359278; c=relaxed/simple;
	bh=36UC2OCViUhpbtYUuDe93He8fNFw4C4/8PmKGr28IhM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KfjFGk8V9y+6UPulv3kjwCuYHA/H+lG2v3ziwuyRJ+Lt0SI5ckSto6Oq5fTBf2TN2Qqfg/UXDqdbovTVeTbjZ2bHUICMQZlGNclE/vxCruPCVVoA6Bm/JP88PJFEXL8nk5DbC4r0TgMpXt8rhX+Cy6x9IEkDZnZbYMdnz16iK1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Nqap68zS; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Nqap68zS"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751359267; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=/HTqQOukH8ltO5SuZ3RnIjBK+1QQULpxe6V4i8FUs4g=;
	b=Nqap68zSMwfaE5Jqsg9G/qK2MF2K2EVtNDcuNnzpfqSbd/dozwZiVzU4zfMclHja4kyjAnXQXlTQyXoDUAWLs5RvMENfZGcMTkqG4CZb07cIodesP3PCcOv7IlAfF4S3JqbCQC+s0zaR52Ho77GEYHeaex7dRW0T3AF8W41vf3s=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WgN.CAt_1751359264 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Jul 2025 16:41:05 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com,
	david@redhat.com
Cc: ziy@nvidia.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: support large mapping building for tmpfs
Date: Tue,  1 Jul 2025 16:40:55 +0800
Message-ID: <d4cb6e578bca8c430174d5972550cbeb530ec3fe.1751359073.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs"),
tmpfs can also support large folio allocation (not just PMD-sized large
folios).

However, when accessing tmpfs via mmap(), although tmpfs supports large folios,
we still establish mappings at the base page granularity, which is unreasonable.

We can establish large mappings according to the size of the large folio. On one
hand, this can reduce the overhead of page faults; on the other hand, it can
leverage hardware architecture optimizations to reduce TLB misses, such as
contiguous PTEs on the ARM architecture.

Moreover, since the user has already added the 'huge=' option when mounting tmpfs
to allow for large folio allocation, establishing large folios' mapping is expected
and will not surprise users by inflating the RSS of the process.

In order to support large mappings for tmpfs, besides checking VMA limits and
PMD pagetable limits, it is also necessary to check if the linear page offset
of the VMA is order-aligned within the file.

Performance test:
I created a 1G tmpfs file, populated with 64K large folios, and accessed it
sequentially via mmap(). I observed a significant performance improvement:

Before the patch:
real	0m0.214s
user	0m0.012s
sys	0m0.203s

After the patch:
real	0m0.025s
user	0m0.000s
sys	0m0.024s

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/memory.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 0f9b32a20e5b..6385a9385a9b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5383,10 +5383,10 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 
 	/*
 	 * Using per-page fault to maintain the uffd semantics, and same
-	 * approach also applies to non-anonymous-shmem faults to avoid
+	 * approach also applies to non shmem/tmpfs faults to avoid
 	 * inflating the RSS of the process.
 	 */
-	if (!vma_is_anon_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
+	if (!vma_is_shmem(vma) || unlikely(userfaultfd_armed(vma)) ||
 	    unlikely(needs_fallback)) {
 		nr_pages = 1;
 	} else if (nr_pages > 1) {
@@ -5395,15 +5395,20 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 		pgoff_t vma_off = vmf->pgoff - vmf->vma->vm_pgoff;
 		/* The index of the entry in the pagetable for fault page. */
 		pgoff_t pte_off = pte_index(vmf->address);
+		unsigned long hpage_size = PAGE_SIZE << folio_order(folio);
 
 		/*
 		 * Fallback to per-page fault in case the folio size in page
-		 * cache beyond the VMA limits and PMD pagetable limits.
+		 * cache beyond the VMA limits or PMD pagetable limits. And
+		 * also check if the linear page offset of vma is order-aligned
+		 * within the file for tmpfs.
 		 */
 		if (unlikely(vma_off < idx ||
 			    vma_off + (nr_pages - idx) > vma_pages(vma) ||
 			    pte_off < idx ||
-			    pte_off + (nr_pages - idx)  > PTRS_PER_PTE)) {
+			    pte_off + (nr_pages - idx)  > PTRS_PER_PTE) ||
+			    !IS_ALIGNED((vma->vm_start >> PAGE_SHIFT) - vma->vm_pgoff,
+					hpage_size >> PAGE_SHIFT)) {
 			nr_pages = 1;
 		} else {
 			/* Now we can set mappings for the whole large folio. */
-- 
2.43.5

