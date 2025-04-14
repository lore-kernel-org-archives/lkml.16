Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CFB42A92
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744643723; cv=none; b=lkRBlku/etk/uHMw2M6YYaMEnY4dEnyaWgW7e95lNAWer8DB6js2l6NumuVC8gl6Wba7360NDqyKrFeJAEfMopxuScdH1m/rbkRZ+eL/RaQCd9+CNyUIsLbmLUbhq5OhylntiFiCwzhJ4vhH9R1IX8qB+Rv6nMJN6Sri7iTC8Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744643723; c=relaxed/simple;
	bh=FHMbNI8ZQ7xZEDy48xc0yqL8OEDsZaFXHDuPf4RVMTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehT+QKfYjSobG+vjUcHNg5+mFVJOYYuafqLwMXxIWVN9L/t+uOUFS2jpKCNfrtlJ7ds/Ahwzzw5GCPM1VnDy9oGFQgRg8hRcDzKZbD+c9zRchhUXzijvcp+pQ43u8cGUFklCJAp2WEm4GZk7Qdm9q+hG9iPHcghAikGz3rFuyQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TocCTFxc; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TocCTFxc"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso3123347a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744643721; x=1745248521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gy8LtRusG3LlBq4PRwJCXbC0Gt2r1lIPvShAadKH+1Y=;
        b=TocCTFxckJc66+Z2egwk7Qq4ygl5jTjJIXVkWZXmucJqY43ZEYolsdE1UwbMVIlGwH
         9THmDflcN8jCbBTzd7FMu8pmLtT1gyUoJaVrS5MzJyD+MTrIc906LD1qSbtHlvEHHutp
         eQOn5wJPyxTxXCp5o4/OEmLsZJ0AzoWvU+/eFO7anEtf75LopDLqguQK/oL59yTsgJOW
         9sgObJrv+WAOh3+yuOrqVcBe9BVpi2OTVHCFWtsaHlTTWCxdaiqGfDlcL7rgFRX52mdL
         5knBWw9qb0zjXjiyzdmdDIVR33glii3rNa3aD63nXyoy8jLyr405r2DyCEu5yACmF2jG
         suwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744643721; x=1745248521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gy8LtRusG3LlBq4PRwJCXbC0Gt2r1lIPvShAadKH+1Y=;
        b=Dr2oR4Kqd6Mih75XSB8qjG2d4WFi15+VaYDXrtrFO9qPk3jVOcAzgLPCMfi67CnbAW
         yQ5fBrwg5j89Iv9BpcbILTNNRB0jO0Amq6rGLcV1pPsTS3ZKKor/z3oCqlqqeYi0BKFW
         /ctH9ZwRMtibPt+toyxbjyO4t9MPt7S0PFk+B7xbuYHkcl+6pGAkyv/Wey7FRhle9Gqt
         ru8Q8iR+rd82Y6aocDN3HgHxXx8s7Vn+/aZoyKqQAMNkpmzQWmWS2npKkPSeWQrK3t1m
         POsH/+oIqZjkipgtuotvdpnkSb0Qp/+BMf+i4I6jhCmO2qtANczFxkmi9h8W/JmBoH/X
         W69Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvLL30uAg3RpQF7o7Cj0Cux7IRvsMfF9iCo+iOrMnHJteogzOwCqA4Hpe1VwwpiOhfsQC0IJYHIsXJ5s4=@vger.kernel.org
X-Gm-Message-State: AOJu0YylQgFJe4xyP+EHthRZ/7xtqx2BYr9XRAceCyv5Lq9oZyVbt7sQ
	9FVflVdNdTt0WJYWOJWcVFGWbYInGMWIZdeJvl1Wp8i56BI8nP5F0T0g/WubcaqRDIt68Hj5mLg
	veMAhMXmtVR+RoPMczowlRZ8uTl482GLHPZ+H
X-Gm-Gg: ASbGnctOicS3smXIO++Oul7tB+M9nhhEiROWxdsPfFYU8G64fNaX6Hnd72RUauLXJD+
	HSXkiSyR6K1IARi/LZ6pt2jUesduga/NvHXcd+Bp4SaCL/G2lowovdzKAcXjIffBNGFtFvOqq17
	mBmNW1J1RvCJ7gWLCvP5N1riNt769x03LQMUxaxN2b3XRz/cYsFtA=
