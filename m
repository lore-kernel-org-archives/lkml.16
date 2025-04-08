Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FBD26A0DD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114940; cv=none; b=O8xXQgWh6BfCjDuk++aWsC6Ig0XCfKIRNOt0I76yFprpjFG9WR96F5t7jdPd61JoZcUZpOCca4a2/Gf7TlAozgKJYAIu20/Al0nNGSctlVM/+FUMeCnGIvFmvJvHlclxv++g/Mux5VjNiu8C7GAuMivbIUGGFDk/JGICnRN7j9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114940; c=relaxed/simple;
	bh=r2J6vA7Dd75tuAR7ijQs2wxGAzGC/OLb0q2cwN2w/Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u47SA1Fa1HVezo0SGb2afrB5HJsa+4/JKSyy2B4uO0Bhyjixb/ehdBpwVgQ6R+JfCWS1dr7qvYCFVqY7DHEed0LwguFdxLi5vyk+G7XZvpoFwkl2U3+CeXZMTeE6VJHiR0h75n1Bug5SIss7jVLL/vWcv8oUXy+rtv4fZBwCEGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chjWMUoc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chjWMUoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99143C4CEE5;
	Tue,  8 Apr 2025 12:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744114939;
	bh=r2J6vA7Dd75tuAR7ijQs2wxGAzGC/OLb0q2cwN2w/Vg=;
	h=From:To:Cc:Subject:Date:From;
	b=chjWMUocta0tzTN0SAp03bxejynsdX+/U50ioCAtzzi6ktkupEeZKKISJkBTXGEPN
	 2yn3YCU0TtGhzGKavdjBFzGtPdlaqCawLEfvy5hmtzj5aaL3WbaAIwILLiLa7V8CTL
	 HwYuHqZ0+flTfr4ZY0aPbJvcXmwbHxuyUe5M3xaq7xobzoG0iPQysuxYFssxZGsbGJ
	 3VcmNqvGFd7jcXAEOafcFOcyi5WqFkQ3IVSbQ7ElbWFtEttOUADDG7a0G/x5I4ERlG
	 zGGxXGEbkdkHn5lkNTdwaR0n3NRmHujSk7g/I6zaaxXXs1NB3Ap3AyhYJT7fBfNg7I
	 1A0qDt0iMe83Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	syzbot+8b376a77b2f364097fbe@syzkaller.appspotmail.com
Subject: [PATCH] f2fs: fix to do sanity check on sbi->total_valid_block_count
Date: Tue,  8 Apr 2025 20:22:08 +0800
Message-ID: <20250408122208.2297777-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a f2fs bug as below:

------------[ cut here ]------------
kernel BUG at fs/f2fs/f2fs.h:2521!
RIP: 0010:dec_valid_block_count+0x3b2/0x3c0 fs/f2fs/f2fs.h:2521
Call Trace:
 f2fs_truncate_data_blocks_range+0xc8c/0x11a0 fs/f2fs/file.c:695
 truncate_dnode+0x417/0x740 fs/f2fs/node.c:973
 truncate_nodes+0x3ec/0xf50 fs/f2fs/node.c:1014
 f2fs_truncate_inode_blocks+0x8e3/0x1370 fs/f2fs/node.c:1197
 f2fs_do_truncate_blocks+0x840/0x12b0 fs/f2fs/file.c:810
 f2fs_truncate_blocks+0x10d/0x300 fs/f2fs/file.c:838
 f2fs_truncate+0x417/0x720 fs/f2fs/file.c:888
 f2fs_setattr+0xc4f/0x12f0 fs/f2fs/file.c:1112
 notify_change+0xbca/0xe90 fs/attr.c:552
 do_truncate+0x222/0x310 fs/open.c:65
 handle_truncate fs/namei.c:3466 [inline]
 do_open fs/namei.c:3849 [inline]
 path_openat+0x2e4f/0x35d0 fs/namei.c:4004
 do_filp_open+0x284/0x4e0 fs/namei.c:4031
 do_sys_openat2+0x12b/0x1d0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_creat fs/open.c:1522 [inline]
 __se_sys_creat fs/open.c:1516 [inline]
 __x64_sys_creat+0x124/0x170 fs/open.c:1516
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94

The reason is: in fuzzed image, sbi->total_valid_block_count is
inconsistent w/ mapped blocks indexed by inode, so, we should
not trigger panic for such case, instead, let's print log and
set fsck flag.

Fixes: 39a53e0ce0df ("f2fs: add superblock and major in-memory structure")
Reported-by: syzbot+8b376a77b2f364097fbe@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/67f3c0b2.050a0220.396535.0547.GAE@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f8f7ec4c644c..9915f31ee2d1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2526,8 +2526,14 @@ static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
 	blkcnt_t sectors = count << F2FS_LOG_SECTORS_PER_BLOCK;
 
 	spin_lock(&sbi->stat_lock);
-	f2fs_bug_on(sbi, sbi->total_valid_block_count < (block_t) count);
-	sbi->total_valid_block_count -= (block_t)count;
+	if (unlikely(sbi->total_valid_block_count < count)) {
+		f2fs_warn(sbi, "Inconsistent total_valid_block_count:%u, ino:%lu, count:%u",
+			  sbi->total_valid_block_count, inode->i_ino, count);
+		sbi->total_valid_block_count = 0;
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+	} else {
+		sbi->total_valid_block_count -= count;
+	}
 	if (sbi->reserved_blocks &&
 		sbi->current_reserved_blocks < sbi->reserved_blocks)
 		sbi->current_reserved_blocks = min(sbi->reserved_blocks,
-- 
2.49.0

