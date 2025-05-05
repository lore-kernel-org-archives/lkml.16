Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB9B2475C2
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450257; cv=none; b=PW/NWgI8rr90gnqnz3to1XljqvmP/oKd2sWw/EVocIAcCc0wl7U30HyHR9Gn2uLrjcU/nCHS9Whnlc2aOSAGvgZmo5RmuyI9Y7RSq1jMKNDCWr7W2uR5YVzIHF5EMcKO30cCdjlETqgLGuE8RGS328D7X244s5q1JDc3eaRjL3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450257; c=relaxed/simple;
	bh=qTEcIkgtXunXIbjrI9FUD7Q4MC8FSlx3/f2YHkOth2M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CQfKLLikIJsqpZ4OWJz/BqcZ6Jw8F2Xf4afPwQa28bBqpHOiBq4XqqPP9foOz3N+LwZEBa6W5b4+3cn9sB5Hf/QQey7ntV3aF5KZh039nP4zWr0xug/xwE/wdahFsJOyyNIwCpPUuO4sHCwsVsMGqexKLjrvGqjxTrJgm3ztpBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 237F192009C; Mon,  5 May 2025 15:04:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1C35692009B;
	Mon,  5 May 2025 14:04:12 +0100 (BST)
Date: Mon, 5 May 2025 14:04:12 +0100 (BST)
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
In-Reply-To: <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com>
Message-ID: <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk>
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 May 2025, H. Peter Anvin wrote:

> >>  > I really get the feeling that it's time to leave i486 support behind.
> >>  > There's zero real reason for anybody to waste one second of
> >>  > development effort on this kind of issue.
> >> 
> >> This series increases minimum kernel support features to include TSC and
> >> CX8 (CMPXCHG8B) hardware support, which removes 486 (and derivatives) support
> >> and early-586 (and derivatives) support.
> >
> > FWIW I'm not happy about that at the very least because this will prevent 
> >me from using my 486 box for EISA defxx driver maintenance.  What exactly 
> >is the problem with 486?
> >
> > I know the lack of TSC has security implications, but don't use the 
> >machine in a way for which it would be an issue and I don't expect anyone 
> >doing otherwise.  We have non-x86 platforms that lack a high-resolution 
> >timer and nobody's going to drop them.
> >
> > We also have platforms that lack atomics, let alone double-precision ones 
> >and they're fine too, so why is x86 different?
> 
> Why is x86 different? Because it is a tightly integrated platform with 
> code shared across a very large number of generations, without "silly 
> embedded nonsense hacks."

 Thank you for the clarification.  By "silly embedded nonsense hacks" I 
suppose you refer to missing instruction emulation, which some platforms 
do so as to contain legacy support in a single place and let the rest of 
the code base assume the required feature is there, relieving maintainers 
from extra burden, correct?

> I think if you have a use case, you need to speak up about it, rather 
> than for people to guess.

 Which I just did; I think that's exactly what an RFC is about, isn't it?

  Maciej
