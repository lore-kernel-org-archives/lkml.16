Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F262528F51E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747862166; cv=none; b=MPAv2pjLINrAj8euN0pwDoEosL9sN6L2Ix52dhf67hHh5yiHDypMbvdsh+/sRd3UD9B1ODJ9bbHMTWO53vLB7SqxgXq6qwYgMNm3kx/A47jLisiB/kt8qoQnXz4tubvDzrdaTDq/DObThormcSpWAADCbY3XwsqjsOhW5H5cM6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747862166; c=relaxed/simple;
	bh=+uHTsxf0kpAeHkP0CgUMQZmXQgCWNa40qNNDJmVnOdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUmOkbyKnnCuM2YXyTSjLjCc9qSVShFi9GLUhWW1UCLYxnx0dpdpv06tfJvin9GYV7X0nIHEZ642TWuj0+A3s3L0Ubk1akN+A9KkLiLr2k+JN351QT4vhxmfQQK2kjSnAW0VQokguPlZb4ennWrX3Cek7YewfxFuGAxKNY0JkCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Xy6wwhgK; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Xy6wwhgK"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7b962a156cso3841360276.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747862164; x=1748466964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uk5ADmEEbojLF9vw+PT8fW0QwTlaN6bVu+m3RHjqe/Q=;
        b=Xy6wwhgKL5L5ltPaI56DvXjhhYnxNDLOxgZhmhePlNhVSakIxGh4cfub9cRX4C/f+q
         66uDUDtMPMHX4gUgWspze26TnukU1aRlWj7dR7hUBc6uP3WZtvFKmeVemvZtf/rEkziy
         LIfhNN08e/EdWH+iuxITZQiVp9vX3wh8k1MRen88FCAIQWekFx/VN+qeO/HyYYw8VLqU
         5wxAznBjPsVQxEQRmGUaozJRxifKe/WDOQg227U+MlIebFF0h6/QeaVSvD540YP16fiD
         yiC3EsCbMYo08m6A1hqmpIAGveBoG9XqQTEfnRc8tgCBAoo551efFA+lS3AyNTr7Hyt9
         pdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747862164; x=1748466964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uk5ADmEEbojLF9vw+PT8fW0QwTlaN6bVu+m3RHjqe/Q=;
        b=jogsRMKoB757fLYFSOosOmxy5vShqfEuUWc81A/PTV5B5Er5O8+qeaPbdAnhojua4D
         GnqFw1GlyCi98xgpiHwNmY97pKd3O2V9IlIvQ3PO+jH+6nSku8F6KrX4NfpH0GxNMV8Q
         su5HjwFBvHIChmY+mCIHC756CfMYEG2ixsAdX9kj2FeLEYkRZI5Fm628ZJz2OSpJMcFd
         ltQDVMfIG4FK0Xy2peR0ZDVmI9Xw8+n7tCBEJYRgaR4mdnfvA2WXXJJnOfuJMuDEMOIV
         Q/CzaSy50XiaUf9GpNIa1yqd7KjESIvTnBFjzTF3WeFaq11wcnOEfLQi+LetSdF+r8lp
         oRJg==
X-Forwarded-Encrypted: i=1; AJvYcCUt6QwOtoIjI1xT1n17j/DUFdzdgV0x87dJ5Gf0T9514fvNdtpc2/ColylNJRiWtA6BpMA2tGtPgsRVY0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnMBOOpyUTnB42xp3bDyMV+oD7S8j4+B68JU9dixr8zRmQG96x
	xqqKz4DF+XDoGnWnKxLxUR1nP96ZtAjAuMPrRhnoxJatq2XcNZxFifootPB0HPjGzu/MI9N/NBz
	dkNN63Ttm5szRMxV4yHbRAqblqntsgJ1rOUUdiPq2
X-Gm-Gg: ASbGncs7pmmlAVrWZYP13ThGZJNBd5gdGz2Oy5aeTqrgcmy5iQh3/6xAoeRE8FHDOaa
	pRbE8Yp7H2j2YTHQBel/qe0k2rocpIlTgyB1vB0qBxLu9BlOOr4Sftvu1botoBIEAnaPC1GkpBZ
	0I12T25a5+qO5vcWr/CS1pUrdOTksYXwnq
X-Google-Smtp-Source: AGHT+IG6lbG8HsDZriLVu/vkA1R9DjldLzxZ5hbwC/JSuhHIFOleESitoJLV9on+A1MIJHCeG83IWKFRGjHXfEBXvMU=
X-Received: by 2002:a05:6902:1242:b0:e7d:6b43:2447 with SMTP id
 3f1490d57ef6-e7d6b4332damr1336161276.21.1747862163761; Wed, 21 May 2025
 14:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAP=Rh=PtKsiXGLYeK5tr4LSw-AHJ6LM4kuTWR3Hs5sQQp02wCw@mail.gmail.com>
 <jnrnpz2sms365aleeowcwisbefiekvkhbd6s5x42z7wuqnfxcy@dr6tkjizp3v5>
 <CAHC9VhSD0VHyNK59991PJFp8qkzM=sAsNE9nG7M42xhER13csw@mail.gmail.com> <27w4ljtexicir75kwsmacvwjhluqboaoo7wiertmt2i5ohgy2u@rfelfik46hmy>
