Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA48219FC
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 17:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746381208; cv=none; b=sCLeiSRAoXrxrlwKq2NdYMBQlejoW9kbzU84r5GG0ICnyYUWYO1hxl+rNN9zXLcvkU5Nw7BqfwnDEXQS3L80JL5GilrFBDvD0S1CvkpnbRkc0ir9cmylmfALsoaZckQvOr/AfsZpkcbrN7LOwdxA2Gzu9/h71B2iLm4mCi7+nBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746381208; c=relaxed/simple;
	bh=r64Mac+FeayfMBUVl/9NlvickW/czh4/eidkYab5Kzs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=M2VCfExY2+AASR7kzPkGeZOb0zgLt++BtxqTfSlm9ByBiM/iWUvnKwRxijE95ftBZoV08TH28oZzj9kyJpSxjGJVvPfS+PIjkKW0CawShUkmUXorsuJlkQSlHyhBRu/eCqsC06MBS79hrPpRejBr0u7wkrF+MFTpuPLKmKtrTBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d43541a706so31789035ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 10:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746381205; x=1746986005;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tt95TFb3UPk7KVN0ENKNrXAObhmLVTcX1Pr2I8L7yG4=;
        b=rw1o2iEZ6W6OAszwcdjU+nzgQsOQXEXRiy4GQcYtkK0yyRIg55vH7BTuXnHFLjpgGZ
         kMtwZ463H/l4gqdL4P7iRwjkHo6yTfcszQlGbrHGVFvPzD+t5ISqoqEAtCZofLmwR0o0
         1dV97ht8AdaHzBMfb2DIh8fmTVUO9S+Y/FvIxaodkEmbsV2zbOdnPZbeg81RqjvIFdaF
         Kb37A54yWtLg65ME38AwPDQD6Jm0SnH7I3HOh5nJeG/gHsCs9ePJkvctLKjHeUkbz3oD
         BLDI2+PgGw08T8fz4TBk8/VLo5ccdWMNvds3Bs+jdrNi9qs4A1zbrExzTqTYwmQo87Fj
         kaYA==
X-Forwarded-Encrypted: i=1; AJvYcCU4zC6XvMWr56Qtpz1ag0Ot0gg97nmh42MMLp4ui61tvyZCvq7PTl92vX7nBRKS+tR5C/ocVPqBjcaWFo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEHw0c9bn9XXaIUr67padBKlOIQwUtvKGDslGWTwJD2c2RAFKV
	V+ZHHSq/WeLHiqZzG3Qd6IbIv9VkDER0KFl53vPF5xFYJwt7lVZ6HdJpQ+mk65/CzObSALTzeAL
	KevtPVk920k50coycoG5fHT+yZ7xBJBxy/Pm1KroYy4T9XOeGCN1UHZ8=
X-Google-Smtp-Source: AGHT+IFUjlDOTHHIkCBYv7BDNcpHz8PL8V2d3IjLZh8hKyS9J+KwomP37jCBy3I0JlLxTeU4NKWeuynkJ2e4kdihEhLYQdE/7i85
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3703:b0:3d5:8937:f419 with SMTP id
 e9e14a558f8ab-3da5b2a5dc5mr38902915ab.13.1746381205554; Sun, 04 May 2025
 10:53:25 -0700 (PDT)
Date: Sun, 04 May 2025 10:53:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6817a995.050a0220.11da1b.0034.GAE@google.com>
Subject: [syzbot] [afs?] WARNING in delete_node (3)
From: syzbot <syzbot+cc97c0c6ad58aaa2c578@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b6ea1680d0ac Merge tag 'v6.15-p6' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a6502f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=541aa584278da96c
dashboard link: https://syzkaller.appspot.com/bug?extid=cc97c0c6ad58aaa2c578
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0902cf82898c/disk-b6ea1680.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8d8189dce486/vmlinux-b6ea1680.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0976c5dd0feb/bzImage-b6ea1680.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cc97c0c6ad58aaa2c578@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 23 at lib/radix-tree.c:572 delete_node+0x223/0x8d0 lib/radix-tree.c:572
Modules linked in:
CPU: 1 UID: 0 PID: 23 Comm: ksoftirqd/1 Not tainted 6.15.0-rc4-syzkaller-00042-gb6ea1680d0ac #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
RIP: 0010:delete_node+0x223/0x8d0 lib/radix-tree.c:572
Code: 5f 3a f6 41 bc 01 00 00 00 e8 a9 72 53 f6 44 89 e0 48 83 c4 28 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc e8 8e 72 53 f6 90 <0f> 0b 90 e8 85 72 53 f6 48 c7 c6 80 a8 67 8b 4c 89 e7 e8 56 5f 3a
RSP: 0018:ffffc900001d7ac8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff88807ea0d118 RCX: ffffffff8b67bde3
RDX: ffff88801daec880 RSI: ffffffff8b67be72 RDI: ffff88807ea0d160
RBP: ffff88805c383440 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000004 R11: 0000000000000000 R12: ffff88805c383458
R13: dffffc0000000000 R14: 0000000000000000 R15: 0000000004000004
FS:  0000000000000000(0000) GS:ffff888124ae2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2ec05ff8 CR3: 0000000060b5a000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __radix_tree_delete+0x193/0x3d0 lib/radix-tree.c:1379
 radix_tree_delete_item+0xea/0x230 lib/radix-tree.c:1430
 afs_cell_destroy+0x1db/0x310 fs/afs/cell.c:522
 rcu_do_batch kernel/rcu/tree.c:2568 [inline]
 rcu_core+0x799/0x14e0 kernel/rcu/tree.c:2824
 handle_softirqs+0x216/0x8e0 kernel/softirq.c:579
 run_ksoftirqd kernel/softirq.c:968 [inline]
 run_ksoftirqd+0x3a/0x60 kernel/softirq.c:960
 smpboot_thread_fn+0x3f4/0xae0 kernel/smpboot.c:164
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
