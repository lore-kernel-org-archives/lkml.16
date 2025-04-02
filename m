Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357FD199948
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743588082; cv=none; b=PoNwJGKOxJTg7qOSiNkJfZ8GMfTtaZOe9/UtSvWU9BwAVkai7twbQMFTIXV+YnCsWUD1BBTges+ime8Mkby7TrSbU3kpdXlMfEUlPeEspEoxPhU2VXDIfQ9QlpvW4L2pCXVlW7xd00UgAHlON6iT4zCOA16fG+63Nx1sJUpkthI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743588082; c=relaxed/simple;
	bh=5zDWPBQx2le1Ivbva5c1ttBmu8Sf/QmV+6wl5+8XbGE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=exV2218F1EQQp13XEclKUtJEz4BWDFwjSd425Yp/4Rlmj2Rp7gj93G1YQ5+2JuoZ8wWeaG7Y8rQiWpTEJEMN89dMqZzCa/lzeCTCAebx6c5qK4S2QhofALmji4DrMLIfampEwgl83+TKB7bqlnhyNWXxOjZgYurHv163qyIIRt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d458e61faaso7949865ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 03:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743588080; x=1744192880;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3xZDafEEtYWM+rcMpEpLNTs7hEOvGbfXHnpXhkG/qQ=;
        b=c6/z+BtukeOZBG3rzGyyc746Tjkzelr/NhX53HIBobx8Oa+IPMbNXJDR5RovpvLiMY
         ZcxfIiqD4SNhFX8SjvA30wAXqcWddkmf68Zfnz4O3DFmOuphviZZsh9dDh1zmUoLkP/T
         ecLOyCq9gSYjnUnwF/+KC5AlLryzYczTv5u9TmozBv3xqywYTYfxk6R66Q/oFFNXOtYJ
         crVKbuV5T8oUKeDmqCVrRSuomkglzOA/FoWL0jng6+ZDodc8oUPd+wDE1wxjOKUb0kku
         G03hv0zHfd1AR0s+PsZESuVdrTGNrsFnoVHwzJOIy2BswTiFTyldD/Pz4Eaa7u4hFxwu
         OlXg==
X-Forwarded-Encrypted: i=1; AJvYcCU9OTKtc+H+keC4w2Bd8xHUb1WDps/YFzcXMJrEjoD3oMBQSMMtjaDBrx0wcSmcVo1aw1PrypEoeaVprqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5QNI3CXTAnhUR8T8r6trNurSXLjoLVJDlkjkVSkqPMRub5E+Z
	zCLNBTNa2WDyiPobLHnu8MlqbNniDEX94boW9LMgb5UiOwE4HCP5E2gwU6cvCKWEMhjPsmpBTiM
	X0ynDOJAXjT7VhrpHeNVfIU4jMbQkfHiXA666P6+V1DMYkwoo/n750c0=
X-Google-Smtp-Source: AGHT+IHQOdDwtFOTU+AfHbp7DS7+qaTMROmpQtqlziho7sXhiREA/l1Ym9Us2Iq0uvmffvuNz04n2aEMQ+kmtvsaKjstL0obBWEj
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:450f:b0:3d6:d838:8b93 with SMTP id
 e9e14a558f8ab-3d6d838915fmr4831595ab.7.1743588080237; Wed, 02 Apr 2025
 03:01:20 -0700 (PDT)
