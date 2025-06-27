Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D98202965
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751005374; cv=none; b=Dg43Bs15oa9txNc/o0ttGvFVbJn+PgtLuH/d4K3RQ6BvU0kj3j0nRgYL1wP5EK+m6Z2w6NptJXHV0Rtn3e1S0tFedkfGZaaYFI+v9Ojjkbn7WxapjSj27wKFOpHrpB/k/KeSCDAeXHD1lOxUXS5VYT/Fwg2KWy0jouAgFNM4sUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751005374; c=relaxed/simple;
	bh=gkzFmUaJ1q4N79v+je8BwK2j3QkKt60kKVdzDcL+ZPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LDqPF+0HB+gAydGvXy8YUhH8dU/I6bc+9X+kBvvOecWK4LkvaoGLe4+K+UVfsoYOP1cHKOGfJjoTWIrU28Mg7gVIMcIwTVPlLEfyuqpl4Fm4/R6YHSv91DW4lQpf+Mb+oPdY/rMQeuh1+tyIVmF7qVmChdrKEWa6aDtw2DVu98g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwOh0FXm; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwOh0FXm"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748d982e97cso1836698b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751005373; x=1751610173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=50Y0XWJGwJinRQammbhrqeExSwEhDWKAQx/TaIcN54Y=;
        b=VwOh0FXmDGBkBc6iucZ01/thIJRlbOojrgM3GLZ7J4xNiy+3qecJLfFrEuu2MuQUb3
         e9y+qu0bGl3QT6/lK4shn029wOuxn9v8W4Hw9uftzF6TyBJE1YN+PFSMPjp/U8FtMyxO
         s/quSAn+O+BxAyNFdaYxUkX2OVKYfAUKR3nqWi4fUWI0incpUB4UzyZxkA6L2XUYf67V
         mQkx3ukvaFjuCFIfAk638yaiCCKtoW3PkG7OmizN9icsuiJakNSkGOJRvHLUuS/rnVlG
         5s8f5hlm+cCCSWhLisyOjrbU1YWQFXW2kd5UtDF3nTnwPhxmBbMrBFXq7VGfVKHC3nix
         mllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005373; x=1751610173;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=50Y0XWJGwJinRQammbhrqeExSwEhDWKAQx/TaIcN54Y=;
        b=sCG/FhIDkjNi8RXhW8unr5qCHsBloChG8+1sa3WM5Mrrb7TADUNsd8083FIBOyBTR6
         U4ik6Kqz11T5yXbgrrHJ/QT489mFQsuYeK5lm55QIyJKV4U6/nBUwa1nzd/zXfs9RICf
         FRq3nE59v02XFPUIQol9P1x5hNB4RF1bsPjxYDupoaVJTuy0frGfTNFornYYVrlRNH0H
         tqgundjyn81TiWImhggEJOGlJqK4yoBgn4qzEskvhO8HF3ZxY1mVYe/Kkc7Vi0FuDVRd
         fKszPFXS3xE4F2+ektF8dFSuqX2CYUuVn/Wt9wKFMIcLSATDkBW9QV2g9RW8BduROsgt
         6KMw==
X-Forwarded-Encrypted: i=1; AJvYcCVVEJCNa7L1VHaefrr9lIoaVtf8+uN3Q50xaZHHmhwcmAcfZ3P2GRrIKdlQHKYU0WdwD6sfnaPz6deoEhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqPP+tQrrKaFXoFkCwEU9cImf2YvxaTD71KQ+GhVy2NTd4F5Ze
	QEv0BVmBsKwv3Ki83J/u3OTTyL55DGzd2E1wndwrqfgXoX47CFOwONnM
X-Gm-Gg: ASbGncvhpL0Aix6wDnfonzIjdM0pbw9/ls9Vgr8wly4tA8v3oIlinAEMw8xvkuPTc1O
	xdGOz8CYKvBhERpMFKoyExILFX30V7kFEq2nA2I8UQHdj1D5CGuW8SJ7ddwxZMS0td1wEbu/7qW
	Fy+cqH8VmRqtXLPZgpQthmglztR16ZR35whakw4AIZv7QgQG8j5OQ7Fl5w6NMbPP1uI/rrokF65
	B0MTyll9IfYoDmiKRLic1bsJBoa9hmEyOKGV/0ilCOzQiw6mWoK3WcaZj/sKFcrAKWKEH3mam99
	6x/o0JhQ1odkh/vV23952f8b1UIxqmp5I+v1WgpRfXyTy0fO8BRFlp6hWtNlZ/B9nPg4sMGcx0o
	3
