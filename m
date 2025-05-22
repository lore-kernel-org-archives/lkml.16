Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB40E29CE6
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747884718; cv=none; b=Uz1crWie/USfmCLikLUbfzXQrQ9ldL5HYGjbfwbEsTIQ0M4FYTqRJuIet4hA5VQrGEA/aleZZmyWnSrVFsrqyVju3CKumy5ka5iMGYV4pPGzMMdnFFyxnB/tc3a0NOtoNPTLyfV9M4fyMUbu1DZodCWd+pru+XiL1k6hgxLwrTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747884718; c=relaxed/simple;
	bh=UXwlqC7O8+HrgPAr/FR4rcNv+SzUHHJYf5FmJhcdYGg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bReTM7ySVlpN00WBZqBQzXTV/iC9QClUuqmhbcq8RonvuZEQ1X/Kkr7nzU2BJCJTmL87TGfiMUPWkEIAE/lZJG7/l2w2nbvsRvtp9EP/mJP2cDM46nJXueNmZrdvrtjwGt49E9hPX6e1SmWgiUZHPsMmaZ/eWGayMH8JucK89cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4b2v333dGxz4f3l7n
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:31:27 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 8E6E11A0BAD
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:31:52 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP1 (Coremail) with SMTP id cCh0CgC3Z3immi5okKq2Mw--.19487S4;
	Thu, 22 May 2025 11:31:52 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: akpm@linux-foundation.org
Cc: kasong@tencent.com,
	bhe@redhat.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] mm: swap: correctly use maxpages in swapon syscall to avoid potensial deadloop
Date: Thu, 22 May 2025 20:25:52 +0800
Message-Id: <20250522122554.12209-3-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250522122554.12209-1-shikemeng@huaweicloud.com>
References: <20250522122554.12209-1-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgC3Z3immi5okKq2Mw--.19487S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGrWkAF17XryUWFWrGw4kWFg_yoWrCry7pF
	W3WF90kr4kJryftw17A3WDCry3Gr1fCa17tF43Ja4Sv3WDJrySgFy8tFnYkryfKFykJFyD
	trs7t343uFs0va7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmlb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vEnII2IxkI6r1a6r45M2
	8IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK
	0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4
	x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l
	84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI
	0_JF0_Jw1l42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_JF0_Jw1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
	JbIYCTnIWIevJa73UjIFyTuYvjxUaknYDUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

We use maxpages from read_swap_header() to initialize swap_info_struct,
however the maxpages might be reduced in setup_swap_extents() and the
si->max is assigned with the reduced maxpages from the
setup_swap_extents().
Obviously, this could lead to memory waste as we allocated memory based on
larger maxpages, besides, this could lead to a potensial deadloop as
following:
1) When calling setup_clusters() with larger maxpages, unavailable pages
within range [si->max, larger maxpages) are not accounted with
inc_cluster_info_page(). As a result, these pages are assumed available
but can not be allocated. The cluster contains these pages can be moved
to frag_clusters list after it's all available pages were allocated.
2) When the cluster mentioned in 1) is the only cluster in frag_clusters
list, cluster_alloc_swap_entry() assume order 0 allocation will never
failed and will enter a deadloop by keep trying to allocate page from the
only cluster in frag_clusters which contains no actually available page.

Call setup_swap_extents() to get the final maxpages before swap_info_struct
initialization to fix the issue.

Fixes: 661383c6111a3 ("mm: swap: relaim the cached parts that got scanned")
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 mm/swapfile.c | 47 ++++++++++++++++++++---------------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 75b69213c2e7..a82f4ebefca3 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3141,43 +3141,30 @@ static unsigned long read_swap_header(struct swap_info_struct *si,
 	return maxpages;
 }
 
-static int setup_swap_map_and_extents(struct swap_info_struct *si,
-					union swap_header *swap_header,
-					unsigned char *swap_map,
-					unsigned long maxpages,
-					sector_t *span)
+static int setup_swap_map(struct swap_info_struct *si,
+			  union swap_header *swap_header,
+			  unsigned char *swap_map,
+			  unsigned long maxpages)
 {
-	unsigned int nr_good_pages;
 	unsigned long i;
-	int nr_extents;
-
-	nr_good_pages = maxpages - 1;	/* omit header page */
 
+	swap_map[0] = SWAP_MAP_BAD; /* omit header page */
 	for (i = 0; i < swap_header->info.nr_badpages; i++) {
 		unsigned int page_nr = swap_header->info.badpages[i];
 		if (page_nr == 0 || page_nr > swap_header->info.last_page)
 			return -EINVAL;
 		if (page_nr < maxpages) {
 			swap_map[page_nr] = SWAP_MAP_BAD;
-			nr_good_pages--;
+			si->pages--;
 		}
 	}
 
-	if (nr_good_pages) {
-		swap_map[0] = SWAP_MAP_BAD;
-		si->max = maxpages;
-		si->pages = nr_good_pages;
-		nr_extents = setup_swap_extents(si, span);
-		if (nr_extents < 0)
-			return nr_extents;
-		nr_good_pages = si->pages;
-	}
-	if (!nr_good_pages) {
+	if (!si->pages) {
 		pr_warn("Empty swap-file\n");
 		return -EINVAL;
 	}
 
-	return nr_extents;
+	return 0;
 }
 
 #define SWAP_CLUSTER_INFO_COLS						\
@@ -3217,7 +3204,7 @@ static struct swap_cluster_info *setup_clusters(struct swap_info_struct *si,
 	 * Mark unusable pages as unavailable. The clusters aren't
 	 * marked free yet, so no list operations are involved yet.
 	 *
-	 * See setup_swap_map_and_extents(): header page, bad pages,
+	 * See setup_swap_map(): header page, bad pages,
 	 * and the EOF part of the last cluster.
 	 */
 	inc_cluster_info_page(si, cluster_info, 0);
@@ -3354,6 +3341,15 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		goto bad_swap_unlock_inode;
 	}
 
+	si->max = maxpages;
+	si->pages = maxpages - 1;
+	nr_extents = setup_swap_extents(si, &span);
+	if (nr_extents < 0) {
+		error = nr_extents;
+		goto bad_swap_unlock_inode;
+	}
+	maxpages = si->max;
+
 	/* OK, set up the swap map and apply the bad block list */
 	swap_map = vzalloc(maxpages);
 	if (!swap_map) {
@@ -3365,12 +3361,9 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	if (error)
 		goto bad_swap_unlock_inode;
 
-	nr_extents = setup_swap_map_and_extents(si, swap_header, swap_map,
-						maxpages, &span);
-	if (unlikely(nr_extents < 0)) {
-		error = nr_extents;
+	error = setup_swap_map(si, swap_header, swap_map, maxpages);
+	if (error)
 		goto bad_swap_unlock_inode;
-	}
 
 	/*
 	 * Use kvmalloc_array instead of bitmap_zalloc as the allocation order might
-- 
2.30.0

