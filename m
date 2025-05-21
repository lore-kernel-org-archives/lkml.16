Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948FC2D613
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833102; cv=none; b=d8XMeM+X/gkEHrBVUgxjUuPRrOyL85oY/HtKOyp6dYgq0aofdabEzPuDMnOfatphhLGWCNX6Cmtqz0P7FguYgTBtNbWK+/0PkMAnYqEOH5uXNpjE1aEj2zhqtvhjPqcBIybwy098WfwmioDZAdGZaDh6LL2HmDXEOC6rSFMsC+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833102; c=relaxed/simple;
	bh=lhh1hYn0GhJBl3MQiuJ3ZgVJnZubB815syL/zJ6kNZI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=l++QU+yaJzVZr/DjX7NJW1ttRr6HUXff39lGkeBY0W9BsiMkGU3MBJ5qxvUn2DhQjx2EmxXkIfSfOBqBcUaXGDg524ZgvSTn77dwmi3ZFiWMYh8ILLiwZD5u09vkRlCjpZa3jL1fHcPp0NbSBwU9bP/zQiA0JjdUFHcyJUZah/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-85b402f69d4so718927339f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747833099; x=1748437899;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IrTK+l8Aj/pA31DELUnnqfEV2uIT+e3shglXW6nnXRA=;
        b=F24ddo1vq6FK3ziEHw1IM5S40xln3gNw0MWS0J57jkfumvjLqDMtw0z8biteuz3B+o
         yEiSrY4nr1LNChBRzitjCGUQutWtz/UDVxZ+JbXZzxJdGwNhS5uFOIJJaau2kYd5UzAe
         e7gRfObcXY9sBZrGHqevnxRceMu+uVI96B9A4XeOe5r9PD3sGdS+f5g6hH6n6ekWl3+k
         ONbaIK/4isF8JvDBCdV/CUrOaU+IyQMwX5yW/+MajGztPEiItb/k9UpynXEF4u22hWTh
         iXwu6Uo7CNiqEUs3qZuDtQP9oDn5rlaANbzVVQJRNUsHdYlh6UpRnyw6RWaDAwQ7KN8l
         fwQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcteY30G+RAGxkXdiGFkJDVAphX7uYz3bzh/IeH0Asu5eXOFpFeKWOdSd+PL5mDNa83fQ2n6DFPvqdKdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP5LZzIC89xKW7lDXqR6A7UOBwSaZKBD+aBLbZn8jH8gv1qfhP
	pItZsjDbJRMTIxE7qU395kOm+b69uGEKi5/EA/qhGfrCwmADCRaG0dk2FF9a8T9/3QPxI3XY35R
	+0qTDnfrRrmZDgHx9WBw/HtRrgPlEuX/nrY1Om0vUJdIlV3xYATAbvuJEsFQ=
X-Google-Smtp-Source: AGHT+IGpINRHIv5Qt32rieZ9qoCXjUUE4pZkVobeBJhF3H1pMQxen0t2kAFPSkvY9JyRo5WLjfqN1vyRWgobXOcnOqcEdVNC73SN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3589:b0:864:a1fe:1e41 with SMTP id
 ca18e2360f4ac-86a24cdd7a1mr2812239139f.13.1747833099708; Wed, 21 May 2025
 06:11:39 -0700 (PDT)
Date: Wed, 21 May 2025 06:11:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682dd10b.a00a0220.29bc26.028e.GAE@google.com>
Subject: [syzbot] [bpf?] WARNING in bpf_check (4)
From: syzbot <syzbot+0ef84a7bdf5301d4cbec@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, haoluo@google.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@linux.dev, sdf@fomichev.me, 
	song@kernel.org, syzkaller-bugs@googlegroups.com, yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    172a9d94339c Merge tag '6.15-rc6-smb3-client-fixes' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11d15ef4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4f080d149583fe67
