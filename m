Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE692DEA91
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 18:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751653108; cv=none; b=NfzGlWkCbSyuhfc9Cz6Pgqju0528FgYjALuUvenesn8XEEQeMk36t7qeYqDFbfJTtuyGXpvytQ3/E0vfnU+y1GMIzyQIckHrYc0czoTszgKiqCQZkdFKeo7+5nK5A8VEYMGFFpsDxp29H62AKKcRjRt0ChMSKv91auwNXZrXpRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751653108; c=relaxed/simple;
	bh=sOF8j109TVAQDLZQ/4m6sSs9/wpUhGrSj5un3YtCCW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmPz4Rah/KxBVtrj7+REKJYwrB+tLPwYQzmiZG4rhqE1hZG/TMhO+HkXwV5lt7w3bJAbRtLTCurS9zbLUtvx8nz6LaWzYa5lUSc6sr4RAQ0214t73mFMXOSTqeLH0XtZL0mpLXee7ioYWI87l1m7vPuIdBKtdeOqkGKIUHLsEwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+O5HbPm; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+O5HbPm"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d094ef02e5so308081585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751653106; x=1752257906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fm6vJJaMXbRf6XqtNvSdcQQA6cTKubPXK6+QlM/U09I=;
        b=N+O5HbPmeO/OGlAug8i80IewpEGXBkG0xQb0t2Z4t17Sj30r4nmgU9SdShRFXTCoFx
         ZCDZpxVBH9KLUcrdLkjQeJaEtI6PbNhojL8DrJZj4ewMKfqkUJfxA2O7zLJTsdwxCaOr
         dHesyV+6glxvR6nJzbq2EYn40mBcKmvocHwpoT90mFBaHNi4tXKcmRpkGqGpSElkDLM9
         kftn9/spSdKRHhK9rjpBjpnQp1hFnBX/rkprYGqpJx7Zx3HJ1CCBvWKfZpE+CuXHWQRb
         SB70fgmEsjNBhG3TSKOrIIYK1ORNykLSQgYrXDHg+q3lw5lkgOfLyjhua9AnuuKlN0Nf
         kXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751653106; x=1752257906;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fm6vJJaMXbRf6XqtNvSdcQQA6cTKubPXK6+QlM/U09I=;
        b=uY6WR45PCekpsMQbDXcTIhtwLG7++/bi5II4njFp7F5kuj7Z6iFYFRwbM9xhSXVeyQ
         ymRfxnkSUjImY1gh3QGSPiJssuMSYGYEVdrIBBej65Y1/5n1BcI/wlXecKSoLtLRaojQ
         f04fx3n24/clb9hdhXdFHW+W4bdKv/ck5V9FMDzg62e2vsO54xrdf0f1+5flpretfS0J
         3YaUoiD1Qu7IIGdqadcfiDjW8le0yeMHVdw4qfNEwTyluB3u7naxL2h+tnldpqpQu98t
         8UkIo2jwU2wEcAMwgmJdd1qNUYZZ3D9TPhHRp2Ocim/xDWlpkJPeHV2I59k3xhYOVKAu
         SVxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZQ8+e4EmxlyCuZpIHd2rVSY+iVlHwf0urDrhV1HNZkSCTOtMrh+fD951Wt4+5jTTD+EjPplQ1Arm00OU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPvGHhuudrplEXgtN3diMaD7gg0q3SeQeBEnK/GhaIKPnKtmoV
	DLzcM4SRUTdSMr3gwCWSdofpOkLiDdB1CYuQglb6GDC3v9iPMr7wa65S
X-Gm-Gg: ASbGncuAwLvgoMRycMIIlyUqJahhez6rf0PkVjGcOf/MTBGzXu8NaoPR+B6YRQxU0Ud
	OU5diIiwXpGey/UtMwGbTPLQbfplIK25G6V1uGzaxISmjMjhq5JTsl88tVN8qsjTbOKTxlXEXEr
	gRj9n0F2+fDnADmTz9XAYCE+Gg+RiX2RJOC2DSPmwN20XHO0yxMb6g7NrjmpZFjZQphUgv3AXi0
	d2/hLoA6L/Lgky2ugA8X/NR/o5JSkJv2onyTUxgTTV8n/WMFBxVNjOq6Mh8J+KxJBYwnoaTpRVG
	1a1qjcaaVvgFbdDA24QoE89O7ZtvQxyQT9UXe3oRJ2ul8/vK0NzXXU7gThQBBwBS9/0=
X-Google-Smtp-Source: AGHT+IEXrMp6Gc6YtTfhlo1IKx9/9SN33lsFuLpyujrzcHT63LT3n6kt97kO/u1UXRNsCA8RvHka+g==
X-Received: by 2002:a05:620a:6289:b0:7c5:95e6:62c9 with SMTP id af79cd13be357-7d5dcd47e14mr451163785a.29.1751653105731;
        Fri, 04 Jul 2025 11:18:25 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7c188sm183300585a.59.2025.07.04.11.18.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Jul 2025 11:18:25 -0700 (PDT)
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
Subject: [PATCH v4 6/9] mm/shmem, swap: never use swap cache and readahead for SWP_SYNCHRONOUS_IO
Date: Sat,  5 Jul 2025 02:17:45 +0800
Message-ID: <20250704181748.63181-7-ryncsn@gmail.com>
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

