Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2C92C3271
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748939616; cv=none; b=QY/+uzj3yQsqhleuMqKZVSoiOLptiojY7bqeEy2ma2U6ZZUG4fPLbPZw5a7YgB+AiEpPB6wFT41gNgwkOQk0kNRe//Z3wGCCle5HQ0Qav4bsH0bJDVeWPY8uSTYHMUNmRJ4Qhky3QU6pl0IuEOlpC9gdXV4YEf0ysxnQMgOkhgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748939616; c=relaxed/simple;
	bh=QDd5gO3VmW4PsIQs2/PqN2ib6jDK3YOpIlYaKTtg5rM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Euy7ol+Eee1TSARuN8AMwFNgUz/sgV4VeHsurhTmUAvTQeHEpn4pAEO+SBuyOay0muwMm3RXSn3K3eSwBGieo2D/PqHpAPo+nGC3AGBu21II0z972BwfSS13UlbZx2wSTqAV3xGXENfYpE0DwdWGVEJDPsCyW6tXFaECclRLV/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddb8522720so9684575ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748939614; x=1749544414;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PnDXQQ+eXJvD3MKBP/vy3SLNLiIY9oiD1zSTePQgx/0=;
        b=wA9PLAe8vII1olBPnwWmwGAWGwe5lqF9UJklnYVjydVqJX6cmdals08UjSNeXldECW
         XRMU9GXYTredTAiMNViroROOr6RV3kUdCPeRO917C7OJlJSTObMcg8znPUb3/R4j7ShP
         AUVBtm1VglYab40Hb2X2Q3Trj67c+f+nMFd3mmJz2g8S34xUo+MhM44ozin6kcuCEnWp
         xIJphuHbNVJeEkqXUHs04m9Rufmqc3jht5UHK2GIybPUz/5fdlZIhr3R7AOEiMXe8lL2
         2yXj6SviWuqzDDs9VX00nfgJJNb+6T2ujnZ/Ivn6DCLXe9vzH8JCuvEaZ5V1HWmHzw/8
         JoJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV93tza5MN3XfFI5PRvmdNXXJC49ZoEVqtImwiyqnZ4oXVF3KDr8jgnpCje3EttGapVvxJFvs2fYOuWrLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHeVF6m46BVCnMXsrUfqjSE+n6UfaTCHUIPXFb7Sp2n943VjtU
	8e+tcNL1WMeyKu5nmPqV8x5k/qiqWoMFHJZcBotAk3OV489jdZoEPZKmXwGXNtMU97Z/izQuM9G
	yrunBBqPRjUSZ3a+hS9or/BCn7nzj1UeQhqJZWqU5N4sgC7vt7q3yz99tm5c=
X-Google-Smtp-Source: AGHT+IFavsB8h7+yWi6f2dQJlVvPgrl8pLo7lS7OGVCB5+DuKHXjBTm7uok/halrKk/E/hlCNrUTXUhemXXgH/VrfnuZv6zSY1C6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d99:b0:3dc:7fa4:804 with SMTP id
 e9e14a558f8ab-3dda3387dc3mr110544985ab.16.1748939614144; Tue, 03 Jun 2025
 01:33:34 -0700 (PDT)
Date: Tue, 03 Jun 2025 01:33:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683eb35e.a00a0220.d8eae.0062.GAE@google.com>
Subject: [syzbot] [jfs?] kernel BUG in jfs_truncate_nolock
From: syzbot <syzbot+630f6d40b3ccabc8e96e@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f66bc387efbe Merge tag 'scsi-misc' of git://git.kernel.org..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14ccbff4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5035170c334b10e0
dashboard link: https://syzkaller.appspot.com/bug?extid=630f6d40b3ccabc8e96e
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1725f7f4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=158147f4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fd515d0ab520/disk-f66bc387.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/02091b462a17/vmlinux-f66bc387.xz
kernel image: https://storage.googleapis.com/syzbot-assets/963425e89030/bzImage-f66bc387.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/41b7b3dad955/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=10a93482580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+630f6d40b3ccabc8e96e@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 32768
BUG at fs/jfs/inode.c:370 assert(length >= 0)
------------[ cut here ]------------
kernel BUG at fs/jfs/inode.c:370!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 5823 Comm: syz-executor203 Not tainted 6.15.0-syzkaller-08486-gf66bc387efbe #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:jfs_truncate_nolock+0x33b/0x340 fs/jfs/inode.c:370
Code: e8 aa a9 25 08 e8 25 01 89 fe 48 c7 c7 80 6f c3 8b 48 c7 c6 a0 6b c3 8b ba 72 01 00 00 48 c7 c1 c0 6f c3 8b e8 76 4f f0 fd 90 <0f> 0b 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66
RSP: 0018:ffffc900043af860 EFLAGS: 00010246
RAX: 000000000000002d RBX: ffff8880770d1fd8 RCX: 6cc80c570e63f800
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: ffffc900043af910 R08: ffffc900043af547 R09: 1ffff92000875ea8
R10: dffffc0000000000 R11: fffff52000875ea9 R12: fffffa000000000a
R13: dffffc0000000000 R14: ffff8880770d1fd8 R15: 1ffff92000875f10
FS:  0000555593cd0380(0000) GS:ffff888125d98000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd7dd58a000 CR3: 00000000338e4000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 jfs_truncate fs/jfs/inode.c:412 [inline]
 jfs_write_failed+0x119/0x190 fs/jfs/inode.c:289
 jfs_direct_IO+0x1f4/0x220 fs/jfs/inode.c:342
 generic_file_direct_write+0x1d8/0x3e0 mm/filemap.c:4037
 __generic_file_write_iter+0x11d/0x230 mm/filemap.c:4206
 generic_file_write_iter+0x10f/0x540 mm/filemap.c:4246
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x548/0xa90 fs/read_write.c:686
 ksys_write+0x145/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fce1ba0eb99
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd0e6719b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fce1ba0eb99
RDX: 00000000000000a0 RSI: 0000200000000340 RDI: 0000000000000004
RBP: 00007fce1ba875f0 R08: 0000000000000000 R09: 0000555593cd14c0
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffd0e6719e0
R13: 00007ffd0e671c08 R14: 431bde82d7b634db R15: 00007fce1ba5703b
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:jfs_truncate_nolock+0x33b/0x340 fs/jfs/inode.c:370
Code: e8 aa a9 25 08 e8 25 01 89 fe 48 c7 c7 80 6f c3 8b 48 c7 c6 a0 6b c3 8b ba 72 01 00 00 48 c7 c1 c0 6f c3 8b e8 76 4f f0 fd 90 <0f> 0b 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66
RSP: 0018:ffffc900043af860 EFLAGS: 00010246
RAX: 000000000000002d RBX: ffff8880770d1fd8 RCX: 6cc80c570e63f800
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: ffffc900043af910 R08: ffffc900043af547 R09: 1ffff92000875ea8
R10: dffffc0000000000 R11: fffff52000875ea9 R12: fffffa000000000a
R13: dffffc0000000000 R14: ffff8880770d1fd8 R15: 1ffff92000875f10
FS:  0000555593cd0380(0000) GS:ffff888125c98000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055923e290368 CR3: 00000000338e4000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
