Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F92698BE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210684; cv=none; b=TLsXfP/CoeuOy4J2qb0dRoU+e7K+kMUdcsgPmHS2GlbdpjVcJvkECPWShQ75LDIYuyhp2DlgIa6lCrY+lS19MSbhDGCQm3sjl08lVlV6fMf8LY+yRl4wXHNRF7Kx/hwRsXesDsT4DCb4k3I9QEribSyZ/kgaC/lwCIKOo3WErzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210684; c=relaxed/simple;
	bh=7pHKwmxnwnKm+kaPJt4GvWZWMpLnsWqQJORKGqpKsPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DCmWWbvxwhDbaJE4mrP134JN+ORfNskd6eLu82HrGC3URQS2sxHYclgWH8zT/pjoC+GCiS5mpS+fN/yzBOOv2QJwfWDiLj6sKdNzClto7h0Yf6u8TGuATMGpE0gd+0Qqc7XBMixlVmtySMSehRPbRFSWIwFHkzrQMTQobLLJUqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D4NGt2qH; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D4NGt2qH"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30332dfc820so7393230a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744210681; x=1744815481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvMlvfko46u4RHI+ZrkaTKVlGUANMNZ6Hd9jSBGGvX0=;
        b=D4NGt2qHwovVy+U8rrUNqEG8M0r0bCt+Zi80cUlmwazCTZrMtVGfjRgMW1SnPO8TGv
         qpDyRKPzhdIJSKhkDiGK1JO/7ru5ugC3uRBV95XkXZNUOMnZo5WfNWkzkq1PYaNAmEeG
         NtFnShu2UeF344CDGfhTNU1g42OKoojXy1l/uir+L4VxwkeH7tDjGgg6+lLuw0MpzJQ0
         ADv3YWxZBBbsdXa6JIzEflQUDyubR3yEQWruHjGohpZzXujvpXJdPM4AWSjCj5fOtUa3
         g6JUKC8ntpCm5eADnStwwafkQI0FbRWnkMqC1+WKnRbyhwUXySZmnRexv6p0qNeCXnqM
         Wg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744210681; x=1744815481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvMlvfko46u4RHI+ZrkaTKVlGUANMNZ6Hd9jSBGGvX0=;
        b=ePn6OdKUix0s7nSv/OTbzeVXkwtrKWqoVTHLkwkiM2Jy1OSemTYa2m4g5eFO+HgYLI
         tbQCw11u3tuhbecyrg6M8+yuR/EkvWuZaKOgD5B8t3P/xa94L3cbiNLY9s7aM9P5olWT
         6ty9qF8I7NCZy9FUUp5gmlc2GQSXZtj5ShNtp2c7CX2KdYU9z3k8A6y9zo3CHrH5aHxk
         rvB43AOOftGic3ZSwl58yIpV7Ir5aUdsez412UlrLe+XEstg1UnZC6o1kzLn6M3vpLpf
         eHxnr/qYEdM5Gp0QiFWNv3kig1x5tyMH2xmy2FqzTJjafZI7wP11XXS5A3xU9sIYUS4i
         C4pg==
X-Forwarded-Encrypted: i=1; AJvYcCWYMad4v4zHEVzuvPBcte5QzrHqRcbl04f5NVCBlqRmmojKfsH4UhirnlW/N/6/WJ6kxoVtNzowET9gheI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQiHAOJWK1ryjgmIC0/DmfxTePN/iDEGDFP2gkhVnnbcksUFN2
	b29Oe0pg9WhGyqdvkKCR5US+3H0ZJpBHHu+K5JDfKQjzQAiZZ94cSSDb1yryz8FTSlhRp14riVG
	lyGh0NhRNN6E+W6lvTg7RbH3glAcHPA3+YbF0YDecEbWVe2CWW8RW7T93RQ==
X-Gm-Gg: ASbGnctCWgtyzHEdqjurHRoaALotdE2tAHwnpTo1kO02ZefXXL2s/ybPVmoxsvUEory
	KOrXcLubZXu0gj7YXAp0WzWat2WyCfiNpz/Em0XXAKGvT4GTrZMWlFhNocBIaKB1V2px0rpC9X6
	8Hmd0GqB6lX9HOWmuqjPFmTB7KyCUMMGeKLhT/llW+7B2jsAWaGMc=
