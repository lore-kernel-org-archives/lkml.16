Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCAF208CA
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539324; cv=none; b=pY9rerUB9jJG8QyW+Irmv1+dTSVbuVV9QzQW4dJhA230a5YP0T5PuqcSA7sbghLRUjxqf5tTPT+qo12Ci/QHmgDUhrCCqZVzfj1n5A4J/SzuKwhP0ho8QyuseDrtvoMSLX+AmqeVgepCJGpgUpop+ouy6IGYk29/0+lup0BdP2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539324; c=relaxed/simple;
	bh=trAzMXKXlgRtceqPV1ERmyexC67Fp7DuXfkdcBaLGZU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CAL5xmchhA8/uzcQyg+3ZZXVLZY6aaojqQkUW1NXepQN1YgwSoJocDyErolAPu1o9WT5lQcd6MmHAqsoHl2MYxQmxa0bfvCvKxS91OFkRAoGYhs+J43XD8y9ySR6wyFnGhV38ZDPVKuSKUzw2UlvdFXbDH3Rc9d55HtBx22ig28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 13E7292009C; Tue,  6 May 2025 15:48:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0DFA892009B;
	Tue,  6 May 2025 14:48:34 +0100 (BST)
Date: Tue, 6 May 2025 14:48:33 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "H. Peter Anvin" <hpa@zytor.com>
cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
    "Ahmed S . Darwish" <darwi@linutronix.de>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    John Ogness <john.ogness@linutronix.de>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
In-Reply-To: <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com>
Message-ID: <alpine.DEB.2.21.2505060106180.31828@angie.orcam.me.uk>
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com> <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk>
 <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 5 May 2025, H. Peter Anvin wrote:

> >> I think if you have a use case, you need to speak up about it, rather 
> >> than for people to guess.
> >
> > Which I just did; I think that's exactly what an RFC is about, isn't it?
> 
> No, with "silly embedded nonsense hacks" (Google for it) I mean ad hoc 
> hacks breaking the notion of a common platform.

 I don't feel like I'm the right person to talk about such stuff.  I've 
always cared about portability and standardisation.

 In fact running old hardware is one aspect of portability verification, 
for example I run PCIe stuff off my Pentium MMX and Alpha hardware, and 
conversely I run conventional PCI stuff off my POWER9 (no port I/O!) and 
RISC-V hardware.  That has triggered numerous bugs, fixed over the years.

> As far as EISA is concerned, could you go into more detail? What are the 
> remaining users of EISA? One thing that happened with i386 was that we 
> found out that the only remaining "users" were people dragging out an 
> old machine to test if the kernel still booted. With bigsmp we had 
> similar experiences – in at least one case we ended up maintaining 
> support for a system of which there were no machines left in 
> existence...

 Well, my i486 box is plain EISA, so naturally I need EISA support to run 
it:

platform eisa.0: Probing EISA bus 0
eisa 00:00: EISA: Mainboard AEI0401 detected
eisa 00:05: EISA: slot 5: DEC3002 detected
defxx: v1.12 2021/03/10  Lawrence V. Stefani and others
00:05: DEFEA at I/O addr = 0x5000, IRQ = 10, Hardware addr = 00-00-f8-xx-yy-zz
00:05: registered as fddi0
eisa 00:06: EISA: slot 6: NPI0303 detected
eisa 00:08: EISA: slot 8: TCM5094 detected
eth0: 3c5x9 found at 0x8000, 10baseT port, address 00:a0:24:xx:yy:zz, IRQ 12.
platform eisa.0: EISA: Detected 3 cards

(fddi0 is the fast intranet interface, eth0 is the slow external one).  
It's a luggable integrated computer BTW, a Dolch PAC 60, very nice and 
compact, previously used by a field engineer for network fault isolation.

 I've already mentioned the maintenance of the defxx driver (it is also an 
exercise in portability, with defxx supporting 3 host bus attachments).

 This is also my backup box for GNU toolchain (GCC/glibc/GDB) verification 
for the i386 target.  It has actually proved recently to still have some 
commercial relevance (again, for portability verification), but who says 
the use of Linux is supposed to be solely commercial even nowadays?

 The origin of Linux is obvious and I wouldn't be around at all let alone 
for so many years if not for my enthusiasm solely for the technical merit 
of Linux (following my earlier passion for processors and systems) 
accompanied by the fairness of the GNU GPL, with any commercial aspect 
being at most distantly relevant and a late comer into the game.

 So yes, count me in as a passionate systems software engineer with a 
fondness for running odd configurations for the sake of experimentation 
(and consequently a portability exercise) and please do not deprive me of 
my enthusiasm.

  Maciej
