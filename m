Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA61218EB8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744020813; cv=none; b=SpnSd4dxkjumyqMZPupvKRiX8dcCrNkVT30rq/LRz7IFkAbyFRRq3l8wo+z+Ej1MN5/5Mt3l3eJ+2QYurQuj4b8Az0wgydapK9AeU/G5bPwmo4K+ZizVc1cCq+FI/WeWR/OFsIOTSZJUbxevLbfIZ532VbS9Lf6b0uTPpgntKRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744020813; c=relaxed/simple;
	bh=9BgS5jDG6ykiLUhv97LBFjFEvXi9D0+DEz8F3cPM1x4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jt00iuNZzsP8TXHKMPKneQdWkpnzj1IQ85L1pNVjh1YgPUxgtBhn36ICuPpUF8m3Tx17vZFAUFNJ08lhRkIiyICn/Lo+SwpX9+/wQywbGKbHmU9wuz8zO+5whNjKUFjR0YINwbIw3ynw01HfD20qWL6VbDLLWQR508COwnCDuoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c3HWz0T3; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c3HWz0T3"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-aee773df955so3251489a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 03:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744020811; x=1744625611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3Gjippi902AjJabl3vcIx2919Suoq0fQOd/iBiZSvA=;
        b=c3HWz0T3BPY7BdM3N1yx0CFqi8/uTSSWMfUJkbJr6GX6IVSfC3XKF8gChe78wuHZgH
         6rQhzllEsBXb0W4k9HOT2JTnyBM7ertm9l2kBUkRnt65IWqiYNmHXO/3kh1+7IdYb2hm
         8OjnZ3S9eDjIOm8RRwiso9/zohoykZDbl3wfKD8bz4PZ4npHqHLIrERBGQd+aoCIR5OX
         AZjwqyrxc4NsUJpAE8iepYM5q0Mg9dOaqwusJXopPuGndb1IxkRmgcbWrfCReu8h5poW
         RftNCta6VT2NZP2J8zuH3R6VubKURuGbWKT6Is57IR0n/AkamKC2v0hjXYtkR71wlr4H
         jQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744020811; x=1744625611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3Gjippi902AjJabl3vcIx2919Suoq0fQOd/iBiZSvA=;
        b=wNmhgzHno0iBLqhuCdCIXg9FJo73NNKPq2BcUCR3gf7bkYMZpfrKI5EL0rJ0k6XTQd
         rFXNOeEawkt7GnjFgO4naWU/l4/A4xcbuJrph+Zk1XKAnOOEZJ6WspdyeNbrgvaAYjhC
         Rq4jRWGm5Nnkba1Y+QN6By7n+W3bn62e2DdT0p/Tf5/Pk5EOPRLWjoCH0169INV/G6Oe
         UzjLfA1jmfOfw1Jgl6T25BCR5g3xRAUdGjR1r7ShzBECDLI7HPdT+VO6uB+8z46MeTFJ
         u4zqY4dPVjbzAKgOgEcmwRHUPp0ht0PLjIC0sPb/i71is/rT1LSb45KBLK782vtF+PcS
         H32g==
X-Forwarded-Encrypted: i=1; AJvYcCXg4YATAT/6ihFbmb71HS/1C7Apfj+O3Y3e4w1Yno6A11PGAWV7HpLqrsXe/MyAkwob0di4ysJ92+6W6VQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPR3ra4kR7SPJGJn+JMmVyvqLo9zNEakGBHNB0my9NzfuoHnqh
	ia7XijLA91fSQuayHjXUUP3UgO1r91aaOs23DiEZg+KBf4TGyrFixng1aM8dMGCynA3fYUGgdj9
	TNKoluD8QUh4NzzI5FZOw7YjBSpPILuJpObA+
X-Gm-Gg: ASbGncsvI0sbbqqTsbwXna1RnJNgFLXNXI62BXeV/fEjfCcSY1z4YcvbANq/beCLtY9
	on1CTFf5LT3eDvton1Y2+Y0hzvZ+2zNy9anobwjgR2MnXEDQRmQ2B8Mf1p9xxQoSUWjaBOfuP5L
	T35B2aJVaf0MZMFGYFzs04FPxAtsShoEJaYeig45IfRIA1SuDWMspbk7yK
X-Google-Smtp-Source: AGHT+IGMXUqz5Sf/vj6WiuNqxwAYdiL/diBgupBBDNAUXecQHt7NV1Hn8WIxBmI3DhodPb/eBiKU8Ks9H1wE2Pa39Yg=
X-Received: by 2002:a17:90b:2650:b0:2fa:562c:c1cf with SMTP id
 98e67ed59e1d1-3057a5a03c7mr23892320a91.1.1744020811172; Mon, 07 Apr 2025
 03:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67f1c7df.050a0220.0a13.0256.GAE@google.com> <07a22812-4f5b-44e2-a4ce-ad0537934041@lucifer.local>
