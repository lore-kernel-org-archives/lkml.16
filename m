Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6D827605F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715906; cv=none; b=TA/lttjRHkf8iFSLI9SK2l7I/Fm1H1e93PSnUO0UYJczZptkvMCmpy4PiZx6enKdXBmvp7ZHNYo2wNT/i1nUs4dYxSQcQoF67JwwnSf2NGW+UaJ3cBd89MCP3WHP0BQ+vDg4UNGJZQOJQwGMO7u0D8ixT/2llpwcd4VuCVAKAm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715906; c=relaxed/simple;
	bh=dv9G/jpRvgyddCILSX9zx5JXHZTeh7tKiJtjEkIXFPw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IIsi+e2LPymSawhqxOcALTI81ZX4H3GQBnqyGijcidPelSLyfTvvO1iOxaFgRNi1RhM7W1h9SNLIejntFbFZjgmfa6lfM9cnar+V7fFjENbXxVGsul36z6n5BJe7V/iMtliBdNdfYu2wgpelYlUKser1CbSLIpLdjiQbMln+di8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id E0A8792009C; Thu,  8 May 2025 16:51:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id DC64E92009B;
	Thu,  8 May 2025 15:51:42 +0100 (BST)
Date: Thu, 8 May 2025 15:51:42 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "H. Peter Anvin" <hpa@zytor.com>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
    "Ahmed S . Darwish" <darwi@linutronix.de>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    John Ogness <john.ogness@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
In-Reply-To: <A5AC3B8B-335C-4594-B0DC-D9247B286A37@zytor.com>
Message-ID: <alpine.DEB.2.21.2505062253240.21337@angie.orcam.me.uk>
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <CAHk-=wicfBCyMj_x5BiL32o55jqXfnxgn=X5BZZjA-FFER82Jg@mail.gmail.com> <alpine.DEB.2.21.2505061104490.31828@angie.orcam.me.uk>
 <A5AC3B8B-335C-4594-B0DC-D9247B286A37@zytor.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 6 May 2025, H. Peter Anvin wrote:

> > No i486 has ever run Linux SMP.  Back in the day I tried hard to chase by 
> >the spec a single i486 system built around the APIC and Intel MP Spec and 
> >could not find any.  Compaq had some proprietary stuff (Corollary bus?) we 
> >never had support for.  And we discarded support for the discrete i82489DX 
> >APIC years ago anyway that some Pentium systems used too for the original 
> >P5 microarchitecture or to go beyond dual.  So said emulation would have 
> >to handle the UP case only, which ought to be straightforward and well 
> >contained.
> 
> However, building a #UD instruction emulator is a project in itself that 
> someone would have to take on. It isn't inherently simpler – quite the 
> opposite – than the alternatives calling to a stub function than we have 
> now.

 Perhaps my RISC background makes me view instruction emulation as simpler 
than patching code.  It has been common throughout computing history too.  
In any case it would contain all the handling in a single function called 
from the generic #UD exception handler, something that could be `if 
(IS_ENABLED(CONFIG_M486))' and therefore completely ignored for all the 
newer platforms, and leaving the rest of the kernel code exactly the same 
as we now have for CMPXCHG8B platforms.

 My x86-fu is a bit rusty and surely I'm not familiar with all the recent 
features, however I retain my 20+ years of past experience, most recently 
with interfacing Atom systems via a JTAG probe to GDB over the remote 
serial protocol (which did include writing instruction emulation in the 
debug stub, specifically for MOV to/from debug registers or you wouldn't 
be able to run e.g. BIOS initialisation with the debugger attached due to 
the general-detect fault), and the i486/Pentium stuff is contemporary to 
my experience, so writing such an emulation handler shouldn't be a big 
deal to me.

 Note that we'll only have to emulate it for the kernel itself, so the 
emulation won't have to handle all the obscure corner cases, such as 
16-bit address modes, odd segment prefixes, or VM86 mode.

> We have the tools to do it; there is now a full x86 instruction decoder 
> in the kernel that one could use to do this, but...
> 
> a. Someone would have to take it on;
> b. It will need continuous testing;
> c. That someone would *also* have to go through the additional effort of 
>    keeping the mainline code clean for the maintainers of the modern 
>    hardware.

 I'd expect instruction emulation code to be zero-maintenance effort.  We 
have had such bits in the MIPS platform and they haven't been touched in 
decades.  It's not like machine instruction interpretation is ever going 
to change.  And none of the x86 maintainters will have to care whether it 
actually works, as nobody will see any adverse effect *unless* they build 
an i486 kernel *and* actually run it on an i486 both at a time.  Anything 
newer just won't ever trigger it.

> And at some point we will be at a point where we were with i386 that the 
> only users are occasional testers.

 I agree that the lack of the WP bit with the original i386 CPU was a real 
showstopper and a maintenance nightmare, and still having code to handle 
that misfeature would surely be a security hell nowadays too, so it had to 
go as soon as feasible.  As a nice side effect it let us get rid of the 
287/387 PC/AT-specific handling mess.

> With regards to EISA, you still haven't clarified if there is a true use 
> case or if this is a museum/nostalgia project. There isn't anything 
> *wrong* with museum projects, not at all (I recently got to play 
> SPACEWAR! on a real PDP-1; it was amazing) but imposing a maintenance 
> burden on the mainline developers of one of the most heavily used 
> architecture on the planet is not practical.

 There is no commercial value and no use case beyond making sure all the 
pieces involved continue to run.  You can call it a museum/nostalgia 
project if you prefer; for me it's the usual engineering challenge as 
with everything I do around Linux.

 As already stated in my reply to Borislav I don't want to put any burden 
on any maintainers and I'm trying to reduce it to zero while not losing 
the features.  The lone presence of a piece of code isn't a burden unless 
you actually have to do anything about it.

 I realise it's easier done with a niche kernel architecture than with one 
of the mainstream ones.

> If someone really wanted to, they could maybe fork off, say, arch/i486 
> and maintain the a version of the kernel limited to these old machines, 
> but it would require someone being willing to do the work.

 There's willingness and there's the availability of resources.  If it's 
say 2KiB worth of source code difference that you don't have to look at 
unless you run the platform that needs it, I'd argue I could maintain it, 
but question whether it's worth forking in the first place rather than 
keeping it in the main repo.

  Maciej
