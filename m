Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8201D155342
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 07:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749454732; cv=none; b=Xw37MASH3tsy0q5dYVo82vbJsH6GhDVFsVW5oraQztHnGqXd4FTzbASh4txIOfiu1NO1sE1LaFbgfb0gIyqBXZqhdSjSeM9J/AY7OzrtWmPxV45SnvXY+sYv087b6XxN/hAdOjLKYR/BA/fA1VmkxIduJVXK9GCyMq3jeRHdNAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749454732; c=relaxed/simple;
	bh=y8JjxmlE4cJ3pc5jJ/Zy0F6Jhoc6ohXXRZRnqJJ877A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hi6tLETgxJPAsEFLULcC79+HkamN/4XHC6JmIqgrzqzHEROc9eq8gb09SsWpXgUK+2suM49NZXg5z5qLhac7+4uHWdLcCVvYPHNw68eNdW/ughJHqUCzeAv2ajPbfA3DHPV0ujL2Yh4JiTiPZG102fIaTpBTnu3xEXtZdw6mGRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WewtOZyl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WewtOZyl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6376C4CEEB;
	Mon,  9 Jun 2025 07:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749454732;
	bh=y8JjxmlE4cJ3pc5jJ/Zy0F6Jhoc6ohXXRZRnqJJ877A=;
	h=From:To:Cc:Subject:Date:From;
	b=WewtOZylmuyK9mQ7FMEctf/8NrSdU0sgAoF4nTKot4y90Xuo7tkAk0xjFzb0z32+u
	 gq+elNWSI5WT833QpJIb1sHepKww081CWEJz/vmnDF10DT4aeaJ2wGON13cHvC4xvm
	 PywjR1F0PFKgF74JBJN9anRsxxswW58hBMj5tAjBww6Juuk6DUgXZWIFbMnvq9/fqx
	 Gh3gplFzoWXWNfGwR742TDhSFL8//XkO+2SCg967oCeMzYt1IadCf+FsqS14MKGY3O
	 nbvUIYhjP7iPPYM5viKtUHuSpNXpNcz+QIFdbUnV/FHN7MvxVPCk0+H8/mQ0enRleQ
	 aNnIIbnjczijA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] f2fs: handle nat.blkaddr corruption in f2fs_get_node_info()
Date: Mon,  9 Jun 2025 15:27:12 +0800
Message-ID: <20250609072712.792834-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

F2FS-fs (dm-55): access invalid blkaddr:972878540
Call trace:
 dump_backtrace+0xec/0x128
 show_stack+0x18/0x28
 dump_stack_lvl+0x40/0x88
 dump_stack+0x18/0x24
 __f2fs_is_valid_blkaddr+0x360/0x3b4
 f2fs_is_valid_blkaddr+0x10/0x20
 f2fs_get_node_info+0x21c/0x60c
 __write_node_page+0x15c/0x734
 f2fs_sync_node_pages+0x4f8/0x700
 f2fs_write_checkpoint+0x4a8/0x99c
 __checkpoint_and_complete_reqs+0x7c/0x20c
 issue_checkpoint_thread+0x4c/0xd8
 kthread+0x11c/0x1b0
 ret_from_fork+0x10/0x20

If nat.blkaddr is corrupted, during checkpoint, f2fs_sync_node_pages()
will loop to flush node page w/ corrupted nat.blkaddr.

Although, it tags SBI_NEED_FSCK, checkpoint can not persist it due
to deadloop.

Let's call f2fs_handle_error(, ERROR_INCONSISTENT_NAT) to record such
error into superblock, it expects fsck can detect the error and repair
inconsistent nat.blkaddr after device reboot.

Note that, let's add sanity check in f2fs_get_node_info() to detect
in-memory nat.blkaddr inconsistency, but only if CONFIG_F2FS_CHECK_FS
is enabled.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 8b5cd764226a..519c4c114607 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -555,8 +555,8 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	struct f2fs_nat_entry ne;
 	struct nat_entry *e;
 	pgoff_t index;
-	block_t blkaddr;
 	int i;
+	bool need_cache = true;
 
 	ni->flag = 0;
 	ni->nid = nid;
@@ -569,6 +569,10 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 		ni->blk_addr = nat_get_blkaddr(e);
 		ni->version = nat_get_version(e);
 		f2fs_up_read(&nm_i->nat_tree_lock);
+		if (IS_ENABLED(CONFIG_F2FS_CHECK_FS)) {
+			need_cache = false;
+			goto sanity_check;
+		}
 		return 0;
 	}
 
@@ -594,7 +598,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	up_read(&curseg->journal_rwsem);
 	if (i >= 0) {
 		f2fs_up_read(&nm_i->nat_tree_lock);
-		goto cache;
+		goto sanity_check;
 	}
 
 	/* Fill node_info from nat page */
@@ -609,14 +613,23 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	ne = nat_blk->entries[nid - start_nid];
 	node_info_from_raw_nat(ni, &ne);
 	f2fs_folio_put(folio, true);
-cache:
-	blkaddr = le32_to_cpu(ne.block_addr);
-	if (__is_valid_data_blkaddr(blkaddr) &&
-		!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE))
-		return -EFAULT;
+sanity_check:
+	if (__is_valid_data_blkaddr(ni->blk_addr) &&
+		!f2fs_is_valid_blkaddr(sbi, ni->blk_addr,
+					DATA_GENERIC_ENHANCE)) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_err_ratelimited(sbi,
+			"f2fs_get_node_info of %pS: inconsistent nat entry, "
+			"ino:%u, nid:%u, blkaddr:%u, ver:%u, flag:%u",
+			__builtin_return_address(0),
+			ni->ino, ni->nid, ni->blk_addr, ni->version, ni->flag);
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_NAT);
+		return -EFSCORRUPTED;
+	}
 
 	/* cache nat entry */
-	cache_nat_entry(sbi, nid, &ne);
+	if (need_cache)
+		cache_nat_entry(sbi, nid, &ne);
 	return 0;
 }
 
-- 
2.49.0

