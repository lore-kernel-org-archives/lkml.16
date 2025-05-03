Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B33883CC7
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 17:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746292113; cv=none; b=lzwsUKQ717297vblD7EGSBcOQNzji89e4SyIlr3NOaKNzxBn4E8jeAeJ+07U8VjyKJm2cMLSFl/KcESA8yK5v66wqKc4bmzl7BfJeQMZT/SC0xtFo+i+ImTQ8pSFQfP2AFCHBkukaujhrAcjIhHV+RwjTiqwHQG5SD/WSthl1bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746292113; c=relaxed/simple;
	bh=pD9eehmpVWpMruL4h/vCdvngzj3Ds9Oh3xggdahQITE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=V2HJI0zNaBWXWdiRZJRaJBo2jBXObu/l/FIk6SkIiLu5Wy3qXaHQn/holU3RhL4OKeWmJbWvKTib9cIb91+5DyBZ+j5O8N7izN45TeHalzXaFgpgFnasATs/2rXb3XzHswucxVMcFVj3X2/7VtqMAkvrvbD9/5orFpfaYC0kHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-86465e3f1c6so401165239f.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 10:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746292110; x=1746896910;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zm2p9gNHvGZBNicUPyCdXE99nGOc21eJHP7npsFiTP0=;
        b=i3WcRZOgx2poU01sA59s3WEeRfC+zuf4QNVHRb5vQrxLkrvOhbi+Hkr/3MiFrw9E6x
         jafqfUkdbWjf2uMFxPt6piymutVGX8x4dqjOq8m6Aa7vizdgtZJpQgu2he2Rwm8HKFzn
         z/Nafjx96/l5WGmSr1RMSgefCvVPWbq9If8tEG/Ld3T7Z96x/wLNfh1JMa7oIpjqmsKV
         NmRihzLbeiKf+vKS+CTCa5G52XbEPDeAoS/3lUkMoUTichdCdjHDDFbP/KpImUF0Tx84
         86FQqSbfZTWw/uJpHi0rA7ltwlG+lOQB5QQOokV6x3PYRopRtEMNxypmmOvTpYjAdn97
         sPPw==
X-Gm-Message-State: AOJu0YzIJ6qRKcoYASd9aFu7aYxIPJDE2+jwQHHzssg6W9z/VsoEBemX
	EyeVfoBYDi8TbefRWGnCo3m+FKMSnCVBMlgsk94jswJ29+T5tJuWukZCiPHNtYu41BESv2jreYR
	/lkHGMuOFodYQ5LlH4hJylymkyuLV6zKph9e30aVPv3byN7VrYJ3V/UK9WA==
X-Google-Smtp-Source: AGHT+IGGadKujtGYwYE5guN/patqBkmMEWeFMw1LB7z5zxe1SxMLXTrRP8lL00zbAziBp4NB4FjQPgoV/xLioXF4wY2ymGB6RI1p
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e8d:b0:3d9:3675:f531 with SMTP id
 e9e14a558f8ab-3d97ae710cbmr58098465ab.6.1746292110307; Sat, 03 May 2025
 10:08:30 -0700 (PDT)
Date: Sat, 03 May 2025 10:08:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68164d8e.050a0220.11da1b.0019.GAE@google.com>
Subject: [syzbot] [sound?] BUG: unable to handle kernel paging request in
 snd_pcm_format_set_silence (2)
