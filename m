Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B659298C2F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253996; cv=none; b=grzDW0IeetmVFbRpojTp2G1JbJPMrggl2uoyxrXDknV4MlpTTLnViiRi0GICRAxipgSNdcnQNKF+p3L2gidRxZjK0cpSfXf6ILvtyZ8VlmNpJPghzREbVJky5DTm+hbv25NuOGRGR4/i65peQCG2y0ItLcLcHghEC4K815fDcFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253996; c=relaxed/simple;
	bh=7B1r3TeIdhnFhWPTvEnFZH3zdrAwF9UABoIjPfaYNRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HWbvX7lx8WIanIWb16xU9OeKMSVQLKms0U+uUpY1RZ7b0LK17asnwwcSvUVmeABC9m4H2SjTWrwsQcP+pDnSk/VzfYykue26/T84XiB5U8yZByiAn6RtsLocZOXXe2cqi2uGhluEioSq6Hs4Qyx6zMGdtSvdbxSBsB0zMB+3Gt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5J85lzS; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5J85lzS"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30572effb26so269842a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253993; x=1747858793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kieNeCak+ITnknuJUBxpgpyVfGZnqgFMcLNwpEE3iT0=;
        b=j5J85lzSSrPbtm/CqA5f8eWezNduRS+OMjSZRFYc87/L8vzZjtyN0198OV+UC2KeG6
         t7M0ZdCmdPetNObtV9YLY85inHf0nOjr+18MFExzbeBIiiRynk70F9FIfPPkOExWm134
         fN+cBRY+E4WOlsQ/P+Co5MXAokKxP3iv3SlliGPcpRTBPHcnd2H5iDKzlYJLIhkxdLtz
         XhcD1T2BByjetEHxVqBwinuWSDpE8vtbLE/X/2EWHp8AYt3lV3ytwQZquCYFEJIlGJEq
         RwyKz1Q3gW0qG6wdR8AwHrc1l1WVEGTSXZhNQ4aualqi5AMLDO8RNgG1AQ14PcDrQ4Vy
         zDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253993; x=1747858793;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kieNeCak+ITnknuJUBxpgpyVfGZnqgFMcLNwpEE3iT0=;
        b=jtGjO2gR8vNMIr5IyAfBABWLGMR8fFuGaMUMYIKhZgcstsJRgxN36lic/vl1GDPWtR
         SBkT34r5ltwmpemTkdRv4zEOUqdGPvhap8pmhfsVMvmRNFPj9Hzyrsw/xi+uCrs6o/kb
         5+rfPiwAZURr5o8YsORELqQ4964d29AuJfoYaRf1Bu3P9jJy7o39YVAkrTExPZaZaDbr
         92o4REqyBY3mW9wMOrj1rS8kTdkfg3JonB1Y8jD/p4qXSrP7o5Yh6IOPZfedXrjIYfdC
         OOzNIxzlj6LcJZggKN2JL5G7cdnbCPwKRDnj7nLxWncSABE9UdL8aD5+nsZl+7/SUeJ7
         kqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsGotFIwMfJBiWrmxHsavwEjnO5bKu6PHMKyMiwajRIekWhvuiRXjhBlghSjlui0puyZsyX2SFNrFBaP0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2+rLb01PZ4tj1w3qTx2pW2keC57qZhHg05lePN9YPB3gLgK7b
	yvLK2NpNBh1pdDNH8xn9JwaGAqCuyHxSH7fRiDrTkGqdTvfz7pgf
X-Gm-Gg: ASbGnct3f2el5zijmlI5LJfHDC8r76BfXig63uJ0SqQFGyQxffPRwn/UD85YEFIVybQ
	dMJKqujuWquYYtko04O76U1sDLAwXb6R35o/XjcwoNU7FRPA4C7ZgNsKbnWJPft3KGjFf5PBscp
	3g50E6Ii0S/bFEGP60gj5BnsnOseREC3pJkNoDavqi10X0DksPiNu6h3z2JSUvguL8OekaHsTHx
	EjNmeTnT4m2UGPb9A04aR2zjA2SQRhnxGbJQUSPs1bkG+pg0R7t2aGaB5h2wm+MwxIqyAG0QWVI
	Db86vAW+x7tNnkArTHz2JNIQC/y4pG8QKdunmGhkiv0gczvx3Q/mNqI4D2NeVuML0EB8hNFg
