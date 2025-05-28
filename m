Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD213B1A4
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748416854; cv=none; b=NAomeh18z3jlQUWDpc+y8TKdHNP157FA+MAgP3GzIoL2JpUU+UI2wR6bZqSGUA5jU+ZqDrBlMaw6lCIGk3EwLgYLNaefI1vMOdfVC/s6sGC7oHiZbkLjiTm883mBWvY5XCiG945ZGkb3OUh7BSgaVrGLB/EAwPh3lLmr7Lx38X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748416854; c=relaxed/simple;
	bh=1d1WGAVVXkGYDtw9DCPpZQCb5ZPBQACYubXaunIzu7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OESeNo5V54gNkrBuyQZN9aeIpSLNNpJrFVhoo3o9dIDeIemMoKDGBbdJ9cPuQL0Vi+doiOo1pg4nQvFqOsjS2GAsuIHJf0mzAv0dbBGqkk5Kn+JIxKk2Xu8YB6/3IgtQ6PF0+EFwL8xTYT88jsTQPd7GMNF2DE8Qj6/9D0x5moc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZ9QK7eY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZ9QK7eY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC39C4CEE7;
	Wed, 28 May 2025 07:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748416854;
	bh=1d1WGAVVXkGYDtw9DCPpZQCb5ZPBQACYubXaunIzu7M=;
	h=From:To:Cc:Subject:Date:From;
	b=fZ9QK7eYgWzXWJ9hea8LA7KkjNvlOYNMHolRXCAxRMhGFBDhcsMN/C4f8LiuPuC+b
	 m9k61EsM13Hc0+mjExS0Q3k84NYuNYPaQvc65I3qZ4Y0TLBoNOMxY8wTyXCu+zCpLd
	 fYtFEh7fOTftNV2Wtez4dY6xQhQ1H0eGvOogItcr3ggd6+ZzXIfLeweXWYH31WmWzy
	 oNIZWYh18I2i+nx+YzydFJ4uSies36eGZqaYoNNxFK3ZYwzHRB1L3yCS40OMeU/mwk
	 uhVyUg+xEbajwZ92z1/ZZqOh23dszT3yXu5uXH5bqJwy3c6sULP4j9rBMZP+Dqi6VO
	 VistsSWQQylyQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH] f2fs: fix to do sanity check on section ckpt_valid_blocks correctly
Date: Wed, 28 May 2025 15:20:45 +0800
Message-ID: <20250528072045.416898-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot report a f2fs bug as below:

CPU: 0 UID: 0 PID: 5840 Comm: syz-executor138 Not tainted 6.15.0-rc7-next-20250523-syzkaller #0 PREEMPT(full)
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 sanity_check_valid_blocks fs/f2fs/segment.h:385 [inline]
 build_sit_entries+0x1b0c/0x1f80 fs/f2fs/segment.c:5060
 f2fs_build_segment_manager+0x3112/0x49f0 fs/f2fs/segment.c:5707
 f2fs_fill_super+0x45bc/0x6c80 fs/f2fs/super.c:4754
 mount_bdev+0x211/0x2c0 fs/super.c:1736
 legacy_get_tree+0xfd/0x1a0 fs/fs_context.c:666
 vfs_get_tree+0x92/0x2b0 fs/super.c:1802
 do_new_mount+0x24a/0xa40 fs/namespace.c:3869
 do_mount fs/namespace.c:4206 [inline]
 __do_sys_mount fs/namespace.c:4417 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4394
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

sanity_check_valid_blocks() should be called after set_ckpt_valid_blocks()
in the loop, otherwise, @segno passed to sanity_check_valid_blocks() will
become invalid, fix it.

Fixes: 313d10d79a82 ("f2fs: add ckpt_valid_blocks to the section entry")
Reported-by: syzbot+1fa48dc6faf1ff972d7d@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/68345c8d.a70a0220.253bc2.0097.GAE@google.com
Cc: yohan.joung <yohan.joung@sk.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
Change v1:
- merge this into original patch is fine to me as well.
 fs/f2fs/segment.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5ff0111ed974..b77b5de71a48 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5054,10 +5054,10 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	if (__is_large_section(sbi)) {
 		unsigned int segno;
 
-		for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))
+		for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi)) {
 			set_ckpt_valid_blocks(sbi, segno);
-
-		sanity_check_valid_blocks(sbi, segno);
+			sanity_check_valid_blocks(sbi, segno);
+		}
 	}
 
 	if (err)
-- 
2.49.0