In-Reply-To: <07a22812-4f5b-44e2-a4ce-ad0537934041@lucifer.local>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 7 Apr 2025 12:13:19 +0200
X-Gm-Features: ATxdqUFjGdWIY06l8_7_zXJNV37YUknnNrM5U7iu92QlypWDo1KBi2KXyJNr3pI
Message-ID: <CANp29Y7TnFB9eTEDoG5gjoeEkv7mt4GXNYDRz7xnaOhGfcg84A@mail.gmail.com>
Subject: Re: [syzbot] [mm?] general protection fault in mremap
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: syzbot <syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com>, 
	Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lorenzo,

Thanks for looking at the report!

On Mon, Apr 7, 2025 at 12:09=E2=80=AFPM 'Lorenzo Stoakes' via syzkaller-bug=
s
<syzkaller-bugs@googlegroups.com> wrote:
>
> I did actually try to mark this fixed, but apparently syz fix doesn't wor=
k or
> doesn't prevent other syzbots from duplicating reports.

This part is not very clear - why would #syz fix: title not work well here?

>
> Anyway, this is fixed in commit 36eed5400805 ("mm/mremap: do not set
> vrm->vma NULL immediately prior to checking it"), was fixed a long time
> ago, as soon as reported, and it's been a matter of waiting for this to
> land in Linus's tree.
>
> This is now fixed, upstream, and this report is - as a result - redundant=
.
>
> Thanks, Lorenzo

--=20
Aleksandr

>
> On Sat, Apr 05, 2025 at 05:16:31PM -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    a2cc6ff5ec8f Merge tag 'firewire-updates-6.15' of git:/=
/gi..
> > git tree:       upstream
> > console+strace: https://syzkaller.appspot.com/x/log.txt?x=3D11ab27cf980=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dadffebefc9f=
eb9d6
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D5250c4727db03=
e3436cc
> > compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for=
 Debian) 2.40
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1693d4045=
80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D178ac94c580=
000
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/8ecd2318067e/d=
isk-a2cc6ff5.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/05691b82062c/vmli=
nux-a2cc6ff5.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/4698994e99d4=
/bzImage-a2cc6ff5.xz
> >
> > The issue was bisected to:
> >
> > commit d5c8aec0542e2d79b64de9089b88fabdebe05c1e
> > Author: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Date:   Mon Mar 10 20:50:37 2025 +0000
> >
> >     mm/mremap: initial refactor of move_vma()
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D11ff2a74=
580000
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D13ff2a74=
580000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D15ff2a74580=
000
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com
> > Fixes: d5c8aec0542e ("mm/mremap: initial refactor of move_vma()")
> >
> > Code: 48 83 c4 28 c3 e8 17 1a 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89=
 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 =
ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> > RSP: 002b:00007fff0b8738c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> > RAX: ffffffffffffffda RBX: 00007fff0b8738d0 RCX: 00007f46ffb182e9
> > RDX: 0000000000003000 RSI: 0000000000001000 RDI: 0000200000ffc000
> > RBP: 0000000000000001 R08: 0000200000ffa000 R09: 00007f46ffb80031
> > R10: 0000000000000000 R11: 0000000000000246 R12: 00007f46ffb83618
> > R13: 00007fff0b873aa8 R14: 0000000000000001 R15: 0000000000000001
> >  </TASK>
> > Oops: general protection fault, probably for non-canonical address 0xdf=
fffc0000000004: 0000 [#1] SMP KASAN NOPTI
> > KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
> > CPU: 0 UID: 0 PID: 5820 Comm: syz-executor115 Not tainted 6.14.0-syzkal=
ler-12966-ga2cc6ff5ec8f #0 PREEMPT(full)
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS=
 Google 02/12/2025
> > RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> > RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> > RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> > RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> > RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> > RIP: 0010:__do_sys_mremap+0x1392/0x15c0 mm/mremap.c:1784
> > Code: 0f 85 45 02 00 00 48 8b 04 24 c6 84 24 70 01 00 00 01 48 01 85 68=
 02 00 00 eb 9a e8 18 34 af ff 48 b8 04 00 00 00 00 fc ff df <80> 38 00 0f =
85 a7 01 00 00 48 8b 2c 25 20 00 00 00 31 ff 81 e5 00
> > RSP: 0018:ffffc900039dfd20 EFLAGS: 00010293
> > RAX: dffffc0000000004 RBX: ffff88802b765a00 RCX: ffffffff821183c6
> > RDX: ffff88805c7b8000 RSI: ffffffff820c0cb8 RDI: 0000000000000005
> > RBP: ffff8880341fb780 R08: 0000000000000005 R09: 0000000000000000
> > R10: 00000000fffffff4 R11: 0000000000000001 R12: 0000000000002000
> > R13: 1ffff9200073bfaa R14: 0000200000ffc000 R15: ffff88802b765b70
> > FS:  00005555814db380(0000) GS:ffff8881249b8000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00007fff0b8728e0 CR3: 000000007802e000 CR4: 00000000003526f0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  <TASK>
> >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >  do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > RIP: 0033:0x7f46ffb182e9
> > Code: 48 83 c4 28 c3 e8 17 1a 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89=
 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 =
ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> > RSP: 002b:00007fff0b8738c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> > RAX: ffffffffffffffda RBX: 00007fff0b8738d0 RCX: 00007f46ffb182e9
> > RDX: 0000000000003000 RSI: 0000000000001000 RDI: 0000200000ffc000
> > RBP: 0000000000000001 R08: 0000200000ffa000 R09: 00007f46ffb80031
> > R10: 0000000000000000 R11: 0000000000000246 R12: 00007f46ffb83618
> > R13: 00007fff0b873aa8 R14: 0000000000000001 R15: 0000000000000001
> >  </TASK>
> > Modules linked in:
> > ---[ end trace 0000000000000000 ]---
> > RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> > RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> > RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> > RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> > RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> > RIP: 0010:__do_sys_mremap+0x1392/0x15c0 mm/mremap.c:1784
> > Code: 0f 85 45 02 00 00 48 8b 04 24 c6 84 24 70 01 00 00 01 48 01 85 68=
 02 00 00 eb 9a e8 18 34 af ff 48 b8 04 00 00 00 00 fc ff df <80> 38 00 0f =
85 a7 01 00 00 48 8b 2c 25 20 00 00 00 31 ff 81 e5 00
> > RSP: 0018:ffffc900039dfd20 EFLAGS: 00010293
> > RAX: dffffc0000000004 RBX: ffff88802b765a00 RCX: ffffffff821183c6
> > RDX: ffff88805c7b8000 RSI: ffffffff820c0cb8 RDI: 0000000000000005
> > RBP: ffff8880341fb780 R08: 0000000000000005 R09: 0000000000000000
> > R10: 00000000fffffff4 R11: 0000000000000001 R12: 0000000000002000
> > R13: 1ffff9200073bfaa R14: 0000200000ffc000 R15: ffff88802b765b70
> > FS:  00005555814db380(0000) GS:ffff8881249b8000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00007fff0b8728e0 CR3: 000000007802e000 CR4: 00000000003526f0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > ----------------
> > Code disassembly (best guess):
> >    0: 48 83 c4 28             add    $0x28,%rsp
> >    4: c3                      ret
> >    5: e8 17 1a 00 00          call   0x1a21
> >    a: 0f 1f 80 00 00 00 00    nopl   0x0(%rax)
> >   11: 48 89 f8                mov    %rdi,%rax
> >   14: 48 89 f7                mov    %rsi,%rdi
> >   17: 48 89 d6                mov    %rdx,%rsi
> >   1a: 48 89 ca                mov    %rcx,%rdx
> >   1d: 4d 89 c2                mov    %r8,%r10
> >   20: 4d 89 c8                mov    %r9,%r8
> >   23: 4c 8b 4c 24 08          mov    0x8(%rsp),%r9
> >   28: 0f 05                   syscall
> > * 2a: 48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax <-- trapp=
ing instruction
> >   30: 73 01                   jae    0x33
> >   32: c3                      ret
> >   33: 48 c7 c1 b8 ff ff ff    mov    $0xffffffffffffffb8,%rcx
> >   3a: f7 d8                   neg    %eax
> >   3c: 64 89 01                mov    %eax,%fs:(%rcx)
> >   3f: 48                      rex.W
> >
> >
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > For information about bisection process see: https://goo.gl/tpsmEJ#bise=
ction
> >
> > If the report is already addressed, let syzbot know by replying with:
> > #syz fix: exact-commit-title
> >
> > If you want syzbot to run the reproducer, reply with:
> > #syz test: git://repo/address.git branch-or-commit-hash
> > If you attach or paste a git patch, syzbot will apply it before testing=
.
> >
> > If you want to overwrite report's subsystems, reply with:
> > #syz set subsystems: new-subsystem
> > (See the list of subsystem names on the web dashboard)
> >
> > If the report is a duplicate of another one, reply with:
> > #syz dup: exact-subject-of-another-report
> >
> > If you want to undo deduplication, reply with:
> > #syz undup
>
> --
