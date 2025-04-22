Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C735527CB1F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323890; cv=none; b=KUbwfJhfRrooS/MuEsILGt7FLwhV2jNba8poZAUDxEJQnCbw5AfogGckGmCW08RypYJKna5ANk1hOGhy2y+KRJQ630pb4nCuHPlHl0nDoQMlN0L0df1AJHXpurK6/+URn9JZlxj6EWlUXuJPB03MJcaK9ycc4YBqKsn7+OAf3Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323890; c=relaxed/simple;
	bh=v+QGk9aZpsAsGScTaJ03a6+SiReqDBbzR8DgGCECRiM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DXt4t4S8h1hiVEawBQvrPgBK+tLTZZ1tX+doLY5fqOhBJseQv9B1IYd/6SSjJmdAajE9R0TGQOp+02FeShmYEKZnAEBU3CWedgWg7761N1PIAxsHcmowEGzivQ2nU59fJeGIkSuw0PpwgO1B/My9goviKutUwcJCbF+9ABaH/ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d81d99e4e6so43656215ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745323888; x=1745928688;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=msWtidcZBgXXJ+183U0Y5v1GiY5Yg9JwQ4JAAakzZbI=;
        b=AbxP9Dn2dj0bEKY1ZGr36X5gAmehQ7o4S1KSY0Ub1bRy0BJkjVv+hGFPZl2WnmAIZC
         yRIpwYjb1F0yYU+LEbYJL7AENMMjkRDj7jiSMLfHIH60xGhRPmjpHxbFE1sDz1pIL70p
         g9eLhDSOUc6B4mmEyMDuiVRrVNGzgWLe0iOsugrAALRy0S1OihfScihqoQjNkGNGyS5E
         9DCt2RtcqqTWvtOm4cSfXaaIHfPzwW5wD38cF0DDkZcvw324RqtGlasxdL/U0QEI/ILL
         slxusWegiFzTLuMKuUVC4D04cA612+WazPij27YJRJnXWw6zbMKOZoZnF/94EnOWSfdj
         BQ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgza9MsDDdCoer6mQCenyTptHDI+t64IWcBYQJLwkzJB/GgALWLfSQ+5uauqEmRY1wdx50s/Vt94lxZa4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWc6Pd0MCDiDqXmGoGcnAfGpNQwD7Idqjf9608wykx9Svh/cME
	nfKqzwiZrtuWahf9OqimSYPFoCdH4WqhWM0TttMAMGrPtzby08cEgVQpp4g3rsmfTud0QkqR32l
	zYXv9IRnclJ4DT0g1+5L3ND7C2ycu1V72W8CI0yHfZqlvEcrUp4tkg00=
X-Google-Smtp-Source: AGHT+IEMFb8JU/M7kVuJoJS8TIxiLrbjAhQDbP3f3uGhmZLC41LA0ZmwIkm5GudqZ0a7Imt9SF7LapTDu37yzsZXoBtStblPMwSL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4417:10b0:3d9:24d8:8d4f with SMTP id
 e9e14a558f8ab-3d924d88fb1mr4028095ab.16.1745323887958; Tue, 22 Apr 2025
 05:11:27 -0700 (PDT)
Date: Tue, 22 Apr 2025 05:11:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6807876f.050a0220.8500a.000f.GAE@google.com>
Subject: [syzbot] [fs?] KCSAN: data-race in choose_mountpoint_rcu / umount_tree
From: syzbot <syzbot+81fdaf0f522d5c5e41fb@syzkaller.appspotmail.com>
To: brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a33b5a08cbbd Merge tag 'sched_ext-for-6.15-rc3-fixes' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1058f26f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85dd0f8b81b9d41f
dashboard link: https://syzkaller.appspot.com/bug?extid=81fdaf0f522d5c5e41fb
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/718e6f7bde0a/disk-a33b5a08.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/20f5e402fb15/vmlinux-a33b5a08.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2dd06e277fc7/bzImage-a33b5a08.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+81fdaf0f522d5c5e41fb@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in choose_mountpoint_rcu / umount_tree

write to 0xffff888108512d98 of 8 bytes by task 21705 on cpu 1:
 unhash_mnt fs/namespace.c:1050 [inline]
 umount_mnt fs/namespace.c:1064 [inline]
 umount_tree+0x6f0/0xb10 fs/namespace.c:1922
 do_umount fs/namespace.c:-1 [inline]
 path_umount+0x9c1/0xa40 fs/namespace.c:2144
 ksys_umount fs/namespace.c:2167 [inline]
 __do_sys_umount fs/namespace.c:2172 [inline]
 __se_sys_umount fs/namespace.c:2170 [inline]
 __x64_sys_umount+0xb7/0xe0 fs/namespace.c:2170
 x64_sys_call+0x2883/0x2e10 arch/x86/include/generated/asm/syscalls_64.h:167
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0x1a0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff888108512d98 of 8 bytes by task 21704 on cpu 0:
 choose_mountpoint_rcu+0x3d/0x130 fs/namei.c:1386
 follow_dotdot_rcu fs/namei.c:2020 [inline]
 handle_dots+0x559/0x790 fs/namei.c:2095
 walk_component fs/namei.c:2132 [inline]
 link_path_walk+0x5f6/0x840 fs/namei.c:2503
 path_lookupat+0x6c/0x2a0 fs/namei.c:2659
 filename_lookup+0x14b/0x340 fs/namei.c:2689
 filename_setxattr+0x59/0x2b0 fs/xattr.c:660
 path_setxattrat+0x28a/0x320 fs/xattr.c:713
 __do_sys_setxattr fs/xattr.c:747 [inline]
 __se_sys_setxattr fs/xattr.c:743 [inline]
 __x64_sys_setxattr+0x6e/0x90 fs/xattr.c:743
 x64_sys_call+0x28e7/0x2e10 arch/x86/include/generated/asm/syscalls_64.h:189
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0x1a0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

value changed: 0xffff888116147cc0 -> 0xffff8881065c23c0

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 21704 Comm: syz.6.5865 Not tainted 6.15.0-rc3-syzkaller-00008-ga33b5a08cbbd #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
==================================================================


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
