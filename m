Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5C0296721
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253918; cv=none; b=rC0QCfSn5BX+UGIkQZ0NCxlDR/Niz6hl8GMJkd4yYoHDXZf1vlhL7r9MC7Kz5m/d2No+kGPzwWjBaIvybLwJfWGSB4dRIdmMWYJDN+TSf0o128+G+63snKHMF/nc9lnFHO10Cj1tzJ0L7Nu22F+q4tzWoYcnzdPMHfctlnqRryo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253918; c=relaxed/simple;
	bh=ni0ARC8RCm2eZQ4Q7njE4Jty6B41+omq9dJBIsHmoVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tk5HmB7dOGOB6F9lTq0JMYMHzrB+4cuUF4srC3MnUy/spqvUMotzmKftDfdQRvR9wplwpoVUdlNzXwHKxTEnoNm3XNAXEPy1KYMgOmlMaIyArTZoHuaXA9fV8IOr5nqXNCJL0dHZCOXEp+eDN7LLOO0okyBAXuu1tiIb/hqwVJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzQpgGZM; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzQpgGZM"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3081f72c271so269297a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253916; x=1747858716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9BUZKEH/Ak77Mt8ITzomy+/mZrVRHqlKC6HHmrhrRTA=;
        b=OzQpgGZMRCwXNzWPwfl84/8Ja+6vD39Pl/z1+WeJ4cpjgolOJ0fhzHmLRHrmXSGYl2
         gR223Y/c11cLUtlNyqY/eAZ58heiBWI2tl2Hjdm1rU9njcVZnzd0MYzDwm28/Pn8NAFO
         z5od/jk1e8myk/dIJio0q29ciT7MhN4ioD21dpV1D7GskIWvTNyg+6SVU2GjIvevpLCv
         S5JTHSEBlw2HIBbk9pcJPcQPdUAKkJHUGwF4E9KKWqx4S7V8pfjRSGLxbdOxLuCy+TQd
         i9bDji+YZR/bvSRY5bilaF4CYe2UBnzctF4HGdTXoxI+YNEk04QESuUwj/6QZovTqSUZ
         CLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253916; x=1747858716;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9BUZKEH/Ak77Mt8ITzomy+/mZrVRHqlKC6HHmrhrRTA=;
        b=jDOXaOJaw/JyLGu60eYJBsgsyB4gt1tg+PpQM7rERfCOrVhLPxnunRbEnFFClywRAa
         Vw26IaIFWPxrGFlFK9NiL35c2kWnj50opU2raAC4HIF4o2/Q5157YXtgUfHQymRV83Ce
         ysxu+XK6FjjVPqDizf6bJVkjoSPQ6VvrlvnmfFI+BU/PsHUa/yhLdrHCP+TdnEeTZi20
         lOxKQUCMsCHwZJuPlVPAbl/pB6f8FL4UGXWHOlUAJDB3W9ZzDV8TbPyoqWVmxl1I+bee
         88uibmE0BAvggJdBCwQZk4+Lkp0QqP82fVF8GrNFyYXJPxLFwErrCR3tb4hJMpx4m/6z
         Aq0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFfV3NOaUk8zoVuoa0rfgFcPsOq0bVdszP/beuKQESdATvY7HHtcAWil7zwTMgjsL5DDv5OoeQDKFElLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yylkr1sWou4A8Qpuh5nyLymyZNoK3b5iBkJ2XjSIMlMQVmz/xAq
	sy+aRBlcQbzzP86XimwlyUS7hL6MtlDNyNzAXWEfjrkMSJfM2xxD
X-Gm-Gg: ASbGncujV/cE2IXTETFjQIgd6qZXLnflLI9HZWhAuY+lnuFlXgzWRYzjTzw2RbEdZPZ
	s9ZsYGpIBoNunniZADIvShpwUrvObtNJWIvstikVTrwoAQ6t0brwTc7vGt5nAICUyNyTNgZVWFR
	DHmJ9wCKelXyYwT+yfSKArWLzBXe6CwkFl4RZNXjCVnzk6yxxLe54/zPwxMPxqctt6d0vCUXVQa
	KIHJmIpepLCEVN3vt9L2guNVQaJ23g2ULZgwunqJOvQBHZkNsI1kaJClb3A04qHMHN9VP2CRm5d
	dHfnRi/8FUh+H2onxioY5w1rYLCVMnUPeuL1fE5fAWaN3wETq4dK0LF3S9fia2mRpjv6lch0QTM
	HIktT9LQ=
