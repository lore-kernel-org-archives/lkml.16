Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B44C1C6FF6
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747970750; cv=none; b=W+n5srVTcIdTLgufgbyiIf/ob1c5K/nk2JGY4ekSULiRPpIPcoxBiIA7Yc1Gvb8wqL8xvsniW465TdXe0mv0U0sAHCSlsHv3tF5SPmttRuGpd0HSiCAbArb8QdVqLN/tzUn2cEyH5BaNUBBiUKsvZbImV9QFgzOTnSgB/uhPwx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747970750; c=relaxed/simple;
	bh=zs8r39vbFN2or9MqJTpefToKt3xi9idBEwDckvz2KwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IfUGitk5TLzLnHpOAH5+F1O5N7ATzNSZ1oioJ9Z6+NLN9NSbvhZV6v731RQHiromxhIBkYu26clu/1ItWbG2e6Tnri5Du3iWRhZ2COgbH70yNHqcQ+zYQ1kRocQYPEWCSBkLYKSwbPUTNuguzw34SLCH6lyxKQicQaq8CzObnB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDLkN5U8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDLkN5U8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0021C4CEE9;
	Fri, 23 May 2025 03:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747970749;
	bh=zs8r39vbFN2or9MqJTpefToKt3xi9idBEwDckvz2KwE=;
	h=From:To:Cc:Subject:Date:From;
	b=RDLkN5U8S0h0uFcNamFboMXudFbJhQc8QAf3cr+uRhghhFNDHhun8aEUAm1nP4Qz2
	 rFZSWF2yCW026/4xDW44AG2ngCgkP/dEPvr7Ro4zwH2M3PYk1FgSA/rvBu0AJBSXfS
	 FxFI+l0dnWuS6VkcIRREzrs7uhqndFZrunEtPFhoQgMMYIMs+Vjmw0hRLl7jJOTvuo
	 3S1TkRVeVBI3uAK4ppsodeKDJl67+lQMUl3jCY4uGtjA2b2ofyfkE9Gwvai8Fzox4k
	 duY0BuLGywslGToY01i6pmyX4xt2Tq/Kvll+2l+zLfGBr2p7xjRosazBI8jdcIuk9a
	 a92XCKLuQUV/Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com,
	Qi Han <hanqi@vivo.com>
Subject: [PATCH v3] f2fs: fix to skip f2fs_balance_fs() if checkpoint is disabled
Date: Fri, 23 May 2025 11:25:45 +0800
Message-ID: <20250523032545.1392641-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reports a f2fs bug as below:

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

The root cause is after commit 84b5bb8bf0f6 ("f2fs: modify
f2fs_is_checkpoint_ready logic to allow more data to be written with the
CP disable"), we will get chance to allow f2fs_is_checkpoint_ready() to
return true once below conditions are all true:
1. checkpoint is disabled
2. there are not enough free segments
3. there are enough free blocks

Then it will cause f2fs_balance_fs() to trigger foreground GC.

void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
...
	if (!f2fs_is_checkpoint_ready(sbi))
		return;

And the testcase mounts f2fs image w/ gc_merge,checkpoint=disable, so deadloop
will happen through below race condition:

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
avoid such deadloop issue.

Meanwhile let's remove f2fs_is_checkpoint_ready() check condition in
f2fs_balance_fs(), since it's redundant, due to the main logic in the
function is to check:
a) whether checkpoint is disabled
b) there is enough free segments

f2fs_balance_fs() still has all logics after f2fs_is_checkpoint_ready()'s
removal.

Reported-by: syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/682d743a.a00a0220.29bc26.0289.GAE@google.com
Fixes: 84b5bb8bf0f6 ("f2fs: modify f2fs_is_checkpoint_ready logic to allow more data to be written with the CP disable")
Cc: Qi Han <hanqi@vivo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- clean up the codes
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5ff0111ed974..24b4bb2a4b9b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -433,7 +433,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	if (need && excess_cached_nats(sbi))
 		f2fs_balance_fs_bg(sbi, false);
 
-	if (!f2fs_is_checkpoint_ready(sbi))
+	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
 		return;
 
 	/*
-- 
2.49.0

