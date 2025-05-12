Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A29C296D2D
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747070980; cv=none; b=Kb/mivOGdTBBRGuhe8fHl5+Ew5sB2xMUy/YTH809bwVPLSS+azDiCsDgh9MISNS+m11FStn7YAnOxD2is+UFhiYj9wGFik4BNxNB0yWBJzXB4l8r6UpxC8990WVBAtdI5rGNDCwag0p/VkFPmPbz9COOiuCeeBZwKopl0ioTYec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747070980; c=relaxed/simple;
	bh=FmkWTTqowPBRt4Tt9JwzPDGpASwEBtN70+Plymxc0bo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ue0t9D7AnpwfNuvn1cL6y8e9JHhAh36wdWCj5AIyGzqI/YED6ypGzddSgoZcO9QWaS833A/9Cy2h+ZrZ1aAlToyQgoQZx3GolcIFb6K8IUl5gZftbUmqBzSMXDhHjYY/MXaSIQLWZsL/Zf+0uejYyKOLWvw6X3WhoDDYCN0GNeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 1770B92009C; Mon, 12 May 2025 19:29:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1165B92009B;
	Mon, 12 May 2025 18:29:36 +0100 (BST)
Date: Mon, 12 May 2025 18:29:35 +0100 (BST)
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
In-Reply-To: <20250512134853.GGaCH8RUjJwgHq25qx@fat_crate.local>
Message-ID: <alpine.DEB.2.21.2505121810040.46553@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com> <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk> <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com> <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local>
 <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk> <20250506141631.GEaBoZvzPCWh88xDzu@fat_crate.local> <alpine.DEB.2.21.2505062228200.21337@angie.orcam.me.uk> <8C172B63-38E1-427B-8511-25ECE5B9E780@alien8.de> <alpine.DEB.2.21.2505121225000.46553@angie.orcam.me.uk>
 <20250512134853.GGaCH8RUjJwgHq25qx@fat_crate.local>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 May 2025, Borislav Petkov wrote:

> >  Would kernel.org git infrastructure be available for such a project?
> 
> as in hosting your repo there?
> 
> I don't see why not:
> 
> https://korg.docs.kernel.org/accounts.html

 Thank you.  It seems it'll be tough for me though to fulfil the GPG key 
trustability requirement.  While I've used PGP/GPG since 1995, I haven't 
been active collecting signatures with my more recent keys/IDs and neither 
I have appeared in public among Linux kernel developers often enough for 
me to be identified by face over a video call.  Oh well...

  Maciej
