Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D204024E4AA
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746457509; cv=none; b=Fe2v45GK1lbhjlc/QrgbHJQguoCirBYIRZvBacygDDEUEAg1GNdraITjSd2t/1/JtK2k1NuZut23LsIRxjC6o6rz2RiSRXGAMFa8kcD08VHgDTC+vrQkiEa1z/a/h+u8C0IpILpXqSN+SjZ66LdxtZgB1Gky1RBL85dmAO9rEXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746457509; c=relaxed/simple;
	bh=FV8Tejqc6V6+uOqyC0GpdhpV7MI/2Ee8pALjv1APlhw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Um5ImZDYZi2qMkt6pA48EvtLZQJe+lCikC6Gq1BHNlJ0uPN4gxTIom6DdzeT8Wv2tywOB2ERHDxngqW8CwVrfdnZ8lu/bGGSYiAVrhmDTQDmrE1ZZKoiB5kE3hOUKDd222RAptIQwi2QvqTzBFcHNmzjj+I3YYwBC/KNyoqYHsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5014492009C; Mon,  5 May 2025 17:05:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 4904692009B;
	Mon,  5 May 2025 16:05:06 +0100 (BST)
Date: Mon, 5 May 2025 16:05:06 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: Adding __popcountsi2 and __popcountdi2
In-Reply-To: <CAHk-=wjDV3nOK34rbU8bdo6OjM=KYoCN92=1eVEVFu=FQr8TNA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2505051543470.31828@angie.orcam.me.uk>
References: <20250425003342.GA795313@ax162> <CAHk-=whfT3A8K2Z+WbieGG5Hhc9QAT5s3qsbB19O0Roj2G5tfA@mail.gmail.com> <20250425021138.GA3800209@ax162> <CAHk-=wjDV3nOK34rbU8bdo6OjM=KYoCN92=1eVEVFu=FQr8TNA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Apr 2025, Linus Torvalds wrote:

> > I will test declaring __popcount{s,d}i2() as aliases of
> > __sw_hweight{32,64}() to see what effect that has but I figured that
> > calling the __arch_hweight variants was more correct because some
> > architectures (at least RISC-V and x86 when I looked) use alternatives
> > in that path to use hardware instructions and avoid the software path
> > altogether. While there would still be the overhead from the function
> > call, I figured not using the software fallback would at least soften
> > that blow.
> 
> Once you have the overhead of a function call - and all the register
> games etc that involves, you're almost certainly better off with the
> simple unconditional bitwise games.

 Unless optimising for size, which we do support.

 Adding another function call to a non-leaf function is usually cheap on 
RISC platforms as a stack frame must have been created already, so the 
instructions required have taken their space anyway.  For a leaf function 
-- it depends, but in the cheapest case it's 5 instructions total: 2 pairs 
to adjust SP both ways and to save/restore the link register respectively, 
plus one for the actual call.  The result may still be smaller than an 
open-coded variant.

 I have no opinion though on providing libgcc replacement functions to 
satisfy libcalls for -Os builds.

  Maciej
