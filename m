Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC261DF73D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744610499; cv=none; b=N/hP1OpCUOKvPyC13GvZlA2voIDy0NnIdL2S84h08xTeBJ3KJ5QJp1HOJynpRp3I1d/uVfMu+2MZvtqsPVEl54FqQaGUHKF9MowyltxkRdKRfQ5XA/d6bUrmbykrioTyIahirT+iJmT3i2CIPeXi1urEViiaf6hLz/WNiJvt+rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744610499; c=relaxed/simple;
	bh=AyHlGK3bnet9Kd4HcPtbDVU5JRbcUoHT5hbOQe5YL5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBvu+W/JsC4nWfi9wquMSDgRfKujRlAPFdl1S8T8aVkaHEnbI1fmvYK9qiniNcDZPYKPT8m6YeYuEmGz+oIE+xE/hYm96XaTvQLkAy4xrI+CitZoPYoIlLiLyv95Zpi5OazH6fx8Locbdv+y57us6GtK5p/zvzCRNrKt5iM2XM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Etgg3wN4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Etgg3wN4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so3363955e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 23:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744610495; x=1745215295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHkzL6ByD68BHwyJwz9RIFlyTlbarM9Ao6uMqg627CI=;
        b=Etgg3wN4UOKAUB3EYNYDmLrTLmYO2fYBmMKkkX6UBguxiyyC7flVYzNDbje65kx/Ck
         yRu6eol5rhFZsmAHiynJKHY4Bb1KnUXE0fX47XCAmBffaqgVjcO5d7ELDlMC7SJ5k6eM
         5l2tUMe8ryITYDf6XpBLv7QqQXku1S6E76u4Flvnslvvlt2Eh0Bpmx4L58FqeaSE5GtR
         faTPF3TqIX7pSDn1lCaDiLb661jRj4p/lFDWGZ22ayP/Vs+vCbU9UWRJQO2BYGpMXI1D
         NpMEg4HQO/OOZ564kF04/WzWJv71Ekaok6FuYtONzGW+w9kTDwQ/8hk2nrpuFR3cW2fl
         oy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744610495; x=1745215295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHkzL6ByD68BHwyJwz9RIFlyTlbarM9Ao6uMqg627CI=;
        b=nuEn9O2fefOCoo0g1M4SVwuJ6qyBvydbZYt8v/j2IlpsE51hHKL7G2IGLpibZ2ZjqJ
         YBWi/1zK1Vo+U8sydu1DUKcgqSfnMvx8+vygBTeZqjlhJHitJA3QOY2SETWUHciMt+Bn
         wYOQDZMKj8mHL2TLLJ40Dz0D2kQR2deskM/3ehD4EYkl8pWO7LA3xn9dCdHTXlaBORWD
         VuHmDN7xwXhwnvL2t6PXJ0cBvqb3ebbtHdFqgHyYK0NbdBfQBnlnjBKXtfoKWyS7JObB
         wKhe1fCHRNLoZWqGG2+ntAWcNgcODlxFN7Ja8KFrWhEWAoJXL7o+XrYYRT7cThy0K/Zf
         zjJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV24ik2UoCf1S8sBSRR/Q3TWBbnJlrSWESZBa8Qo+s6z8PQBBqzQ9klMRmj2KEstl7uFOQ43xtTTLp7CxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU41rm4+wIJ7RpPkD873nBSMblqxAOXAPdwXEBuCnP5BfDuCq/
	wi4qWzEFFpQ3KphLftkF/NWYWcZvvPmUNoBXDVNbw5nUX8T/NrwNipTiUbyKDtLRLj4XKSo+Egz
	l
X-Gm-Gg: ASbGnct0zAVj1SRd04t1YyynIfVkaQAj9jGy4raj+gjZnRWrjd8tq0cHq0eDFonHCaG
	GQz9dG+mNUG1O6OO5ckj545x4MP3iZ5xwe4AHKCqeZ30LFVJYowHk5pPsL09Wka9ZKlxRbtu+Bf
	j4/hKeHITAL4EvVDGHV9PViME5ts6eqD+EwOQL7+ZYMYW1RyLOQ//qLUEMu2kxRaJaExoV0DGx/
	RXuzh5mbjR6fFSH+Q5Retg80SiOiXuMGh1EQMajj1TfV06z29Qro2bwIo9xXR+7lznAG6sppWno
	aHCmKvKURwzeGuOzD8rUzqnzQUZS/3m6ug4lrn5A6WQ+worB/Uuu+JLKE9e2c1oEBg==
