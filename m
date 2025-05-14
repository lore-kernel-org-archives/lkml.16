Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5324E29616F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253871; cv=none; b=LzIWdMScYQpTm9lgN8y5G+aaFfMiYGLYVdKZfGMQ97FgnaYNEJUXvgaeJJBSt76VGHV9ubOpvoIo5x6nFnlUQ8DA/YCOTBVD5DJuHLCXVRqnJn+D64LOfgZibOvBCTTXloarAgiNvfDrMfv29VP4FTiKzTvjc79FCaS73G+i3bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253871; c=relaxed/simple;
	bh=9IhLQOLL/vouhjuQM59XD87s1+pZ1Np+HGsRfUkeo6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=isAuTJi+tzmo09JBCm/MLwhj+1n2spm51GatMz2SIZye7GH5DP16qul4wwYV97SojS5XBtXk1mTtz4kJM3B0lAUUHL0H167qBT3rDR0FscBBdRqH8G0UreRssp1MvpbGLWE0qykTShgRT8oamzYhScLKeo+wYSNkYtQuXi/KoTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zjz+KhfB; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zjz+KhfB"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30a9cd61159so251689a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253869; x=1747858669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qka9J/ZnaKySa/kXf/KCNurXXskYI6/z9w0Yh6R9N0s=;
        b=Zjz+KhfBgsMxFPR7DbVuOfVCDjIJ7A/ZuApehpmPKXMHlUI2SomEk6UD8M/hPVUMsT
         chrdodKXs48MzKbpu+3fckcc2H4YihSx3rBYjSGqA29aFLhlX2qteMsaBtBBEDE6/kYq
         KNJLygokwl2geIv4t5Usfsnejse7vI3m+bSE5r3ZYUkxaoxA2a5hxvkiVjxVPJNc06+i
         RFd3Axl4q/nUBvv4IkxYeP8N0Oev7l2Io6+lvH8pN662YOqxaL8vton5Vhoa0VEKR+1S
         9c2KWn2hvfm0gN55Wlk/Ruzy+kv0mqOVFTghc+bCgvNvpvlek3TGh38S559GCy/3jW3F
         iBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253869; x=1747858669;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qka9J/ZnaKySa/kXf/KCNurXXskYI6/z9w0Yh6R9N0s=;
        b=nZZ3AXei1ecNfGkTG1pb/WChghFnVKiqH9mTNw8zo3sRszPLldGRdnQKiWcDJz/HY4
         HtnVIUG33dRnSPKcjQtJ4VxNIjQZ1rAILwj1Mg5+6pLZyqXbVLzbtPDBVJFDWMRAGBqL
         vSs2FaCcRewI37d59Tk1K1dJtStuhNSlOHNXhj3QjRZkKXHhp9iK3J9THvHg1wrDSgh1
         u5HXtLk09If3KAcMJC9Q33RUt/8jqE2puMObDdqwa+ZBfDhGpm2heqeHoy3LZHMFKBZK
         cyTaP5xH10gZodLmxZDxaIoOFZlAChDdAhQnx1vsQXmVAS6Nw6Daag7+pzcYBm3iLog8
         /tTA==
X-Forwarded-Encrypted: i=1; AJvYcCVSs5+V0P1iGRE2ouSGmaSgDjaoitiR/8Jj3VZS9Tiayn6npER4L8fS04qBwYG0o69SlvO54TP258PGWsI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoah7NE1ICAiFEJgnfTZGmJWAUqC/m+qAVEp2QZtCuxomkMywh
	omWqIvGWzVO6pQgsPLntn2wo3zjhBZEQYfBroZgLVX3KFokvEH8C5hmh
X-Gm-Gg: ASbGnct518n3cnMIX8HMFfpvIU7BgZUoy5PqXMcG2GVpn+Iv4l0x716RUBhW/VmN9GB
	n8XmILclHrS8PQOSjF3EdtW0jkc9CW8O08Mio0bqjPECQR2hSwE2Bz9+FK/2XNYxEXdURaxeAFJ
	z3DOp4RkjVAaBQwmlYRrUxKSo7nXAIrAXeEeX2j4scBRpSNO7nki847rVjRDLxZRnPuXxm6iVfi
	LbSDkMNJwa+4eiyIwsgNjy8paL1fFl6rzL9N5hAzdJ1/xVuMDy+HP05HVrHu+jyJ3AchBchDlMa
	zSRrnw5hEynEIux9xnmD87BRjO3z5zf+V8lkcpek4DtB8i0IKQkkvAtqMa+/5RiW8sdxARKk
X-Google-Smtp-Source: AGHT+IFsF/FWlsYSpk2bilSZT+eU3KZofkqvca0yqokpqNplBxqQ5MXBcjejALkYCzP8Ww/FftZJjQ==
X-Received: by 2002:a17:90b:3bce:b0:2fe:b907:5e5a with SMTP id 98e67ed59e1d1-30e4db3d8c5mr1128129a91.10.1747253869368;
        Wed, 14 May 2025 13:17:49 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.17.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:17:48 -0700 (PDT)
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
Subject: [PATCH 02/28] mm, swap: consolidate the helper for mincore
Date: Thu, 15 May 2025 04:17:02 +0800
Message-ID: <20250514201729.48420-3-ryncsn@gmail.com>
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

mincore related logics are not used by any one else, so consolidate and
move it to mincore only to simplify the code.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/mincore.c    | 50 +++++++++++++++++++++++++++++++++++++++----------
 mm/swap.h       | 10 ----------
 mm/swap_state.c | 38 -------------------------------------
 3 files changed, 40 insertions(+), 58 deletions(-)

