Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA0920DD5B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744243248; cv=none; b=S6MLGzPSwu28rU2Q4IsZGZej6arADSfM/yb1iszPu+z+rzqrv2xDvc6x5UEvJjawf1KpRLsKf7B5Jrnmltu0JFZg0zUcxRO7mAVtK5Q+HSEVFTdoEgy1rQrrBvpyNg533pbdsTiu42PRvrLr3EG7KgsWtrYSuwflThRNyvHzAFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744243248; c=relaxed/simple;
	bh=AiRM6AgaPbYM4aARYtsDAE0SH4eLTigEd/mfyKuf6e8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gOtLr+kl6cDTRcbFSEBzH6/zF9hy9podFZHKLUVlPL+CvGjGOwVo2DduK5dEnzC+lm60E4yoFfjmHGojUIEAuayLUbwWOZX2fD6fofwiaKP6oXSu49wnWakAMhCZ6FN/DJVU23DMtLQ9Tsl7InxfiyN70SyMhdEVqVrYHdAEtdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2GrDKXy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2GrDKXy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78490C4CEE9;
	Thu, 10 Apr 2025 00:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744243246;
	bh=AiRM6AgaPbYM4aARYtsDAE0SH4eLTigEd/mfyKuf6e8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h2GrDKXyRxw0mpBW/ScN6CLLCrTI3Y/nMLtNQj4qrA+gMGaT4diZIwQxyVRlk+Qk5
	 U/k2UZAy4O6RbCvBkd22bPhecL7dT3ZIWFijQIAyBQRDEOM3erKpDai5Rmw5UJhSM/
	 DZWNpyizeqE5pr0G3xKb/i3sSdtzbT0iAPAMR4tJiETAFniiz7LS1VHtCCo1icS+Yq
	 qzPQtWstjVegYNDRvWby9HCM1zEi3n0tVO61oE+ByGQ0ahG3C/YnJFvNzugE/TZTYv
	 B5+/egDGYkBZziaNVKgk18AENnOJuy4HX76bioEVFEjwe6bmnZfnJdvDmsoU3MQ4b2
	 cxAxW45QgU+eA==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R.Howlett" <howlett@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Rik van Riel <riel@surriel.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v3 3/4] mm/memory: split non-tlb flushing part from zap_page_range_single()
Date: Wed,  9 Apr 2025 17:00:21 -0700
Message-Id: <20250410000022.1901-4-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410000022.1901-1-sj@kernel.org>
References: <20250410000022.1901-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of zap_page_range_single() callers such as [process_]madvise() with
MADV_DONTNEED[_LOCKED] cannot batch tlb flushes because
zap_page_range_single() flushes tlb for each invocation.  Split out the
body of zap_page_range_single() except mmu_gather object initialization
and gathered tlb entries flushing for such batched tlb flushing usage.

To avoid hugetlb pages allocation failures from concurrent page faults,
the tlb flush should be done before hugetlb faults unlocking, though.
Do the flush and the unlock inside the split out function in the order
for hugetlb vma case.  Refer to commit 2820b0f09be9 ("hugetlbfs: close
race between MADV_DONTNEED and page fault") for more details about the
concurrent faults' page allocation failure problem.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/memory.c | 49 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index fda6d6429a27..690695643dfb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1998,36 +1998,65 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
 	mmu_notifier_invalidate_range_end(&range);
 }
 
-/**
- * zap_page_range_single - remove user pages in a given range
+/*
+ * zap_page_range_single_batched - remove user pages in a given range
+ * @tlb: pointer to the caller's struct mmu_gather
  * @vma: vm_area_struct holding the applicable pages
- * @address: starting address of pages to zap
- * @size: number of bytes to zap
+ * @address: starting address of pages to remove
+ * @size: number of bytes to remove
  * @details: details of shared cache invalidation
  *
- * The range must fit into one VMA.
+ * @tlb shouldn't be NULL.  The range must fit into one VMA.  If @vma is for
+ * hugetlb, @tlb is flushed and re-initialized by this function.
  */
-void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
+static void zap_page_range_single_batched(struct mmu_gather *tlb,
+		struct vm_area_struct *vma, unsigned long address,
 		unsigned long size, struct zap_details *details)
 {
 	const unsigned long end = address + size;
 	struct mmu_notifier_range range;
-	struct mmu_gather tlb;
+
+	VM_WARN_ON_ONCE(!tlb || tlb->mm != vma->vm_mm);
 
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
 				address, end);
 	hugetlb_zap_begin(vma, &range.start, &range.end);
-	tlb_gather_mmu(&tlb, vma->vm_mm);
 	update_hiwater_rss(vma->vm_mm);
 	mmu_notifier_invalidate_range_start(&range);
 	/*
 	 * unmap 'address-end' not 'range.start-range.end' as range
 	 * could have been expanded for hugetlb pmd sharing.
 	 */
-	unmap_single_vma(&tlb, vma, address, end, details, false);
+	unmap_single_vma(tlb, vma, address, end, details, false);
 	mmu_notifier_invalidate_range_end(&range);
+	if (is_vm_hugetlb_page(vma)) {
+		/*
+		 * flush tlb and free resources before hugetlb_zap_end(), to
+		 * avoid concurrent page faults' allocation failure.
+		 */
+		tlb_finish_mmu(tlb);
+		hugetlb_zap_end(vma, details);
+		tlb_gather_mmu(tlb, vma->vm_mm);
+	}
+}
+
+/**
+ * zap_page_range_single - remove user pages in a given range
+ * @vma: vm_area_struct holding the applicable pages
+ * @address: starting address of pages to zap
+ * @size: number of bytes to zap
+ * @details: details of shared cache invalidation
+ *
+ * The range must fit into one VMA.
+ */
+void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
+		unsigned long size, struct zap_details *details)
+{
+	struct mmu_gather tlb;
+
+	tlb_gather_mmu(&tlb, vma->vm_mm);
+	zap_page_range_single_batched(&tlb, vma, address, size, details);
 	tlb_finish_mmu(&tlb);
-	hugetlb_zap_end(vma, details);
 }
 
 /**
-- 
2.39.5