X-Google-Smtp-Source: AGHT+IEtdUvTmatOnRbfR6jC6LpmvBeyjNdx8dFBRfok/5utlBG8OKabienqCLq1lEw6NF//Eu4auA==
X-Received: by 2002:a17:90b:4a86:b0:2ee:8e75:4aeb with SMTP id 98e67ed59e1d1-30e2e5dc9f5mr8044733a91.17.1747253916122;
        Wed, 14 May 2025 13:18:36 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.18.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:18:35 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Hugh Dickins <hughd@google.com>,
	Chris Li <chrisl@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Kalesh Singh <kaleshsingh@google.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH 11/28] mm, swap: clean up and consolidate helper for mTHP swapin check
Date: Thu, 15 May 2025 04:17:11 +0800
Message-ID: <20250514201729.48420-12-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514201729.48420-1-ryncsn@gmail.com>
References: <20250514201729.48420-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Move all mTHP swapin check into can_swapin_thp and use it for both pre
IO check and post IO check. This way the code is more consolidated and
make later commit easier to maintain.

Also clean up the comments while at it. The current comment of
non_swapcache_batch is not correct: swap in bypassing swap cache won't
reach the swap device as long as the entry is cached, because it still
sets the SWAP_HAS_CACHE flag. If the folio is already in swap cache, raced
swap in will either fail due to -EEXIST with swapcache_prepare, or see the
cached folio.

The real reason this non_swapcache_batch is needed is that if a smaller
folio is in the swap cache but not mapped, mTHP swapin will be blocked
forever as it won't see the folio due to index offset, nor it can set the
SWAP_HAS_CACHE bit, so it has to fallback to order 0 swap in.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/memory.c | 90 ++++++++++++++++++++++++-----------------------------
 1 file changed, 41 insertions(+), 49 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index f2897d9059f2..1b6e192de6ec 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4319,12 +4319,6 @@ static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
 	pgoff_t offset = swp_offset(entry);
 	int i;
 
-	/*
-	 * While allocating a large folio and doing swap_read_folio, which is
-	 * the case the being faulted pte doesn't have swapcache. We need to
-	 * ensure all PTEs have no cache as well, otherwise, we might go to
-	 * swap devices while the content is in swapcache.
-	 */
 	for (i = 0; i < max_nr; i++) {
 		if ((si->swap_map[offset + i] & SWAP_HAS_CACHE))
 			return i;
@@ -4334,34 +4328,30 @@ static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
 }
 
 /*
- * Check if the PTEs within a range are contiguous swap entries
- * and have consistent swapcache, zeromap.
+ * Check if the page table is still suitable for large folio swap in.
+ * @vmf: The fault triggering the swap-in.
+ * @ptep: Pointer to the PTE that should be the head of the swap in folio.
+ * @addr: The address corresponding to the PTE.
+ * @nr_pages: Number of pages of the folio that suppose to be swapped in.
  */