X-Google-Smtp-Source: AGHT+IEBuaQzZT6cZRe8i4Tk3RuO+xRnC2wpUKEDzJxdy3h1MXpKvK37q+3S5kT7paX1Kxc25syW6S0AgqMDQwgmbHI=
X-Received: by 2002:a17:90b:58e5:b0:2ee:d024:e4fc with SMTP id
 98e67ed59e1d1-306dbc3b998mr5892291a91.33.1744210680984; Wed, 09 Apr 2025
 07:58:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67f1c7df.050a0220.0a13.0256.GAE@google.com> <07a22812-4f5b-44e2-a4ce-ad0537934041@lucifer.local>
 <CANp29Y7TnFB9eTEDoG5gjoeEkv7mt4GXNYDRz7xnaOhGfcg84A@mail.gmail.com> <6efd1c14-2253-4b7d-a647-dce471ffff6f@lucifer.local>
In-Reply-To: <6efd1c14-2253-4b7d-a647-dce471ffff6f@lucifer.local>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 9 Apr 2025 16:57:48 +0200
X-Gm-Features: ATxdqUG6KUCUBx9kzevP8gUZQU5FsDzE806IM-OMR39N2wxGiq9ldb7sCnOzmjQ
Message-ID: <CANp29Y56cNQDGG_0bZEzVedee_rcDKPs28kb=D0-0seRKpbrXA@mail.gmail.com>
Subject: Re: [syzbot] [mm?] general protection fault in mremap
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: syzbot <syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com>, 
	Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz, 
	syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 12:28=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Mon, Apr 07, 2025 at 12:13:19PM +0200, Aleksandr Nogikh wrote:
> > Hi Lorenzo,
> >
> > Thanks for looking at the report!
> >
> > On Mon, Apr 7, 2025 at 12:09=E2=80=AFPM 'Lorenzo Stoakes' via syzkaller=
-bugs
> > <syzkaller-bugs@googlegroups.com> wrote:
> > >
> > > I did actually try to mark this fixed, but apparently syz fix doesn't=
 work or
> > > doesn't prevent other syzbots from duplicating reports.
> >
> > This part is not very clear - why would #syz fix: title not work well h=
ere?
>
> Sorry for not being clear. What I mean is that I already did this on
> another thread with the same, duplicate, report - and then received this
> one afterwards.
>
> This suggests to me that this does nothing, or does nothing useful at lea=
st
> if other bots will just keep on reporting the same thing.

When syzbot receives the #syz fix command, it keeps the bug open until
the fixing commit has reached all the kernel trees it fuzzes. After
that, if the bug is seen again, it's reported as a separate issue with
the (2) suffix, then (3), etc.

If the bug manifested itself with different crash titles, marking just
one report as fixed won't affect others indeed - if syzbot knew they
were related, it would not have reported them separately.

What was the other thread/bug in this case? Maybe we could adjust our
kernel crash log parsing rules to prevent similar duplicates.

>
> I appreciate that recognising that it is the same issue might not be
> trivial, but obviously it's not a hugely great use of my time to repeated=
ly
> chase this stuff up when the fix is already upstream and I've already
> -manually- confirmed it works.
>
> My patience with it was somewhat eroded from my experience of telling
> syzbot in the previous thread [0] to re-test, twice, and it failing to do
> so due to broken presumably VM images, leading to me having to manually
> test the same fix I already tested and fixed a while ago etc. etc.
>
> [0]: https://lore.kernel.org/all/bee2d5f5-db93-42f1-829e-3fd250649ca8@luc=
ifer.local/

FWIW the "unregister_netdevice: waiting for batadv0 to become free.
Usage count =3D 3" bug is discussed here:

https://lore.kernel.org/all/CANp29Y5RjJD3FK8zciRL92f0+tXEaZ=3DDbzSF3JrnVRGy=
Dmag2A@mail.gmail.com/t/#u

This is an actual bug in v6.15-rc1 that's plaguing Linux kernel
fuzzing on syzbot at the moment.

>
> We do very much appreciate syzbot reports, don't get me wrong here, but I
> do also have to partition my time somewhat :)
>
> So I'm afraid I can't promise to always do syz fix updates on this basis.

Sure.

Also please feel free to ping us whenever syzbot's behavior is annoying you=
 :)

--=20
Aleksandr

>
> Cheers, Lorenzo
>
> >
> > >
> > > Anyway, this is fixed in commit 36eed5400805 ("mm/mremap: do not set
> > > vrm->vma NULL immediately prior to checking it"), was fixed a long ti=
me
> > > ago, as soon as reported, and it's been a matter of waiting for this =
to
> > > land in Linus's tree.
> > >
> > > This is now fixed, upstream, and this report is - as a result - redun=
dant.
> > >
> > > Thanks, Lorenzo
> >
> > --
> > Aleksandr
> >
> > >
> > > On Sat, Apr 05, 2025 at 05:16:31PM -0700, syzbot wrote:
> > > > Hello,
> > > >
> > > > syzbot found the following issue on:
> > > >
> > > > HEAD commit:    a2cc6ff5ec8f Merge tag 'firewire-updates-6.15' of g=
it://gi..
> > > > git tree:       upstream
> > > > console+strace: https://syzkaller.appspot.com/x/log.txt?x=3D11ab27c=
f980000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dadffebe=
fc9feb9d6
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=3D5250c4727=
db03e3436cc
> > > > compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils=
 for Debian) 2.40
> > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1693d=
404580000
> > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D178ac94=
c580000
> > > >
> > > > Downloadable assets:
> > > > disk image: https://storage.googleapis.com/syzbot-assets/8ecd231806=
7e/disk-a2cc6ff5.raw.xz
> > > > vmlinux: https://storage.googleapis.com/syzbot-assets/05691b82062c/=
vmlinux-a2cc6ff5.xz
> > > > kernel image: https://storage.googleapis.com/syzbot-assets/4698994e=
99d4/bzImage-a2cc6ff5.xz
> > > >
> > > > The issue was bisected to:
> > > >
> > > > commit d5c8aec0542e2d79b64de9089b88fabdebe05c1e
> > > > Author: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > Date:   Mon Mar 10 20:50:37 2025 +0000
> > > >
> > > >     mm/mremap: initial refactor of move_vma()
> > > >
> > > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D11ff=
2a74580000
> > > > final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D13ff=
2a74580000
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=3D15ff2a7=
4580000
> > > >
> > > > IMPORTANT: if you fix the issue, please add the following tag to th=
e commit:
> > > > Reported-by: syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com
> > > > Fixes: d5c8aec0542e ("mm/mremap: initial refactor of move_vma()")
> > > >
> > > > Code: 48 83 c4 28 c3 e8 17 1a 00 00 0f 1f 80 00 00 00 00 48 89 f8 4=
8 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01=
 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> > > > RSP: 002b:00007fff0b8738c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000=
