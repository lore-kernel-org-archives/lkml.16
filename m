Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1FF175D50
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739251925; cv=none; b=cjP1dasvYkbO1IQ5n5bTVZvEADISPPKzhPQcMJFaSeIGbYw4Aka/lpBPCO7+d9kG7rKOcaDkt9oo3fZsnKS2CZN5s7gdDaUH6z66ijXs2ewVh/dTT5H2ET9Z9+K3NPXSZy8RSbVaeTiUXzXHSkVEs6n+sFITDxhvaSeRszAKZOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739251925; c=relaxed/simple;
	bh=Q3JwADRSqkm9Knu312TFl4pfLiK/QQ8Czko65H6wdZM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VgfQrbdHpkY0fHROZcE4XffiBlFjL3b6+1HbPgfI0K1M0ngtl5cQJLpTn2il1AmjOoC5IcFDZ2KvOuf5Caa/+7ttFS/H//le7vp5BY8hHgXHT5HA5wKZF6G61gvWrTU0A44x3fwK/VdRbNzEvN8YRK6lEwUEv+MX7me2Nxb5clY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d058142573so38630245ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 21:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739251922; x=1739856722;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlVUHeZMHHklhN4yxXU8wF+3Tx00zULTzJ3c+WwKunU=;
        b=uDRZhw64z4NGjHwf9VuvQmYCBsxlD2bUe6pEhz+Z/a01c8O9joyhuf0hK1Awiz4swA
         F9zNk/y3bb1WfW+oGdzc8IXzg76hDqXNO4ia5Uross87y+Rohh1eUQBKmupZ2c9YT2Dp
         YaWWJp65grVC7FyqlryeGGCvoZzWI7d5BltBrdM90GdxDRtCj6rMgR9U/60H6ZQwwtWU
         H9VfV/Elx4RPKL4opT9DnuA/oD4cEU2Dbb2+b3z6hZ52FV269nhzKmQ65gPG2Mo10jVj
         l0Vdml09YlTAKXsl3+HI3BeOrkdxwtQvuDnfCf8Mcg0seS2EtnCm70vqBleSuhaOC4vM
         HGiA==
X-Forwarded-Encrypted: i=1; AJvYcCWzg+7YzQ0/4Cd1rYjfjwW6ipkkJmahRkUcJjHmIPjuKfQMukFJ8dh3FlAO5rmmc4LKJWRkbk4KSnfGMOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFLQshDjwm0f6hfvHbU2cPDN5WdDwtCTDOOBo2dTx93jFLCS0S
	8GijSusiYotkiZrN0tqdv2uzMgjCUl/bNeDjrYqNlto2wwIHpDGVKRSZ/H/t0pMiZIg9+r0Umxh
	aZ8WnQq+F7U3MxGu8afti6rn2zk9sU76mLyLhzf81mJZWB/PElneFWHs=
X-Google-Smtp-Source: AGHT+IEpTYRKmOmIn+fHcT4atdFSY5bs8ytIyieHO8f6r1aLNTuV40aBCQyvjPjl/AGFZ0IGy71JLOJ8jNiLmrpmOFk51pZwl2JC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17ca:b0:3cd:d14c:be69 with SMTP id
 e9e14a558f8ab-3d16f4d9170mr15164065ab.11.1739251922678; Mon, 10 Feb 2025
 21:32:02 -0800 (PST)
Date: Mon, 10 Feb 2025 21:32:02 -0800
In-Reply-To: <5a647c34-62d0-47e9-827d-6d7fa9ee5ec5@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67aae0d2.050a0220.3d72c.005b.GAE@google.com>
Subject: Re: [syzbot] [f2fs?] kernel BUG in new_curseg (2)
From: syzbot <syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in f2fs_handle_critical_error

kworker/u8:3: attempt to access beyond end of device
loop0: rw=2049, sector=40960, nr_sectors = 16 limit=40427
------------[ cut here ]------------
WARNING: CPU: 0 PID: 53 at fs/f2fs/super.c:4255 f2fs_handle_critical_error+0x34f/0x590 fs/f2fs/super.c:4255
Modules linked in:
CPU: 0 UID: 0 PID: 53 Comm: kworker/u8:3 Not tainted 6.14.0-rc1-syzkaller-00028-gb49923b8c6ce #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: writeback wb_workfn (flush-7:0)
RIP: 0010:f2fs_handle_critical_error+0x34f/0x590 fs/f2fs/super.c:4255
Code: 48 83 e6 40 31 ff e8 00 10 a4 fd 48 83 e3 40 0f 84 30 02 00 00 e8 11 0b a4 fd 48 8b 5c 24 10 40 84 ed 74 1a e8 02 0b a4 fd 90 <0f> 0b 90 80 7c 24 08 00 74 30 e8 f2 0a a4 fd e9 83 00 00 00 e8 e8
RSP: 0018:ffffc90000bd6be0 EFLAGS: 00010293
RAX: ffffffff841b52be RBX: ffff88807df62000 RCX: ffff8880226fda00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000002
RBP: 0000000000000003 R08: ffffffff841b521b R09: 1ffffffff2858d2c
R10: dffffc0000000000 R11: fffffbfff2858d2d R12: ffff8880551e596b
R13: dffffc0000000000 R14: ffff8880551e4000 R15: ffff8880551e5988
FS:  0000000000000000(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f490b243290 CR3: 0000000029b3e000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 f2fs_write_end_io+0x674/0x9a0 fs/f2fs/data.c:347
 __submit_merged_bio+0x2a9/0x710 fs/f2fs/data.c:537
 __f2fs_submit_merged_write fs/f2fs/data.c:633 [inline]
 __submit_merged_write_cond fs/f2fs/data.c:655 [inline]
 f2fs_submit_merged_write+0x1ea/0x2c0 fs/f2fs/data.c:665
 f2fs_sync_node_pages+0x1a2c/0x1c90 fs/f2fs/node.c:2101
 f2fs_write_node_pages+0x304/0x6d0 fs/f2fs/node.c:2173
 do_writepages+0x35f/0x880 mm/page-writeback.c:2687
 __writeback_single_inode+0x14f/0x10d0 fs/fs-writeback.c:1680
 writeback_sb_inodes+0x820/0x1360 fs/fs-writeback.c:1976
 wb_writeback+0x413/0xb80 fs/fs-writeback.c:2156
 wb_do_writeback fs/fs-writeback.c:2303 [inline]
 wb_workfn+0x410/0x1080 fs/fs-writeback.c:2343
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


Tested on:

commit:         b49923b8 f2fs: fix to avoid panic once fallocation fai..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
console output: https://syzkaller.appspot.com/x/log.txt?x=14c2b1b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=147b7d49d83b8036
dashboard link: https://syzkaller.appspot.com/bug?extid=15669ec8c35ddf6c3d43
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