X-Google-Smtp-Source: AGHT+IFl/r9CN+crqDsxYvo8EMEo/YC1S6DWzNj/HegMUGLxoAOhlawJgO2Ah9N5Ugc1zkPvkdV1FA==
X-Received: by 2002:a17:90b:3bce:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-30e2e5e7752mr7629337a91.9.1747253993298;
        Wed, 14 May 2025 13:19:53 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.19.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:19:52 -0700 (PDT)
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
Subject: [PATCH 26/28] mm, swap: minor clean up for swapon
Date: Thu, 15 May 2025 04:17:26 +0800
Message-ID: <20250514201729.48420-27-ryncsn@gmail.com>
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

Setup cluster info first as now it's the most basic info for swap device
now, and clean up swap_map setting. There is no need to pass the
them as argument for multiple functions, they are never set to NULL once
allocated, so just set it once.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swapfile.c | 62 +++++++++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 36 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 28bb0a74e4a6..c50cbf6578d3 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2440,8 +2440,6 @@ static int swap_node(struct swap_info_struct *si)
 }
 
 static void setup_swap_info(struct swap_info_struct *si, int prio,
-			    unsigned char *swap_map,
-			    struct swap_cluster_info *cluster_info,
 			    unsigned long *zeromap)
 {
 	int i;
@@ -2465,8 +2463,6 @@ static void setup_swap_info(struct swap_info_struct *si, int prio,
 				si->avail_lists[i].prio = -si->prio;
 		}
 	}
-	si->swap_map = swap_map;
-	si->cluster_info = cluster_info;
 	si->zeromap = zeromap;
 }
 
