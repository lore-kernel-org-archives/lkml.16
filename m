Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B8027D790
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744627990; cv=none; b=NC50dLWzAhKFX9GF8QU7EvL5Fr2HQPiKZmPh5wg8/yMl8S6h29dXtCyJNbE5SkNxDMjM+UqF826xUTrV80gNJXjHpYnCZOYWRr6sCizFyecVSRBezyNRaN+Gp8OXowbPFB1rRBK/uwROWUpBXpNH5F5uQGwkIrRIYcz6s+k3z88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744627990; c=relaxed/simple;
	bh=XJlZfQW1aybX0kMKYGtaAugSD+bmBNoAEbWNwMsoH2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHPesh/3YduN9WV8LzUeTaYJ2MJ6QeIVLGF8ykFUSqNzymMIxskKM2w85yAxdoRyjiZ1Z6+EYkUncDGhuLvNMUmXikk3PPOxjBtQtTpvJdMvjKfXBEbANjDnUnDZ4+9iFZUMhR6uEARblah6f4myooAVO6usmyEZFqnrgTHhXA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuVMIAAH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuVMIAAH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52312C4CEE5;
	Mon, 14 Apr 2025 10:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744627990;
	bh=XJlZfQW1aybX0kMKYGtaAugSD+bmBNoAEbWNwMsoH2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kuVMIAAHd3Udrv0tceg5VNIgKRV9mU0g7FyAysdm0ComUD4peaghAVgMdMnSgLSnn
	 50QPu3XPPDp2L8nOHIKWymBK8dlABV96vC94oaagBnq6w63LyKUDmP7dqzvVJP4Q3T
	 db4vyDSdv3QGxlYLW5rg28mdU34Xz3XAo0JhM8GLAuiHZB5PQ6853P0vxmD3ZPL5ho
	 8FMSqgl6Lm00zRtQ1wsnU2i2zSrGlnuJ91lnecOL6fxqHRNHiUr9xOG5yNJkL2y8GF
	 szpo4bPo3Q5GX2cqSmcXlSODR8E4aGK674xI3G+Tle1Ua06R+50Zi8KbaEsm1bL3vm
	 5PqDwwYM/OJVQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	Jan Prusakowski <jprusakowski@google.com>
Subject: [PATCH 2/2] f2fs: fix to detect gcing page in f2fs_is_cp_guaranteed()
Date: Mon, 14 Apr 2025 18:52:37 +0800
Message-ID: <20250414105237.728522-2-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250414105237.728522-1-chao@kernel.org>
References: <20250414105237.728522-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jan Prusakowski reported a f2fs bug as below:

f2fs/007 will hang kernel during testing w/ below configs:

kernel 6.12.18 (from pixel-kernel/android16-6.12)
export MKFS_OPTIONS="-O encrypt -O extra_attr -O project_quota -O quota"
export F2FS_MOUNT_OPTIONS="test_dummy_encryption,discard,fsync_mode=nobarrier,reserve_root=32768,checkpoint_merge,atgc"

cat /proc/<umount_proc_id>/stack
f2fs_wait_on_all_pages+0xa3/0x130
do_checkpoint+0x40c/0x5d0
f2fs_write_checkpoint+0x258/0x550
kill_f2fs_super+0x14f/0x190
deactivate_locked_super+0x30/0xb0
cleanup_mnt+0xba/0x150
task_work_run+0x59/0xa0
syscall_exit_to_user_mode+0x12d/0x130
do_syscall_64+0x57/0x110
entry_SYSCALL_64_after_hwframe+0x76/0x7e

cat /sys/kernel/debug/f2fs/status

  - IO_W (CP: -256, Data:  256, Flush: (   0    0    1), Discard: (   0    0)) cmd:    0 undiscard:   0

CP IOs reference count becomes negative.

The root cause is:

After 4961acdd65c9 ("f2fs: fix to tag gcing flag on page during block
migration"), we will tag page w/ gcing flag for raw page of cluster
during its migration.

However, if the inode is both encrypted and compressed, during
ioc_decompress(), it will tag page w/ gcing flag, and it increase
F2FS_WB_DATA reference count:
- f2fs_write_multi_page
 - f2fs_write_raw_page
  - f2fs_write_single_page
   - do_write_page
    - f2fs_submit_page_write
     - WB_DATA_TYPE(bio_page, fio->compressed_page)
     : bio_page is encrypted, so mapping is NULL, and fio->compressed_page
       is NULL, it returns F2FS_WB_DATA
     - inc_page_count(.., F2FS_WB_DATA)

Then, during end_io(), it decrease F2FS_WB_CP_DATA reference count:
- f2fs_write_end_io
 - f2fs_compress_write_end_io
  - fscrypt_pagecache_folio
  : get raw page from encrypted page
  - WB_DATA_TYPE(&folio->page, false)
  : raw page has gcing flag, it returns F2FS_WB_CP_DATA
  - dec_page_count(.., F2FS_WB_CP_DATA)

In order to fix this issue, we need to detect gcing flag in raw page
in f2fs_is_cp_guaranteed().

Fixes: 4961acdd65c9 ("f2fs: fix to tag gcing flag on page during block migration")
Reported-by: Jan Prusakowski <jprusakowski@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4f70755c30cc..0df60c3ca533 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -54,7 +54,7 @@ bool f2fs_is_cp_guaranteed(struct page *page)
 	struct f2fs_sb_info *sbi;
 
 	if (fscrypt_is_bounce_page(page))
-		return false;
+		return page_private_gcing(fscrypt_pagecache_page(page));
 
 	inode = mapping->host;
 	sbi = F2FS_I_SB(inode);
-- 
2.49.0

