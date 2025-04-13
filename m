Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF84376
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 00:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744502614; cv=none; b=AlgHh9WqvMdfZe2I19fZetzEjM50b5MIlwNUh96FT+uN0KlmMYjeaTVW428/3LwHhv0Od5mHcoICWL79W345jT8mRZeFFKXoUnhO+VNpq0ij63BhgewZx2uybbp4KUp9CRf2DAPUOI9w6FqQ6A102LfvmOOZh6AIPeQn79hfKmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744502614; c=relaxed/simple;
	bh=xM2hQZdY/RvHeLApzz/5i6wXQ5kTJ4PQYMQoCXfi0+A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=k4EUSISw4OPsPmAJCDAWXYFT70ZKN8mis6qkNohaEEv3wyL+eTMjdISrLBse6XgS4GeeAdJGXmUiwCuP2v1Rp5c05LrTE/WU5XV3c5xrWNOhlyMiaq3CKiIv9p/W8vp4CkpHqyKSSgsKzZ2DxhoyHZ8GGKMVCdGGIXpg8i4wTQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d43b460970so67314625ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 17:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744502611; x=1745107411;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m4xIz/4zYHBl/fpiaLT+zaP0LrzZcPAE8IpE6gTdZms=;
        b=EM57FZhe3UTCHdt2H53LkjukicSLMq+dpx5R0JsRlpNv1qk3uZsqNKEKdOvqYBc9/o
         sbOsPyuozV56/aFmap8J4Kz2YcDIZEEoyRtavzCjqXcnMIrJ2KDI0vHCp6LkdBKEKykJ
         PUO53/eDzLQDp3m2iXh6SomjUeRRAp4MFopw69mXcF9/s1aPr+qTDaGqJAqjyyMIZF/h
         xKk3LwCsOYYH+Kpnf5MMtrAfXoW0EguMYCm10RPv+gYCgzTLv413hqVo33coPmDjxSwu
         oBuXSCwPZ7oeMkCtFj0Ue3urEnXe0XRFEFFHUvLKu59+cnUNzD6e4r9gzIFrEeF3tajJ
         vWoA==
X-Forwarded-Encrypted: i=1; AJvYcCUSSxwvPimSktkm6TL5zGgzh1jaVltli+PCMkvHfobWnDJspW6UvwoOErtV/WZfzDh9ydZvMHDWD9IBux0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+hcKPfzL4s3EAnmWVzbWdqLYEPrrGVAoZrOVopjrNrihlIYAq
	E84lzS4mm7DUCAWQ+ktWsDKq4fWd9UZAoHpcfrF9DhqUlQoWUYm5ER2ByAb3EwUvpezKhcIouAK
	dz56ZGBRNj0rtZ+PT89VkoBsqf7nKUc6fxgWZgDgfkx/z5V/QEigeKvQ=
X-Google-Smtp-Source: AGHT+IFMvtkZlmemBtZ2n88Dqgm8KU5ag2Tw+lNA2QZsU7Vq14r/D++f95VS5o4rhmjpI12YAtCbUkuc2eWpiOWgLC6LBO5w4KOc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c04:b0:3d3:f040:5878 with SMTP id
 e9e14a558f8ab-3d7ec27bdf2mr89557915ab.21.1744502610912; Sat, 12 Apr 2025
 17:03:30 -0700 (PDT)
Date: Sat, 12 Apr 2025 17:03:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67faff52.050a0220.379d84.001b.GAE@google.com>
Subject: [syzbot] [mm?] WARNING in move_to_new_folio
From: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    01c6df60d5d4 Add linux-next specific files for 20250411
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=107b77e4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db03cefa26ecf825
dashboard link: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/928246b3f3d5/disk-01c6df60.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/79a68c4e1134/vmlinux-01c6df60.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9caf8c293819/bzImage-01c6df60.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com

------------[ cut here ]------------
jfs_metapage_aops does not implement migrate_folio
WARNING: CPU: 0 PID: 6870 at mm/migrate.c:955 fallback_migrate_folio mm/migrate.c:953 [inline]
WARNING: CPU: 0 PID: 6870 at mm/migrate.c:955 move_to_new_folio+0x70e/0x840 mm/migrate.c:1007
Modules linked in:
CPU: 0 UID: 0 PID: 6870 Comm: syz.3.196 Not tainted 6.15.0-rc1-next-20250411-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:fallback_migrate_folio mm/migrate.c:953 [inline]
RIP: 0010:move_to_new_folio+0x70e/0x840 mm/migrate.c:1007
Code: b8 00 00 00 00 00 fc ff df 41 80 7c 05 00 00 74 08 4c 89 e7 e8 73 2d fe ff 49 8b 34 24 48 c7 c7 00 8b 57 8c e8 d3 0b 53 ff 90 <0f> 0b 90 90 e9 0a fd ff ff e8 74 f6 93 ff 90 0f 0b 90 eb a7 e8 69
RSP: 0018:ffffc900045aeb30 EFLAGS: 00010246
RAX: d74fd979f2566d00 RBX: 0000000000000000 RCX: 0000000000080000
RDX: ffffc9000e489000 RSI: 000000000007ffff RDI: 0000000000080000
RBP: ffffea0000c98800 R08: ffffffff81829232 R09: 1ffff110170c4852
R10: dffffc0000000000 R11: ffffed10170c4853 R12: ffff8880612710a8
R13: 1ffff1100c24e215 R14: ffffffff8c839248 R15: ffff888061270f88
FS:  00007f855ea5e6c0(0000) GS:ffff888124f80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000008 CR3: 000000003477c000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 migrate_folio_move mm/migrate.c:1312 [inline]
 migrate_folios_move mm/migrate.c:1664 [inline]
 migrate_pages_batch+0x1e86/0x30b0 mm/migrate.c:1911
 migrate_pages_sync mm/migrate.c:1968 [inline]
 migrate_pages+0x24f8/0x3470 mm/migrate.c:2050
 compact_zone+0x365d/0x4dd0 mm/compaction.c:2689
 compact_node mm/compaction.c:2958 [inline]
 compact_nodes mm/compaction.c:2980 [inline]
 sysctl_compaction_handler+0x498/0x9a0 mm/compaction.c:3031
 proc_sys_call_handler+0x54b/0x820 fs/proc/proc_sysctl.c:601
 iter_file_splice_write+0xbdf/0x1530 fs/splice.c:738
 do_splice_from fs/splice.c:935 [inline]
 direct_splice_actor+0x11b/0x220 fs/splice.c:1158
 splice_direct_to_actor+0x595/0xc90 fs/splice.c:1102
 do_splice_direct_actor fs/splice.c:1201 [inline]
 do_splice_direct+0x281/0x3d0 fs/splice.c:1227
 do_sendfile+0x582/0x8d0 fs/read_write.c:1368
 __do_sys_sendfile64 fs/read_write.c:1423 [inline]
 __se_sys_sendfile64+0x102/0x1e0 fs/read_write.c:1415
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f855db8d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f855ea5e038 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007f855dda6080 RCX: 00007f855db8d169
RDX: 00002000000000c0 RSI: 0000000000000006 RDI: 0000000000000007
RBP: 00007f855dc0e990 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000009 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f855dda6080 R15: 00007ffe70b954f8
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