@@ -2493,13 +2489,11 @@ static void _enable_swap_info(struct swap_info_struct *si)
 }
 
 static void enable_swap_info(struct swap_info_struct *si, int prio,
-				unsigned char *swap_map,
-				struct swap_cluster_info *cluster_info,
 				unsigned long *zeromap)
 {
 	spin_lock(&swap_lock);
 	spin_lock(&si->lock);
-	setup_swap_info(si, prio, swap_map, cluster_info, zeromap);
+	setup_swap_info(si, prio, zeromap);
 	spin_unlock(&si->lock);
 	spin_unlock(&swap_lock);
 	/*
@@ -2517,7 +2511,7 @@ static void reinsert_swap_info(struct swap_info_struct *si)
 {
 	spin_lock(&swap_lock);
 	spin_lock(&si->lock);
-	setup_swap_info(si, si->prio, si->swap_map, si->cluster_info, si->zeromap);
+	setup_swap_info(si, si->prio, si->zeromap);
 	_enable_swap_info(si);
 	spin_unlock(&si->lock);
 	spin_unlock(&swap_lock);
@@ -2541,13 +2535,13 @@ static void wait_for_allocation(struct swap_info_struct *si)
 	}
 }
 
-static void free_cluster_info(struct swap_cluster_info *cluster_info,
-			      unsigned long maxpages)
+static void free_swap_cluster_info(struct swap_cluster_info *cluster_info,
+				   unsigned long max)
 {
-	int i, nr_clusters = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
-
+	int i, nr_clusters = DIV_ROUND_UP(max, SWAPFILE_CLUSTER);
 	if (!cluster_info)
 		return;
+	VM_WARN_ON(!nr_clusters);
 	for (i = 0; i < nr_clusters; i++)
 		cluster_table_free(&cluster_info[i]);
 	kvfree(cluster_info);
@@ -2580,7 +2574,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	struct swap_info_struct *p = NULL;
 	unsigned char *swap_map;
 	unsigned long *zeromap;
-	struct swap_cluster_info *cluster_info;
 	struct file *swap_file, *victim;
 	struct address_space *mapping;
 	struct inode *inode;
@@ -2687,14 +2680,13 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 
 	swap_file = p->swap_file;
 	p->swap_file = NULL;
-	p->max = 0;
 	swap_map = p->swap_map;
 	p->swap_map = NULL;
 	zeromap = p->zeromap;
 	p->zeromap = NULL;
-	cluster_info = p->cluster_info;
-	free_cluster_info(cluster_info, p->max);
+	free_swap_cluster_info(p->cluster_info, p->max);
 	p->cluster_info = NULL;
+	p->max = 0;
 	spin_unlock(&p->lock);
 	spin_unlock(&swap_lock);
 	arch_swap_invalidate_area(p->type);
@@ -3067,7 +3059,6 @@ static int setup_swap_map_and_extents(struct swap_info_struct *si,
 
 	if (nr_good_pages) {
 		swap_map[0] = SWAP_MAP_BAD;
-		si->max = maxpages;
 		si->pages = nr_good_pages;
 		nr_extents = setup_swap_extents(si, span);
 		if (nr_extents < 0)
@@ -3089,13 +3080,12 @@ static int setup_swap_map_and_extents(struct swap_info_struct *si,
 #define SWAP_CLUSTER_COLS						\
 	max_t(unsigned int, SWAP_CLUSTER_INFO_COLS, SWAP_CLUSTER_SPACE_COLS)
 
-static struct swap_cluster_info *setup_clusters(struct swap_info_struct *si,
-						union swap_header *swap_header,
-						unsigned long maxpages)
+static int setup_swap_clusters_info(struct swap_info_struct *si,
+				    union swap_header *swap_header,
+				    unsigned long maxpages)
 {
 	unsigned long nr_clusters = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
 	struct swap_cluster_info *cluster_info;
-	int err = -ENOMEM;
 	unsigned long i;
 
 	cluster_info = kvcalloc(nr_clusters, sizeof(*cluster_info), GFP_KERNEL);
@@ -3151,11 +3141,12 @@ static struct swap_cluster_info *setup_clusters(struct swap_info_struct *si,
 			list_add_tail(&ci->list, &si->free_clusters);
 		}
 	}
-	return cluster_info;
+	si->cluster_info = cluster_info;
+	return 0;
 err_free:
-	free_cluster_info(cluster_info, maxpages);
+	free_swap_cluster_info(cluster_info, maxpages);
 err:
-	return ERR_PTR(err);
+	return -ENOMEM;
 }
 
 SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
@@ -3173,7 +3164,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	unsigned long maxpages;
 	unsigned char *swap_map = NULL;
 	unsigned long *zeromap = NULL;
-	struct swap_cluster_info *cluster_info = NULL;
 	struct folio *folio = NULL;
 	struct inode *inode = NULL;
 	bool inced_nr_rotate_swap = false;
@@ -3241,13 +3231,19 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	swap_header = kmap_local_folio(folio, 0);
 
 	maxpages = read_swap_header(si, swap_header, inode);
+	si->max = maxpages;
 	if (unlikely(!maxpages)) {
 		error = -EINVAL;
 		goto bad_swap_unlock_inode;
 	}
 
+	error = setup_swap_clusters_info(si, swap_header, maxpages);
+	if (error)
+		goto bad_swap_unlock_inode;
+
 	/* OK, set up the swap map and apply the bad block list */
 	swap_map = vzalloc(maxpages);
+	si->swap_map = swap_map;
 	if (!swap_map) {
 		error = -ENOMEM;
 		goto bad_swap_unlock_inode;
@@ -3288,13 +3284,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		inced_nr_rotate_swap = true;
 	}
 
-	cluster_info = setup_clusters(si, swap_header, maxpages);
-	if (IS_ERR(cluster_info)) {
-		error = PTR_ERR(cluster_info);
-		cluster_info = NULL;
-		goto bad_swap_unlock_inode;
-	}
-
 	if ((swap_flags & SWAP_FLAG_DISCARD) &&
 	    si->bdev && bdev_max_discard_sectors(si->bdev)) {
 		/*
@@ -3345,7 +3334,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	prio = -1;
 	if (swap_flags & SWAP_FLAG_PREFER)
 		prio = swap_flags & SWAP_FLAG_PRIO_MASK;
-	enable_swap_info(si, prio, swap_map, cluster_info, zeromap);
+	enable_swap_info(si, prio, zeromap);
 
 	pr_info("Adding %uk swap on %s.  Priority:%d extents:%d across:%lluk %s%s%s%s\n",
 		K(si->pages), name->name, si->prio, nr_extents,
@@ -3375,10 +3364,11 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	si->swap_file = NULL;
 	si->flags = 0;
 	spin_unlock(&swap_lock);
-	vfree(swap_map);
+	vfree(si->swap_map);
+	si->swap_map = NULL;
+	free_swap_cluster_info(si->cluster_info, si->max);
+	si->cluster_info = NULL;
 	kvfree(zeromap);
-	if (cluster_info)
-		free_cluster_info(cluster_info, maxpages);
 	if (inced_nr_rotate_swap)
 		atomic_dec(&nr_rotate_swap);
 	if (swap_file)
-- 
2.49.0

