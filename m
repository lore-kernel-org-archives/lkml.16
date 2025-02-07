Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CD1224EA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738893887; cv=none; b=W4NpSc4x0XDw3DpY2ZtCQ3zZqzt3wERfutmKnvtkensPNArvgsvvk+aCZw9XDrgt3ESHk7RSHl9eU1woIOeP2lWgQWSxJkl8y+3vdX0PZitbN0u58wxkH6ATbzDZqCEBm5N7gK+P6sZhfdXYUphWMLqEC5frqASLMKSmFsDm2a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738893887; c=relaxed/simple;
	bh=v++bRkLEIoDpQ8UQ6Hqo6MheQsUvTNovyjq8C1SR9NM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OZbYCno4T/hMWALnNwsWIQFKcbrB4AQgTnsD/a8f2TmrLZ+pBEMwlUmfVJKac6JA5lI4kOEHEBYn7w7j/gf/HXS6BYG4ZkEdE56Ta8unJw2l27/gRge4hhdWXRlJOy7n/lRj+A4CuB8GIK0DVsjEK0zCqp0pqxBEvjRIBYojbl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2ZMADUn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2ZMADUn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3777C4CEDD;
	Fri,  7 Feb 2025 02:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738893886;
	bh=v++bRkLEIoDpQ8UQ6Hqo6MheQsUvTNovyjq8C1SR9NM=;
	h=From:To:Cc:Subject:Date:From;
	b=m2ZMADUnycZuGq3PpDAxpzatmM5byItTdk5VL6qzYkkOwnoYddyQtVMrqGKPWJ47K
	 +uCx7LP3XgTeeNBR4WF5+7mWnYhT8L5PEhTw4BOJGImiKRrxj2Dvgx7/9w5Petvu3Z
	 Kwe1plw6mJj6v5D7TniCrxrdeHSURRhTkobfaFx5AsVNmgM//LSSS6B4/fpsJhWqN7
	 2puhXqPAToZuPddbvYA9UwiPE2vgFgXqoMtgUmZZJ1DJWa02c+h16xG7seqq8dawoJ
	 VIrA1PeqLfbQnBpcNUk5+ZNAkMnqZJiKfoMK4u45Xb6PkLsaoz4VS8MtX8MJHiDIiy
	 2Co0qphJFqo5A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v2] f2fs: quota: fix to avoid warning in dquot_writeback_dquots()
Date: Fri,  7 Feb 2025 10:04:41 +0800
Message-ID: <20250207020441.3415568-1-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

F2FS-fs (dm-59): checkpoint=enable has some unwritten data.

------------[ cut here ]------------
WARNING: CPU: 6 PID: 8013 at fs/quota/dquot.c:691 dquot_writeback_dquots+0x2fc/0x308
pc : dquot_writeback_dquots+0x2fc/0x308
lr : f2fs_quota_sync+0xcc/0x1c4
Call trace:
dquot_writeback_dquots+0x2fc/0x308
f2fs_quota_sync+0xcc/0x1c4
f2fs_write_checkpoint+0x3d4/0x9b0
f2fs_issue_checkpoint+0x1bc/0x2c0
f2fs_sync_fs+0x54/0x150
f2fs_do_sync_file+0x2f8/0x814
__f2fs_ioctl+0x1960/0x3244
f2fs_ioctl+0x54/0xe0
__arm64_sys_ioctl+0xa8/0xe4
invoke_syscall+0x58/0x114

checkpoint and f2fs_remount may race as below, resulting triggering warning
in dquot_writeback_dquots().

atomic write                                    remount
                                                - do_remount
                                                 - down_write(&sb->s_umount);
                                                  - f2fs_remount
- ioctl
 - f2fs_do_sync_file
  - f2fs_sync_fs
   - f2fs_write_checkpoint
    - block_operations
     - locked = down_read_trylock(&sbi->sb->s_umount)
       : fail to lock due to the write lock was held by remount
                                                 - up_write(&sb->s_umount);
     - f2fs_quota_sync
      - dquot_writeback_dquots
       - WARN_ON_ONCE(!rwsem_is_locked(&sb->s_umount))
       : trigger warning because s_umount lock was unlocked by remount

If checkpoint comes from mount/umount/remount/freeze/quotactl, caller of
checkpoint has already held s_umount lock, calling dquot_writeback_dquots()
in the context should be safe.

So let's record task to sbi->umount_lock_holder, so that checkpoint can
know whether the lock has held in the context or not by checking current
w/ it.

In addition, in order to not misrepresent caller of checkpoint, we should
not allow to trigger async checkpoint for those callers: mount/umount/remount/
freeze/quotactl.

