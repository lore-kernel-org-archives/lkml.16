Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F78228F94A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747854317; cv=none; b=WApEjTSOuRmcSrBo5S3NHaBfitMkMIwTIzPFxL33sSJhvj2sunonCcbR+WnCtJlWnJIu7qxAOCv1DbaByfrWkli2TL5+jnkUfxLHfsDwj6IS03jEQz9rHmDoDjjzpxgI03tS9bdGaW4njx4or0pfBWfVxWdf9hbYqiofag+ys04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747854317; c=relaxed/simple;
	bh=rgaMuunKi09YdcNV69mUAN016StxVjPfUYpG4gHhuz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=baWPdGQ2Tok7OuXPdl0qm6kAKlUsXdOrtbBEPllkJbYD2/lK7F/y38dpLOSHWUHpPwTCa9DtNuiho3LINQqkDkfLuSAbfBcUc6j0d23ScU5vsZePrKbeUv17J3U+JTWwZiVKGmi6dBwtrC5Q3wP73MWI3TixW9VOWZWd2pFDI0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1tXz3PB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1tXz3PB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C941C4CEE4;
	Wed, 21 May 2025 19:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747854316;
	bh=rgaMuunKi09YdcNV69mUAN016StxVjPfUYpG4gHhuz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1tXz3PBMbqEZc/7DAtG2cLXHEygp/3vqnMXEj4jTlR0J46ZbO7QoFuO1qgmo7u2r
	 +ybpr/9mvcmpSII5VPIPEPc9sXO0kY5G2QvwVzv8VV8pTHdOEX312D0kgdS0Vc2PZs
	 HU9kEBPyDCXStxNCpWBYBM1CVfCGaHn1CJpDucp8V5K26jz99/UAM6gw6tEwJvELbC
	 f2xYFtroh2LgbaCsoxyTrkXmDqf80u9pbxgAc3vCDcqdE4cuE19HKwydM6+cMxECw4
	 u0uN9tpGF3GXstA9LHuVVOooiN1b/fWo0T9yLcqJC6T5LnZR/VnTn/z0YIWO+66Zue
	 aRvXvJORUg6lA==
Date: Wed, 21 May 2025 12:05:13 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: John <john.cs.hey@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: Re: [Bug] "BUG: soft lockup in perf_event_open" in Linux kernel v6.14
Message-ID: <27w4ljtexicir75kwsmacvwjhluqboaoo7wiertmt2i5ohgy2u@rfelfik46hmy>
References: <CAP=Rh=PtKsiXGLYeK5tr4LSw-AHJ6LM4kuTWR3Hs5sQQp02wCw@mail.gmail.com>
 <jnrnpz2sms365aleeowcwisbefiekvkhbd6s5x42z7wuqnfxcy@dr6tkjizp3v5>
 <CAHC9VhSD0VHyNK59991PJFp8qkzM=sAsNE9nG7M42xhER13csw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhSD0VHyNK59991PJFp8qkzM=sAsNE9nG7M42xhER13csw@mail.gmail.com>

On Wed, May 21, 2025 at 01:26:01PM -0400, Paul Moore wrote:
> On Wed, May 21, 2025 at 11:57 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > On Wed, May 21, 2025 at 09:49:41PM +0800, John wrote:
> > > Dear Linux Kernel Maintainers,
> > >
> > > I hope this message finds you well.
> > >
> > > I am writing to report a potential vulnerability I encountered during
> > > testing of the Linux Kernel version v6.14.
> > >
> > > Git Commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557 (tag: v6.14)
> > >
> > > Bug Location: 0010:orc_find arch/x86/kernel/unwind_orc.c:217
> > >
> > > Bug report: https://pastebin.com/QzuTF9kT
> > >
> > > Complete log: https://pastebin.com/XjZYbiCH
> > >
> > > Entire kernel config: https://pastebin.com/MRWGr3nv
> > >
> > > Root Cause Analysis:
> > >
> > > A soft lockup occurred on CPU#0 in the unwind_next_frame() function
> > > during stack unwinding triggered by arch_stack_walk().
> > > This was called in the middle of __kasan_slab_free() as part of RCU
> > > reclamation path (rcu_do_batch()), likely triggered by a SLAB object
> > > free in SELinux's avc_reclaim_node().
> > > The system was under heavy AVC pressure due to continuous audit and
> > > avc_has_perm() calls (e.g., from selinux_perf_event_open), leading to
> > > repeated avc_node allocations and reclamations under spinlocks.
> >
> > I'm out of the office but I couldn't help myself glancing at it.
> >
> > It looks like a deadlock in the selinux code.  Two of the CPUs are
> > waiting for a spinlock in avc_reclaim_node().  A third CPU is running in
> > avc code (currently context_struct_compute_av).
> >
> > Adding a few selinux folks.
> 
> Thanks Josh, although I'm looking at the three CPU backtraces you
> mentioned and I'm not sure it's a SELinux deadlock.  The two CPUs that
> are in avc_reclaim_node() are in the process of dropping their
> spinlocks (they are calling spin_unlock_irqrestore()) and the other
> CPU which is doing the permission lookup, e.g. the
> context_struct_compute_av() CPU, shouldn't be holding any of those
> spinlocks, although it should be in a RCU critical section.

Maybe it's not a deadlock, but avc_reclaim_node() does do a tight loop
of temporary spinlocks with some condition checks in between, with the
IRQs happening in spin_unlock_irqrestore() due to IRQs being temporarily
re-enabled.

I don't pretend to understand that code, but it does look suspicious
that two of the CPUs are running in that same avc reclaim loop (one of
which's IRQ is doing avc_node_free(), could that be a race?) and the
third CPU is also in AVC code.

So if not a deadlock, maybe some race condition.  Or maybe things slowed
to a crawl thanks to KASAN and the AVC-centric workload.

Regardless I do think it's unlikely to be the unwinder's fault here as
KASAN happens to do a lot of unwinds for allocations and frees.

-- 
Josh
