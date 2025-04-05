Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A10111BF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 07:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743838589; cv=none; b=hsy0aanFeHZZafp20TE4OmDdD6cPp70285eC7gl4HARZLSgt9ulHX52QRyv6vMt4qX895cZCitRjarlqLspSMNxZy5OjGmRfJFAyxtKlpy3u0Lgkm5wxGPZRZFizcKdD1Rx7kfOsCv+0tmWANcEMVdEwkdABi4BYw1IZgNaJmO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743838589; c=relaxed/simple;
	bh=5VJ8xgJipaVSEHLn9ulv2z4DQjA3azRtgAV0f1b1q/o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=geZKpJI0VZluR54L/JrSHlPV+6o6zg1wpEag9h1Ns82JrdXyR7rzL/CAHKHEnWX2rzLyDnOlhtTjroN+WrkSHNUckyhyQdt+veLYYjtsw8HnFQi2xF8HeNKYJvHhSSz9HNsgPG5SpqKXBQlOXgHDsxaKVbf0FApaFH4Gy9yfMoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d43d333855so25269415ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 00:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743838586; x=1744443386;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYdqOKBhO4Y7x/Q9Fwh+sEk7DN7IEzXW2QV85ZrostY=;
        b=J/7hRPk9u+zM21c9JcILIL2/mjXdMsw7Lu34iGTDM62RT5Uw+rrODEYokZ5iyzF+qu
         /p/NLE6bALThZDDrJ2GjeixkP8S1kX6OcmApIfm8ww1r+d37dh3veLMKFD4O+SQnLxBL
         xir5rrbBRtf4SgnhlAy/ywmqfWXtKkSddbZmiZjYyojBmipUrOWo07+lv6jSEHKj4afC
         bcGWKNp8U18Y6v7jefLaReXzqEEpxVnWRchHxqV0z2qj0xgXH+wUu2YYtO+lw8veCDwC
         q3S/6/UpNKYvDsvi2LeTa285Rj+ciU+3qG3TTO8pvpNJL7lF7Hez9r/vqgtiLXio4Tmx
         du5g==
X-Gm-Message-State: AOJu0Yz1DYowDzXERRdWfywRJwdka5QTTvndFccHsy8WNrHuRLhSD/jF
	m4lGjx4iewq8rnhxzpf+cDorIJzRXdh4hyWHtcRJiRJCw5PzcQzHTeO5rXFVuaVWdPyUSHE29in
	zHTjlfTzzx2YYqz6OGpGLRzAbK59AcPREx6/hN9k/zZnTpqpArXHL+onSZg==
X-Google-Smtp-Source: AGHT+IHG/QT7SwrpCdY173BXAt35jTs+xqLIW7NkdioBxsaePLV8xWPiqets58ebi0zrJaLiQhyRA1P4Y8dauq9PFwnYwPQ/nVv2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a4d:b0:3d3:fdb8:1799 with SMTP id
 e9e14a558f8ab-3d6ec590c21mr24114215ab.22.1743838586662; Sat, 05 Apr 2025
 00:36:26 -0700 (PDT)
Date: Sat, 05 Apr 2025 00:36:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f0dd7a.050a0220.0a13.0230.GAE@google.com>
Subject: [syzbot] [squashfs?] UBSAN: shift-out-of-bounds in squashfs_bio_read
From: syzbot <syzbot+65761fc25a137b9c8c6e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, phillip@squashfs.org.uk, 
	squashfs-devel@lists.sourceforge.net, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    609706855d90 Merge tag 'trace-latency-v6.15-3' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12a88fb0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f8721be6a767792
dashboard link: https://syzkaller.appspot.com/bug?extid=65761fc25a137b9c8c6e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/48bd65025d89/disk-60970685.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/332202d68035/vmlinux-60970685.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1c4aa49d3e14/bzImage-60970685.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+65761fc25a137b9c8c6e@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 8
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in fs/squashfs/block.c:195:36
shift exponent 64 is too large for 64-bit type 'u64' (aka 'unsigned long long')
CPU: 0 UID: 0 PID: 6373 Comm: syz.0.109 Not tainted 6.14.0-syzkaller-11125-g609706855d90 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_shift_out_of_bounds+0x3c8/0x420 lib/ubsan.c:492
 squashfs_bio_read+0x1050/0x1180 fs/squashfs/block.c:195
 squashfs_read_data+0x2e7/0xba0 fs/squashfs/block.c:333
 squashfs_read_table+0x338/0x390 fs/squashfs/cache.c:436
 squashfs_fill_super+0x238/0x21e0 fs/squashfs/super.c:216
 get_tree_bdev_flags+0x492/0x5c0 fs/super.c:1636
 vfs_get_tree+0x92/0x2b0 fs/super.c:1759
 do_new_mount+0x2cf/0xb70 fs/namespace.c:3878
 do_mount fs/namespace.c:4218 [inline]
 __do_sys_mount fs/namespace.c:4429 [inline]
 __se_sys_mount+0x38c/0x400 fs/namespace.c:4406
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f229398e90a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2294866e68 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f2294866ef0 RCX: 00007f229398e90a
RDX: 0000200000000040 RSI: 0000200000000240 RDI: 00007f2294866eb0
RBP: 0000200000000040 R08: 00007f2294866ef0 R09: 0000000000210c00
R10: 0000000000210c00 R11: 0000000000000246 R12: 0000200000000240
R13: 00007f2294866eb0 R14: 00000000000001ad R15: 0000200000001480
 </TASK>
---[ end trace ]---


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
