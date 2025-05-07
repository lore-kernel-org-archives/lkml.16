Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6311E1A841B
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599711; cv=none; b=cMeV5pVlLMJZdew85hukthZXMFD8Nq8YCa6WRpWXO9fe55Pf79/XnVk6agMujkkwMc6G9SpGc8sxAHmndoXUuFWICIxSnGgxxWNYyADrqotd041wMs7TBqCQiOBSYUDSGBdDKYG0GGbXVxnwRkbGlcO7I1GBp9y7zNafAeZ03UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599711; c=relaxed/simple;
	bh=aw40nhVq4qGCb1FGtJLCrkrXQEqvvRfwD3kXfxz9VU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fF5ocBdnHwT+WSTip92oW+jecTjLFgb/QsHOFcyNph0KE9o8AXSikXoRizIFSDOg0nuj4avYICuZ3eyjSD+XhZJbQFDIOr5SCixv6VRMAUAgkdP3IDWT99hiGjZ4Dh0X8Gz5xwipu86dPBSbuDZaAfdZflxuv29YEpyEK7Pru6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFnCL0ta; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFnCL0ta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F23BC4CEE7;
	Wed,  7 May 2025 06:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746599710;
	bh=aw40nhVq4qGCb1FGtJLCrkrXQEqvvRfwD3kXfxz9VU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFnCL0taaEa1cy4cOV2pECs3UQInUbvEt5yJP50ku4p4re7ZvbCUuxnI17XiNgZ1C
	 CqUf5zqyL2UUFMzfJtVf8nypWA62jxVMPEZzq6exDiTnW/6tt86kTQhAjzGbjMn8AR
	 BVAH4UVrXsytFhuqdWCdzVOE+5K54ZgTTnncRbTTVyUyDzuGcvv1GEt6Ka1h939zEQ
	 lc9Op8rwgZRNC4pz3qQcltAedez8135qze74Tf2Zndlmq3NvpOZvwdUMZBjTZtzGDf
	 vv1e+06X4ilMNp7vRf8SQUiziItjBMtTT4Xc5tLHSKNrRWfu+c5oT/ju1Zz+NXNXFq
	 vHzglZgwNLF4g==
Date: Wed, 7 May 2025 08:35:05 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 04/15] x86/kbuild: Introduce the 'x86_32' subarchitecture
Message-ID: <aBr_GZ9P7k_I7RU6@gmail.com>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-5-mingo@kernel.org>
 <cd541739-4ec5-4772-9cef-e3527fc69e26@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd541739-4ec5-4772-9cef-e3527fc69e26@app.fastmail.com>


* Arnd Bergmann <arnd@arndb.de> wrote:

> On Tue, May 6, 2025, at 19:09, Ingo Molnar wrote:
> > 
> >  # Additional ARCH settings for x86
> > -ifeq ($(ARCH),i386)
> > +ifeq ($(ARCH),x86_64)
> >          SRCARCH := x86
> >  endif
> > -ifeq ($(ARCH),x86_64)
> > +ifeq ($(ARCH),x86_32)
> > +        SRCARCH := x86
> > +endif
> > +ifeq ($(ARCH),i386)
> >          SRCARCH := x86
> >  endif
> 
> Would it be possible to just remove the entire SRCARCH hack for x86? 
> It's not clear from the changelog what the intention was in 2007 when 
> it was added, but my impression was that this should be a temporary 
> workaround to users doing 'make defconfig' on i386 would still get a 
> 32-bit config by default and didn't have to change there scripts.

Correct, this was done during the x86 unification: a significant number 
of kernel developers were still using 32-bit x86 systems, and they 
expected the host architecture to be used by default like it was when 
it lived in arch/i386/.

Ie. it was a 'seamless x86 unification' build feature.

I'd be glad to add a tested patch for SRCARCH hack removal, which 
should simplify things a bit.

> Also, I don't think there are any systems that return 'x86_32' from 
> 'uname -m', so your added special case would never be used by 
> default, only when cross-compiling from some other architecture.

No, on most 32-bit systems 'uname -m' returns 'i686', which we cannot 
use straight away anyway. And it looked a bit silly to me for us to 
fudge over the architecture from 'i686' to 'i386', when we haven't 
supported i386 for quite some while and are now working on i486 
removal...

Let's just have x86_32 as the internal primary subarchitecture name, 
with support for historic aliases like 'i386'. That it cleans up things 
for defconfig naming is a bonus.

Thanks,

	Ingo