X-Google-Smtp-Source: AGHT+IHqkL/jB7bJHRSxi3RdPmce7drmHBQpR0tbDBwXoDyNFuZl8wZqXe1lybTZoPmqpmuBMCyqrw==
X-Received: by 2002:a5d:5f4e:0:b0:39c:13fa:3e0 with SMTP id ffacd0b85a97d-39ea5313da5mr2871230f8f.9.1744610495199;
        Sun, 13 Apr 2025 23:01:35 -0700 (PDT)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c3c1sm92029555ad.60.2025.04.13.23.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 23:01:34 -0700 (PDT)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gautham.ananthakrishna@oracle.com
Subject: [PATCH v2 1/1] ocfs2: fix the issue with discontiguous allocation in the global_bitmap
Date: Mon, 14 Apr 2025 14:01:23 +0800
Message-ID: <20250414060125.19938-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414060125.19938-1-heming.zhao@suse.com>
References: <20250414060125.19938-1-heming.zhao@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit 4eb7b93e0310 ("ocfs2: improve write IO performance when
fragmentation is high") introduced another regression.

The following ocfs2-test case can trigger this issue:
> discontig_runner.sh => activate_discontig_bg.sh => resv_unwritten:
> ${RESV_UNWRITTEN_BIN} -f ${WORK_PLACE}/large_testfile -s 0 -l \
> $((${FILE_MAJOR_SIZE_M}*1024*1024))

In my env, test disk size (by "fdisk -l <dev>"):
> 53687091200 bytes, 104857600 sectors.

Above command is:
> /usr/local/ocfs2-test/bin/resv_unwritten -f \
> /mnt/ocfs2/ocfs2-activate-discontig-bg-dir/large_testfile -s 0 -l \
> 53187969024

Error log:
> [*] Reserve 50724M space for a LARGE file, reserve 200M space for future test.
> ioctl error 28: "No space left on device"
> resv allocation failed Unknown error -1
> reserve unwritten region from 0 to 53187969024.

Call flow:
__ocfs2_change_file_space //by ioctl OCFS2_IOC_RESVSP64
 ocfs2_allocate_unwritten_extents //start:0 len:53187969024
  while()
   + ocfs2_get_clusters //cpos:0, alloc_size:1623168 (cluster number)
   + ocfs2_extend_allocation
     + ocfs2_lock_allocators
     |  + choose OCFS2_AC_USE_MAIN & ocfs2_cluster_group_search
     |
     + ocfs2_add_inode_data
        ocfs2_add_clusters_in_btree
         __ocfs2_claim_clusters
          ocfs2_claim_suballoc_bits
          + During the allocation of the final part of the large file
	    (after ~47GB), no chain had the required contiguous
            bits_wanted. Consequently, the allocation failed.

How to fix:
When OCFS2 is encountering fragmented allocation, the file system should
stop attempting bits_wanted contiguous allocation and instead provide the
largest available contiguous free bits from the cluster groups.

Reported-by: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
Signed-off-by: Heming Zhao <heming.zhao@suse.com>
Fixes: 4eb7b93e0310 ("ocfs2: improve write IO performance when fragmentation is high")
---
 fs/ocfs2/suballoc.c | 38 ++++++++++++++++++++++++++++++++------
 fs/ocfs2/suballoc.h |  1 +
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
index f7b483f0de2a..6ac4dcd54588 100644
--- a/fs/ocfs2/suballoc.c
+++ b/fs/ocfs2/suballoc.c
@@ -698,10 +698,12 @@ static int ocfs2_block_group_alloc(struct ocfs2_super *osb,
 
 	bg_bh = ocfs2_block_group_alloc_contig(osb, handle, alloc_inode,
 					       ac, cl);
-	if (PTR_ERR(bg_bh) == -ENOSPC)
+	if (PTR_ERR(bg_bh) == -ENOSPC) {
+		ac->ac_which = OCFS2_AC_USE_MAIN_DISCONTIG;
 		bg_bh = ocfs2_block_group_alloc_discontig(handle,
 							  alloc_inode,
 							  ac, cl);
+	}
 	if (IS_ERR(bg_bh)) {
 		status = PTR_ERR(bg_bh);
 		bg_bh = NULL;
@@ -1794,6 +1796,7 @@ static int ocfs2_search_chain(struct ocfs2_alloc_context *ac,
 {
 	int status;
 	u16 chain;
+	u32 contig_bits;
 	u64 next_group;
 	struct inode *alloc_inode = ac->ac_inode;
 	struct buffer_head *group_bh = NULL;
@@ -1819,10 +1822,21 @@ static int ocfs2_search_chain(struct ocfs2_alloc_context *ac,
 	status = -ENOSPC;
 	/* for now, the chain search is a bit simplistic. We just use
 	 * the 1st group with any empty bits. */
-	while ((status = ac->ac_group_search(alloc_inode, group_bh,
-					     bits_wanted, min_bits,
-					     ac->ac_max_block,
-					     res)) == -ENOSPC) {
+	while (1) {
+		if (ac->ac_which == OCFS2_AC_USE_MAIN_DISCONTIG) {
+			contig_bits = le16_to_cpu(bg->bg_contig_free_bits);
+			if (!contig_bits)
+				contig_bits = ocfs2_find_max_contig_free_bits(bg->bg_bitmap,
+						le16_to_cpu(bg->bg_bits), 0);
+			if (bits_wanted > contig_bits && contig_bits >= min_bits)
+				bits_wanted = contig_bits;
+		}
+
+		status = ac->ac_group_search(alloc_inode, group_bh,
+				bits_wanted, min_bits,
+				ac->ac_max_block, res);
+		if (status != -ENOSPC)
+			break;
 		if (!bg->bg_next_group)
 			break;
 
@@ -1982,6 +1996,7 @@ static int ocfs2_claim_suballoc_bits(struct ocfs2_alloc_context *ac,
 	victim = ocfs2_find_victim_chain(cl);
 	ac->ac_chain = victim;
 
+search:
 	status = ocfs2_search_chain(ac, handle, bits_wanted, min_bits,
 				    res, &bits_left);
 	if (!status) {
@@ -2022,6 +2037,16 @@ static int ocfs2_claim_suballoc_bits(struct ocfs2_alloc_context *ac,
 		}
 	}
 
+	/* Chains can't supply the bits_wanted contiguous space.
+	 * We should switch to using every single bit when allocating
+	 * from the global bitmap. */
+	if (i == le16_to_cpu(cl->cl_next_free_rec) &&
+	    status == -ENOSPC && ac->ac_which == OCFS2_AC_USE_MAIN) {
+		ac->ac_which = OCFS2_AC_USE_MAIN_DISCONTIG;
+		ac->ac_chain = victim;
+		goto search;
+	}
+
 set_hint:
 	if (status != -ENOSPC) {
 		/* If the next search of this group is not likely to
@@ -2365,7 +2390,8 @@ int __ocfs2_claim_clusters(handle_t *handle,
 	BUG_ON(ac->ac_bits_given >= ac->ac_bits_wanted);
 
 	BUG_ON(ac->ac_which != OCFS2_AC_USE_LOCAL
-	       && ac->ac_which != OCFS2_AC_USE_MAIN);
+	       && ac->ac_which != OCFS2_AC_USE_MAIN
+	       && ac->ac_which != OCFS2_AC_USE_MAIN_DISCONTIG);
 
 	if (ac->ac_which == OCFS2_AC_USE_LOCAL) {
 		WARN_ON(min_clusters > 1);
diff --git a/fs/ocfs2/suballoc.h b/fs/ocfs2/suballoc.h
index b481b834857d..bcf2ed4a8631 100644
--- a/fs/ocfs2/suballoc.h
+++ b/fs/ocfs2/suballoc.h
@@ -29,6 +29,7 @@ struct ocfs2_alloc_context {
 #define OCFS2_AC_USE_MAIN  2
 #define OCFS2_AC_USE_INODE 3
 #define OCFS2_AC_USE_META  4
+#define OCFS2_AC_USE_MAIN_DISCONTIG  5
 	u32    ac_which;
 
 	/* these are used by the chain search */
-- 
2.43.0

