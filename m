Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BB4211A00
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751005382; cv=none; b=nBl9T4GDS3Ldt4dLLc8mfCjRMSUO3HPvXj2l7eYzbUwlcfXLWkUeY0uZ6fVhaI562TX7Hz2sipkvuujn7ooUuCTorQRhq0QD6/q6DINOQmxKRs+Hw9lg+y5lHwdPwVPX8RCn/eFnF1FtYihrxCXWNFfhQf/idFnxg7LAyyNbgQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751005382; c=relaxed/simple;
	bh=iVyr98S66nkqKEQXOcn/fomDItBbPe+w6yG+IASi8zY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crnxpXXLCQn91L8sVHs5iuEMTMMxVYuvGzbiicU2kO59rbVcmV4obpZrl+NGaYAOEGtVA9Jnx+LQpvCspqGO+7Pij9dGXwe2hKl9nIa3X/VjFz2T2ettFKuVo3M6+tlnPe5ZUbhJRSn5YfCHMLby2MAmVYKRI3akg6r+tRb05UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zl9znYnl; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zl9znYnl"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7490cb9a892so1242932b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751005380; x=1751610180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C7MLuCSrE1yGN0/K+3ZOSsZH1kdg+jacwIW2AlKNhWo=;
        b=Zl9znYnlL9yS2AsIU/GG2PWFG8t1cCX778a3ZBB0Rmc6Ug9J45UTeqlzkGKS7WfbK+
         V7GnLN5+EEuDfXcBp/XoJOBnfLOsnJ3Sm2llh44kbWo7KJia9vcz2f1phCvmwHafPP6q
         8rZrapog7s5btQ3jQcmo2M0GuENDRS6LFEvTfQeDsWSLAxLmF3taPrmYijazYLmzgSvv
         NSlUIhKC+8kMQor3P6OR5nS8MKWjrWcpGyQjKXI+0WDKaeHCYm7fS6nFlhK38UuSIh4K
         ZcwiVV9VU92OqWtXz7RGFIr1YGUeE29KmH3wTPlGi9P8x4lBtqB1kANfGJKN266ywL66
         iMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005380; x=1751610180;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C7MLuCSrE1yGN0/K+3ZOSsZH1kdg+jacwIW2AlKNhWo=;
        b=S0wqu9sePMT8Zp4vlrm0Egb6D1ZHLHmynkeWMRB369rSEpkHuCW80imHx6ZU65xx2a
         CKgvy8cjA1E9KXEerDZxrwt5RCKngb1xuug/3cgGAJzj/QB9qrClXlw+BIp49Vwess3o
         kGM/9mNgJKXFh2q7nNQF1clbYZI9lWr5SiRoBF7ziKtz+hCFr9QwUkZgsFzTsVVvo8WO
         NMZQfUS2W0XVHjMkLZzsPBbOCfylFhtea0169mWSZSC7hhLCc6LDw4/hAv7DXbnJ55mv
         76Fuc+aTxcmwfPqPM1hzA7QIuOFovJBT7fVmGlHBn3A/hv8nQwxdBJnOiDaY6mQyyas2
         VBXA==
X-Forwarded-Encrypted: i=1; AJvYcCVzvByUgnmu7GP45h53ADsEiHYr/DvS68OmjaL1PrIjf8HQmgmqnp+ILVfT1GkYKs1EQl3LX1JxtxoBPaA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gSb3pX6sqqQsCFyQ9lodG4OTG9vCjPHCDHzfl5uKsyMLdtqM
	2JjQGJVuyKIf8c+K+D1ZGswwEtPl3qivtuCFOx/c+EYlnmWzCYkEzEn8
X-Gm-Gg: ASbGncvGBTkV80dVqGNZg6gey4DXg4wfE6MUpKX8fj0Y+XI1U451wzYFzedmgVXioSl
	7/QdkO8cKvjnbPpqErD/UGm/N5/G/HwiFXXLzRWJPgfn5Q22fpzshl/c958flRgjwJSvPPJ3yxc
	JdYB6PDxLvDEz+hI8qnNus0RE986xBOSeE/AZ6KjQ0g7kFiNQmJN83ZzXU/qNEQ+Kf2qFJy4xBK
	Q3lGr6+o6qW6iKeGmWJHjkm7ravPhaJhhr1yNk/6Zxf+3aTwWoBmo7wbySSUUuQ2vs9aVk9si7X
	WCRZfmliXteEsbG+cKjsZfDtuwkoHteJtV9TPvsPAcePLt5KDxc8ZXGTzhTBaSdtY8eB4Ii8QQJ
	6
X-Google-Smtp-Source: AGHT+IGH69rDgVPbw+rW1TxbTSwidDYOQSjIR5lrciPeYQ1EueHkgXL17qrV4KOtidHHVr3VYimEvg==
X-Received: by 2002:a05:6a00:b4f:b0:748:e4f6:ff31 with SMTP id d2e1a72fcca58-74af6e509f7mr3101933b3a.8.1751005379998;
        Thu, 26 Jun 2025 23:22:59 -0700 (PDT)
Received: from KASONG-MC4 ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5409cb6sm1456212b3a.23.2025.06.26.23.22.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Jun 2025 23:22:59 -0700 (PDT)
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
Subject: [PATCH v3 5/7] mm/shmem, swap: never use swap cache and readahead for SWP_SYNCHRONOUS_IO
Date: Fri, 27 Jun 2025 14:20:18 +0800
Message-ID: <20250627062020.534-6-ryncsn@gmail.com>
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

Currently if THP swapin failed due to reasons like partially conflicting
swap cache or ZSWAP enabled, it will fallback to cached swapin.

Right now the swap cache has a non-trivial overhead, and readahead is
not helpful for SWP_SYNCHRONOUS_IO devices, so we should always skip
the readahead and swap cache even if the swapin falls back to order 0.

So handle the fallback logic without falling back to the cached read.

Also slightly tweak the behavior if the WARN_ON is triggered (shmem
mapping is corrupted or buggy code) as a side effect, just return
with -EINVAL. This should be OK as things are already very wrong
beyond recovery at that point.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/shmem.c | 68 ++++++++++++++++++++++++++++++------------------------
 1 file changed, 38 insertions(+), 30 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 5be9c905396e..5f2641fd1be7 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1975,13 +1975,15 @@ static struct folio *shmem_alloc_and_add_folio(struct vm_fault *vmf,
 	return ERR_PTR(error);
 }
 
-static struct folio *shmem_swap_alloc_folio(struct inode *inode,
+static struct folio *shmem_swapin_direct(struct inode *inode,
 		struct vm_area_struct *vma, pgoff_t index,
 		swp_entry_t entry, int order, gfp_t gfp)
 {
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	int nr_pages = 1 << order;
 	struct folio *new;
+	pgoff_t offset;
+	gfp_t swap_gfp;
 	void *shadow;
 
 	/*
@@ -1989,6 +1991,7 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
 	 * limit chance of success with further cpuset and node constraints.
 	 */
 	gfp &= ~GFP_CONSTRAINT_MASK;
+	swap_gfp = gfp;
 	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 		if (WARN_ON_ONCE(order))
 			return ERR_PTR(-EINVAL);
@@ -2003,20 +2006,23 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
 		if ((vma && unlikely(userfaultfd_armed(vma))) ||
 		     !zswap_never_enabled() ||
 		     non_swapcache_batch(entry, nr_pages) != nr_pages) {
-			return ERR_PTR(-EINVAL);
+			goto fallback;
 		} else {
-			gfp = limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
+			swap_gfp = limit_gfp_mask(vma_thp_gfp_mask(vma), gfp);
 		}
 	}
-
-	new = shmem_alloc_folio(gfp, order, info, index);
-	if (!new)
-		return ERR_PTR(-ENOMEM);
+retry:
+	new = shmem_alloc_folio(swap_gfp, order, info, index);
+	if (!new) {
+		new = ERR_PTR(-ENOMEM);
+		goto fallback;
+	}
 
 	if (mem_cgroup_swapin_charge_folio(new, vma ? vma->vm_mm : NULL,
-					   gfp, entry)) {
+					   swap_gfp, entry)) {
 		folio_put(new);
-		return ERR_PTR(-ENOMEM);
+		new = ERR_PTR(-ENOMEM);
+		goto fallback;
 	}
 
 	/*
@@ -2045,6 +2051,17 @@ static struct folio *shmem_swap_alloc_folio(struct inode *inode,
 	folio_add_lru(new);
 	swap_read_folio(new, NULL);
 	return new;
+fallback:
+	/* Order 0 swapin failed, nothing to fallback to, abort */
+	if (!order)
+		return new;
+	/* High order swapin failed, fallback to order 0 and retry */
+	order = 0;
+	nr_pages = 1;
+	swap_gfp = gfp;
+	offset = index - round_down(index, nr_pages);
+	entry = swp_entry(swp_type(entry), swp_offset(entry) + offset);
+	goto retry;
 }
 
 /*
@@ -2243,7 +2260,6 @@ static int shmem_split_swap_entry(struct inode *inode, pgoff_t index,
 			cur_order = split_order;
 			split_order = xas_try_split_min_order(split_order);
 		}
-
 unlock:
 		xas_unlock_irq(&xas);
 
@@ -2306,34 +2322,26 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 			count_vm_event(PGMAJFAULT);
 			count_memcg_event_mm(fault_mm, PGMAJFAULT);
 		}
-
-		/* Skip swapcache for synchronous device. */
 		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
-			folio = shmem_swap_alloc_folio(inode, vma, index, swap, order, gfp);
-			if (!IS_ERR(folio)) {
+			/* Direct mTHP swapin without swap cache or readahead */
+			folio = shmem_swapin_direct(inode, vma, index,
+						    swap, order, gfp);
+			if (IS_ERR(folio)) {
+				error = PTR_ERR(folio);
+				folio = NULL;
+			} else {
 				skip_swapcache = true;
-				goto alloced;
 			}
-
+		} else {
 			/*
-			 * Fallback to swapin order-0 folio unless the swap entry
-			 * already exists.
+			 * Order 0 swapin using swap cache and readahead, it
+			 * may return order > 0 folio due to raced swap cache
 			 */
-			error = PTR_ERR(folio);
-			folio = NULL;
-			if (error == -EEXIST)
-				goto failed;
+			folio = shmem_swapin_cluster(swap, gfp, info, index);
 		}
-
-		/* Here we actually start the io */
-		folio = shmem_swapin_cluster(swap, gfp, info, index);
-		if (!folio) {
-			error = -ENOMEM;
+		if (!folio)
 			goto failed;
-		}
 	}
-
-alloced:
 	/*
 	 * We need to split an existing large entry if swapin brought in a
 	 * smaller folio due to various of reasons.
-- 
2.50.0