Date: Wed, 02 Apr 2025 03:01:20 -0700
In-Reply-To: <67ec7e14.050a0220.31979b.0030.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ed0af0.050a0220.31979b.0041.GAE@google.com>
Subject: Re: [syzbot] [mm?] general protection fault in sys_mremap
From: syzbot <syzbot+e3385f43b2897a19be24@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com, 
	liam.howlett@oracle.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	lorenzo.stoakes@oracle.com, syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    acc4d5ff0b61 Merge tag 'net-6.15-rc0' of git://git.kernel...
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=16719404580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=24f9c4330e7c0609
dashboard link: https://syzkaller.appspot.com/bug?extid=e3385f43b2897a19be24
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=175a4fb0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1687b7b0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e4bfa652b34a/disk-acc4d5ff.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3d19beb8bb92/vmlinux-acc4d5ff.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e7298ccc6331/bzImage-acc4d5ff.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e3385f43b2897a19be24@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
CPU: 0 UID: 0 PID: 5840 Comm: syz-executor163 Not tainted 6.14.0-syzkaller-12456-gacc4d5ff0b61 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
RIP: 0010:__do_sys_mremap mm/mremap.c:1784 [inline]
RIP: 0010:__se_sys_mremap+0x25fa/0x2c00 mm/mremap.c:1752
Code: c0 0f 85 0e 05 00 00 0f b6 9c 24 20 03 00 00 31 ff 89 de e8 d8 0d ab ff 85 db 0f 84 7b 01 00 00 e8 cb 0a ab ff e9 9e 00 00 00 <80> 78 04 00 74 0a bf 20 00 00 00 e8 26 2f 15 00 4c 8b 34 25 20 00
RSP: 0018:ffffc900040cfb40 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 1ffff92000819fca
RDX: 0000000000000000 RSI: 0000000010000000 RDI: 0000000000000000
RBP: ffffc900040cff00 R08: ffffffff821d1f24 R09: ffffffff8c271397
R10: 0000000000000004 R11: ffff888034658000 R12: 0000200000000000
R13: ffff888077fac000 R14: 00000000180000fa R15: ffffc900040cfcd0
FS:  0000555571cf3380(0000) GS:ffff888124f99000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00002000000000c0 CR3: 00000000316de000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4480ba0369
Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff6c642778 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007f4480ba0369
RDX: 0000000000004000 RSI: 0000000000001000 RDI: 0000200000000000
RBP: 0000200000001000 R08: 0000200000001000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007fff6c642958 R14: 0000000000000001 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
RIP: 0010:__do_sys_mremap mm/mremap.c:1784 [inline]
RIP: 0010:__se_sys_mremap+0x25fa/0x2c00 mm/mremap.c:1752
Code: c0 0f 85 0e 05 00 00 0f b6 9c 24 20 03 00 00 31 ff 89 de e8 d8 0d ab ff 85 db 0f 84 7b 01 00 00 e8 cb 0a ab ff e9 9e 00 00 00 <80> 78 04 00 74 0a bf 20 00 00 00 e8 26 2f 15 00 4c 8b 34 25 20 00
RSP: 0018:ffffc900040cfb40 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 1ffff92000819fca
RDX: 0000000000000000 RSI: 0000000010000000 RDI: 0000000000000000
RBP: ffffc900040cff00 R08: ffffffff821d1f24 R09: ffffffff8c271397
R10: 0000000000000004 R11: ffff888034658000 R12: 0000200000000000
R13: ffff888077fac000 R14: 00000000180000fa R15: ffffc900040cfcd0
FS:  0000555571cf3380(0000) GS:ffff888124f99000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00002000000000c0 CR3: 00000000316de000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	0f 85 0e 05 00 00    	jne    0x514
   6:	0f b6 9c 24 20 03 00 	movzbl 0x320(%rsp),%ebx
   d:	00
   e:	31 ff                	xor    %edi,%edi
  10:	89 de                	mov    %ebx,%esi
  12:	e8 d8 0d ab ff       	call   0xffab0def
  17:	85 db                	test   %ebx,%ebx
  19:	0f 84 7b 01 00 00    	je     0x19a
  1f:	e8 cb 0a ab ff       	call   0xffab0aef
  24:	e9 9e 00 00 00       	jmp    0xc7
* 29:	80 78 04 00          	cmpb   $0x0,0x4(%rax) <-- trapping instruction
  2d:	74 0a                	je     0x39
  2f:	bf 20 00 00 00       	mov    $0x20,%edi
  34:	e8 26 2f 15 00       	call   0x152f5f
  39:	4c                   	rex.WR
  3a:	8b                   	.byte 0x8b
  3b:	34 25                	xor    $0x25,%al
  3d:	20 00                	and    %al,(%rax)


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