Fixes: af033b2aa8a8 ("f2fs: guarantee journalled quota data by checkpoint")
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix to return correct error number in f2fs_quota_on()
- clean up codes in block_operations()
- fix commit message
 fs/f2fs/checkpoint.c | 15 ++++++-----
 fs/f2fs/f2fs.h       |  3 ++-
 fs/f2fs/super.c      | 63 ++++++++++++++++++++++++++++++++++----------
 3 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index efda9a022981..bd890738b94d 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1237,7 +1237,7 @@ static int block_operations(struct f2fs_sb_info *sbi)
 retry_flush_quotas:
 	f2fs_lock_all(sbi);
 	if (__need_flush_quota(sbi)) {
-		int locked;
+		bool need_lock = sbi->umount_lock_holder != current;
 
 		if (++cnt > DEFAULT_RETRY_QUOTA_FLUSH_COUNT) {
 			set_sbi_flag(sbi, SBI_QUOTA_SKIP_FLUSH);
@@ -1246,11 +1246,13 @@ static int block_operations(struct f2fs_sb_info *sbi)
 		}
 		f2fs_unlock_all(sbi);
 
-		/* only failed during mount/umount/freeze/quotactl */
-		locked = down_read_trylock(&sbi->sb->s_umount);
-		f2fs_quota_sync(sbi->sb, -1);
-		if (locked)
+		/* don't grab s_umount lock during mount/umount/remount/freeze/quotactl */
+		if (!need_lock) {
+			f2fs_do_quota_sync(sbi->sb, -1);
+		} else if (down_read_trylock(&sbi->sb->s_umount)) {
+			f2fs_do_quota_sync(sbi->sb, -1);
 			up_read(&sbi->sb->s_umount);
+		}
 		cond_resched();
 		goto retry_flush_quotas;
 	}
@@ -1867,7 +1869,8 @@ int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi)
 	struct cp_control cpc;
 
 	cpc.reason = __get_cp_reason(sbi);