dashboard link: https://syzkaller.appspot.com/bug?extid=0ef84a7bdf5301d4cbec
compiler:       arm-linux-gnueabi-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=130462d4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14efaef4580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98a89b9f34e4/non_bootable_disk-172a9d94.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/88f3b6a8815a/vmlinux-172a9d94.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8835063aa13d/zImage-172a9d94.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0ef84a7bdf5301d4cbec@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 3102 at kernel/bpf/verifier.c:20723 opt_subreg_zext_lo32_rnd_hi32 kernel/bpf/verifier.c:20723 [inline]
WARNING: CPU: 1 PID: 3102 at kernel/bpf/verifier.c:20723 bpf_check+0x2d58/0x2ed4 kernel/bpf/verifier.c:24078
Modules linked in:
Kernel panic - not syncing: kernel: panic_on_warn set ...
CPU: 1 UID: 0 PID: 3102 Comm: syz-executor107 Not tainted 6.15.0-rc6-syzkaller #0 PREEMPT 
Hardware name: ARM-Versatile Express
Call trace: 
[<802019e4>] (dump_backtrace) from [<80201ae0>] (show_stack+0x18/0x1c arch/arm/kernel/traps.c:257)
 r7:00000000 r6:828227fc r5:00000000 r4:82257e84
[<80201ac8>] (show_stack) from [<8021ff7c>] (__dump_stack lib/dump_stack.c:94 [inline])
[<80201ac8>] (show_stack) from [<8021ff7c>] (dump_stack_lvl+0x54/0x7c lib/dump_stack.c:120)
[<8021ff28>] (dump_stack_lvl) from [<8021ffbc>] (dump_stack+0x18/0x1c lib/dump_stack.c:129)
 r5:00000000 r4:82a70d4c
[<8021ffa4>] (dump_stack) from [<802025f8>] (panic+0x120/0x374 kernel/panic.c:354)
[<802024d8>] (panic) from [<802619e8>] (check_panic_on_warn kernel/panic.c:243 [inline])
[<802024d8>] (panic) from [<802619e8>] (get_taint+0x0/0x1c kernel/panic.c:238)
 r3:8280c604 r2:00000001 r1:8223ea4c r0:8224654c
 r7:804020d0
[<80261974>] (check_panic_on_warn) from [<80261b4c>] (__warn+0x80/0x188 kernel/panic.c:749)
[<80261acc>] (__warn) from [<80261dcc>] (warn_slowpath_fmt+0x178/0x1f4 kernel/panic.c:776)
 r8:00000009 r7:8225e3a4 r6:df989c44 r5:844f0000 r4:00000000
[<80261c58>] (warn_slowpath_fmt) from [<804020d0>] (opt_subreg_zext_lo32_rnd_hi32 kernel/bpf/verifier.c:20723 [inline])
[<80261c58>] (warn_slowpath_fmt) from [<804020d0>] (bpf_check+0x2d58/0x2ed4 kernel/bpf/verifier.c:24078)
 r10:00000002 r9:84850000 r8:00000004 r7:00000002 r6:00000003 r5:000000c3
 r4:ffffffff
[<803ff378>] (bpf_check) from [<803d66d0>] (bpf_prog_load+0x68c/0xc20 kernel/bpf/syscall.c:2971)
 r10:844f0000 r9:842a6f30 r8:00000048 r7:df989d90 r6:00000000 r5:00000000
 r4:df989ec0
[<803d6044>] (bpf_prog_load) from [<803d7e24>] (__sys_bpf+0x578/0x1fd0 kernel/bpf/syscall.c:5834)
 r10:b5403587 r9:2000e000 r8:00000000 r7:00000000 r6:00000005 r5:df989e90
 r4:00000048
[<803d78ac>] (__sys_bpf) from [<803d9e1c>] (__do_sys_bpf kernel/bpf/syscall.c:5941 [inline])
[<803d78ac>] (__sys_bpf) from [<803d9e1c>] (sys_bpf+0x2c/0x48 kernel/bpf/syscall.c:5939)
 r10:00000182 r9:844f0000 r8:8020029c r7:00000182 r6:0008e048 r5:00000000
 r4:ffffffff
[<803d9df0>] (sys_bpf) from [<80200060>] (ret_fast_syscall+0x0/0x1c arch/arm/mm/proc-v7.S:67)
Exception stack(0xdf989fa8 to 0xdf989ff0)
9fa0:                   ffffffff 00000000 00000005 2000e000 00000048 00000000
9fc0: ffffffff 00000000 0008e048 00000182 00000002 0000fd90 000f4240 00000000
9fe0: 7ebc8c70 7ebc8c60 000106bc 0002e810
Rebooting in 86400 seconds..


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
