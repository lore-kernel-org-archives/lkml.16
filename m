Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD0521D5B6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 21:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743800830; cv=none; b=eJ4EzLIpkrq95CmPpoVo1oTAmu7ucmwDnALlsAf4fqF6Pum00YgOT4XMkEhBF2gN+HBenpnmuqFH5J8DsmbGM5oFS3nIIjHsPqCUslLakD9OsqyYCreuJ/IhvPGlxs9a8KXRk9SpaB841uur6vttxFoncG8BRSA4bKWShpHzY60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743800830; c=relaxed/simple;
	bh=J7/gCDdc8fvuXxQWaVRGjApfDs/hGBRUpXDXtj9AVtM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=buMSOnV3tEQLPsWMRYUFRF7Zffh6ELjOKn01n0TfbrhzMYBsRprDaP+Bz0cvHF5hhxLiIp9pddS0c/gqAB6mccTHrRXivH1EvRUj1Mx9uua1iMpUuC4U1K8LHaDBr0gkNOBjc07qs4/faWMZ3iwx969tPQ5PFkqCAhPZoWnd3Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFAEWJ8U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFAEWJ8U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA66C4CEDD;
	Fri,  4 Apr 2025 21:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743800830;
	bh=J7/gCDdc8fvuXxQWaVRGjApfDs/hGBRUpXDXtj9AVtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mFAEWJ8UakEVQgoyrGBCSCT/ySW7BY+FmZ4Y3zhWuE45GXBofakIyEn0PXwiETFTA
	 fmMqTCKz10Ox03ttTmL2pS+lLcLBANmV87GIHc3ZpaKcZqhl8RuDge4oCu/jpSFVLN
	 x/D1w5UmSKaieWuPAPVgmHVagEO2DrWcUzjSEA2ln2QEdSAjlGpxveG3rNGHaoOkTH
	 TWG5YdXnPgIC7eNjYmsVLfqgdgH/zxgGVWBQhM1BLdSXeO38xgNROr3/DjwczH6F5h
	 R2kJifQwWjZWC/Yyg7lW9Wpqwjy9v2X+IOVliGpxpLiSoexrTuNW6Hzx7hTYpHIUYg
	 vp7tTqJGmxQQA==
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
Subject: [PATCH v2 3/4] mm/memory: split non-tlb flushing part from zap_page_range_single()
Date: Fri,  4 Apr 2025 14:06:59 -0700
Message-Id: <20250404210700.2156-4-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404210700.2156-1-sj@kernel.org>
References: <20250404210700.2156-1-sj@kernel.org>
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
index 8669b2c981a5..8c9bbb1a008c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1989,36 +1989,65 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
 	mmu_notifier_invalidate_range_end(&range);
 }
 
-/**
- * zap_page_range_single - remove user pages in a given range
+/*
+ * notify_unmap_single_vma - remove user pages in a given range
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
+static void notify_unmap_single_vma(struct mmu_gather *tlb,
+		struct vm_area_struct *vma, unsigned long address,
 		unsigned long size, struct zap_details *details)
 {
 	const unsigned long end = address + size;
 	struct mmu_notifier_range range;
-	struct mmu_gather tlb;
+
+	VM_WARN_ON_ONCE(!tlb);
 
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
+		 * avoid concurrent page faults' allocation failure
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
+	notify_unmap_single_vma(&tlb, vma, address, size, details);
 	tlb_finish_mmu(&tlb);
-	hugetlb_zap_end(vma, details);
 }
 
 /**
-- 
2.39.5