In-Reply-To: <27w4ljtexicir75kwsmacvwjhluqboaoo7wiertmt2i5ohgy2u@rfelfik46hmy>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 21 May 2025 17:15:52 -0400
X-Gm-Features: AX0GCFt4iYJdyPEMNu8Q-vzyNASdTPYutb8bS5Uo82uTLqcWTkqU4Y26Apn_JM4
Message-ID: <CAHC9VhRyQZRQ+2zWUZzYZyp64FUnVPiL8_rDq3VOowwu+yFB_w@mail.gmail.com>
Subject: Re: [Bug] "BUG: soft lockup in perf_event_open" in Linux kernel v6.14
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: John <john.cs.hey@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Stephen Smalley <stephen.smalley.work@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 3:05=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
> On Wed, May 21, 2025 at 01:26:01PM -0400, Paul Moore wrote:
> > On Wed, May 21, 2025 at 11:57=E2=80=AFAM Josh Poimboeuf <jpoimboe@kerne=
l.org> wrote:
> > > On Wed, May 21, 2025 at 09:49:41PM +0800, John wrote:
> > > > Dear Linux Kernel Maintainers,
> > > >
> > > > I hope this message finds you well.
> > > >
> > > > I am writing to report a potential vulnerability I encountered duri=
ng
> > > > testing of the Linux Kernel version v6.14.
> > > >
> > > > Git Commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557 (tag: v6.14)
> > > >
> > > > Bug Location: 0010:orc_find arch/x86/kernel/unwind_orc.c:217
> > > >
> > > > Bug report: https://pastebin.com/QzuTF9kT
> > > >
> > > > Complete log: https://pastebin.com/XjZYbiCH
> > > >
> > > > Entire kernel config: https://pastebin.com/MRWGr3nv
> > > >
> > > > Root Cause Analysis:
> > > >
> > > > A soft lockup occurred on CPU#0 in the unwind_next_frame() function
> > > > during stack unwinding triggered by arch_stack_walk().
> > > > This was called in the middle of __kasan_slab_free() as part of RCU
> > > > reclamation path (rcu_do_batch()), likely triggered by a SLAB objec=
t
> > > > free in SELinux's avc_reclaim_node().
> > > > The system was under heavy AVC pressure due to continuous audit and
> > > > avc_has_perm() calls (e.g., from selinux_perf_event_open), leading =
to
> > > > repeated avc_node allocations and reclamations under spinlocks.
> > >
> > > I'm out of the office but I couldn't help myself glancing at it.
> > >
> > > It looks like a deadlock in the selinux code.  Two of the CPUs are
> > > waiting for a spinlock in avc_reclaim_node().  A third CPU is running=
 in
> > > avc code (currently context_struct_compute_av).
> > >
> > > Adding a few selinux folks.
> >
> > Thanks Josh, although I'm looking at the three CPU backtraces you
> > mentioned and I'm not sure it's a SELinux deadlock.  The two CPUs that
> > are in avc_reclaim_node() are in the process of dropping their
> > spinlocks (they are calling spin_unlock_irqrestore()) and the other
> > CPU which is doing the permission lookup, e.g. the
> > context_struct_compute_av() CPU, shouldn't be holding any of those
> > spinlocks, although it should be in a RCU critical section.
>
> Maybe it's not a deadlock, but avc_reclaim_node() does do a tight loop
> of temporary spinlocks with some condition checks in between, with the
> IRQs happening in spin_unlock_irqrestore() due to IRQs being temporarily
> re-enabled.
>
> I don't pretend to understand that code, but it does look suspicious
> that two of the CPUs are running in that same avc reclaim loop (one of
> which's IRQ is doing avc_node_free(), could that be a race?)

The two CPUs in avc_reclaim_node() don't seem to be that odd, the
system's SELinux access vector/decision cache is full and the code is
purging some old entries so new entries can be added.  There is a
window where the AVC on one CPU can decide it needs to free some room
in the cache and start that process, but before it can actually make
progress on that and make some space another CPU also hits the AVC and
decides it needs more room.

The system does seem to be undergoing churn with respect to the AVC,
and if KASAN is enabled that likely adds an additional burden to all
of the AVC operations.  The avc_reclaim_node() code tries to empty up
to AVC_CACHE_RECLAIM/16 cache entries at a time, presumably to limit
the amount of time the per-bucket spinlock is held.  Without knowing
more about the reporter's system, it is hard to say for certain, but
it is possible that the AVC_CACHE_RECLAIM limit is too high given the
workload, KASAN, and other factors.  The fact that the lockup is
hitting when the CPU is trying to drop the spinlock and the IRQs are
firing tells me that the reclaim limit isn't too far off; it would be
interesting to see how much time the CPU spent processing the IRQs, I
wonder if that is a significant contributor.

We could make the reclaim limit smaller, but that would potentially
create more work for systems that can handle the current
AVC_CACHE_RECLAIM value, and it is worth noting that we haven't seen
widespread problem reports like this so I'm somewhat hesitant to start
messing with this limit.  Has anyone seen similar reports lately?

I imagine we could also do something to limit the number of CPUs
simultaneously trying to reclaim AVC space, but I don't think that's
the real problem here.

> ... and the third CPU is also in AVC code.

It is passing through the AVC/cache code and is querying the SELinux
policy directly because the requested access decision result is not
currently cached in the AVC.  As mentioned previously, this CPU
shouldn't be holding any SELinux/AVC related locks, although it is in
a RCU critical section.

> So if not a deadlock, maybe some race condition.  Or maybe things slowed
> to a crawl thanks to KASAN and the AVC-centric workload.
>
> Regardless I do think it's unlikely to be the unwinder's fault here as
> KASAN happens to do a lot of unwinds for allocations and frees.

--=20
paul-moore.com