019
> > > > RAX: ffffffffffffffda RBX: 00007fff0b8738d0 RCX: 00007f46ffb182e9
> > > > RDX: 0000000000003000 RSI: 0000000000001000 RDI: 0000200000ffc000
> > > > RBP: 0000000000000001 R08: 0000200000ffa000 R09: 00007f46ffb80031
> > > > R10: 0000000000000000 R11: 0000000000000246 R12: 00007f46ffb83618
> > > > R13: 00007fff0b873aa8 R14: 0000000000000001 R15: 0000000000000001
> > > >  </TASK>
> > > > Oops: general protection fault, probably for non-canonical address =
0xdffffc0000000004: 0000 [#1] SMP KASAN NOPTI
> > > > KASAN: null-ptr-deref in range [0x0000000000000020-0x00000000000000=
27]
> > > > CPU: 0 UID: 0 PID: 5820 Comm: syz-executor115 Not tainted 6.14.0-sy=
zkaller-12966-ga2cc6ff5ec8f #0 PREEMPT(full)
> > > > Hardware name: Google Google Compute Engine/Google Compute Engine, =
BIOS Google 02/12/2025
> > > > RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> > > > RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> > > > RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> > > > RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> > > > RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> > > > RIP: 0010:__do_sys_mremap+0x1392/0x15c0 mm/mremap.c:1784
> > > > Code: 0f 85 45 02 00 00 48 8b 04 24 c6 84 24 70 01 00 00 01 48 01 8=
5 68 02 00 00 eb 9a e8 18 34 af ff 48 b8 04 00 00 00 00 fc ff df <80> 38 00=
 0f 85 a7 01 00 00 48 8b 2c 25 20 00 00 00 31 ff 81 e5 00
> > > > RSP: 0018:ffffc900039dfd20 EFLAGS: 00010293
> > > > RAX: dffffc0000000004 RBX: ffff88802b765a00 RCX: ffffffff821183c6
> > > > RDX: ffff88805c7b8000 RSI: ffffffff820c0cb8 RDI: 0000000000000005
> > > > RBP: ffff8880341fb780 R08: 0000000000000005 R09: 0000000000000000
> > > > R10: 00000000fffffff4 R11: 0000000000000001 R12: 0000000000002000
> > > > R13: 1ffff9200073bfaa R14: 0000200000ffc000 R15: ffff88802b765b70
> > > > FS:  00005555814db380(0000) GS:ffff8881249b8000(0000) knlGS:0000000=
000000000
> > > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > CR2: 00007fff0b8728e0 CR3: 000000007802e000 CR4: 00000000003526f0
> > > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > > Call Trace:
> > > >  <TASK>
> > > >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> > > >  do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
> > > >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > > > RIP: 0033:0x7f46ffb182e9
> > > > Code: 48 83 c4 28 c3 e8 17 1a 00 00 0f 1f 80 00 00 00 00 48 89 f8 4=
8 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01=
 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> > > > RSP: 002b:00007fff0b8738c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000=
019
> > > > RAX: ffffffffffffffda RBX: 00007fff0b8738d0 RCX: 00007f46ffb182e9
> > > > RDX: 0000000000003000 RSI: 0000000000001000 RDI: 0000200000ffc000
> > > > RBP: 0000000000000001 R08: 0000200000ffa000 R09: 00007f46ffb80031
> > > > R10: 0000000000000000 R11: 0000000000000246 R12: 00007f46ffb83618
> > > > R13: 00007fff0b873aa8 R14: 0000000000000001 R15: 0000000000000001
> > > >  </TASK>
> > > > Modules linked in:
> > > > ---[ end trace 0000000000000000 ]---
> > > > RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> > > > RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> > > > RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> > > > RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> > > > RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> > > > RIP: 0010:__do_sys_mremap+0x1392/0x15c0 mm/mremap.c:1784
> > > > Code: 0f 85 45 02 00 00 48 8b 04 24 c6 84 24 70 01 00 00 01 48 01 8=
5 68 02 00 00 eb 9a e8 18 34 af ff 48 b8 04 00 00 00 00 fc ff df <80> 38 00=
 0f 85 a7 01 00 00 48 8b 2c 25 20 00 00 00 31 ff 81 e5 00
> > > > RSP: 0018:ffffc900039dfd20 EFLAGS: 00010293
> > > > RAX: dffffc0000000004 RBX: ffff88802b765a00 RCX: ffffffff821183c6
> > > > RDX: ffff88805c7b8000 RSI: ffffffff820c0cb8 RDI: 0000000000000005
> > > > RBP: ffff8880341fb780 R08: 0000000000000005 R09: 0000000000000000
> > > > R10: 00000000fffffff4 R11: 0000000000000001 R12: 0000000000002000
> > > > R13: 1ffff9200073bfaa R14: 0000200000ffc000 R15: ffff88802b765b70
> > > > FS:  00005555814db380(0000) GS:ffff8881249b8000(0000) knlGS:0000000=
000000000
> > > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > CR2: 00007fff0b8728e0 CR3: 000000007802e000 CR4: 00000000003526f0
> > > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > > ----------------
> > > > Code disassembly (best guess):
> > > >    0: 48 83 c4 28             add    $0x28,%rsp
> > > >    4: c3                      ret
> > > >    5: e8 17 1a 00 00          call   0x1a21
> > > >    a: 0f 1f 80 00 00 00 00    nopl   0x0(%rax)
> > > >   11: 48 89 f8                mov    %rdi,%rax
> > > >   14: 48 89 f7                mov    %rsi,%rdi
> > > >   17: 48 89 d6                mov    %rdx,%rsi
> > > >   1a: 48 89 ca                mov    %rcx,%rdx
> > > >   1d: 4d 89 c2                mov    %r8,%r10
> > > >   20: 4d 89 c8                mov    %r9,%r8
> > > >   23: 4c 8b 4c 24 08          mov    0x8(%rsp),%r9
> > > >   28: 0f 05                   syscall
> > > > * 2a: 48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax <-- t=
rapping instruction
> > > >   30: 73 01                   jae    0x33
> > > >   32: c3                      ret
> > > >   33: 48 c7 c1 b8 ff ff ff    mov    $0xffffffffffffffb8,%rcx
> > > >   3a: f7 d8                   neg    %eax
> > > >   3c: 64 89 01                mov    %eax,%fs:(%rcx)
> > > >   3f: 48                      rex.W
> > > >
> > > >
> > > > ---
> > > > This report is generated by a bot. It may contain errors.
> > > > See https://goo.gl/tpsmEJ for more information about syzbot.
> > > > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > > >
> > > > syzbot will keep track of this issue. See:
> > > > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > > > For information about bisection process see: https://goo.gl/tpsmEJ#=
bisection
> > > >
> > > > If the report is already addressed, let syzbot know by replying wit=
h:
> > > > #syz fix: exact-commit-title
> > > >
> > > > If you want syzbot to run the reproducer, reply with:
> > > > #syz test: git://repo/address.git branch-or-commit-hash
> > > > If you attach or paste a git patch, syzbot will apply it before tes=
ting.
> > > >
> > > > If you want to overwrite report's subsystems, reply with:
> > > > #syz set subsystems: new-subsystem
> > > > (See the list of subsystem names on the web dashboard)
> > > >
> > > > If the report is a duplicate of another one, reply with:
> > > > #syz dup: exact-subject-of-another-report
> > > >
> > > > If you want to undo deduplication, reply with:
> > > > #syz undup
> > >
> > > --
> >
