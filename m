Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D544278775
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716084; cv=none; b=CIN24tv0mhLb4e/JzBoe2MTlegmBYhYsb7YkdDuS2nYjfxvvSuwQs7bATDmmDcHsk1QQH8LYVtor3FAAzOjZLUtAyLO7AWSTqSgl4cnxCdNGc5qjA9yX+LLu42Pci/cYBOUpstVoqP5O24XKB8pZ/S9Ynu6bUVwsB6v31wdduFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716084; c=relaxed/simple;
	bh=ERnxOn7Ui2iw4/oK7ARuw/higQNdBw+7jP5Yrcb601o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=T2mlRN50TAWKbGeXXZdknjHE8Kfepmuo+AjWBOsCq6NdK64m39s0CVZL6kGtzIBjmjMB93W8CGZ04WiO93T1P6OOzvHxQIpSRkaQpcJE/gY17qiIQeZF7kGC6cMXfp46QCg0YEMydIQvGqFZTGXuJAL/LKDYE7GMAYcFgFrRWoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 447CD92009C; Thu,  8 May 2025 16:54:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 3D45892009B;
	Thu,  8 May 2025 15:54:42 +0100 (BST)
Date: Thu, 8 May 2025 15:54:42 +0100 (BST)
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
In-Reply-To: <A50E7745-759B-462D-BA7C-C9F747070F91@zytor.com>
Message-ID: <alpine.DEB.2.21.2505062301010.21337@angie.orcam.me.uk>
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <CAHk-=wicfBCyMj_x5BiL32o55jqXfnxgn=X5BZZjA-FFER82Jg@mail.gmail.com> <alpine.DEB.2.21.2505061104490.31828@angie.orcam.me.uk>
 <A5AC3B8B-335C-4594-B0DC-D9247B286A37@zytor.com> <CAHk-=wjCiEk-kc-vOug2GKJdhHKce3vWALbqjybLPcKLHNmEbQ@mail.gmail.com> <A50E7745-759B-462D-BA7C-C9F747070F91@zytor.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 May 2025, H. Peter Anvin wrote:

> An i486/i586 retroport can presumably also axe a bunch of things like 
> side channel mitigations; most of them aren't applicable to the in-order 
> i486/586 pipelines and the rest ... well, on a machine that slow, you 
> are unlikely to be running the kind of workloads that care.
> 
> Similarly, you should be able to simply unsupport the things that make 
> the entry/exit code a nightmare, like SYSENTER and fancy NMI hacks (the 
> latter requires an APIC.)

 I do have a dual i586 with an APIC; used it to work on some NMI watchdog 
stuff that landed in mainline 25+ years ago.  Back in the day such systems 
were pretty common, built around the NX or later the HX chipset, so it's 
not that APIC support is irrelevent could be dropped.  If we were to go 
for a separate port, than stuff could potentially be resurrected too that 
was previously removed, such as discrete i82489DX APIC support.

 NB that box actually still runs some server software I need for my lab 
(MOP daemon, needed to netboot various DEC equipment) that I haven't 
ported to POWER9 owing to higher priority items.

> There is a huge gap then to the i686, with the i686 being the direct 
> ancestor of the x86-64 systems in terms of systems architecture (APIC, 
> PAE*, etc; SYSENTER in the second iteration; a general tightening of the 
> ISA definition; PCI universal by then...)

 I suspect eventually we'll want to drop all IA-32 support from mainline; 
isn't it of no commercial relevance already?  Hasn't even the embedded x86 
ecosystem switched to 64-bit Atom and the like?

 Actually I think a project to maintain the whole IA-32 platform alive 
rather than just the i486 subtarget might attract more attention and 
people beyond just myself and Adrian.  So far I've committed to support 
across the board (Linux where applicable and the GNU toolchain) for DEC 
Alpha, MIPS and VAX platforms plus a couple of small pieces such as the 
defxx driver and I can hardly cope already, so taking on another large 
project just won't work if I were alone with it.

> But again, this is all academic unless someone steps up and wants to 
> take on such a project.

 Correct, I just want to keep support to the minimum at the moment.

  Maciej
