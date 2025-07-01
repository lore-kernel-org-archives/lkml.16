Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C0C25F7A9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358883; cv=none; b=HVz8YNw8l/cuvqSD7VYebfIaIdFW2ZhOyojyTZJQBH0Z2SskE0rDU9qmOkyZs2AQxW3vKCfHTjkPr7EEWvTD8KT+9wkY/SMu3VX2T5i1N0euTf4kVIAOZRj5c9Pv3p3AIUA3r+jFNSDq9JWduec/XWheodb6EP5Uft2zO7ykQfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358883; c=relaxed/simple;
	bh=umg6gCeuoOOe/4FN2ZZQLa02VnWQ23BZYnSymARLrnA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q0fzXZyr5zv8DlbyVpCaFeQn7zVfh8e/ew1KGPuckGIGeMtM1pqlAcMm9/jgpqRfyFjflR/SKT1iVne6UmWlgacvbcfC8u51aexWqgpKG1Z3IyFNNjqJg7ggYvKV30rlhxPbIsvjvHC6j1ZYLtog6398yQ2QuX2XN2Rc0s/Lb98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxWPecMx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxWPecMx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9E2C4CEEF;
	Tue,  1 Jul 2025 08:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751358882;
	bh=umg6gCeuoOOe/4FN2ZZQLa02VnWQ23BZYnSymARLrnA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=lxWPecMxr6PXKy/YLdgvhmUIFKMQbonrC8suJ8G6hCPLnbt+0jL4sUNTjXrvPqfEy
	 5UsE6kBFCWCyW8jqDVtyh/KK+fjMw9pihSF18zl6T3kA8SOCpBMIQ0SGmFQG9MaAon
	 SGf1PFw+o29pZQ6X1mDbOVliYyY9kQ+vx8KT7Qa6PjHXqbtKlPATAkQU+yefGVQVfm
	 nT9iunNbOLlbrbfFkCVNAtQNe1UQsCw/novmBvmWVWnx6eccfoGbfuoMgZVjTzfKB1
	 6//06jI56fr7TMBMbEBRceq4nU15KEK/IqcQBz853LkTPeclkTa254VS5Ff2CkvC10
	 AnMtLxeF6PKQw==
Message-ID: <a0abb368-1871-49e9-8f6b-ff78f543c808@kernel.org>
Date: Tue, 1 Jul 2025 16:34:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org
Subject: Re: [syzbot] [f2fs?] kernel BUG in do_write_page
To: syzbot <syzbot+9201a61c060513d4be38@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <68639520.a70a0220.3b7e22.17e6.GAE@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <68639520.a70a0220.3b7e22.17e6.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common