X-Google-Smtp-Source: AGHT+IEqfY010ingzvwEXrROI72JiTGh0L7tXCs5uWwB+6W3VxTF2TUNYLCfZ3OCYchE45voeAupYA==
X-Received: by 2002:a05:6a00:238b:b0:746:24c9:c92e with SMTP id d2e1a72fcca58-74af6ef81a9mr2980203b3a.8.1751005372580;
        Thu, 26 Jun 2025 23:22:52 -0700 (PDT)
Received: from KASONG-MC4 ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5409cb6sm1456212b3a.23.2025.06.26.23.22.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Jun 2025 23:22:51 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthew Wilcox <willy@infradead.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH v3 3/7] mm/shmem, swap: tidy up THP swapin checks
Date: Fri, 27 Jun 2025 14:20:16 +0800
Message-ID: <20250627062020.534-4-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250627062020.534-1-ryncsn@gmail.com>
References: <20250627062020.534-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Move all THP swapin related checks under CONFIG_TRANSPARENT_HUGEPAGE,
so they will be trimmed off by the compiler if not needed.

And add a WARN if shmem sees a order > 0 entry when
CONFIG_TRANSPARENT_HUGEPAGE is disabled, that should never happen unless
things went very wrong.

There should be no observable feature change except the new added WARN.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/shmem.c | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 033dc7a3435d..f85a985167c5 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1980,26 +1980,39 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
 		swp_entry_t entry, int order, gfp_t gfp)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
+	int nr_pages = 1 << order;
 	struct folio *new;
 	void *shadow;
-	int nr_pages;
 
 	/*
 	 * We have arrived here because our zones are constrained, so don't
 	 * limit chance of success with further cpuset and node constraints.
 	 */
 	gfp &= ~GFP_CONSTRAINT_MASK;
-	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && order > 0) {
-		gfp_t huge_gfp = vma_thp_gfp_mask(vma);
-
-		gfp = limit_gfp_mask(huge_gfp, gfp);
+	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
+		if (WARN_ON_ONCE(order))
+			return ERR_PTR(-EINVAL);
+	} else if (order) {
+		/*
+		 * If uffd is active for the vma, we need per-page fault
+		 * fidelity to maintain the uffd semantics, then fallback
+		 * to swapin order-0 folio, as well as for zswap case.
+		 * Any existing sub folio in the swap cache also blocks
+		 * mTHP swapin.
+		 */
+		if ((vma && unlikely(userfaultfd_armed(vma))) ||
+		     !zswap_never_enabled() ||
+		     non_swapcache_batch(entry, nr_pages) != nr_pages) {
+			return ERR_PTR(-EINVAL);
+		} else {
+			gfp = limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
+		}
 	}
 
 	new = shmem_alloc_folio(gfp, order, info, index);
 	if (!new)
 		return ERR_PTR(-ENOMEM);
 
-	nr_pages = folio_nr_pages(new);
 	if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
 					   gfp, entry)) {
 		folio_put(new);
@@ -2283,9 +2296,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	/* Look it up and read it in.. */
 	folio = swap_cache_get_folio(swap, NULL, 0);
 	if (!folio) {
-		int nr_pages = 1 << order;
-		bool fallback_order0 = false;
-
 		/* Or update major stats only when swapin succeeds?? */
 		if (fault_type) {
 			*fault_type |= VM_FAULT_MAJOR;
@@ -2293,20 +2303,8 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 			count_memcg_event_mm(fault_mm, PGMAJFAULT);
 		}
 
-		/*
-		 * If uffd is active for the vma, we need per-page fault
-		 * fidelity to maintain the uffd semantics, then fallback
-		 * to swapin order-0 folio, as well as for zswap case.
-		 * Any existing sub folio in the swap cache also blocks
-		 * mTHP swapin.
-		 */
-		if (order > 0 && ((vma && unlikely(userfaultfd_armed(vma))) ||
-				  !zswap_never_enabled() ||
-				  non_swapcache_batch(swap, nr_pages) != nr_pages))
-			fallback_order0 = true;
-
 		/* Skip swapcache for synchronous device. */
-		if (!fallback_order0 && data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
+		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
 			folio = shmem_swap_alloc_folio(inode, vma, index, swap, order, gfp);
 			if (!IS_ERR(folio)) {
 				skip_swapcache = true;
-- 
2.50.0

