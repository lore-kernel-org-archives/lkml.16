Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5F0275842
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539617; cv=none; b=ZlzxSOqaXy3So0TcCEHn5XjdGQT8nYl5u1SJZYeW8eOzUHR7fPSBkiFe0EWKKB/WPbyEysyRv/ruHwD135UMCMpzjSHyTioXgXkJTRZPEKn+5eS7j5zkk4A+FhTo873/pYooTksMV7ZDWQPVFX9xm4K3bCjsEM2vA3UpnnlQlLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539617; c=relaxed/simple;
	bh=DX/x94enC4P/KX0z1fsXERb8R01VLiG1dNw4utSS+Ps=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tfLtIEOFD332hihZampRQxfTfuMNCZbf5ChRD3hacVexYVBh/Pzd0SPdkTlgVH8ADgEjQq5OfrDbx7rF6m77j3JO83xtkbwr/bF/kuLdOfIPw5uPwLQz5CT8JyGH3QfI+N/qO+12+vIJEGgW/5BCe7qpWD8/aeggzmOTo3e+iA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 34FD292009C; Tue,  6 May 2025 15:53:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2E9C592009B;
	Tue,  6 May 2025 14:53:34 +0100 (BST)
Date: Tue, 6 May 2025 14:53:34 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
    "Ahmed S . Darwish" <darwi@linutronix.de>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    "H . Peter Anvin" <hpa@zytor.com>, John Ogness <john.ogness@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
In-Reply-To: <CAHk-=wicfBCyMj_x5BiL32o55jqXfnxgn=X5BZZjA-FFER82Jg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2505061104490.31828@angie.orcam.me.uk>
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <CAHk-=wicfBCyMj_x5BiL32o55jqXfnxgn=X5BZZjA-FFER82Jg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 May 2025, Linus Torvalds wrote:

> >  We also have platforms that lack atomics, let alone double-precision ones
> > and they're fine too, so why is x86 different?
> 
> So I don't know if you saw this thread:
> 
>    https://lore.kernel.org/all/202504211553.3ba9400-lkp@intel.com/
> 
> where I initially thought that it was the lack of TSC, but it looks
> like it's the CMPXCHG8B code that ends up causing problems.

 I did glance over (in my effort to process outstanding 40k mailing list 
messages in two days), but haven't spotted CMPXCHG8B being the culprit; 
thanks for the pointer.

> And the core issue boils down to "there's no point in wasting time on
> even debugging this".

 Sadly I tend to agree, being unable, owing to time constraints, to commit 
myself to doing such debugging (NB glibc verification crashes i386 Linux 
reliably on Pentium MMX, apparently due to FP context corruption, and I 
need to prioritise debugging that, once I've figured out which actual test 
case triggers it, as due to the oddity of the glibc test system it's quite 
tough getting the logs matched between the host and the target system).

> So basically, the support for i486 costs us more than it is worth.

 So the cost has to be reduced and just as I proposed on the previous 
iteration last year this can be solved quite easily without sacrificing 
i486 support by adding #UD handler for CMPXCHG8B, just as we did for 
analogous stuff with some RISC platforms years if not decades ago.

 I was told in said discussion that decoding x86 address modes was not as
easy as with RISC modes (thank you, Captain Obvious!), but still that 
boils down to indexing into registers by ModR/M and SIB bit-fields, with a 
couple of corner cases, which ought to be less than a screenful of code.  
If objdump(1) can do it, so can we.

 No i486 has ever run Linux SMP.  Back in the day I tried hard to chase by 
the spec a single i486 system built around the APIC and Intel MP Spec and 
could not find any.  Compaq had some proprietary stuff (Corollary bus?) we 
never had support for.  And we discarded support for the discrete i82489DX 
APIC years ago anyway that some Pentium systems used too for the original 
P5 microarchitecture or to go beyond dual.  So said emulation would have 
to handle the UP case only, which ought to be straightforward and well 
contained.

 Thoughts?

  Maciej
