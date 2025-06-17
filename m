Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EA41B85FD
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750147294; cv=none; b=ZkkZ7doEWs3/lgHoZpz1BEREXVnfSrYkw0LRo0/tOCgdNiBmcr9JfLIWxhhj3gxt/MRKvOVCIWTuzAcBqRUU/QBRH8AuQ6Vvu0kbQmGeUgGUGbrBtfw9vywb3QDnrgaLWMCoC6+0mITxAuHhTxOeZFZWdRuExAWWDRJG/KUpJSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750147294; c=relaxed/simple;
	bh=FYncf0Gwp1uLRRk+uYgc+h7nkTLVop02HHpfWbUpAT0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=G8EniW9vDXVwXuIFcAOQDuTA1rq5frvg8qV/7iYnAw1DSJpe0RZ1cMTLXU2P2Dc1hzTNQ+QkGePlIdRm2sfH84sMtYTtKUmE64JXZICSOwj+5qV0j5dVim0p/0JKPtg+c7kREFXrb/tM4nthxmvhNMB+4VK//UU4/be5P1X1jZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ddc0a6d4bdso68513765ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750147288; x=1750752088;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e29NjVcmLgFlgix8gs7SJOTwD7u9KXoV23o2ubJcggQ=;
        b=pOTW3+KuGqtHDKiapmhCmJwwpZnNjmgzg+yGWmV6uON0Vhd95MqVFlCcPAiJ2/O4HP
         PJPOLtZHtYET2Rx/XD8lWcKE0DEbkFZu+3XfMtFktlENKoKmRYasHG1PTxxcUP1Rgwey
         ZpHEZIjhRXy7LneU4t0hWTTYjwnU7Q38szMTiz4qHKtwDP6smcmjqw3halQrnRmTy97X
         Z1U4vM2aV5kpLLTnMhFcE+1sA8FLeaY0gHXrs6Sop3kGD+vXtFj4VDALLoCv4wKvZHKT
         aOjgy2s6EEXvKZh3pTMu14g0vO0mlxqZc/D0jwnmcOTRqSpy/JzpI5ucnc6iBgdm+ThE
         pxXw==
X-Forwarded-Encrypted: i=1; AJvYcCUvkkh/uRt3SVZ6VWJJhhzky8zVapbjIvUO+z7B6YhD1MrtmD7UXRO9rlaK1bZrWOhf11xanL3/yn00SMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK5ntTYiDUbYpvQePTHRPHQj5nSvZ7MYAibmlW6rMDvIs/ezdh
	RMVJXCwAoVluw10gwxClh5j2aB1qj91nOg9wZbksUMN/4dllCxuOfA/9LsLJnH+rE2HcTsbGiGH
	TfujFBKW/z2NKiHod94ywXLw9JnkPLsIq71mtia0NjPJOGMAfvTobW+Gtdjc=
X-Google-Smtp-Source: AGHT+IGEtTFqUZrc9jB73llRLoLcKYQbUn9ikYxSRc2hqlSQIm2PIZkBrEGpFh2tgRG1FMUZ5DzaJF874DDr6cZkYJQOSxAIJCMN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a68:b0:3dc:7bc9:503e with SMTP id
 e9e14a558f8ab-3de07cdb455mr138915935ab.2.1750147288407; Tue, 17 Jun 2025
 01:01:28 -0700 (PDT)
Date: Tue, 17 Jun 2025 01:01:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685120d8.a70a0220.395abc.0204.GAE@google.com>
Subject: [syzbot] [ntfs3?] general protection fault in pick_link (2)
From: syzbot <syzbot+1aa90f0eb1fc3e77d969@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9afe652958c3 Merge tag 'x86_urgent_for_6.16-rc3' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10cf95d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d11f52d3049c3790
dashboard link: https://syzkaller.appspot.com/bug?extid=1aa90f0eb1fc3e77d969
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11969e82580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14fd450c580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-9afe6529.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/46695f4e5fdb/vmlinux-9afe6529.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4357674be01a/bzImage-9afe6529.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/dd817d4f3932/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1aa90f0eb1fc3e77d969@syzkaller.appspotmail.com