On 7/1/25 15:58, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    2aeda9592360 Add linux-next specific files for 20250627
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=152363d4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7f5c1d958b70bf47
> dashboard link: https://syzkaller.appspot.com/bug?extid=9201a61c060513d4be38
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/d532560074a3/disk-2aeda959.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/483001f76864/vmlinux-2aeda959.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/8f233cdc1c77/bzImage-2aeda959.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+9201a61c060513d4be38@syzkaller.appspotmail.com
> 
> F2FS-fs (loop9): inject invalid blkaddr in f2fs_is_valid_blkaddr of do_write_page+0x277/0xb10 fs/f2fs/segment.c:3956
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/segment.c:3957!
> Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
> CPU: 0 UID: 0 PID: 10538 Comm: syz-executor Not tainted 6.16.0-rc3-next-20250627-syzkaller #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> RIP: 0010:do_write_page+0xa44/0xb10 fs/f2fs/segment.c:3956
> Code: 82 7f ad fd 49 89 ed 48 89 e8 48 25 ff 0f 00 00 74 1a e8 8f 7a ad fd e9 9f 00 00 00 e8 85 7a ad fd 90 0f 0b e8 7d 7a ad fd 90 <0f> 0b 4d 89 ee 4c 89 ef be 08 00 00 00 e8 7a 7c 11 fe 49 c1 ee 03
> RSP: 0018:ffffc90004f2ec58 EFLAGS: 00010293
> RAX: ffffffff841257e3 RBX: ffffc90004f2ef40 RCX: ffff88802f493c00
> RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
> RBP: ffffc90004f2ef5c R08: 0000000000000003 R09: 0000000000000004
> R10: dffffc0000000000 R11: fffffbfff1bfa428 R12: ffff888042d28000
> R13: 1ffff920009e5deb R14: dffffc0000000000 R15: ffffc90004f2ef5c
> FS:  000055555f3a1500(0000) GS:ffff888125c1e000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f2ce7b71d60 CR3: 0000000031b0e000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  f2fs_outplace_write_data+0x11a/0x220 fs/f2fs/segment.c:4017
>  f2fs_do_write_data_page+0x12ea/0x1a40 fs/f2fs/data.c:2752
>  f2fs_write_single_data_page+0xa68/0x1680 fs/f2fs/data.c:2851
>  f2fs_write_cache_pages fs/f2fs/data.c:3133 [inline]
>  __f2fs_write_data_pages fs/f2fs/data.c:3282 [inline]
>  f2fs_write_data_pages+0x195b/0x3000 fs/f2fs/data.c:3309
>  do_writepages+0x32b/0x550 mm/page-writeback.c:2636
>  filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
>  __filemap_fdatawrite_range mm/filemap.c:419 [inline]
>  __filemap_fdatawrite mm/filemap.c:425 [inline]
>  filemap_fdatawrite+0x199/0x240 mm/filemap.c:430
>  f2fs_sync_dirty_inodes+0x31f/0x830 fs/f2fs/checkpoint.c:1108
>  block_operations fs/f2fs/checkpoint.c:1247 [inline]
>  f2fs_write_checkpoint+0x95a/0x1df0 fs/f2fs/checkpoint.c:1638
>  kill_f2fs_super+0x2c3/0x6c0 fs/f2fs/super.c:5081
>  deactivate_locked_super+0xb9/0x130 fs/super.c:474
>  cleanup_mnt+0x425/0x4c0 fs/namespace.c:1417
>  task_work_run+0x1d4/0x260 kernel/task_work.c:227
>  resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
>  exit_to_user_mode_loop+0xec/0x110 kernel/entry/common.c:114
>  exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
>  syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
>  syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
>  do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f85f3d8fc57
> Code: a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 a8 ff ff ff f7 d8 64 89 02 b8
> RSP: 002b:00007ffc395e64c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
> RAX: 0000000000000000 RBX: 00007f85f3e10925 RCX: 00007f85f3d8fc57
> RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffc395e6580
> RBP: 00007ffc395e6580 R08: 0000000000000000 R09: 0000000000000000
> R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffc395e7610
> R13: 00007f85f3e10925 R14: 00000000000c355a R15: 00007ffc395e7650
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:do_write_page+0xa44/0xb10 fs/f2fs/segment.c:3956
> Code: 82 7f ad fd 49 89 ed 48 89 e8 48 25 ff 0f 00 00 74 1a e8 8f 7a ad fd e9 9f 00 00 00 e8 85 7a ad fd 90 0f 0b e8 7d 7a ad fd 90 <0f> 0b 4d 89 ee 4c 89 ef be 08 00 00 00 e8 7a 7c 11 fe 49 c1 ee 03
> RSP: 0018:ffffc90004f2ec58 EFLAGS: 00010293
> RAX: ffffffff841257e3 RBX: ffffc90004f2ef40 RCX: ffff88802f493c00
> RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
> RBP: ffffc90004f2ef5c R08: 0000000000000003 R09: 0000000000000004
> R10: dffffc0000000000 R11: fffffbfff1bfa428 R12: ffff888042d28000
> R13: 1ffff920009e5deb R14: dffffc0000000000 R15: ffffc90004f2ef5c
> FS:  000055555f3a1500(0000) GS:ffff888125c1e000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007ff1d4e5ef40 CR3: 0000000031b0e000 CR4: 00000000003526f0
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup

