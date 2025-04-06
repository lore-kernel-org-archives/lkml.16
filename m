Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6CD33E4
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 00:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743898594; cv=none; b=Wq8k1cKX6ri90iimp28FpkeRZq34s3P73bazvZFeXBuoWVHYCOXaJL16HxcxzYJmK6spu8C/yr2BLPmd3xco1dOPZkDZPIV009SK8M2IqTrp6OZkUvtekNmb7n2LgEw9xGcdexIYKHeW+k5wEYXdEyJxUDBz2EbBYE7EzeoU/0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743898594; c=relaxed/simple;
	bh=YMBWOwgtZ2Olz6ieCT6e8anfpksmxkGjcYU5a4YAnBM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DLttDQ1k+9/fzlYcYJp85S6b/DjNAZM9DoYlmJmz+Zk8wvn8f9p7ggsbgLg969T0KUiRaT4tjV2CyiHyhRRMua1AI3pxA5hRud84xsjcnTvKYz6bv+nGLrSOim2LQw5yiKC9k8QmjaRA1cSZ9z7ERL16kcF9+l86qbWzyvgC0dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d6c613bd79so34776415ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 17:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743898591; x=1744503391;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8fv3R+oS9w0q7qzp6DbGGfEsM+2K+8Plh5Y77NHX8tg=;
        b=unzNUWCHPtl9o+LUIcQkEPRIEW4YdVP3BdoDrjzrHTtg+TCqId74YessHD+bBvoFvH
         kDh4JEUMKO1FFayIwgFtH8TB67DKU/w7q0V5XSTWYBK/Rah4GLQCzHFGG8GzaaYFZBeg
         JOBNAEr+Np97PaTLNLkcMnKcdXjcuYSv2WqIM3Aui7dOam4WC6aRay622ZayDf/5Qjfo
         r3uuoVhM1xXb6Ra01lRvss7gOpGsoPzEex9eWT9mtVNR61dm/X/A5uhTmFqBfkFtkH44
         A1MKxk+aRRbXaFNvhVtbaSJCCdW3MwFXAkn+SxlO2JW+l4CTfMBt80tvr8eopKZUnJjM
         dYCw==
X-Forwarded-Encrypted: i=1; AJvYcCUpqgjSrYrqWEQSMRdYDt7CM5whyB5igVY9k7Dje/r1mMjdtp4Im75Uso30edwU3I6lkU4g9jiBjPc29wA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Gw/cBzaNwqFxughaUU5UEu9gFgRpVuOuzui+ZTjmhOQIJLws
	EKw+MNEVb3vxQFU/5EXZam56nV5RyayiryTWi1l4pdt2ogqNXfIqg7vzVxNeq4fFa2xCH0xDR7i
	JhFkSaXSX2xK3Qv3YFg8UZkCKVC/9Rc6BZJrnka3EtwMe8fX3nZHu89E=
X-Google-Smtp-Source: AGHT+IFFm0SbyjxmrAZLwkahCEgaApSxPTNpIfZ7SqbpF/25/8dC12TaS1UbJsGPqE+XHJFbKdJC/xtU3GPABABhFHk5CISrZ9wb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154e:b0:3d4:6f9d:c0d0 with SMTP id
 e9e14a558f8ab-3d6e3f054bbmr82970655ab.8.1743898591486; Sat, 05 Apr 2025
 17:16:31 -0700 (PDT)
Date: Sat, 05 Apr 2025 17:16:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f1c7df.050a0220.0a13.0256.GAE@google.com>
Subject: [syzbot] [mm?] general protection fault in mremap
From: syzbot <syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com, 
	liam.howlett@oracle.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	lorenzo.stoakes@oracle.com, syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a2cc6ff5ec8f Merge tag 'firewire-updates-6.15' of git://gi..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=11ab27cf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=adffebefc9feb9d6
dashboard link: https://syzkaller.appspot.com/bug?extid=5250c4727db03e3436cc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1693d404580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=178ac94c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8ecd2318067e/disk-a2cc6ff5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/05691b82062c/vmlinux-a2cc6ff5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4698994e99d4/bzImage-a2cc6ff5.xz

The issue was bisected to:

