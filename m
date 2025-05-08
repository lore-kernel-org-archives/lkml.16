Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C7126F478
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715897; cv=none; b=FqOqod+4Icn69RMCbHSIPXzN7oRecBvhaeWgyn/y3olUf2e6SnczmcKlbX3jhgGhIrilnCw0cuF+DPxax5milB73lwvqti1/aPgZrai91eIeWaSTQPi9mDVrNyrLI1MRCgUu6TmuNsentfKkC2y6lZ0IafQTvqlCJm2DIIiGAYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715897; c=relaxed/simple;
	bh=0rX2MpZ7h1KWbBVu9p5pM5Cpu/jNlATjNuO8xLlXn4M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kRyj2pUmkSyyKeJt4qHXr1aemhNVSfEJdcRybDDghdj4Us8cIa6IguTnMdxNjMfN9EKiHzbzpBFhttw09jfyKbpvwsAr4GiKoQ+ZLDQNM8hPu+gjZtaZkwPKcW462kHCxTxqXErucwLwwwHYnWKbk//ZN9vWmy7hq/6iywH6be8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 20ED492009C; Thu,  8 May 2025 16:51:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 19B7E92009B;
	Thu,  8 May 2025 15:51:27 +0100 (BST)
Date: Thu, 8 May 2025 15:51:27 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Borislav Petkov <bp@alien8.de>
cc: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>, 
    linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    John Ogness <john.ogness@linutronix.de>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
In-Reply-To: <20250506141631.GEaBoZvzPCWh88xDzu@fat_crate.local>
Message-ID: <alpine.DEB.2.21.2505062228200.21337@angie.orcam.me.uk>
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com> <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk> <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com>
 <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local> <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk> <20250506141631.GEaBoZvzPCWh88xDzu@fat_crate.local>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 May 2025, Borislav Petkov wrote:

> >  Doesn't work for ongoing driver maintenance
> 
> Dunno, I'd concentrate my efforts on something, a *little* *bit* more modern.
> At some point this is old rusty hw no matter from which way you look at it and
> it might as well be left to rest in its sunset days.

 One doesn't exclude the other.  I do POWER9 or RISC-V stuff too.  Isn't 
it modern enough?

> What I have problem with is wasting my time maintaining old, ancient hw which
> is not worth the electricity it needs to run. Especially if you can get
> something orders of magnitudes better in *any* aspect you can think of, and
> actually get some real work done.

 I don't want you let alone expect to waste time on anything you're not 
interested in.  I'm trying to find a solution that saves you from that 
while preferably keeping everyone happy enough, including myself.

 Real work?  I find engineering challenges enjoyable regardless of the age 
of hardware involved and I don't want to take away anyone's daily bread 
(including mine) by spending my free time on a project someone might have 
commercial interest in and should pay for.  An obsolete platform is ideal 
for this purpose.

 And what's better and what's not is subjective.  I don't find all the new 
stuff better, just as I don't all the old stuff.  At least the old gear 
tends to be sturdy (once you've contained issues with the PSU) and likely 
won't suffer from electromigration in a few years' time.  It can be easier 
to repair too if a component does fail.

 NB people also fancy old cars, or boats, or trains even, not because 
they're faster, more comfortable, or have any real advantage over modern 
alternatives.

  Maciej
