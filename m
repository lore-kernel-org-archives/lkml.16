Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8C82741CB
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715992; cv=none; b=ZqN0M8YZHoAO+IHMAq6g46whMmAH97XZ9vXMrvlg/9vfYFZtV9qd1EqxHf7M6Tr43qnJ8GW7a1hl59Bh3gUMsOTqUXu11KlMfMEHNuuWCJgFkR0kyZXzKponAPpnGpQlIekbdEacIiqFk/ImUZTS3TzO0bwf4ZGQ8yRfYssL87Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715992; c=relaxed/simple;
	bh=dY6PQ8wf2SxhjmjTpHtT7MCQRc196ur0uJ4Zhkehbhw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CINkgUqRB+/WWaD1JuTVj/OrSWQWBZ965rOOl4XlwNms4Q3BDMUFAJcTW91DWRmql50qrtGkYgmsAjkSoajx2g15UxxVQHqagyE5/G+m3nnFnGK1HdR5cJOHTyfMuatPBHVdSjlEAC+gJJH3tW7v/lng3f7Y3xxSaVTrzvVR9AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C18C992009C; Thu,  8 May 2025 16:53:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id BA28992009B;
	Thu,  8 May 2025 15:53:09 +0100 (BST)
Date: Thu, 8 May 2025 15:53:09 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>, 
    linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    John Ogness <john.ogness@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
In-Reply-To: <CAHk-=wjCiEk-kc-vOug2GKJdhHKce3vWALbqjybLPcKLHNmEbQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2505062256170.21337@angie.orcam.me.uk>
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <CAHk-=wicfBCyMj_x5BiL32o55jqXfnxgn=X5BZZjA-FFER82Jg@mail.gmail.com> <alpine.DEB.2.21.2505061104490.31828@angie.orcam.me.uk>
 <A5AC3B8B-335C-4594-B0DC-D9247B286A37@zytor.com> <CAHk-=wjCiEk-kc-vOug2GKJdhHKce3vWALbqjybLPcKLHNmEbQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 May 2025, Linus Torvalds wrote:

> > a. Someone would have to take it on;
> > b. It will need continuous testing;
> > c. That someone would *also* have to go through the additional effort of keeping the mainline code clean for the maintainers of the modern hardware.
> 
> I think the main issue is "when problems happen, people who
> *shouldn't* have to care get reports".

 FWIW I can't agree more here.

> I really think that the way forward is basically what we did for ia64:
> get rid of i486 support in mainline, and people who care about i486
> can maintain a smallish patch that basically keeps it alive for them.
> 
> Because I suspect that the "patch to keep it working in practice" is
> likely going to remain pretty small: it's the silly cmpxchg helper
> wrappers, it's disabling ARCH_USE_CMPXCHG_LOCKREF, and probably a few
> X86_FEATURE_CX8 tests.

 Why would these have to be disabled if we have CMPXCHG8B emulation?  Yes,
performance won't be stellar, but we talked it through already in the 
context of my recent EV4 Alpha effort.  People ran FPU emulation back in 
the day too rather than using soft-float, which would have surely reduced 
the handling overhead.

> And it probably (a) works fine and (b) won't be code that changs very
> much upstream, so maintaining it outside the main tree is likely not a
> lot of work.

 Conversely dropping support for a subtarget in the kernel will likely 
prompt the removal on the userland side, namely glibc, which will only 
complicate things.

> But because it's outside of the main tree, it won't cause pointless
> noise from 0day bots etc, and won't affect people who care about
> modern machines. And it can do various hacky things because the patch
> would *only* be used by people who actually run on an i486-class
> machine.

 This is a fair point, although I'm not sure why the bots are expected to 
complain about a piece of code once it's settled and does not change.  I 
can't recall any mailing list traffic about MIPS instruction emulation for 
legacy systems (and we made it a part of the uABI even) in what? -- 20 
years or so.

 And I'd prefer to stay away from hacks even at the cost of performance.  
I don't find the emulation of CMPXCHG8B and maybe RDTSC if really needed 
(possibly in a trivial way, such as returning an incrementing software 
counter) a hack, but evolution.  It has happened before.

> (Ok, if you actually care about the i486SX, the patch will be much
> bigger, because it will have that whole FPU emulation code in it)

 FWIW I'm fine to see FPU emulation code go, especially as it's something 
that can be sorted in the userland for the so inclined.  Or you can run a 
soft-float userland, for example in the form of a GCC multilib just as 
done with numerous targets.

  Maciej