X-Google-Smtp-Source: AGHT+IEyN9umKvcvvG9jl+UGRWtP+jSDs7xgWa5bCPLWbQU5lgk8rlLVjeQRX34opmLIjhMCnyLgpfJ0YerGivWS8Ng=
X-Received: by 2002:a17:90b:2246:b0:2fa:228d:5af2 with SMTP id
 98e67ed59e1d1-3082367cc9amr20123354a91.15.1744643720629; Mon, 14 Apr 2025
 08:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67f1c7df.050a0220.0a13.0256.GAE@google.com> <07a22812-4f5b-44e2-a4ce-ad0537934041@lucifer.local>
 <CANp29Y7TnFB9eTEDoG5gjoeEkv7mt4GXNYDRz7xnaOhGfcg84A@mail.gmail.com>
 <6efd1c14-2253-4b7d-a647-dce471ffff6f@lucifer.local> <CANp29Y56cNQDGG_0bZEzVedee_rcDKPs28kb=D0-0seRKpbrXA@mail.gmail.com>
 <f2d77295-ab4f-4557-81dd-40039754e643@lucifer.local>
In-Reply-To: <f2d77295-ab4f-4557-81dd-40039754e643@lucifer.local>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 14 Apr 2025 17:15:09 +0200
X-Gm-Features: ATxdqUGzTCtEoElu44Fv1yOe0ciF6LR2a2GwQlbUWnuf4NnPKVe4sOBeqep7vxs
Message-ID: <CANp29Y7b=KEA2M+acmCvt8bvKXRquTBztsD2726iZ94+rWw78g@mail.gmail.com>
Subject: Re: [syzbot] [mm?] general protection fault in mremap
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: syzbot <syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.com>, 
	Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz, 
	syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 7:30=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, Apr 09, 2025 at 04:57:48PM +0200, Aleksandr Nogikh wrote:
> > On Mon, Apr 7, 2025 at 12:28=E2=80=AFPM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > On Mon, Apr 07, 2025 at 12:13:19PM +0200, Aleksandr Nogikh wrote:
> > > > Hi Lorenzo,
> > > >
> > > > Thanks for looking at the report!
> > > >
> > > > On Mon, Apr 7, 2025 at 12:09=E2=80=AFPM 'Lorenzo Stoakes' via syzka=
ller-bugs
> > > > <syzkaller-bugs@googlegroups.com> wrote:
> > > > >
> > > > > I did actually try to mark this fixed, but apparently syz fix doe=
sn't work or
> > > > > doesn't prevent other syzbots from duplicating reports.
> > > >
> > > > This part is not very clear - why would #syz fix: title not work we=
ll here?
> > >
> > > Sorry for not being clear. What I mean is that I already did this on
> > > another thread with the same, duplicate, report - and then received t=
his
> > > one afterwards.
> > >
> > > This suggests to me that this does nothing, or does nothing useful at=
 least
> > > if other bots will just keep on reporting the same thing.
> >
> > When syzbot receives the #syz fix command, it keeps the bug open until
> > the fixing commit has reached all the kernel trees it fuzzes. After
> > that, if the bug is seen again, it's reported as a separate issue with
> > the (2) suffix, then (3), etc.
> >
> > If the bug manifested itself with different crash titles, marking just
> > one report as fixed won't affect others indeed - if syzbot knew they
> > were related, it would not have reported them separately.
>
> Yeah this is what I suspected. I mean you could take file/line, but then
> that'll vary at different merge commits potentially and it's clearly a
> non-trivial problem.
>
> >
> > What was the other thread/bug in this case? Maybe we could adjust our
> > kernel crash log parsing rules to prevent similar duplicates.
>
> The [0] referenced below. But not sure how easy it'd be to recognise.

Ah, right, it was already referenced in your email. Sorry, I didn't notice.

So I've taken a closer look at these two reports - it turns out that
the essential difference is that one was found on syzbot's gcc-based
instances and another was found on the clang-based ones. That leads to
slightly different function names, which confused syzbot.

I've filed https://github.com/google/syzkaller/issues/5940 to discuss
how to best address it.

