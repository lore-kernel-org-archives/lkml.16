Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5AD157493
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 05:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744434461; cv=none; b=af/hY9SRBc2KqH1lD0alicBEuAls8+Gpr+wkHyjzSK3Bl1Q+fLaKVszQpCGXuIY9YR6gN8+pA9cnmAvQfgMpdHHSzczyOHR4UkViAG0xPhAdo9uXP4bzoKjBjlgWxdN2mJ3/0FwK7cUwdpd9pZFGc3SYhfWDxMmEEIIptXJESCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744434461; c=relaxed/simple;
	bh=En1cesfzcC238AOzohjVszVo+z7+7ixM7UPjvNrn0iQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=KRL4Zijnch17jJtfUBnyDMyPY4VSPeUYYftHygh7Y79rMMLywjIJ2RuFHw7DkcjXJtQ+kwDuCzflwnm2KzJIdRT2eX/5mPDWr7EIphq2iCYCoUwJdL6U1tuXy+HumpTZPF6deOFaaw9TsyTG6a8AoKNqvr06EZcO7ZcP46QlSqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=nHzHvik5; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="nHzHvik5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1744434440; bh=PYgAf7sAo1Jbw1H8B3bk2ICdZQiMe/tWDsbOKTKUqlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nHzHvik5fzJdsmUjQhsfCnmaiBKpdAncTyAoKm6EQxX7cAphubkIu5x7nqBGiabG5
	 4SYQiIHZoMgxK4oAzB2Rseul3XrtBSJh9lyNWXRHTVw/EOKVlTr4Qpzv3S31H+rPzZ
	 lDbkS9lmhvk4MKq0HR9ZcNTJe120FLdUtbPwyC+0=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 1D2008E3; Sat, 12 Apr 2025 13:07:18 +0800
X-QQ-mid: xmsmtpt1744434438typgg8jw5
Message-ID: <tencent_C803BAF1BB47330C9E131B254B191B682508@qq.com>
X-QQ-XMAILINFO: MiE+axgVDEQLnMD1kvjwy7aC9Q17sZk+V8RxyupaZ4znspS8nlIUYxWO7pb3re
	 gg/m5+Tfv375RwOfHff12jZEMHWPpKTq9uLLnRhzeJAGiFv0vXYWyp4oDYvbSPYjBmggZ+M0W+PN
	 rCzqCE4aCgZDbX4xv2EFp3+5UjSLZ2nVsKqsq3rWX9XbSlNC31Yvy8Nu/Vo1+G0uz/GoBvLSD0kC
	 YH3/GhLHYjOkObVABwD12TjP39SlPH9bZ+Gs5NjFqm8uo9j+QBu5z8g0OH4Rn4g4/tw79S3cewSo
	 n4XCWPDHg8VS9+NWL8uG6n/zfU19t3fvTwutEuCpxRFcCWtjRPaJBvgcCrGiB91YlRW/gBlt598/
	 OVbWv4cUVqwRwv1HLxh85mkcoI7tEGFSKmP0D/kL4Lc3DMA76n3uQX6g4Jij/ZZVFun7I22fv4pr
	 wRcvpJ5BG1wUXqMID4iULU+vGjDH+OF4Q9m6x8UaY0g6t/WE8b0ZSqglR50AnoeVm/ibp1GTighI
	 ClhrQ23ldcryD2+0X36H/DY7TuVRk4Xgsl5OMfhRbSowb2tNuu5edFLsHMOwsSPRCMnb3XjAx6Ec
	 K33/5LK9Z+//HUNjBq9XVUnTT1xRsbzhZG2OAg+0WMbuzN+geOKXZRKx0vHrsnGKOV9quPwSlBx8
	 VWhECcVAfW5i1v//82F/eV8pdk/zFpYrgN09d2NYPfcXLks6RmGzt0wLHfsqfqk4RkzAVemiO/Vp
	 7t2esH99j16ohk6hlQ5Ewuwb6RcCUd8csr21MDJq1Bvm6oW7pZVkPjUGjoI6QKY/PolQZfNh6Wkd
	 mDko28RwsxWD60hywzOtbTBG4yH9GweSJupPUSPl8nuiZi1mRWu/A0G5G8fs4/Ald1+KH9bkxtoQ
	 2WewMe5dI3APtCUHSavYcOH3+SRtFaIfJN3IkW41Mt
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+b0018b7468b2af33b4d5@syzkaller.appspotmail.com
Cc: agruenba@redhat.com,
	gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] gfs2: capture blocksize set failed
Date: Sat, 12 Apr 2025 13:07:18 +0800
X-OQ-MSGID: <20250412050717.3676047-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <67f8d2b2.050a0220.355867.001c.GAE@google.com>
References: <67f8d2b2.050a0220.355867.001c.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a oob in gfs2_fill_super. [1]

When setting blocksize fails, the s_blocksize_bits value is incorrect.

[1]
UBSAN: shift-out-of-bounds in fs/gfs2/ops_fstype.c:1172:19
shift exponent 4294967287 is too large for 64-bit type 'unsigned long'
CPU: 1 UID: 0 PID: 6127 Comm: syz.0.42 Not tainted 6.14.0-next-20250404-syzkaller #0 PREEMPT(full)
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_shift_out_of_bounds+0x3c8/0x420 lib/ubsan.c:492
 gfs2_fill_super+0x255e/0x27b0 fs/gfs2/ops_fstype.c:1172
 get_tree_bdev_flags+0x490/0x5c0 fs/super.c:1636
 gfs2_get_tree+0x54/0x220 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0x90/0x2b0 fs/super.c:1759
 do_new_mount+0x2cf/0xb70 fs/namespace.c:3879
 do_mount fs/namespace.c:4219 [inline]
 __do_sys_mount fs/namespace.c:4430 [inline]
 __se_sys_mount+0x38c/0x400 fs/namespace.c:4407
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported-by: syzbot+b0018b7468b2af33b4d5@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/gfs2/ops_fstype.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index e83d293c3614..d5bc25164b89 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1167,6 +1167,10 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	/* Set up the buffer cache and fill in some fake block size values
 	   to allow us to read-in the on-disk superblock. */
 	sdp->sd_sb.sb_bsize = sb_min_blocksize(sb, 512);
+	if (!sdp->sd_sb.sb_bsize) {
+		error = -EINVAL;
+		goto fail_free;
+	}
 	sdp->sd_sb.sb_bsize_shift = sb->s_blocksize_bits;
 	sdp->sd_fsb2bb_shift = sdp->sd_sb.sb_bsize_shift - 9;
 	sdp->sd_fsb2bb = BIT(sdp->sd_fsb2bb_shift);
-- 
2.43.0

