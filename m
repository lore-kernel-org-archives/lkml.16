Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3AD1AAC4;
	Fri, 25 Apr 2025 02:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745547104; cv=none; b=C/Rv+v5WNkXsDp4HJUpc21ZOi/jNuXqTyMqIwHdS8y1z6srhn38HEjHLgT6AfgqM9FUTSZc7j2Wz2gf8xLD5DSCjABTVpGpUIwIFiGOBXcuAtY9MftZfX4sERfkRFNbres6O2NW5BIOqciXtGbdrrU63ABtgaXD24/7VsQqCyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745547104; c=relaxed/simple;
	bh=D2+vNAluRK4Dl/4yxS0rI+QGdXT+hzGHu9oUTwoSaGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ga1oBAn574PUzCB+9scbgVcgnXzmbC6UzyhXuSY3vCIgu5q96Alijtk61tYiQ7sjVgEFr6XRIoRelZ+7KHMStdpn0EAIRWuMKRvpTPVwOBKjaqKxmiq/xkpgjLjKfAxncIzr0fhnTvMETvto/t4RTDC6h19G84tLXjSsl8g62Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8GAz0Ci; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8GAz0Ci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86629C4CEE3;
	Fri, 25 Apr 2025 02:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745547102;
	bh=D2+vNAluRK4Dl/4yxS0rI+QGdXT+hzGHu9oUTwoSaGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8GAz0CiJC7ccRPuqlpa6/9AHElEWMOVKLgwHRbjy/V9X1agZ6mOu2MUJtZXR/gap
	 1t76HOrEi7FI5R/01w2SzJ0qRIs/WtAxMcUsSN5pXBffC2ErU0CwJNdwZ/T+OGROCE
	 UqBPVIWuHLHS+B3jMLHnHp5Z0UWWV0QF4OEcRefIGAQgnsmgNXOwVz5VSmwbobxCKr
	 N0z6kQgw7Bw2orp0BnF9An9X39m7YuzH7X9XGpIFgaU2xdSKkmYB3dnqYoQHLP70qX
	 6vQ7zkcyV3ojKLWl3n89w42ukyjJzT5okIs3XTZaZvxYxhRKOPCLVxkzPaHx4u71Bs
	 TuUpv6IGaptXw==
Date: Thu, 24 Apr 2025 21:11:38 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Adding __popcountsi2 and __popcountdi2
Message-ID: <20250425021138.GA3800209@ax162>
References: <20250425003342.GA795313@ax162>
 <CAHk-=whfT3A8K2Z+WbieGG5Hhc9QAT5s3qsbB19O0Roj2G5tfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whfT3A8K2Z+WbieGG5Hhc9QAT5s3qsbB19O0Roj2G5tfA@mail.gmail.com>

On Thu, Apr 24, 2025 at 06:36:33PM -0700, Linus Torvalds wrote:
> On Thu, 24 Apr 2025 at 17:33, Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > I figured added
> > these may not be as bad as the wcslen() case because most architectures
> > generally have an optimized popcount implementation and I am not sure
> > compiler builtins are banned entirely from the kernel but I can
> > understand if it is still contentious.
> 
> Why does the compiler even bother to do this if the architecture
> doesn't have the popcount instruction? The function call is quite
> possibly more expensive than just doing it the stupid way.

Not entirely sure what the motivation is from the compiler side but I
cannot immagine that they would be doing this if it was not more
efficient in some way.

> But if you want to do this, put the damn thing as an alias on the code
> that actually *does* the SW fallback in lib/hweight.c.
> 
> Because the way your patch does it now, it takes "I'm doing stupid
> things" to the next level by turning that function call into *two*
> function calls - first calling __popcountsi2, which then calls
> __sw_hweight32.
> 
> Let's not do stupid things, ok?

I will test declaring __popcount{s,d}i2() as aliases of
__sw_hweight{32,64}() to see what effect that has but I figured that
calling the __arch_hweight variants was more correct because some
architectures (at least RISC-V and x86 when I looked) use alternatives
in that path to use hardware instructions and avoid the software path
altogether. While there would still be the overhead from the function
call, I figured not using the software fallback would at least soften
that blow.

Cheers,
Nathan