Currently if a THP swapin failed due to reasons like partially
conflicting swap cache or ZSWAP enabled, it will fallback to
cached swapin.

Right now the swap cache still has a non-trivial overhead, and readahead
is not helpful for SWP_SYNCHRONOUS_IO devices, so we should always skip
the readahead and swap cache even if the swapin falls back to order 0.

So handle the fallback logic without falling back to the cached read.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/shmem.c | 55 +++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 19 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 2ab214e2771c..1fe9a3eb92b1 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1975,13 +1975,16 @@ static struct folio *shmem_alloc_and_add_folio(struct vm_fault *vmf,
 	return ERR_PTR(error);
 }
 
-static struct folio *shmem_swap_alloc_folio(struct inode *inode,
+static struct folio *shmem_swapin_direct(struct inode *inode,
 		struct vm_area_struct *vma, pgoff_t index,
-		swp_entry_t entry, int order, gfp_t gfp)
+		swp_entry_t swap, swp_entry_t index_entry,
+		int order, gfp_t gfp)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
+	swp_entry_t entry = index_entry;
 	int nr_pages = 1 << order;
 	struct folio *new;
+	gfp_t alloc_gfp;
 	void *shadow;
 
 	/*
@@ -1989,6 +1992,7 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
 	 * limit chance of success with further cpuset and node constraints.
 	 */
 	gfp &= ~GFP_CONSTRAINT_MASK;
+	alloc_gfp = gfp;
 	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 		if (WARN_ON_ONCE(order))
 			return ERR_PTR(-EINVAL);
@@ -2003,19 +2007,22 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
 		if ((vma && unlikely(userfaultfd_armed(vma))) ||
 		     !zswap_never_enabled() ||
 		     non_swapcache_batch(entry, nr_pages) != nr_pages)
-			return ERR_PTR(-EINVAL);
+			goto fallback;
 
-		gfp = limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
+		alloc_gfp = limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
+	}
+retry:
+	new = shmem_alloc_folio(alloc_gfp, order, info, index);
+	if (!new) {
+		new = ERR_PTR(-ENOMEM);
+		goto fallback;
 	}
-
-	new = shmem_alloc_folio(gfp, order, info, index);
-	if (!new)
-		return ERR_PTR(-ENOMEM);
 
 	if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
-					   gfp, entry)) {
+					   alloc_gfp, entry)) {
 		folio_put(new);
-		return ERR_PTR(-ENOMEM);
+		new = ERR_PTR(-ENOMEM);
+		goto fallback;
 	}
 
 	/*
@@ -2030,7 +2037,9 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
 	 */
 	if (swapcache_prepare(entry, nr_pages)) {
 		folio_put(new);
-		return ERR_PTR(-EEXIST);
+		new = ERR_PTR(-EEXIST);
+		/* Try smaller folio to avoid cache conflict */
+		goto fallback;
 	}
 
 	__folio_set_locked(new);
@@ -2044,6 +2053,15 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
 	folio_add_lru(new);
 	swap_read_folio(new, NULL);
 	return new;
+fallback:
+	/* Order 0 swapin failed, nothing to fallback to, abort */
+	if (!order)
+		return new;
+	order = 0;
+	nr_pages = 1;
+	alloc_gfp = gfp;
+	entry = swap;
+	goto retry;
 }
 
 /*
@@ -2309,25 +2327,24 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 			count_vm_event(PGMAJFAULT);
 			count_memcg_event_mm(fault_mm, PGMAJFAULT);
 		}
-
 		/* Skip swapcache for synchronous device. */
 		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
-			folio = shmem_swap_alloc_folio(inode, vma, index,
-						       index_entry, order, gfp);
+			folio = shmem_swapin_direct(inode, vma, index, swap,
+						    index_entry, order, gfp);
 			if (!IS_ERR(folio)) {
-				swap = index_entry;
+				if (folio_test_large(folio))
+					swap = index_entry;
 				skip_swapcache = true;
 				goto alloced;
 			}
 
 			/*
-			 * Fallback to swapin order-0 folio unless the swap entry
-			 * already exists.
+			 * Direct swapin handled order 0 fallback already,
+			 * if it failed, abort.
 			 */
 			error = PTR_ERR(folio);
 			folio = NULL;
-			if (error == -EEXIST)
-				goto failed;
+			goto failed;
 		}
 		/* Cached swapin with readahead, only supports order 0 */
 		folio = shmem_swapin_cluster(swap, gfp, info, index);
-- 
2.50.0