ntfs3(loop0): ino=1b, "file0" ntfs_rename
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 5313 Comm: syz-executor352 Not tainted 6.16.0-rc2-syzkaller-00024-g9afe652958c3 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:pick_link+0x4f1/0xe80 fs/namei.c:1949
Code: 4c 89 f7 e8 81 fa ea ff 4d 8b 36 4d 85 f6 0f 84 9b 00 00 00 e8 50 7c 87 ff 49 bf 00 00 00 00 00 fc ff df 4c 89 f0 48 c1 e8 03 <42> 0f b6 04 38 84 c0 0f 85 b9 06 00 00 41 0f b6 2e bf 2f 00 00 00
RSP: 0018:ffffc9000d2477e8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffffc9000d247908 RCX: ffff88801a34c880
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff823d3d98
R10: 000000003b9aca00 R11: ffffffff823cb0a0 R12: 1ffff92001a48f8b
R13: ffffc9000d247c20 R14: 0000000000000002 R15: dffffc0000000000
FS:  00005555725f0380(0000) GS:ffff88808d251000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4a1afaf000 CR3: 00000000438a8000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 step_into+0xc5d/0xf30 fs/namei.c:2008
 open_last_lookups fs/namei.c:3843 [inline]
 path_openat+0x1bc6/0x3830 fs/namei.c:4052
 do_filp_open+0x1fa/0x410 fs/namei.c:4082
 do_sys_openat2+0x121/0x1c0 fs/open.c:1437
 do_sys_open fs/open.c:1452 [inline]
 __do_sys_open fs/open.c:1460 [inline]
 __se_sys_open fs/open.c:1456 [inline]
 __x64_sys_open+0x11e/0x150 fs/open.c:1456
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5aa2adeed9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc2e7cf7e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00007f5aa2b47ac0 RCX: 00007f5aa2adeed9
RDX: 0000000000000000 RSI: 0000000000048500 RDI: 0000200000000a80
RBP: 0000200000001240 R08: 00005555725f14c0 R09: 00005555725f14c0
R10: 00005555725f14c0 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc2e7cfa38 R14: 431bde82d7b634db R15: 00007f5aa2b2803b
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:pick_link+0x4f1/0xe80 fs/namei.c:1949
Code: 4c 89 f7 e8 81 fa ea ff 4d 8b 36 4d 85 f6 0f 84 9b 00 00 00 e8 50 7c 87 ff 49 bf 00 00 00 00 00 fc ff df 4c 89 f0 48 c1 e8 03 <42> 0f b6 04 38 84 c0 0f 85 b9 06 00 00 41 0f b6 2e bf 2f 00 00 00
RSP: 0018:ffffc9000d2477e8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffffc9000d247908 RCX: ffff88801a34c880
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff823d3d98
R10: 000000003b9aca00 R11: ffffffff823cb0a0 R12: 1ffff92001a48f8b
R13: ffffc9000d247c20 R14: 0000000000000002 R15: dffffc0000000000
FS:  00005555725f0380(0000) GS:ffff88808d251000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055ff6c3df070 CR3: 00000000438a8000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	4c 89 f7             	mov    %r14,%rdi
   3:	e8 81 fa ea ff       	call   0xffeafa89
   8:	4d 8b 36             	mov    (%r14),%r14
   b:	4d 85 f6             	test   %r14,%r14
   e:	0f 84 9b 00 00 00    	je     0xaf
  14:	e8 50 7c 87 ff       	call   0xff877c69
  19:	49 bf 00 00 00 00 00 	movabs $0xdffffc0000000000,%r15
  20:	fc ff df
  23:	4c 89 f0             	mov    %r14,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	0f 85 b9 06 00 00    	jne    0x6f0
  37:	41 0f b6 2e          	movzbl (%r14),%ebp
  3b:	bf 2f 00 00 00       	mov    $0x2f,%edi


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
