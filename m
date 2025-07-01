Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F09264F87
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361980; cv=none; b=sd0oMWP9zyOAfXy1BoZu66CtcbkkBsyO3NF4Glsv9euUSW84fHzLx86KR6AHoScFkNULcFoc50+PCcFbsP0qZ2j4BAJ+tZRF/cQXucd/QW9NoxFz1t/sMmKsVWRlCZuhZyEjQIoE3uLy05jB88iQSFkd1Apq98JLASs5+0YnXu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361980; c=relaxed/simple;
	bh=Hv5oD2MchPa+sxKfOPqs/fhxZY2OH/uArq2h36gdvl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kl5xE0TzWAJVkHnBxDCLdp9hfx8uXO8bjjlxbXXmlot3tX9kr9kqyHNTkbHiDK8Cg+Zhf0VHFmY2Ha3FSrWHWUWHbayraT1siHg/tOt5C5POtTPMHWRoA5QKPc/OGWSpi9j0O1Xplgfqv18UKmGdW/R4xlk+p6EH69BHfGXEges=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=la7ebupb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="la7ebupb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3EDC4CEEE;
	Tue,  1 Jul 2025 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751361978;
	bh=Hv5oD2MchPa+sxKfOPqs/fhxZY2OH/uArq2h36gdvl4=;
	h=From:To:Cc:Subject:Date:From;
	b=la7ebupbPz7HaRXwt44Dr/c+fm1u/pZfXfSGQvCUMq1y5jCbO0LdmkqriaZiR9Un7
	 b0xGtYwCTTUFGvxQJ9HxifPTSi3z2nXcIg4vNMb2BSOgYDZwzq9SY7jkgsdng5zj9t
	 AUWpHXOtp4ilRzYP5n1RTgGH7yWsU18NlhqkMrUn0/1GN0t2UBJtJeGPLqL1tBha25
	 zzOKmBCs6t+6C/QgH1xWUslmqIyrGstPRYyU0TNySxogMns3P/wSoy5RgGlk799L3h
	 /b1Nt8qbjnH3GGwQYiAHt84q0yTLRSKj53TlafozsallWQeGNtMXF8/ZWxZrvEHpDa
	 lOjaTPG6/RBjA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	syzbot+9201a61c060513d4be38@syzkaller.appspotmail.com
Subject: [PATCH] f2fs: fix to use f2fs_is_valid_blkaddr_raw() in do_write_page()
Date: Tue,  1 Jul 2025 17:26:10 +0800
Message-ID: <20250701092610.511964-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As syzbot reported as below:

F2FS-fs (loop9): inject invalid blkaddr in f2fs_is_valid_blkaddr of do_write_page+0x277/0xb10 fs/f2fs/segment.c:3956
------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:3957!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 10538 Comm: syz-executor Not tainted 6.16.0-rc3-next-20250627-syzkaller #0 PREEMPT(full)
Call Trace:
 <TASK>
 f2fs_outplace_write_data+0x11a/0x220 fs/f2fs/segment.c:4017
 f2fs_do_write_data_page+0x12ea/0x1a40 fs/f2fs/data.c:2752
 f2fs_write_single_data_page+0xa68/0x1680 fs/f2fs/data.c:2851
 f2fs_write_cache_pages fs/f2fs/data.c:3133 [inline]
 __f2fs_write_data_pages fs/f2fs/data.c:3282 [inline]
 f2fs_write_data_pages+0x195b/0x3000 fs/f2fs/data.c:3309
 do_writepages+0x32b/0x550 mm/page-writeback.c:2636
 filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
 __filemap_fdatawrite_range mm/filemap.c:419 [inline]
 __filemap_fdatawrite mm/filemap.c:425 [inline]
 filemap_fdatawrite+0x199/0x240 mm/filemap.c:430
 f2fs_sync_dirty_inodes+0x31f/0x830 fs/f2fs/checkpoint.c:1108
 block_operations fs/f2fs/checkpoint.c:1247 [inline]
 f2fs_write_checkpoint+0x95a/0x1df0 fs/f2fs/checkpoint.c:1638
 kill_f2fs_super+0x2c3/0x6c0 fs/f2fs/super.c:5081
 deactivate_locked_super+0xb9/0x130 fs/super.c:474
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1417
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xec/0x110 kernel/entry/common.c:114
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

If we inject block address fault, it may trigger kernel panic, we need
to use f2fs_is_valid_blkaddr_raw() instead of f2fs_is_valid_blkaddr()
in do_write_page() to avoid such issue.

Fixes: 70b6e8500431 ("f2fs: do sanity check on fio.new_blkaddr in do_write_page()")
Reported-by: syzbot+9201a61c060513d4be38@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/68639520.a70a0220.3b7e22.17e6.GAE@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5653716460ea..b89bdb867508 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3953,7 +3953,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		goto out;
 	}
 
-	f2fs_bug_on(fio->sbi, !f2fs_is_valid_blkaddr(fio->sbi,
+	f2fs_bug_on(fio->sbi, !f2fs_is_valid_blkaddr_raw(fio->sbi,
 				fio->new_blkaddr, DATA_GENERIC_ENHANCE));
 
 	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO)
-- 
2.49.0

