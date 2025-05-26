Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0951ACEDE
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748257415; cv=none; b=Adbu3K7xq+adAy8E/ml5YVRJOtXMB44vaoGSn5r2YdJNe6ctGcYjPwG8YoSQozGxndlcizZ1KbzSR9KhXPr55PLEjfY9hu0lnDOWGFjc6CNxFAlCdTwGcMlJ/qDY/phmZKdpX7Dh7MbZe0GR1pxlQdLixUXQ7Lb2uhPiG9eYIMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748257415; c=relaxed/simple;
	bh=CBVeeS7glTvQC6dmqIUuLX52H6+6ul0PpYPDRtu9H5o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZKgIsF2kWsXhD6+atWRcy34gSSbtqN14fAdjGXg944syrwZhvd1RecK4oZli7tcbE5eSsY6BRZt8BbD393XlVAJuA7/g+KWTMeMAKfdejdunuKLk8xYvPWJ1got9P/JdoqV83Qrk7FZlrKUE5ytic3+02rhNnoU8dTUHrMWj3hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-85e7551197bso190420739f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 04:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748257412; x=1748862212;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DzlRudKs0/WU7tTKrz28vGcAaYQuWRxm9c4GmJrMWnk=;
        b=p3/57V3TSffFMtaF7adeC5SAROOzIyNOZye5ToNphXI7J2nwGDp5KUniHoRjPhx+j2
         LLh5HuU8K/tLXFkS8pHoPHIu6WABdd1L74+pJILoa5olwYOcZhCgXXGKKgiOiDVNUmh0
         0yAGDTDjoNazKzrUTHd4NavBhWzC4UIkIGLLEWaDmeSQV8U23EaSLRy2SV5+FTtpv5av
         Mz8XoYBhyNdrxJtgPaLxYWNUanO61jqPcjjlUbv3+ND5xm/l3rQMvJDTaFbfq5OvOnxH
         tuBIMldoYAS/gOJY9oKrsrsOKt+U/hjo4ROBjPTGFh9VxCFX/IpXXu0M6dpWlxakT+hy
         AObw==
X-Forwarded-Encrypted: i=1; AJvYcCWqiu+zdikjHt7FnMFS8hef61XddrUf5e1XlLMJpdyh45+K9Mr/k3qJ6FCdooxH0/vTN+gKXte9VchFuPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPWeWCLYslpjsCpAP/Ckw0q0zhDXYjiz/kXYnNDoKJU0qrf91/
	/ortNgFljWjBXOLqYj9O1LbNIz1HBWVc04SRodEkbhDMoQ9H/XSBELfVRlZr8kj4VJClLp3zDDb
	okWk3qWyes7JX71rGwmWKkNw7dG9OKNM+hUux9GxqnF+a1tilNOaktOiWwyc=
X-Google-Smtp-Source: AGHT+IESvahhBxYUK9kRHcmEf6chOXuOS2AtMtb4+uPOpNRysMHCWuXScZAprAKKIQ6yhYcGGSOCY7DZ1CsfZhaANaB/vwzRmW7k
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6d17:b0:85b:3ae9:da01 with SMTP id
 ca18e2360f4ac-86cadd5ffbcmr1098803539f.4.1748257412437; Mon, 26 May 2025
 04:03:32 -0700 (PDT)
Date: Mon, 26 May 2025 04:03:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68344a84.a70a0220.1765ec.0166.GAE@google.com>
Subject: [syzbot] [gfs2?] KASAN: null-ptr-deref Read in gfs2_drop_inode
From: syzbot <syzbot+b12826218502df019f9d@syzkaller.appspotmail.com>
To: agruenba@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    176e917e010c Add linux-next specific files for 20250523
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=135065f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e7902c752bef748
dashboard link: https://syzkaller.appspot.com/bug?extid=b12826218502df019f9d
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=151759f4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16b9c5f4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5f7692c642fa/disk-176e917e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/057a442d42d0/vmlinux-176e917e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8f8ebdb4dd96/bzImage-176e917e.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/0e694bf0a04e/mount_0.gz
  fsck result: OK (log: https://syzkaller.appspot.com/x/fsck.log?x=16e42170580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b12826218502df019f9d@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: null-ptr-deref in instrument_atomic_read include/linux/instrumented.h:68 [inline]
BUG: KASAN: null-ptr-deref in _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
BUG: KASAN: null-ptr-deref in gfs2_drop_inode+0x20c/0x3a0 fs/gfs2/super.c:1052
Read of size 8 at addr 00000000000000a8 by task syz-executor628/5863

CPU: 0 UID: 0 PID: 5863 Comm: syz-executor628 Not tainted 6.15.0-rc7-next-20250523-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x2b0/0x2c0 mm/kasan/generic.c:189
 instrument_atomic_read include/linux/instrumented.h:68 [inline]
 _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
 gfs2_drop_inode+0x20c/0x3a0 fs/gfs2/super.c:1052
 iput_final fs/inode.c:1868 [inline]
 iput+0x45d/0x9d0 fs/inode.c:1924
 gfs2_fill_super+0x1418/0x2010 fs/gfs2/ops_fstype.c:1314
 get_tree_bdev_flags+0x40b/0x4d0 fs/super.c:1679
 gfs2_get_tree+0x51/0x1e0 fs/gfs2/ops_fstype.c:1333
 vfs_get_tree+0x92/0x2b0 fs/super.c:1802
 do_new_mount+0x24a/0xa40 fs/namespace.c:3869
 do_mount fs/namespace.c:4206 [inline]
 __do_sys_mount fs/namespace.c:4417 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4394
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f219bad284a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 6e 07 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdb657b2f8 EFLAGS: 00000282 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f219bad284a
RDX: 0000200000021140 RSI: 0000200000021180 RDI: 00007ffdb657b350
RBP: 0000000000000004 R08: 00007ffdb657b390 R09: 0000000000021135
R10: 0000000000000000 R11: 0000000000000282 R12: 0000000001000000
R13: 00007ffdb657b390 R14: 0000200000021180 R15: 0000000000000003
 </TASK>
==================================================================


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