-	if (!test_opt(sbi, MERGE_CHECKPOINT) || cpc.reason != CP_SYNC) {
+	if (!test_opt(sbi, MERGE_CHECKPOINT) || cpc.reason != CP_SYNC ||
+		sbi->umount_lock_holder == current) {
 		int ret;
 
 		f2fs_down_write(&sbi->gc_lock);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bd0d8138b71d..205bdcbd01e6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1668,6 +1668,7 @@ struct f2fs_sb_info {
 
 	unsigned int nquota_files;		/* # of quota sysfile */
 	struct f2fs_rwsem quota_sem;		/* blocking cp for flags */
+	struct task_struct *umount_lock_holder;	/* s_umount lock holder */
 
 	/* # of pages, see count_type */
 	atomic_t nr_pages[NR_COUNT_TYPE];
@@ -3633,7 +3634,7 @@ int f2fs_inode_dirtied(struct inode *inode, bool sync);
 void f2fs_inode_synced(struct inode *inode);
 int f2fs_dquot_initialize(struct inode *inode);
 int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
-int f2fs_quota_sync(struct super_block *sb, int type);
+int f2fs_do_quota_sync(struct super_block *sb, int type);
 loff_t max_file_blocks(struct inode *inode);
 void f2fs_quota_off_umount(struct super_block *sb);
 void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 24ded06c8980..944b09fd3aca 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1738,22 +1738,28 @@ int f2fs_sync_fs(struct super_block *sb, int sync)
 
 static int f2fs_freeze(struct super_block *sb)
 {
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+
 	if (f2fs_readonly(sb))
 		return 0;
 
 	/* IO error happened before */
-	if (unlikely(f2fs_cp_error(F2FS_SB(sb))))
+	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 
 	/* must be clean, since sync_filesystem() was already called */
-	if (is_sbi_flag_set(F2FS_SB(sb), SBI_IS_DIRTY))
+	if (is_sbi_flag_set(sbi, SBI_IS_DIRTY))
 		return -EINVAL;
 
+	sbi->umount_lock_holder = current;
+
 	/* Let's flush checkpoints and stop the thread. */
-	f2fs_flush_ckpt_thread(F2FS_SB(sb));
+	f2fs_flush_ckpt_thread(sbi);
+
+	sbi->umount_lock_holder = NULL;
 
 	/* to avoid deadlock on f2fs_evict_inode->SB_FREEZE_FS */
-	set_sbi_flag(F2FS_SB(sb), SBI_IS_FREEZING);
+	set_sbi_flag(sbi, SBI_IS_FREEZING);
 	return 0;
 }
 
@@ -2330,6 +2336,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	org_mount_opt = sbi->mount_opt;
 	old_sb_flags = sb->s_flags;
 
+	sbi->umount_lock_holder = current;
+
 #ifdef CONFIG_QUOTA
 	org_mount_opt.s_jquota_fmt = F2FS_OPTION(sbi).s_jquota_fmt;
 	for (i = 0; i < MAXQUOTAS; i++) {
@@ -2553,6 +2561,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 
 	limit_reserve_root(sbi);
 	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
+
+	sbi->umount_lock_holder = NULL;
 	return 0;
 restore_checkpoint:
 	if (need_enable_checkpoint) {
@@ -2593,6 +2603,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 #endif
 	sbi->mount_opt = org_mount_opt;
 	sb->s_flags = old_sb_flags;
+
+	sbi->umount_lock_holder = NULL;
 	return err;
 }
 
@@ -2909,7 +2921,7 @@ static int f2fs_quota_sync_file(struct f2fs_sb_info *sbi, int type)
 	return ret;
 }
 
-int f2fs_quota_sync(struct super_block *sb, int type)
+int f2fs_do_quota_sync(struct super_block *sb, int type)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	struct quota_info *dqopt = sb_dqopt(sb);
@@ -2957,11 +2969,21 @@ int f2fs_quota_sync(struct super_block *sb, int type)
 	return ret;
 }
 
+static int f2fs_quota_sync(struct super_block *sb, int type)
+{
+	int ret;
+
+	F2FS_SB(sb)->umount_lock_holder = current;
+	ret = f2fs_do_quota_sync(sb, type);
+	F2FS_SB(sb)->umount_lock_holder = NULL;
+	return ret;
+}
+
 static int f2fs_quota_on(struct super_block *sb, int type, int format_id,
 							const struct path *path)
 {
 	struct inode *inode;
-	int err;
+	int err = 0;
 
 	/* if quota sysfile exists, deny enabling quota with specific file */
 	if (f2fs_sb_has_quota_ino(F2FS_SB(sb))) {
@@ -2972,31 +2994,34 @@ static int f2fs_quota_on(struct super_block *sb, int type, int format_id,
 	if (path->dentry->d_sb != sb)
 		return -EXDEV;
 
-	err = f2fs_quota_sync(sb, type);
+	F2FS_SB(sb)->umount_lock_holder = current;
+
+	err = f2fs_do_quota_sync(sb, type);
 	if (err)
-		return err;
+		goto out;
 
 	inode = d_inode(path->dentry);
 
 	err = filemap_fdatawrite(inode->i_mapping);
 	if (err)
-		return err;
+		goto out;
 
 	err = filemap_fdatawait(inode->i_mapping);
 	if (err)
-		return err;
+		goto out;
 
 	err = dquot_quota_on(sb, type, format_id, path);
 	if (err)
-		return err;
+		goto out;
 
 	inode_lock(inode);
 	F2FS_I(inode)->i_flags |= F2FS_QUOTA_DEFAULT_FL;
 	f2fs_set_inode_flags(inode);
 	inode_unlock(inode);
 	f2fs_mark_inode_dirty_sync(inode, false);
-
-	return 0;
+out:
+	F2FS_SB(sb)->umount_lock_holder = NULL;
+	return err;
 }
 
 static int __f2fs_quota_off(struct super_block *sb, int type)
@@ -3007,7 +3032,7 @@ static int __f2fs_quota_off(struct super_block *sb, int type)
 	if (!inode || !igrab(inode))
 		return dquot_quota_off(sb, type);
 
-	err = f2fs_quota_sync(sb, type);
+	err = f2fs_do_quota_sync(sb, type);
 	if (err)
 		goto out_put;
 
@@ -3030,6 +3055,8 @@ static int f2fs_quota_off(struct super_block *sb, int type)
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	int err;
 
+	F2FS_SB(sb)->umount_lock_holder = current;
+
 	err = __f2fs_quota_off(sb, type);
 
 	/*
@@ -3039,6 +3066,9 @@ static int f2fs_quota_off(struct super_block *sb, int type)
 	 */
 	if (is_journalled_quota(sbi))
 		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
+
+	F2FS_SB(sb)->umount_lock_holder = NULL;
+
 	return err;
 }
 
@@ -4704,6 +4734,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_compress_inode;
 
+	sbi->umount_lock_holder = current;
 #ifdef CONFIG_QUOTA
 	/* Enable quota usage during mount */
 	if (f2fs_sb_has_quota_ino(sbi) && !f2fs_readonly(sb)) {
@@ -4830,6 +4861,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	f2fs_update_time(sbi, CP_TIME);
 	f2fs_update_time(sbi, REQ_TIME);
 	clear_sbi_flag(sbi, SBI_CP_DISABLED_QUICK);
+
+	sbi->umount_lock_holder = NULL;
 	return 0;
 
 sync_free_meta:
@@ -4932,6 +4965,8 @@ static void kill_f2fs_super(struct super_block *sb)
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 
 	if (sb->s_root) {
+		sbi->umount_lock_holder = current;
+
 		set_sbi_flag(sbi, SBI_IS_CLOSE);
 		f2fs_stop_gc_thread(sbi);
 		f2fs_stop_discard_thread(sbi);
-- 
2.48.1.502.g6dc24dfdaf-goog