>
> >
> > >
> > > I appreciate that recognising that it is the same issue might not be
> > > trivial, but obviously it's not a hugely great use of my time to repe=
atedly
> > > chase this stuff up when the fix is already upstream and I've already
> > > -manually- confirmed it works.
> > >
> > > My patience with it was somewhat eroded from my experience of telling
> > > syzbot in the previous thread [0] to re-test, twice, and it failing t=
o do
> > > so due to broken presumably VM images, leading to me having to manual=
ly
> > > test the same fix I already tested and fixed a while ago etc. etc.
> > >
> > > [0]: https://lore.kernel.org/all/bee2d5f5-db93-42f1-829e-3fd250649ca8=
@lucifer.local/
> >
> > FWIW the "unregister_netdevice: waiting for batadv0 to become free.
> > Usage count =3D 3" bug is discussed here:
> >
> > https://lore.kernel.org/all/CANp29Y5RjJD3FK8zciRL92f0+tXEaZ=3DDbzSF3Jrn=
VRGyDmag2A@mail.gmail.com/t/#u
> >
> > This is an actual bug in v6.15-rc1 that's plaguing Linux kernel
> > fuzzing on syzbot at the moment.
>
> Ugh well in that case apologies, I assumed some VM setup issue :)
>
> >
> > >
> > > We do very much appreciate syzbot reports, don't get me wrong here, b=
ut I
> > > do also have to partition my time somewhat :)
> > >
> > > So I'm afraid I can't promise to always do syz fix updates on this ba=
sis.
> >
> > Sure.
> >
> > Also please feel free to ping us whenever syzbot's behavior is annoying=
 you :)
>
> Cheers, you guys have always been responsive even when I grumble inanely =
:)
>
> Though you might get quite a few emails :P
>
> Mostly syzbot is really useful and has caught multiple very real things,
> but when it is noisy it can be pretty noisy :)
>
> Hopefully we can help sort out tractable problems, I guess we have to
> accept a certain amount of noise though as a biproduct.

Yes, we will unlikely ever reach 0% noise, but we could at least
address the most repetitive problems.

>
> But sure, will raise issues moving forward also!

Thanks!