From: syzbot <syzbot+32d4647f551007595173@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ca91b9500108 Merge tag 'v6.15-rc4-ksmbd-server-fixes' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15e8f374580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3c7669b03e3aef84
dashboard link: https://syzkaller.appspot.com/bug?extid=32d4647f551007595173
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=166a88d4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a18774580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/74ec1ffa5ea7/disk-ca91b950.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e357e48a5249/vmlinux-ca91b950.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c1f75a3b9a37/bzImage-ca91b950.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+32d4647f551007595173@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: ffffc9000cd2e000
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 1b400067 P4D 1b400067 PUD 1c2ff067 PMD 31ddb067 PTE 0
Oops: Oops: 0002 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 6904 Comm: syz-executor975 Not tainted 6.15.0-rc4-syzkaller-00021-gca91b9500108 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
RIP: 0010:memset_orig+0x33/0xb0 arch/x86/lib/memset_64.S:68
Code: 01 01 01 01 01 01 01 01 48 0f af c1 41 89 f9 41 83 e1 07 75 74 48 89 d1 48 c1 e9 06 74 39 66 0f 1f 84 00 00 00 00 00 48 ff c9 <48> 89 07 48 89 47 08 48 89 47 10 48 89 47 18 48 89 47 20 48 89 47
RSP: 0018:ffffc90003477b28 EFLAGS: 00010216
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000005b3f
RDX: 0000000000200000 RSI: 0000000000000000 RDI: ffffc9000cd2e000
RBP: 0000000000200000 R08: 0000000000000001 R09: 0000000000000000
R10: ffffc9000cc9b000 R11: 0000000000000000 R12: 0000000000100000
R13: ffffc9000cc9b000 R14: ffffffff8cb35e9c R15: 000000000000001c
FS:  000055558204d380(0000) GS:ffff888124aef000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc9000cd2e000 CR3: 00000000309d4000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 snd_pcm_format_set_silence+0x211/0x340 sound/core/pcm_misc.c:441
 snd_pcm_oss_change_params_locked+0x1eb4/0x3b40 sound/core/oss/pcm_oss.c:1078
 snd_pcm_oss_change_params sound/core/oss/pcm_oss.c:1105 [inline]
 snd_pcm_oss_make_ready+0xe6/0x1b0 sound/core/oss/pcm_oss.c:1164
 snd_pcm_oss_sync+0x1de/0x840 sound/core/oss/pcm_oss.c:1730
 snd_pcm_oss_release+0x28b/0x310 sound/core/oss/pcm_oss.c:2575
 __fput+0x3ff/0xb70 fs/file_table.c:465
 task_work_run+0x14d/0x240 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x27b/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xda/0x230 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa65d3ffbe9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcae655848 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007fa65d3ffbe9
RDX: 0000000000000000 RSI: 0000000000000008 RDI: 0000000000000002
RBP: 00000000000f4240 R08: 0000000000008000 R09: 0000000000008000
R10: 0000000000008000 R11: 0000000000000246 R12: 0000000000016f19
R13: 00007ffcae65586c R14: 00007ffcae655880 R15: 00007ffcae655870
 </TASK>
Modules linked in:
CR2: ffffc9000cd2e000
---[ end trace 0000000000000000 ]---
RIP: 0010:memset_orig+0x33/0xb0 arch/x86/lib/memset_64.S:68
Code: 01 01 01 01 01 01 01 01 48 0f af c1 41 89 f9 41 83 e1 07 75 74 48 89 d1 48 c1 e9 06 74 39 66 0f 1f 84 00 00 00 00 00 48 ff c9 <48> 89 07 48 89 47 08 48 89 47 10 48 89 47 18 48 89 47 20 48 89 47
RSP: 0018:ffffc90003477b28 EFLAGS: 00010216
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000005b3f
RDX: 0000000000200000 RSI: 0000000000000000 RDI: ffffc9000cd2e000
RBP: 0000000000200000 R08: 0000000000000001 R09: 0000000000000000
R10: ffffc9000cc9b000 R11: 0000000000000000 R12: 0000000000100000
R13: ffffc9000cc9b000 R14: ffffffff8cb35e9c R15: 000000000000001c
FS:  000055558204d380(0000) GS:ffff888124aef000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffc9000cd2e000 CR3: 00000000309d4000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	01 01                	add    %eax,(%rcx)
   2:	01 01                	add    %eax,(%rcx)
   4:	01 01                	add    %eax,(%rcx)
   6:	01 01                	add    %eax,(%rcx)
   8:	48 0f af c1          	imul   %rcx,%rax
   c:	41 89 f9             	mov    %edi,%r9d
   f:	41 83 e1 07          	and    $0x7,%r9d
  13:	75 74                	jne    0x89
  15:	48 89 d1             	mov    %rdx,%rcx
  18:	48 c1 e9 06          	shr    $0x6,%rcx
  1c:	74 39                	je     0x57
  1e:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  25:	00 00
  27:	48 ff c9             	dec    %rcx
* 2a:	48 89 07             	mov    %rax,(%rdi) <-- trapping instruction
  2d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  31:	48 89 47 10          	mov    %rax,0x10(%rdi)
  35:	48 89 47 18          	mov    %rax,0x18(%rdi)
  39:	48 89 47 20          	mov    %rax,0x20(%rdi)
  3d:	48                   	rex.W
  3e:	89                   	.byte 0x89
  3f:	47                   	rex.RXB


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
