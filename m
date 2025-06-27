Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA061A2398
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750993194; cv=none; b=E3PojXGmFG6gbHvjK922KRTeoyT5k6QWLpHlGyQpQ215r1HyTZIqUtgNmDtcQi/Ch1k+O4rGGmIxzMEYZlDnokfZSGgRYvGmuMyCGPwmaxXGMZtJn3/qamEjqT4SXxGqWGotkBjPXi501VgMQvWhHouO1oROSGW/1nf+NRsSIr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750993194; c=relaxed/simple;
	bh=4NqwKliYxy8MhrsnNyN+PcNi2iyEW5+AWz1gEYnmZ54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JF1nRjBCV/dlLR8S6bwhmYYyh8gy50hTflUT1bSFRR6BFIkxifHbeyeWl8w/kyohHjerF60Ah+MYWeY3ZDr7aKeW422wkMFGgnE0BmTtvfyLvElXLC2aRUDt190gqpMH15NcPiWLyLfafQlrxqGLTFc1VwjWluvZYm9IvZDUYQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+MCvt/2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+MCvt/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F48C4CEEB;
	Fri, 27 Jun 2025 02:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750993192;
	bh=4NqwKliYxy8MhrsnNyN+PcNi2iyEW5+AWz1gEYnmZ54=;
	h=From:To:Cc:Subject:Date:From;
	b=j+MCvt/2FcPez/rFPZyI6bhqypUTJfQAwX2v8YBWMRudhwu/XzFe/YL9wGejK+2yc
	 XIUTIeDbhxxVN4RSKl469DRbQzM3lXhYuxCaJOg8R+xhNZmypn997e2nLXGNPY92fx
	 wScR4n4/f825GRadPfvf3fdIxVjwcgzxys9Kpu5NbkVL125dvue2Ca5PufIOEf6UXW
	 ybuwKYBCvOPOq8Cgi0FFNM3uFi2S35d3SOMwwFAFSC1F8ngTbyg2kZTIgUyppA6K4A
	 xHFu//XGI+N+gPE5/YRxXJGOBjSYfzbIyQg0+vFiFyZGIflPBAIyFSYwlMJkEcDs9F
	 60AMMdVP9eoeg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] f2fs: account and print more stats during recovery
Date: Fri, 27 Jun 2025 10:59:43 +0800
Message-ID: <20250627025944.152334-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

F2FS-fs (vdc): f2fs_recover_fsync_data: recovery fsync data, check_only: 0
F2FS-fs (vdc): do_recover_data: start to recover dnode
F2FS-fs (vdc): recover_inode: ino = 5, name = testfile.t2, inline = 21
F2FS-fs (vdc): recover_data: ino = 5, nid = 5 (i_size: recover), range (0, 864), recovered = 1, err = 0
F2FS-fs (vdc): do_recover_data: dnode: (recoverable: 256, fsynced: 256, total: 256), recovered: (inode: 256, dentry: 1, dnode: 256), err: 0

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/recovery.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 51ebed4e1521..f7d2fc86aeb1 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -624,7 +624,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 {
 	struct dnode_of_data dn;
 	struct node_info ni;
-	unsigned int start, end;
+	unsigned int start = 0, end = 0, index;
 	int err = 0, recovered = 0;
 
 	/* step 1: recover xattr */
@@ -679,7 +679,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		goto err;
 	}
 
-	for (; start < end; start++, dn.ofs_in_node++) {
+	for (index = start; index < end; index++, dn.ofs_in_node++) {
 		block_t src, dest;
 
 		src = f2fs_data_blkaddr(&dn);
@@ -708,9 +708,9 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		}
 
 		if (!file_keep_isize(inode) &&
-			(i_size_read(inode) <= ((loff_t)start << PAGE_SHIFT)))
+			(i_size_read(inode) <= ((loff_t)index << PAGE_SHIFT)))
 			f2fs_i_size_write(inode,
-				(loff_t)(start + 1) << PAGE_SHIFT);
+				(loff_t)(index + 1) << PAGE_SHIFT);
 
 		/*
 		 * dest is reserved block, invalidate src block
@@ -765,9 +765,11 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 err:
 	f2fs_put_dnode(&dn);
 out:
-	f2fs_notice(sbi, "recover_data: ino = %lx (i_size: %s) recovered = %d, err = %d",
-		    inode->i_ino, file_keep_isize(inode) ? "keep" : "recover",
-		    recovered, err);
+	f2fs_notice(sbi, "recover_data: ino = %lx, nid = %x (i_size: %s), "
+		    "range (%u, %u), recovered = %d, err = %d",
+		    inode->i_ino, nid_of_node(&folio->page),
+		    file_keep_isize(inode) ? "keep" : "recover",
+		    start, end, recovered, err);
 	return err;
 }
 
@@ -778,6 +780,14 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 	int err = 0;
 	block_t blkaddr;
 	unsigned int ra_blocks = RECOVERY_MAX_RA_BLOCKS;
+	unsigned int recoverable_dnode = 0;
+	unsigned int fsynced_dnode = 0;
+	unsigned int total_dnode = 0;
+	unsigned int recovered_inode = 0;
+	unsigned int recovered_dentry = 0;
+	unsigned int recovered_dnode = 0;
+
+	f2fs_notice(sbi, "do_recover_data: start to recover dnode");
 
 	/* get node pages in the current segment */
 	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
@@ -800,10 +810,12 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 			f2fs_folio_put(folio, true);
 			break;
 		}
+		recoverable_dnode++;
 
 		entry = get_fsync_inode(inode_list, ino_of_node(&folio->page));
 		if (!entry)
 			goto next;
+		fsynced_dnode++;
 		/*
 		 * inode(x) | CP | inode(x) | dnode(F)
 		 * In this case, we can lose the latest inode(x).
@@ -815,6 +827,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 				f2fs_folio_put(folio, true);
 				break;
 			}
+			recovered_inode++;
 		}
 		if (entry->last_dentry == blkaddr) {
 			err = recover_dentry(entry->inode, &folio->page, dir_list);
@@ -822,12 +835,14 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 				f2fs_folio_put(folio, true);
 				break;
 			}
+			recovered_dentry++;
 		}
 		err = do_recover_data(sbi, entry->inode, folio);
 		if (err) {
 			f2fs_folio_put(folio, true);
 			break;
 		}
+		recovered_dnode++;
 
 		if (entry->blkaddr == blkaddr)
 			list_move_tail(&entry->list, tmp_inode_list);
@@ -840,9 +855,15 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		f2fs_folio_put(folio, true);
 
 		f2fs_ra_meta_pages_cond(sbi, blkaddr, ra_blocks);
+		total_dnode++;
 	}
 	if (!err)
 		err = f2fs_allocate_new_segments(sbi);
+
+	f2fs_notice(sbi, "do_recover_data: dnode: (recoverable: %u, fsynced: %u, "
+		"total: %u), recovered: (inode: %u, dentry: %u, dnode: %u), err: %d",
+		recoverable_dnode, fsynced_dnode, total_dnode, recovered_inode,
+		recovered_dentry, recovered_dnode, err);
 	return err;
 }
 
@@ -855,6 +876,9 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	unsigned long s_flags = sbi->sb->s_flags;
 	bool need_writecp = false;
 
+	f2fs_notice(sbi, "f2fs_recover_fsync_data: recovery fsync data, "
+					"check_only: %d", check_only);
+
 	if (is_sbi_flag_set(sbi, SBI_IS_WRITABLE))
 		f2fs_info(sbi, "recover fsync data on readonly fs");
 
-- 
2.49.0