>
> Cheers, Lorenzo
>
> >
> > --
> > Aleksandr
> >
> > >
> > > Cheers, Lorenzo
> > >
> > > >
> > > > >
> > > > > Anyway, this is fixed in commit 36eed5400805 ("mm/mremap: do not =
set
> > > > > vrm->vma NULL immediately prior to checking it"), was fixed a lon=
g time
> > > > > ago, as soon as reported, and it's been a matter of waiting for t=
his to
> > > > > land in Linus's tree.
> > > > >
> > > > > This is now fixed, upstream, and this report is - as a result - r=
edundant.
> > > > >
> > > > > Thanks, Lorenzo
> > > >
> > > > --
> > > > Aleksandr
> > > >
> > > > >
> > > > > On Sat, Apr 05, 2025 at 05:16:31PM -0700, syzbot wrote:
> > > > > > Hello,
> > > > > >
> > > > > > syzbot found the following issue on:
> > > > > >
> > > > > > HEAD commit:    a2cc6ff5ec8f Merge tag 'firewire-updates-6.15' =
of git://gi..
> > > > > > git tree:       upstream
> > > > > > console+strace: https://syzkaller.appspot.com/x/log.txt?x=3D11a=
b27cf980000
> > > > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dadf=
febefc9feb9d6
> > > > > > dashboard link: https://syzkaller.appspot.com/bug?extid=3D5250c=
4727db03e3436cc
> > > > > > compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binu=
tils for Debian) 2.40
> > > > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1=
693d404580000
> > > > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D178=
ac94c580000
> > > > > >
> > > > > > Downloadable assets:
> > > > > > disk image: https://storage.googleapis.com/syzbot-assets/8ecd23=
18067e/disk-a2cc6ff5.raw.xz
> > > > > > vmlinux: https://storage.googleapis.com/syzbot-assets/05691b820=
62c/vmlinux-a2cc6ff5.xz
> > > > > > kernel image: https://storage.googleapis.com/syzbot-assets/4698=
994e99d4/bzImage-a2cc6ff5.xz
> > > > > >
> > > > > > The issue was bisected to:
> > > > > >
> > > > > > commit d5c8aec0542e2d79b64de9089b88fabdebe05c1e
> > > > > > Author: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > > > Date:   Mon Mar 10 20:50:37 2025 +0000
> > > > > >
> > > > > >     mm/mremap: initial refactor of move_vma()
> > > > > >
> > > > > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D=
11ff2a74580000
> > > > > > final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D=
13ff2a74580000
> > > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=3D15f=
f2a74580000
> > > > > >
> > > > > > IMPORTANT: if you fix the issue, please add the following tag t=
o the commit:
> > > > > > Reported-by: syzbot+5250c4727db03e3436cc@syzkaller.appspotmail.=
com
> > > > > > Fixes: d5c8aec0542e ("mm/mremap: initial refactor of move_vma()=
")
> > > > > >
> > > > > > Code: 48 83 c4 28 c3 e8 17 1a 00 00 0f 1f 80 00 00 00 00 48 89 =
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> > > > > > RSP: 002b:00007fff0b8738c8 EFLAGS: 00000246 ORIG_RAX: 000000000=
0000019
> > > > > > RAX: ffffffffffffffda RBX: 00007fff0b8738d0 RCX: 00007f46ffb182=
e9
> > > > > > RDX: 0000000000003000 RSI: 0000000000001000 RDI: 0000200000ffc0=
00
> > > > > > RBP: 0000000000000001 R08: 0000200000ffa000 R09: 00007f46ffb800=
31
> > > > > > R10: 0000000000000000 R11: 0000000000000246 R12: 00007f46ffb836=
18
> > > > > > R13: 00007fff0b873aa8 R14: 0000000000000001 R15: 00000000000000=
01
> > > > > >  </TASK>
> > > > > > Oops: general protection fault, probably for non-canonical addr=
ess 0xdffffc0000000004: 0000 [#1] SMP KASAN NOPTI
> > > > > > KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000=
000027]
> > > > > > CPU: 0 UID: 0 PID: 5820 Comm: syz-executor115 Not tainted 6.14.=
0-syzkaller-12966-ga2cc6ff5ec8f #0 PREEMPT(full)
> > > > > > Hardware name: Google Google Compute Engine/Google Compute Engi=
ne, BIOS Google 02/12/2025
> > > > > > RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> > > > > > RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> > > > > > RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> > > > > > RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> > > > > > RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> > > > > > RIP: 0010:__do_sys_mremap+0x1392/0x15c0 mm/mremap.c:1784
> > > > > > Code: 0f 85 45 02 00 00 48 8b 04 24 c6 84 24 70 01 00 00 01 48 =
01 85 68 02 00 00 eb 9a e8 18 34 af ff 48 b8 04 00 00 00 00 fc ff df <80> 3=
8 00 0f 85 a7 01 00 00 48 8b 2c 25 20 00 00 00 31 ff 81 e5 00
> > > > > > RSP: 0018:ffffc900039dfd20 EFLAGS: 00010293
> > > > > > RAX: dffffc0000000004 RBX: ffff88802b765a00 RCX: ffffffff821183=
c6
> > > > > > RDX: ffff88805c7b8000 RSI: ffffffff820c0cb8 RDI: 00000000000000=
05
> > > > > > RBP: ffff8880341fb780 R08: 0000000000000005 R09: 00000000000000=
00
> > > > > > R10: 00000000fffffff4 R11: 0000000000000001 R12: 00000000000020=
00
> > > > > > R13: 1ffff9200073bfaa R14: 0000200000ffc000 R15: ffff88802b765b=
70
> > > > > > FS:  00005555814db380(0000) GS:ffff8881249b8000(0000) knlGS:000=
0000000000000
> > > > > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > > CR2: 00007fff0b8728e0 CR3: 000000007802e000 CR4: 00000000003526=
f0
> > > > > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000000=
00
> > > > > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000004=
00
> > > > > > Call Trace:
> > > > > >  <TASK>
> > > > > >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> > > > > >  do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
> > > > > >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > > > > > RIP: 0033:0x7f46ffb182e9
> > > > > > Code: 48 83 c4 28 c3 e8 17 1a 00 00 0f 1f 80 00 00 00 00 48 89 =
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> > > > > > RSP: 002b:00007fff0b8738c8 EFLAGS: 00000246 ORIG_RAX: 000000000=
0000019
> > > > > > RAX: ffffffffffffffda RBX: 00007fff0b8738d0 RCX: 00007f46ffb182=
e9
> > > > > > RDX: 0000000000003000 RSI: 0000000000001000 RDI: 0000200000ffc0=
00
> > > > > > RBP: 0000000000000001 R08: 0000200000ffa000 R09: 00007f46ffb800=
31
> > > > > > R10: 0000000000000000 R11: 0000000000000246 R12: 00007f46ffb836=
18
> > > > > > R13: 00007fff0b873aa8 R14: 0000000000000001 R15: 00000000000000=
01
> > > > > >  </TASK>
> > > > > > Modules linked in:
> > > > > > ---[ end trace 0000000000000000 ]---
> > > > > > RIP: 0010:vrm_uncharge mm/mremap.c:964 [inline]
> > > > > > RIP: 0010:expand_vma_in_place mm/mremap.c:1566 [inline]
> > > > > > RIP: 0010:expand_vma mm/mremap.c:1621 [inline]
> > > > > > RIP: 0010:mremap_at mm/mremap.c:1682 [inline]
> > > > > > RIP: 0010:do_mremap mm/mremap.c:1727 [inline]
> > > > > > RIP: 0010:__do_sys_mremap+0x1392/0x15c0 mm/mremap.c:1784
> > > > > > Code: 0f 85 45 02 00 00 48 8b 04 24 c6 84 24 70 01 00 00 01 48 =
01 85 68 02 00 00 eb 9a e8 18 34 af ff 48 b8 04 00 00 00 00 fc ff df <80> 3=
8 00 0f 85 a7 01 00 00 48 8b 2c 25 20 00 00 00 31 ff 81 e5 00
> > > > > > RSP: 0018:ffffc900039dfd20 EFLAGS: 00010293
> > > > > > RAX: dffffc0000000004 RBX: ffff88802b765a00 RCX: ffffffff821183=
c6
> > > > > > RDX: ffff88805c7b8000 RSI: ffffffff820c0cb8 RDI: 00000000000000=
05
> > > > > > RBP: ffff8880341fb780 R08: 0000000000000005 R09: 00000000000000=
00
> > > > > > R10: 00000000fffffff4 R11: 0000000000000001 R12: 00000000000020=
00
> > > > > > R13: 1ffff9200073bfaa R14: 0000200000ffc000 R15: ffff88802b765b=
70
> > > > > > FS:  00005555814db380(0000) GS:ffff8881249b8000(0000) knlGS:000=
0000000000000
> > > > > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > > CR2: 00007fff0b8728e0 CR3: 000000007802e000 CR4: 00000000003526=
f0
> > > > > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000000=
00
> > > > > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000004=
00
> > > > > > ----------------
> > > > > > Code disassembly (best guess):
> > > > > >    0: 48 83 c4 28             add    $0x28,%rsp
> > > > > >    4: c3                      ret
> > > > > >    5: e8 17 1a 00 00          call   0x1a21
> > > > > >    a: 0f 1f 80 00 00 00 00    nopl   0x0(%rax)
> > > > > >   11: 48 89 f8                mov    %rdi,%rax
> > > > > >   14: 48 89 f7                mov    %rsi,%rdi
> > > > > >   17: 48 89 d6                mov    %rdx,%rsi
> > > > > >   1a: 48 89 ca                mov    %rcx,%rdx
> > > > > >   1d: 4d 89 c2                mov    %r8,%r10
> > > > > >   20: 4d 89 c8                mov    %r9,%r8
> > > > > >   23: 4c 8b 4c 24 08          mov    0x8(%rsp),%r9
> > > > > >   28: 0f 05                   syscall
> > > > > > * 2a: 48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax <=
-- trapping instruction
> > > > > >   30: 73 01                   jae    0x33
> > > > > >   32: c3                      ret
> > > > > >   33: 48 c7 c1 b8 ff ff ff    mov    $0xffffffffffffffb8,%rcx
> > > > > >   3a: f7 d8                   neg    %eax
> > > > > >   3c: 64 89 01                mov    %eax,%fs:(%rcx)
> > > > > >   3f: 48                      rex.W
> > > > > >
> > > > > >
> > > > > > ---
> > > > > > This report is generated by a bot. It may contain errors.
> > > > > > See https://goo.gl/tpsmEJ for more information about syzbot.
> > > > > > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > > > > >
> > > > > > syzbot will keep track of this issue. See:
> > > > > > https://goo.gl/tpsmEJ#status for how to communicate with syzbot=
.
> > > > > > For information about bisection process see: https://goo.gl/tps=
mEJ#bisection
> > > > > >
> > > > > > If the report is already addressed, let syzbot know by replying=
 with:
> > > > > > #syz fix: exact-commit-title
> > > > > >
> > > > > > If you want syzbot to run the reproducer, reply with:
> > > > > > #syz test: git://repo/address.git branch-or-commit-hash
> > > > > > If you attach or paste a git patch, syzbot will apply it before=
 testing.
> > > > > >
> > > > > > If you want to overwrite report's subsystems, reply with:
> > > > > > #syz set subsystems: new-subsystem
> > > > > > (See the list of subsystem names on the web dashboard)
> > > > > >
> > > > > > If the report is a duplicate of another one, reply with:
> > > > > > #syz dup: exact-subject-of-another-report
> > > > > >
> > > > > > If you want to undo deduplication, reply with:
> > > > > > #syz undup
> > > > >
> > > > > --
> > > >
