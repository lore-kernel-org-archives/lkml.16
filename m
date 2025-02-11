Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB37433BE
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739255828; cv=none; b=MTq6zp+gXlMjqjYCpG6hKGd20321RgDU+FIs6JEibOrV7IQCt8jjMsH5g9wzrDOil/86xkII/PGg8SKsGcU6HU3bB7YqXpvTPG64ygn8NrS1ZzL7SFtVeYLWum4D25+aDOHo2aKsRUDgeD9WryI3NIihhY567WSbHwlh44DWyeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739255828; c=relaxed/simple;
	bh=2yiMq0kic3NrnbeSa2ncweARleUMsxv2MZfLUAhekBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bu+3u1i91zz1G6UTB0DyVdvy75FKOroTigSmS+2pnuxYDzuT617GqRwuaEl89X20Th9TKkVuEclK1olaC/Oj6OA+cg3NR/wKeBWqMQWPMt6n3pQ3LIDvufao1Aqutxq9Yd5WtScZTaHVbeHmO0E8AQoGA8iIQeqGRKdaLQg/nS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPf78K2q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPf78K2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE3CC4CEDD;
	Tue, 11 Feb 2025 06:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739255827;
	bh=2yiMq0kic3NrnbeSa2ncweARleUMsxv2MZfLUAhekBg=;
	h=From:To:Cc:Subject:Date:From;
	b=RPf78K2q9HUuMOvKHKYTYMZJZdjnBS6vsvOPMVUBAIJyjzkerItYnNHWGIHGehp0t
	 DuHptmwQCwGdWvyWZk1C1hReI98IYHFXxKEkFMlRAw8ZEL86X1NSidX59sou2OWptE
	 nU+FTOC2/hSG0lFgFlbqiX3ZeF/fMrcv23k763ar3NTcHhRb4osPRZ7kGntG7dzvgF
	 G+7VcDaen4CkYphc73WVcwqbaL2HDlf8qwHUITwq2fyKVtcrFow4vZpF1awrvK3U+Z
	 Zm7tAUJf4spebyJw0Z03mypGy/2H1it+VlGrqIChHo9AQOElXdq6adr2dv6+Pq/GX7
	 UfJ73yRjneO7Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com
Subject: [PATCH] f2fs: fix to avoid panic once fallocation fails for pinfile
Date: Tue, 11 Feb 2025 14:36:57 +0800
Message-ID: <20250211063657.405289-1-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reports a f2fs bug as below:

------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:2746!
CPU: 0 UID: 0 PID: 5323 Comm: syz.0.0 Not tainted 6.13.0-rc2-syzkaller-00018-g7cb1b4663150 #0
RIP: 0010:get_new_segment fs/f2fs/segment.c:2746 [inline]
RIP: 0010:new_curseg+0x1f52/0x1f70 fs/f2fs/segment.c:2876
Call Trace:
 <TASK>
 __allocate_new_segment+0x1ce/0x940 fs/f2fs/segment.c:3210
 f2fs_allocate_new_section fs/f2fs/segment.c:3224 [inline]
 f2fs_allocate_pinning_section+0xfa/0x4e0 fs/f2fs/segment.c:3238
 f2fs_expand_inode_data+0x696/0xca0 fs/f2fs/file.c:1830
 f2fs_fallocate+0x537/0xa10 fs/f2fs/file.c:1940
 vfs_fallocate+0x569/0x6e0 fs/open.c:327
 do_vfs_ioctl+0x258c/0x2e40 fs/ioctl.c:885
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0x80/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Concurrent pinfile allocation may run out of free section, result in
panic in get_new_segment(), let's expand pin_sem lock coverage to
include f2fs_gc(), so that we can make sure to reclaim enough free
space for following allocation.

In addition, do below changes to enhance error path handling:
- call f2fs_bug_on() only in non-pinfile allocation path in
get_new_segment().
- call reset_curseg_fields() to reset all fields of curseg in
new_curseg()

Fixes: f5a53edcf01e ("f2fs: support aligned pinned file")
Reported-by: syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/675cd64e.050a0220.37aaf.00bb.GAE@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c    |  8 +++++---
 fs/f2fs/segment.c | 20 ++++++++++----------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 2f93a27d2f45..4c563edbf5c6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1834,18 +1834,20 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 
 		map.m_len = sec_blks;
 next_alloc:
+		f2fs_down_write(&sbi->pin_sem);
+
 		if (has_not_enough_free_secs(sbi, 0, f2fs_sb_has_blkzoned(sbi) ?
 			ZONED_PIN_SEC_REQUIRED_COUNT :
 			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
 			f2fs_down_write(&sbi->gc_lock);
 			stat_inc_gc_call_count(sbi, FOREGROUND);
 			err = f2fs_gc(sbi, &gc_control);
-			if (err && err != -ENODATA)
+			if (err && err != -ENODATA) {
+				f2fs_up_write(&sbi->pin_sem);
 				goto out_err;
+			}
 		}
 
-		f2fs_down_write(&sbi->pin_sem);
-
 		err = f2fs_allocate_pinning_section(sbi);
 		if (err) {
 			f2fs_up_write(&sbi->pin_sem);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c282e8a0a2ec..6ebe25eafafa 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2806,7 +2806,7 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 							MAIN_SECS(sbi));
 		if (secno >= MAIN_SECS(sbi)) {
 			ret = -ENOSPC;
-			f2fs_bug_on(sbi, 1);
+			f2fs_bug_on(sbi, !pinning);
 			goto out_unlock;
 		}
 	}
@@ -2848,7 +2848,7 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 out_unlock:
 	spin_unlock(&free_i->segmap_lock);
 
-	if (ret == -ENOSPC)
+	if (ret == -ENOSPC && !pinning)
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_NO_SEGMENT);
 	return ret;
 }
@@ -2921,6 +2921,13 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
 	return curseg->segno;
 }
 
+static void reset_curseg_fields(struct curseg_info *curseg)
+{
+	curseg->inited = false;
+	curseg->segno = NULL_SEGNO;
+	curseg->next_segno = 0;
+}
+
 /*
  * Allocate a current working segment.
  * This function always allocates a free segment in LFS manner.
@@ -2939,7 +2946,7 @@ static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
 	ret = get_new_segment(sbi, &segno, new_sec, pinning);
 	if (ret) {
 		if (ret == -ENOSPC)
-			curseg->segno = NULL_SEGNO;
+			reset_curseg_fields(curseg);
 		return ret;
 	}
 
@@ -3710,13 +3717,6 @@ static void f2fs_randomize_chunk(struct f2fs_sb_info *sbi,
 		get_random_u32_inclusive(1, sbi->max_fragment_hole);
 }
 
-static void reset_curseg_fields(struct curseg_info *curseg)
-{
-	curseg->inited = false;
-	curseg->segno = NULL_SEGNO;
-	curseg->next_segno = 0;
-}
-
 int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		block_t old_blkaddr, block_t *new_blkaddr,
 		struct f2fs_summary *sum, int type,
-- 
2.48.1.502.g6dc24dfdaf-goog