commit d5c8aec0542e2d79b64de9089b88fabdebe05c1e
Author: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date:   Mon Mar 10 20:50:37 2025 +0000

    mm/mremap: initial refactor of move_vma()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11ff2a74580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13ff2a74580000
console output: https://syzkaller.appspot.com/x/log.txt?x=15ff2a74580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com
Fixes: d5c8aec0542e ("mm/mremap: initial refactor of move_vma()")

Code: 48 83 c4 28 c3 e8 17 1a 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff0b8738c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
RAX: ffffffffffffffda RBX: 00007fff0b8738d0 RCX: 00007f46ffb182e9
RDX: 0000000000003000 RSI: 0000000000001000 RDI: 0000200000ffc000
RBP: 0000000000000001 R08: 0000200000ffa000 R09: 00007f46ffb80031
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f46ffb83618
R13: 00007fff0b873aa8 R14: 0000000000000001 R15: 0000000000000001
 </TASK>
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
CPU: 0 UID: 0 PID: 5820 Comm: syz-executor115 Not tainted 6.14.0-syzkaller-12966-ga2cc6ff5ec8f #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
RIP: 0010:__do_sys_mremap+0x1392/0x15c0 mm/mremap.c:1784
Code: 0f 85 45 02 00 00 48 8b 04 24 c6 84 24 70 01 00 00 01 48 01 85 68 02 00 00 eb 9a e8 18 34 af ff 48 b8 04 00 00 00 00 fc ff df <80> 38 00 0f 85 a7 01 00 00 48 8b 2c 25 20 00 00 00 31 ff 81 e5 00
RSP: 0018:ffffc900039dfd20 EFLAGS: 00010293
RAX: dffffc0000000004 RBX: ffff88802b765a00 RCX: ffffffff821183c6
RDX: ffff88805c7b8000 RSI: ffffffff820c0cb8 RDI: 0000000000000005
RBP: ffff8880341fb780 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000fffffff4 R11: 0000000000000001 R12: 0000000000002000
R13: 1ffff9200073bfaa R14: 0000200000ffc000 R15: ffff88802b765b70
FS:  00005555814db380(0000) GS:ffff8881249b8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff0b8728e0 CR3: 000000007802e000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f46ffb182e9
Code: 48 83 c4 28 c3 e8 17 1a 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff0b8738c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
RAX: ffffffffffffffda RBX: 00007fff0b8738d0 RCX: 00007f46ffb182e9
RDX: 0000000000003000 RSI: 0000000000001000 RDI: 0000200000ffc000
RBP: 0000000000000001 R08: 0000200000ffa000 R09: 00007f46ffb80031
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f46ffb83618
R13: 00007fff0b873aa8 R14: 0000000000000001 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
RIP: 0010:__do_sys_mremap+0x1392/0x15c0 mm/mremap.c:1784
Code: 0f 85 45 02 00 00 48 8b 04 24 c6 84 24 70 01 00 00 01 48 01 85 68 02 00 00 eb 9a e8 18 34 af ff 48 b8 04 00 00 00 00 fc ff df <80> 38 00 0f 85 a7 01 00 00 48 8b 2c 25 20 00 00 00 31 ff 81 e5 00
RSP: 0018:ffffc900039dfd20 EFLAGS: 00010293
RAX: dffffc0000000004 RBX: ffff88802b765a00 RCX: ffffffff821183c6
RDX: ffff88805c7b8000 RSI: ffffffff820c0cb8 RDI: 0000000000000005
RBP: ffff8880341fb780 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000fffffff4 R11: 0000000000000001 R12: 0000000000002000
R13: 1ffff9200073bfaa R14: 0000200000ffc000 R15: ffff88802b765b70
FS:  00005555814db380(0000) GS:ffff8881249b8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff0b8728e0 CR3: 000000007802e000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	48 83 c4 28          	add    $0x28,%rsp
   4:	c3                   	ret
   5:	e8 17 1a 00 00       	call   0x1a21
   a:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall
* 2a:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax <-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	ret
  33:	48 c7 c1 b8 ff ff ff 	mov    $0xffffffffffffffb8,%rcx
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