diff --git a/mm/mincore.c b/mm/mincore.c
index 42d6c9c8da86..7ee88113d44c 100644
--- a/mm/mincore.c
+++ b/mm/mincore.c
@@ -44,6 +44,36 @@ static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned long addr,
 	return 0;
 }
 
+static unsigned char mincore_swap(swp_entry_t entry)
+{
+	struct swap_info_struct *si;
+	struct folio *folio = NULL;
+	unsigned char present = 0;
+
+	/* There might be swapin error entries in shmem mapping. */
+	if (non_swap_entry(entry))
+		return 0;
+
+	if (!IS_ENABLED(CONFIG_SWAP)) {
+		WARN_ON_ONCE(1);
+		return 1;
+	}
+
+	/* Prevent swap device to being swapoff under us */
+	si = get_swap_device(entry);
+	if (si) {
+		folio = filemap_get_folio(swap_address_space(entry),
+					  swap_cache_index(entry));
+		put_swap_device(si);
+	}
+	if (folio) {
+		present = folio_test_uptodate(folio);
+		folio_put(folio);
+	}
+
+	return present;
+}
+
 /*
  * Later we can get more picky about what "in core" means precisely.
  * For now, simply check to see if the page is in the page cache,
@@ -61,8 +91,15 @@ static unsigned char mincore_page(struct address_space *mapping, pgoff_t index)
 	 * any other file mapping (ie. marked !present and faulted in with
 	 * tmpfs's .fault). So swapped out tmpfs mappings are tested here.
 	 */
-	folio = filemap_get_incore_folio(mapping, index);
-	if (!IS_ERR(folio)) {
+	folio = filemap_get_entry(mapping, index);
+	if (folio) {
+		if (xa_is_value(folio)) {
+			if (shmem_mapping(mapping))
+				return mincore_swap(radix_to_swp_entry(folio));
+			else
+				return 0;
+		}
+
 		present = folio_test_uptodate(folio);
 		folio_put(folio);
 	}
@@ -141,7 +178,6 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 				vec[i] = 1;
 		} else { /* pte is a swap entry */
 			swp_entry_t entry = pte_to_swp_entry(pte);
-
 			if (non_swap_entry(entry)) {
 				/*
 				 * migration or hwpoison entries are always
@@ -149,13 +185,7 @@ static int mincore_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 				 */
 				*vec = 1;
 			} else {
-#ifdef CONFIG_SWAP
-				*vec = mincore_page(swap_address_space(entry),
-						    swap_cache_index(entry));
-#else
-				WARN_ON(1);
-				*vec = 1;
-#endif
+				*vec = mincore_swap(entry);
 			}
 		}
 		vec += step;
diff --git a/mm/swap.h b/mm/swap.h
index 521bf510ec75..4f85195ab83d 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -62,9 +62,6 @@ void clear_shadow_from_swap_cache(int type, unsigned long begin,
 void swapcache_clear(struct swap_info_struct *si, swp_entry_t entry, int nr);
 struct folio *swap_cache_get_folio(swp_entry_t entry,
 		struct vm_area_struct *vma, unsigned long addr);
-struct folio *filemap_get_incore_folio(struct address_space *mapping,
-		pgoff_t index);
-
 struct folio *read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 		struct vm_area_struct *vma, unsigned long addr,
 		struct swap_iocb **plug);
@@ -156,13 +153,6 @@ static inline struct folio *swap_cache_get_folio(swp_entry_t entry,
 	return NULL;
 }
 
-static inline
-struct folio *filemap_get_incore_folio(struct address_space *mapping,
-		pgoff_t index)
-{
-	return filemap_get_folio(mapping, index);
-}
-
 static inline void *get_shadow_from_swap_cache(swp_entry_t entry)
 {
 	return NULL;
diff --git a/mm/swap_state.c b/mm/swap_state.c
index ac4e0994931c..4117ea4e7afc 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -324,44 +324,6 @@ struct folio *swap_cache_get_folio(swp_entry_t entry,
 	return folio;
 }
 
-/**
- * filemap_get_incore_folio - Find and get a folio from the page or swap caches.
- * @mapping: The address_space to search.
- * @index: The page cache index.
- *
- * This differs from filemap_get_folio() in that it will also look for the
- * folio in the swap cache.
- *
- * Return: The found folio or %NULL.
- */
-struct folio *filemap_get_incore_folio(struct address_space *mapping,
-		pgoff_t index)
-{
-	swp_entry_t swp;
-	struct swap_info_struct *si;
-	struct folio *folio = filemap_get_entry(mapping, index);
-
-	if (!folio)
-		return ERR_PTR(-ENOENT);
-	if (!xa_is_value(folio))
-		return folio;
-	if (!shmem_mapping(mapping))
-		return ERR_PTR(-ENOENT);
-
-	swp = radix_to_swp_entry(folio);
-	/* There might be swapin error entries in shmem mapping. */
-	if (non_swap_entry(swp))
-		return ERR_PTR(-ENOENT);
-	/* Prevent swapoff from happening to us */
-	si = get_swap_device(swp);
-	if (!si)
-		return ERR_PTR(-ENOENT);
-	index = swap_cache_index(swp);
-	folio = filemap_get_folio(swap_address_space(swp), index);
-	put_swap_device(si);
-	return folio;
-}
-
 struct folio *__read_swap_cache_async(swp_entry_t entry, gfp_t gfp_mask,
 		struct mempolicy *mpol, pgoff_t ilx, bool *new_page_allocated,
 		bool skip_if_exists)
-- 
2.49.0

