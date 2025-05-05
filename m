Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88402F275C
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 23:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486799; cv=none; b=CBb1pENU0zSYDgxYKtWdPZ34d9VRi/GZCu0SJYAKHWaB1DYKcekwf7SZ73Ti5Ytw1zRWhjE85txfHzT6/ULEhB05kuw9M0ed2rhC2PPpLJBqgnzD/eJtANFEflTas3AEg6cCRR5tffRGWMF5Xc19pqD7EIWZ8J3TQ3xdoVEoYb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486799; c=relaxed/simple;
	bh=klT+e0G7GBgldQiw2Du9d6zSDr6XFN1S9BQ5CRt2ufc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=d7mHhWkijG4fhAvSsxabusjJMYEyiXEgLfH9SRNGkKxtiL9lj2VAkCe63aiEbAwj8O6CPkAS4u1VRm9nEiXf4WqJnriPYmKAmKk5t2wSWD0EwVTOBSII2SgfSBf+IsACsOqvdoOA5KeBkwKuzQhqwlM6S/2DBbc/vtT+V6zxHTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id C7D9E92009D; Tue,  6 May 2025 01:13:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C3B6392009C;
	Tue,  6 May 2025 00:13:13 +0100 (BST)
Date: Tue, 6 May 2025 00:13:13 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: Adding __popcountsi2 and __popcountdi2
In-Reply-To: <CAHk-=wiQN=jqK9n-mUEAD1Q36t-6d589M_rAG568pLq2KysJ5w@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2505052357091.31828@angie.orcam.me.uk>
References: <20250425003342.GA795313@ax162> <CAHk-=whfT3A8K2Z+WbieGG5Hhc9QAT5s3qsbB19O0Roj2G5tfA@mail.gmail.com> <20250425021138.GA3800209@ax162> <CAHk-=wjDV3nOK34rbU8bdo6OjM=KYoCN92=1eVEVFu=FQr8TNA@mail.gmail.com> <alpine.DEB.2.21.2505051543470.31828@angie.orcam.me.uk>
 <CAHk-=wiQN=jqK9n-mUEAD1Q36t-6d589M_rAG568pLq2KysJ5w@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 May 2025, Linus Torvalds wrote:

> > > Once you have the overhead of a function call - and all the register
> > > games etc that involves, you're almost certainly better off with the
> > > simple unconditional bitwise games.
> >
> >  Unless optimising for size, which we do support.
> 
> I think you missed the part where I said
> 
>  "But if you want to do this, put the damn thing as an alias on the code
>   that actually *does* the SW fallback in lib/hweight.c."
> 
> IOW, what I object to is being *stupid* and doing *two* function
> calls. It sure as hell doesn't optimize for size.

 Sure, I only commented on whether or not to have entry points defined in 
the link for libcalls that GCC emits whenever it produces a `popcount' 
operation it cannot find a machine description pattern for (IOW a machine 
instruction or a favourable sequence of).

 They need to have specific names a per the subject and it's up to us to 
implement them one way or another should we choose to; and as I say it 
seems not unreasonable to me for GCC to emit these libcalls at least when 
optimising for size.

 Traditionally we have chosen not to implement double-precision division 
libcalls so as to trap expensive usage.  For `popcount' I have no opinion 
offhand.

  Maciej
