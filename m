Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79CF263F25
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827700; cv=none; b=pGj4aANWEfScxHEl7p38tR5wzT3SZsRIdkXJAfcY3fG8z5b0PbKwYcpUxv5bHJnMW8XtZbxB/zpwXrODo2PD5LnYg0sxfCOIse2M7MPEpXEeFi0Uf34KtoqdeNxei2PtCtoAfk/kzp2SYBOC+u4jWiY3kIMgY0dyc1RgW0hl/GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827700; c=relaxed/simple;
	bh=MqsLTq+Q9ipAuMRrtVo5YYhsxU4uQvPSZlQLm21r3d4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JkE/NdbQ8DsL93/67uxmkJWVFxpCktfu++AKqgxxcLmN+sVfe4vHK4LzEcYBxcJvQOss4gzGhB5DFXKlOcZcYa8B8BotnX9VxHqxyi9lR0OBTq3Ex+1sl/Ax8TuUUnkB5NoGKNZTOYO5f70cQWvDqmn7+d6oCGzRRDOWC4OArZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZoqG/Bp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZoqG/Bp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0803C4CEE4;
	Wed, 21 May 2025 11:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747827699;
	bh=MqsLTq+Q9ipAuMRrtVo5YYhsxU4uQvPSZlQLm21r3d4=;
	h=From:To:Cc:Subject:Date:From;
	b=BZoqG/BpvalAwmzbxwUNX7uXOYiIJyRpidDQ6/kDo9axT7Ey9xSU7wAq0IjIEdHgc
	 EySGyaKeA7K8nZLtVOJV1GPs1Agp/zbdgrteg465YGg5BSUgrEezuDq8yiOuA2lJjV
	 vL8xYUNmhEURlyMaGDZZteqcNCoE99w4+PAqxhKfpDFdfD4gcRSo1o2pnqOrfppKQj
	 etV5eae1wEX9IyTPO15iTz5NNun6rJc/OJezE6bwb5ybYppwa61XG63wIAPYGFrP+W
	 ELm1y3IrXGIVAGxxJw0Ex7qEoRI32y0sdYi87pfmC5GZc6PLSTNI1frg8GwUeY95K5
	 ACcAiKc+nZTBQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com,
	Qi Han <hanqi@vivo.com>
Subject: [PATCH] f2fs: fix to skip f2fs_balance_fs() if checkpoint is disabled
Date: Wed, 21 May 2025 19:41:32 +0800
Message-ID: <20250521114132.824349-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

INFO: task syz-executor328:5856 blocked for more than 144 seconds.
      Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor328 state:D stack:24392 pid:5856  tgid:5832  ppid:5826   task_flags:0x400040 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6860
 io_schedule+0x81/0xe0 kernel/sched/core.c:7742
 f2fs_balance_fs+0x4b4/0x780 fs/f2fs/segment.c:444
 f2fs_map_blocks+0x3af1/0x43b0 fs/f2fs/data.c:1791
 f2fs_expand_inode_data+0x653/0xaf0 fs/f2fs/file.c:1872
 f2fs_fallocate+0x4f5/0x990 fs/f2fs/file.c:1975
 vfs_fallocate+0x6a0/0x830 fs/open.c:338
 ioctl_preallocate fs/ioctl.c:290 [inline]
 file_ioctl fs/ioctl.c:-1 [inline]
 do_vfs_ioctl+0x1b8f/0x1eb0 fs/ioctl.c:885
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0x82/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The root cause is after 84b5bb8bf0f6 ("f2fs: modify f2fs_is_checkpoint_ready
logic to allow more data to be written with the CP disable"), we will get
chance to allow f2fs_is_checkpoint_ready() to return true once below
conditions are all true:
1. checkpoint is disabled
2. there are not enough free segments
3. there are enough free blocks

Then it will cause f2fs_balance_fs() to trigger foreground GC.

void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
...
	if (!f2fs_is_checkpoint_ready(sbi))
		return;

And it mounts f2fs image w/ gc_merge,checkpoint=disable, so below deadloop
will happen:

- f2fs_do_shutdown		- vfs_fallocate				- gc_thread_func
				 - file_start_write
				  - __sb_start_write(SB_FREEZE_WRITE)
				 - f2fs_fallocate
				  - f2fs_expand_inode_data
				   - f2fs_map_blocks
				    - f2fs_balance_fs
				     - prepare_to_wait
				     - wake_up(gc_wait_queue_head)
				     - io_schedule
 - bdev_freeze
  - freeze_super
   - sb->s_writers.frozen = SB_FREEZE_WRITE;
   - sb_wait_write(sb, SB_FREEZE_WRITE);
									 - if (sbi->sb->s_writers.frozen >= SB_FREEZE_WRITE) continue;
									 : cause deadloop

This patch fix to add check condition in f2fs_balance_fs(), so that if
checkpoint is disabled, we will just skip trigger foreground GC to
avoid above deadloop issue.

Reported-by: syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com
Fixes: 84b5bb8bf0f6 ("f2fs: modify f2fs_is_checkpoint_ready logic to allow more data to be written with the CP disable")
Cc: Qi Han <hanqi@vivo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5ff0111ed974..19b716fda72a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -433,6 +433,8 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	if (need && excess_cached_nats(sbi))
 		f2fs_balance_fs_bg(sbi, false);
 
+	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
+		return;
 	if (!f2fs_is_checkpoint_ready(sbi))
 		return;
 
-- 
2.49.0