-static bool can_swapin_thp(struct vm_fault *vmf, pte_t *ptep, int nr_pages)
+static bool can_swapin_thp(struct vm_fault *vmf, pte_t *ptep,
+			   unsigned long addr, unsigned int nr_pages)
 {
-	unsigned long addr;
-	swp_entry_t entry;
-	int idx;
-	pte_t pte;
-
-	addr = ALIGN_DOWN(vmf->address, nr_pages * PAGE_SIZE);
-	idx = (vmf->address - addr) / PAGE_SIZE;
-	pte = ptep_get(ptep);
+	pte_t pte = ptep_get(ptep);
+	unsigned long addr_end = addr + (PAGE_SIZE * nr_pages);
+	unsigned long pte_offset = (vmf->address - addr) / PAGE_SIZE;
 
-	if (!pte_same(pte, pte_move_swp_offset(vmf->orig_pte, -idx)))
+	VM_WARN_ON_ONCE(!IS_ALIGNED(addr, PAGE_SIZE) ||
+			addr > vmf->address || addr_end <= vmf->address);
+	if (unlikely(addr < max(addr & PMD_MASK, vmf->vma->vm_start) ||
+		     addr_end > pmd_addr_end(addr, vmf->vma->vm_end)))
 		return false;
-	entry = pte_to_swp_entry(pte);
-	if (swap_pte_batch(ptep, nr_pages, pte) != nr_pages)
-		return false;
-
 	/*
-	 * swap_read_folio() can't handle the case a large folio is hybridly
-	 * from different backends. And they are likely corner cases. Similar
-	 * things might be added once zswap support large folios.
+	 * All swap entries must from the same swap device, in same
+	 * cgroup, with same exclusiveness, only differs in offset.
 	 */
-	if (unlikely(swap_zeromap_batch(entry, nr_pages, NULL) != nr_pages))
-		return false;
-	if (unlikely(non_swapcache_batch(entry, nr_pages) != nr_pages))
+	if (!pte_same(pte, pte_move_swp_offset(vmf->orig_pte, -pte_offset)) ||
+	    swap_pte_batch(ptep, nr_pages, pte) != nr_pages)
 		return false;
 
 	return true;
@@ -4441,13 +4431,24 @@ static struct folio *alloc_swap_folio(struct vm_fault *vmf)
 	 * completely swap entries with contiguous swap offsets.
 	 */
 	order = highest_order(orders);
-	while (orders) {
-		addr = ALIGN_DOWN(vmf->address, PAGE_SIZE << order);
-		if (can_swapin_thp(vmf, pte + pte_index(addr), 1 << order))
-			break;
-		order = next_order(&orders, order);
+	for (; orders; order = next_order(&orders, order)) {
+		unsigned long nr_pages = 1 << order;
+		swp_entry_t swap_entry = { .val = ALIGN_DOWN(entry.val, nr_pages) };
+		addr = ALIGN_DOWN(vmf->address, nr_pages * PAGE_SIZE);
+		if (!can_swapin_thp(vmf, pte + pte_index(addr), addr, nr_pages))
+			continue;
+		/*
+		 * If there is already a smaller folio in cache, it will
+		 * conflict with the larger folio in the swap cache layer
+		 * and block the swap in.
+		 */
+		if (unlikely(non_swapcache_batch(swap_entry, nr_pages) != nr_pages))
+			continue;
+		/* Zero map doesn't work with large folio yet. */
+		if (unlikely(swap_zeromap_batch(swap_entry, nr_pages, NULL) != nr_pages))
+			continue;
+		break;
 	}
-
 	pte_unmap_unlock(pte, ptl);
 
 	/* Try allocating the highest of the remaining orders. */
@@ -4731,27 +4732,18 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	page_idx = 0;
 	address = vmf->address;
 	ptep = vmf->pte;
+
 	if (folio_test_large(folio) && folio_test_swapcache(folio)) {
-		int nr = folio_nr_pages(folio);
+		unsigned long nr = folio_nr_pages(folio);
 		unsigned long idx = folio_page_idx(folio, page);
-		unsigned long folio_start = address - idx * PAGE_SIZE;
-		unsigned long folio_end = folio_start + nr * PAGE_SIZE;
-		pte_t *folio_ptep;
-		pte_t folio_pte;
+		unsigned long folio_address = address - idx * PAGE_SIZE;
+		pte_t *folio_ptep = vmf->pte - idx;
 
-		if (unlikely(folio_start < max(address & PMD_MASK, vma->vm_start)))
-			goto check_folio;
-		if (unlikely(folio_end > pmd_addr_end(address, vma->vm_end)))
-			goto check_folio;
-
-		folio_ptep = vmf->pte - idx;
-		folio_pte = ptep_get(folio_ptep);
-		if (!pte_same(folio_pte, pte_move_swp_offset(vmf->orig_pte, -idx)) ||
-		    swap_pte_batch(folio_ptep, nr, folio_pte) != nr)
+		if (!can_swapin_thp(vmf, folio_ptep, folio_address, nr))
 			goto check_folio;
 
 		page_idx = idx;
-		address = folio_start;
+		address = folio_address;
 		ptep = folio_ptep;
 		nr_pages = nr;
 		entry = folio->swap;
-- 
2.49.0

