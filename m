Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED5922338
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173325; cv=none; b=F35LJii6+5bxlZJDU0hqwFHKkr2jsOImH9uwNwg2FVQropaU3dO3nCPYYJigKfP324yvV5eDHw6j1QwGOOB38x1ETR853ukgmT4uCbBTUAlfT2vPF8PoBIPBKjHxpNsq8IlAUlp6FTH7Ky+xhWm2m4bp6uJrikbwKLXZ9R77uGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173325; c=relaxed/simple;
	bh=wW8skg3zevd8ly6jlW+M7QoC/KYFAp67zo06skwUxNE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pZJLN74uTBQTPstT46Trh6uhaNdsYDgjl/fPY/lyiIa5CkvUGrMaej2xYoscpjrV4KYJg3cTVYTTJi2gvUCysPL4qAfOBcfB80hqf3/WU9/9y/mpFOsfAISa6BVky79cbJEhJ94m037mqEvBD0HUwGpAE+3tZbiDxHCK3JPv1HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 02C799200B3; Tue, 13 May 2025 23:55:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id EFC0A92009C;
	Tue, 13 May 2025 22:55:14 +0100 (BST)
Date: Tue, 13 May 2025 22:55:14 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
    Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
    Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
    "Ahmed S . Darwish" <darwi@linutronix.de>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    John Ogness <john.ogness@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
In-Reply-To: <a719b6ec1ccba2ecad7421a2cdf1660d1be16888.camel@physik.fu-berlin.de>
Message-ID: <alpine.DEB.2.21.2505131735170.46553@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk>  <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com>  <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk>  <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com>  <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local>
  <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk>  <20250506141631.GEaBoZvzPCWh88xDzu@fat_crate.local>  <alpine.DEB.2.21.2505062228200.21337@angie.orcam.me.uk>  <8C172B63-38E1-427B-8511-25ECE5B9E780@alien8.de>  <alpine.DEB.2.21.2505121225000.46553@angie.orcam.me.uk>
  <20250512134853.GGaCH8RUjJwgHq25qx@fat_crate.local>  <alpine.DEB.2.21.2505121810040.46553@angie.orcam.me.uk>  <CAADWXX8+-=pcOUeu_cwX_vkkkGp6jn0GQLUhZX8MxGGRjKz=Lg@mail.gmail.com> <a719b6ec1ccba2ecad7421a2cdf1660d1be16888.camel@physik.fu-berlin.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 May 2025, John Paul Adrian Glaubitz wrote:

> > >  Thank you.  It seems it'll be tough for me though to fulfil the GPG key
> > > trustability requirement.  While I've used PGP/GPG since 1995, I haven't
> > > been active collecting signatures with my more recent keys/IDs and neither
> > > I have appeared in public among Linux kernel developers often enough for
> > > me to be identified by face over a video call.  Oh well...
> > 
> > I don't think this has been insurmountable before, particularly for
> > anybody who has been around for as long as you have.  Even your
> > current email goes back to at least the beginnings of git.

 Hmm, a .mailmap artifact perhaps; I actually only switched to my current 
e-mail address back in 2021 once linux-mips.org has lost all the remaining 
credibility in my eyes.  There's exactly one "Patch-dusted-off-by:" commit 
using my yet earlier personal address, plus a bunch using my various old 
work addresses too.

 All the earlier work has been buried either in the linux-mips.org git 
repo, going back via conversion from CVS to:

commit 1513ff9b7899ab588401c89db0e99903dbf5f886
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Mon Nov 28 11:59:19 1994 +0000

    Import of Linus's Linux 1.1.68

(which I still do hope to fully recover and for which kernel.org seems to 
be the right ultimate haven), or in LKML and other mailing list archives.

 None of this however proves any GPG key offered is actually mine.

> > If "two decades+ of active kernel development involvement using the
> > same email address" doesn't make you eligible for a kernel.org
> > account, we're doing something wrong.
> 
> I agree. Maciej does a fantastic job saving old junk^W^Wretro hardware ;-).

 Thank you.  That makes two of us; the rest has switched to NetBSD.

> I'm sure there should be anyone in Maciej's area that could sign his keys.

 Undoubtedly, but finding someone local who has a kernel.org account and 
can actually tell I am who I claim I am will be rather tough, and trusting 
a government-issued ID alone may be questionable nowadays, as correctly 
observed in <https://korg.docs.kernel.org/accounts.html#pgp-web-of-trust>.

  Maciej
