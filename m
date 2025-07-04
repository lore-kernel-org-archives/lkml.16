Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D8928EA53
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 18:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751653094; cv=none; b=C4MyF3zke6WZaIURjZMV1mIX0M1AwCggj4gs76XgtVK5A7IR6rkHLfr60FZvydz7fHT121VDKaZHhCdo7wB2UAiAL9EyxjEAaFdf2PmhK6gNslZtph1nRA8y1wYDzWv2zqcAiAi7cA7luIIPqYgwaFte3yNusEt/BexDs5kREyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751653094; c=relaxed/simple;
	bh=5SlSKVYaikBvzNw7pg1GtRW0MelPrvAj+/aYCCw7eew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orr4HMYnGrtJaNo9OGQAuROWp/BDDSa7G8IGjrrcjBYX6U+JUkCIXffUZH2JVraiy1hxSCp8piihoLbxc9ZDCbAFuJf3NZU3EK75kLEmW4qbv4RS3T75zvp6llIJr5B1odBnoG5X2oN8TtTm7RuPjdmpygJ1eM5/0wBdDewH+cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrH43g6X; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrH43g6X"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d21cecc11fso234780085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751653092; x=1752257892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oWhZ3pxhN1lXqqOVvU26zrhwf3trxDJnUjGeu1jb+Qg=;
        b=KrH43g6XCWaeaxUYLYel60z1RdAfNU92uHz44+ot23/KxNk7on87wD/vt3Z8yomE9O
         czHWfZfAC10KGLYQu0EfRxygBjQcBoDuukuVCVey1El3p1fvdyVUCLNJrfZihK/MQmgl
         cFXUYxKzecHfeDwwz8157oc8iATozU1x8GrxFBIA8dUea32uFAm+nVo1teLLkOuqWSkv
         x5Q9LcHSOY61wAZsyBKlS2XBm0B15qBBr9ZgV+yKhSYNFjeWjrOHSiKEiMDjlox58UcN
         koUNSSKU07gIEfAfhdtsIPXT/FX4lUKAqW1g6kp83j6s9KLkJH4zfyp59M7smKuRshTp
         CCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751653092; x=1752257892;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oWhZ3pxhN1lXqqOVvU26zrhwf3trxDJnUjGeu1jb+Qg=;
        b=vNBTOUQRl+jeYDC4iePYnEnzVLLJQMbMnJ9sSFJcfTFSQzHCAvoYmzx2WpRaxxe1Wm
         URHJd3SdssKfWRl5an1w2Lxib5TtNY+lCKXUaEidvNUh887koCwwFbviLr1GkxgLkrLH
         Y6Fb7ZtgKNeZSmo9eIyelzOSkhMZbrx5r2dflxcKqxKulQC9sb3QlCjncFOPaXxZ29Gm
         njGOZk3Id9C5BmwrbiRT/vLz1+p1GiBwIlFLZ4vk5rNSCKd7dchqTkG51cIk/DI0R97e
         shYLNd7056+LvVx5UPckLqOTIqWiHyjN658SrqciIyA/nYA/nBMYPz7AdlPGqNpJ0s0y
         dAQw==
X-Forwarded-Encrypted: i=1; AJvYcCW050CeJTEuz48JQdyjFTu80C1WnaDZmGq5lPdynAneg6IDKWxGu+TtVEPR6QAcNuSUJJ8tmNSuZBOj6As=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAFMuYuq6q91AFtS2aQSt1h5aH3GGFoO3MceHrzT8Nm0MW0I7L
	qyiudfprGnyns9ap+Z9lE1BAaJ0M8mVr3hINFzGAHUv7G5GJUmxozFTw
X-Gm-Gg: ASbGnctWfXEOpGt0X5oEqDuwjKhBFEETU17chmjA9GyVsKWNib6ErtVdq9rLO6tad4j
	jtXmhsODApE7HGgNi7v9G9tiq79i4+9VKhvY5mKBPfjgvib/4jZjctBRpGRmJvYChR90ELcBpXh
	f/I/CtPygVwQjLZfD9aP04/bh45nlDagjfX3qq9ZzYfgKlzy07yfLcd9oW3R5zFM8uOwdnlrn4+
	BjHE2uMdmVbgHlnIahVybSiut3rl+E1LWZmuraiP/vQ4/qfbBya6SWNpuUpGhXd1GmnpZ2NE4Xo
	TQo1YY70e/jORIUwG4U6QKq946tdsRW8O9bV36jQkiGGWJZ3/Ewgybi36y4JP0mWkag=
X-Google-Smtp-Source: AGHT+IFjFtRePaENXASuLHvAEpQN3EzqUwdcJQ4E3pI38WDkXZL5SEVcCYTGBTbX24Z+GJefpfkG0w==
X-Received: by 2002:a05:620a:4403:b0:7d4:57b7:bc12 with SMTP id af79cd13be357-7d5ddaa7cb8mr405533485a.10.1751653091890;
        Fri, 04 Jul 2025 11:18:11 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7c188sm183300585a.59.2025.07.04.11.18.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Jul 2025 11:18:11 -0700 (PDT)
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
Subject: [PATCH v4 3/9] mm/shmem, swap: tidy up THP swapin checks
Date: Sat,  5 Jul 2025 02:17:42 +0800
Message-ID: <20250704181748.63181-4-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250704181748.63181-1-ryncsn@gmail.com>
References: <20250704181748.63181-1-ryncsn@gmail.com>
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
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/shmem.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 033dc7a3435d..e43becfa04b3 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1980,26 +1980,38 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
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
+		     non_swapcache_batch(entry, nr_pages) != nr_pages)
+			return ERR_PTR(-EINVAL);
 
-		gfp = limit_gfp_mask(huge_gfp, gfp);
+		gfp = limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
 	}
 
 	new = shmem_alloc_folio(gfp, order, info, index);
 	if (!new)
 		return ERR_PTR(-ENOMEM);
 
-	nr_pages = folio_nr_pages(new);
 	if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
 					   gfp, entry)) {
 		folio_put(new);
@@ -2283,9 +2295,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	/* Look it up and read it in.. */
 	folio = swap_cache_get_folio(swap, NULL, 0);
 	if (!folio) {
-		int nr_pages = 1 << order;
-		bool fallback_order0 = false;
-
 		/* Or update major stats only when swapin succeeds?? */
 		if (fault_type) {
 			*fault_type |= VM_FAULT_MAJOR;
@@ -2293,20 +2302,8 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
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

