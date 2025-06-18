Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25B03085CC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750285899; cv=none; b=sft9+Qqicsx33LVwyNnGEJc0qgXKGOtLom78UZdvdznZt5kYqMRrahcjtlpV5KlP8DaTcBNtI8TLDIv7taeS/qDbN/XcZimkt5Pu6KCXzUpoJhLTvfQJKc0rMcnEFMWBG4U086xVl77tUEIszjSFhSEa8yhr0HsHz4tTARabvWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750285899; c=relaxed/simple;
	bh=Sh+fB8f3onrvVBI5RiqkmnuXNfwO5+3FLY5RZ3oUno0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KRIrw3fOhx88I1LjzDwZ/CHQs64bnMbw/N1l9aS7JHJBfJzbtMtypw5OEKIGaetrN7jhxT5oez6zotVFqbEOtVlCrxwP5UnaZAKjWVA/8SjfKNpcT4dQmbNp44PWsUr7L5K4b4aA6J82uQrT9qeUnuzpWZpPu6DceqxARFQLHWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iX13dbBT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iX13dbBT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7326BC4CEE7;
	Wed, 18 Jun 2025 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750285899;
	bh=Sh+fB8f3onrvVBI5RiqkmnuXNfwO5+3FLY5RZ3oUno0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iX13dbBT/V0WyWxJ0VTVTM5vK26Sg4dWAFzp4S1qpncd/PBDlQya9ePJGDb+mbX2e
	 w+f9TRWNRGYffxDCEvo7LM+Blt+Mlt0pGomBm/bfinVvQH8cZEsV1kzrJ+9Y+ttaLB
	 P4XxXWTmoZXYjCCLTo75Vne9Maz53IWDpah+VT/w=
Date: Wed, 18 Jun 2025 15:31:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: syzbot <syzbot+ca15a081ac6b8357d82c@syzkaller.appspotmail.com>
Cc: Liam.Howlett@oracle.com, bsegall@google.com, david@redhat.com,
 dietmar.eggemann@arm.com, juri.lelli@redhat.com, kees@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, mgorman@suse.de, mhocko@suse.com,
 mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org,
 rppt@kernel.org, surenb@google.com, syzkaller-bugs@googlegroups.com,
 vbabka@suse.cz, vincent.guittot@linaro.org, vschneid@redhat.com, Jens Axboe
 <axboe@kernel.dk>
Subject: Re: [syzbot] [mm?] WARNING in __put_task_struct (5)
Message-Id: <20250618153137.a8f3937e86816cd9b7a3ab0d@linux-foundation.org>
In-Reply-To: <6852b77e.a70a0220.79d0a.0216.GAE@google.com>
References: <6852b77e.a70a0220.79d0a.0216.GAE@google.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Jun 2025 05:56:30 -0700 syzbot <syzbot+ca15a081ac6b8357d82c@syzkaller.appspotmail.com> wrote:

> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    4663747812d1 Merge tag 'platform-drivers-x86-v6.16-2' of g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1626f90c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d6f01a06a8393850
> dashboard link: https://syzkaller.appspot.com/bug?extid=ca15a081ac6b8357d82c
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10c9d5d4580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/ef27ce1c74bb/disk-46637478.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/2962783b1956/vmlinux-46637478.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/faa841f27097/bzImage-46637478.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+ca15a081ac6b8357d82c@syzkaller.appspotmail.com
> 
> RBP: 00007ff5f3810b39 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000000 R14: 00007ff5f39b5fa0 R15: 00007ffd192cb478
>  </TASK>
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 6071 at kernel/fork.c:731 __put_task_struct+0x340/0x530 kernel/fork.c:731

It doesn't look MM related.  Perhaps there's something wonky in the
io_sq_offload_create() error path.


> Modules linked in:
> 
> CPU: 1 UID: 0 PID: 6071 Comm: syz.2.22 Not tainted 6.16.0-rc2-syzkaller-00045-g4663747812d1 #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> RIP: 0010:__put_task_struct+0x340/0x530 kernel/fork.c:731
> Code: f6 ac 41 00 be 03 00 00 00 4c 89 e7 e8 f9 c2 5e 03 e9 ed fe ff ff e8 df ac 41 00 90 0f 0b 90 e9 6d fd ff ff e8 d1 ac 41 00 90 <0f> 0b 90 e9 0b fd ff ff e8 c3 ac 41 00 90 0f 0b 90 e9 67 fd ff ff
> RSP: 0018:ffffc90002fd7c50 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: ffff888026d18000 RCX: ffffffff8179d88b
> RDX: ffff888032081e00 RSI: ffffffff8179db7f RDI: 0000000000000005
> RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000001 R12: ffff888026d18000
> R13: 1ffff920005faf96 R14: ffff888026d18028 R15: 0000000000000000
> FS:  00007ff5f452f6c0(0000) GS:ffff888124861000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007ff5f3725b20 CR3: 0000000073166000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  put_task_struct include/linux/sched/task.h:145 [inline]
>  put_task_struct include/linux/sched/task.h:132 [inline]
>  io_sq_offload_create+0xe4b/0x1330 io_uring/sqpoll.c:517
>  io_uring_create io_uring/io_uring.c:3747 [inline]
>  io_uring_setup+0x1493/0x2080 io_uring/io_uring.c:3830
>  __do_sys_io_uring_setup io_uring/io_uring.c:3864 [inline]
>  __se_sys_io_uring_setup io_uring/io_uring.c:3855 [inline]
>  __x64_sys_io_uring_setup+0xc2/0x170 io_uring/io_uring.c:3855
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xcd/0x490 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7ff5f378e929
> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ff5f452f038 EFLAGS: 00000246 ORIG_RAX: 00000000000001a9
> RAX: ffffffffffffffda RBX: 00007ff5f39b5fa0 RCX: 00007ff5f378e929
> RDX: 0000000000000000 RSI: 0000200000000080 RDI: 0000000000000059
> RBP: 00007ff5f3810b39 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000000 R14: 00007ff5f39b5fa0 R15: 00007ffd192cb478
>  </TASK>
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
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
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
