Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEB6295506
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253866; cv=none; b=mgmLPPz6P9bXCnp7Ua7pAo//XKUW1Uiv0URSkf6JteNpNgWkQWEomwAC2zZ/ZZIIByVD6LORI4VLonOXjj6a2iNnjnDYAMRrXsave9P9cBaOLvEibX2MvOUe2dQ0DJIZCbAAA6y+IFTZByG9fdAw2rbVJnmvhXsAE3SiqzG4dy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253866; c=relaxed/simple;
	bh=h4d3UnxGoxYRUnGJPqkcXxg5r7CmBhjCMdOw0JDzo2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DKJl6Q4lfCA9twSOZziEpR4By/0CLQSlbBO7SuBPU+2RLo94gGTr8erdwzq8knDQ35xbvM7oGFpN6NBnh4V8w059m6S5ZcsLb1ZMJ9e1SNKVCo4heRkHSY+/gqyjUYzbLHlYQjd/A7zU1P2ugzYpawl2e5pmooRJK42qIh1LMTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVqKEGfF; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVqKEGfF"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30c47918d84so263065a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253864; x=1747858664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8AlrphzJzFh3a5J5QPmLDB74oQwYSGsKj2pYO/+pAWY=;
        b=ZVqKEGfFyD/j/xrttVggAw1roGy5fM4yyeAzz+KpWp0XIRuIZsNkokSLoT1xRC/6t+
         DtwuxnAs9aIEJxQkyHDIPLn2AIgJodNMAeAO4Mrxpy6zbGIGdtvedmWIvPPOgsVe8tQC
         TW/qy+xLfTSJ6IK34/iRFt9nZVbVFn1vRKXGycDetQWTRwZJ7YKIi+t7XZrP+6GGbBKY
         yO+6hWPzp7AcxbeMbvEdT6JOUD6EPHNV5BA2GHHZFPGSM6YhdYC/c2DLDnr1AY0SaFRx
         yDryzk0N0jxMx/1dFCzhVyhGzt8+xCWDfPoeXN4RkiVfm1WG8dCVEYDFC54u/UKvXyn2
         DCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253864; x=1747858664;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8AlrphzJzFh3a5J5QPmLDB74oQwYSGsKj2pYO/+pAWY=;
        b=NFKschsDYkH+mQ8DzWPTt1UmPSl+CutrTnFFGD0A8xHrOFWMHKh1vkdWhqGRhWVsQE
         G0ir9Y8c7xYM5AZ6vKHqr5yW82mEu0M4JV6KPI/2U97AhPpWar0yyiv028gSrX4UyZQG
         0NjrePMVzsGMRwCz7MN/+0+BqvCC+dqY/yXRM4bdLL+ofFHmXt9iq1RnRCuroVkatk4C
         Hs0IDegfY7UC2CEb3WQWG3vBhDs4dXHFfeIqLocroI1aFtq9O6692gWVSAjPdh8iqz8x
         ojHSKv5EvXNj43+4Nbc3rcxBbSeDBXbNwyOgNibuTberby0nUNzWoNZ9MCSNGr5o0LdP
         rBRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7I7pzAT+eY3ZmTyMTiVW5zajZ87aHFN3Mip0xDuRYIDFCTWwEHwtguyJNzu8QR8pIee73KgqAicrpHe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdGOMou0YX6SNGBcHKU+wDZN0skIC/XJBrY/yzyUFzYKxLjeMs
	+WPcQqpGCR2v38FGel5M5INAM4q+fAhOrxPVbWLJIsWn/gdC1Wl4
X-Gm-Gg: ASbGncsUaaGWt6ukxlUbWgyGay7bYRDp4uHX2OILWhjkOsE3ZWy03r+XFNVUInqsp6B
	UTmxonTbYWw1kXsiwytK3vW8S39hH1FM/Nohd0iy30i/kkqvppIFj4Buw6IiMpBmNdQ6bDI8qzC
	n6pUqjrAyLiTFvGQQJrDdOcN5VBK942b8R+IJhJOjO3AnZSRFO58CBzNFIQTH1Zt0VUjsHCZG03
	ayXRfzI2ZhWL2HD+bU6clGM3JfjsIHXRL7WkMzU+VVltlRH3F0ikeKeVW8SJHlXM8q8daj6vnpN
	d7SbscMw11KkdbqtuuioMjo74oafAGlh8QnH3CFifuT1z4gGcQ6FhmIUwJA68ZA0JiYgcS41
X-Google-Smtp-Source: AGHT+IEePKZsW2RTsfW0tKVf1T8xZLvycmuR3dieqTOJNDka7eCP+i5yn8SNIGAd4e0FacSKYdOiaQ==
X-Received: by 2002:a17:90b:3802:b0:2fa:1a23:c01d with SMTP id 98e67ed59e1d1-30e2e5df0cbmr7143131a91.21.1747253864230;
        Wed, 14 May 2025 13:17:44 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.17.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:17:43 -0700 (PDT)
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
Subject: [PATCH 01/28] mm, swap: don't scan every fragment cluster
Date: Thu, 15 May 2025 04:17:01 +0800
Message-ID: <20250514201729.48420-2-ryncsn@gmail.com>
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

Fragment clusters were failing high order allocation already, the reason
we scan it now is that a swap entry may get freed without releasing the
cache so a swap map entry will end up in HAS_CACHE only status and the
cluster won't be moved back to non-full or free cluster list.

The chance is low and only happens with the device usage is low
(!vm_swap_full()). This is especially unhelpful for SWP_SYNCHRONOUS_IO
devices as swap cache almost always gets freed when count reaches zero
for these device.

And besides, high order allocation failure isn't a critical issue.
Having the scan actually slow down mTHP allocation by a lot
when the fragment cluster list is long.

The HAS_CACHE issue will be fixed in a proper way later, so drop this
fragment cluster scanning design.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/swap.h |  1 -
 mm/swapfile.c        | 32 +++++++++-----------------------
 2 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index bc0e1c275fc0..817e427a47d2 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -310,7 +310,6 @@ struct swap_info_struct {
 					/* list of cluster that contains at least one free slot */
 	struct list_head frag_clusters[SWAP_NR_ORDERS];
 					/* list of cluster that are fragmented or contented */
-	atomic_long_t frag_cluster_nr[SWAP_NR_ORDERS];
 	unsigned int pages;		/* total of usable pages of swap */
 	atomic_long_t inuse_pages;	/* number of those currently in use */
 	struct swap_sequential_cluster *global_cluster; /* Use one global cluster for rotating device */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 026090bf3efe..34188714479f 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -470,11 +470,6 @@ static void move_cluster(struct swap_info_struct *si,
 	else
 		list_move_tail(&ci->list, list);
 	spin_unlock(&si->lock);
-
-	if (ci->flags == CLUSTER_FLAG_FRAG)
-		atomic_long_dec(&si->frag_cluster_nr[ci->order]);
-	else if (new_flags == CLUSTER_FLAG_FRAG)
-		atomic_long_inc(&si->frag_cluster_nr[ci->order]);
 	ci->flags = new_flags;
 }
 
@@ -926,32 +921,25 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si, int o
 		swap_reclaim_full_clusters(si, false);
 
 	if (order < PMD_ORDER) {
-		unsigned int frags = 0, frags_existing;
-
 		while ((ci = isolate_lock_cluster(si, &si->nonfull_clusters[order]))) {
 			found = alloc_swap_scan_cluster(si, ci, cluster_offset(si, ci),
 							order, usage);
 			if (found)
 				goto done;
-			/* Clusters failed to allocate are moved to frag_clusters */
-			frags++;
 		}
 
-		frags_existing = atomic_long_read(&si->frag_cluster_nr[order]);
-		while (frags < frags_existing &&
-		       (ci = isolate_lock_cluster(si, &si->frag_clusters[order]))) {
-			atomic_long_dec(&si->frag_cluster_nr[order]);
-			/*
-			 * Rotate the frag list to iterate, they were all
-			 * failing high order allocation or moved here due to
-			 * per-CPU usage, but they could contain newly released
-			 * reclaimable (eg. lazy-freed swap cache) slots.
-			 */
+		/*
+		 * Scan only one fragment cluster is good enough. Order 0
+		 * allocation will surely success, and mTHP allocation failure
+		 * is not critical, and scanning one cluster still keeps the
+		 * list rotated and scanned (for reclaiming HAS_CACHE).
+		 */
+		ci = isolate_lock_cluster(si, &si->frag_clusters[order]);
+		if (ci) {
 			found = alloc_swap_scan_cluster(si, ci, cluster_offset(si, ci),
-							order, usage);
+					order, usage);
 			if (found)
 				goto done;
-			frags++;
 		}
 	}
 
@@ -973,7 +961,6 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si, int o
 		 * allocation, but reclaim may drop si->lock and race with another user.
 		 */
 		while ((ci = isolate_lock_cluster(si, &si->frag_clusters[o]))) {
-			atomic_long_dec(&si->frag_cluster_nr[o]);
 			found = alloc_swap_scan_cluster(si, ci, cluster_offset(si, ci),
 							0, usage);
 			if (found)
@@ -3234,7 +3221,6 @@ static struct swap_cluster_info *setup_clusters(struct swap_info_struct *si,
 	for (i = 0; i < SWAP_NR_ORDERS; i++) {
 		INIT_LIST_HEAD(&si->nonfull_clusters[i]);
 		INIT_LIST_HEAD(&si->frag_clusters[i]);
-		atomic_long_set(&si->frag_cluster_nr[i], 0);
 	}
 
 	/*
-- 
2.49.0

