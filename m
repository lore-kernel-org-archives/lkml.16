Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9373A1D52B
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 11:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749986715; cv=none; b=A5rhuUMv0+lnJrqBZoEiUIkniVMniJMRn9uIy3zjtXK4OSFUNaS6EFSN2dQXMESES/xgt0tL/wvwEnrIDVpSrfr0aWzmtckMG5auuuF/r8cBmPpBAx+D8SzXPcpNqG6KiS74lrA6V8Mt3TWnyyETMarBhTxRGHvlj8HT5coFEeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749986715; c=relaxed/simple;
	bh=dLLLbMw4ySVF6pq7jdmPz4/TfBd/tAp/3SZE2vYaPOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9nw/jBlQZleeH95+75El9d7IujajafAN5ffDMh6x31yf5r06nCkUB8f5Ob6bHATXWBIoDUDeQ3fjJNuKclmWksjMSL0ZPC8fd7IcYiJgGck2VvGtL6QLSp+ZZcS3C6lQIDdiD04oTMmszqrvHdTvMpEYA0o9CXh68rxZ9jr/F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8HcusNL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8HcusNL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7051DC4CEE3;
	Sun, 15 Jun 2025 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749986715;
	bh=dLLLbMw4ySVF6pq7jdmPz4/TfBd/tAp/3SZE2vYaPOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P8HcusNLz35jVPoR8R6gn7QN2rjBp8sMgUij3u1SvfMLQFvCl5lHorvensFtHp/XB
	 1gLYEjN+oMAacpWA2IQEiBeiN8q58pPVWC6ZvgircJtfkBjhHvEll6jztUPZHjp/P6
	 9wJJK78Sd4Zk79cKRGGkL9UI+UqQDV4U7dFILXvG+jG8SjZqcNv6je6TLfiv2k4FAp
	 jfFXUfmcd8qpjbryIjm26fmGnBgloxpufo6tzf0+8PztqffyPWpPL6vjjRcFHFs4O/
	 37jpxwZbKrFsWTQNKu8JyutfIKmhXkBWUFNnJPoMxspNxrXxUELkUxfKsaPhjn+HML
	 5daN6iCLvoY2g==
Date: Sun, 15 Jun 2025 13:25:09 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Brian Gerst <brgerst@gmail.com>
Cc: linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	=?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 03/13] x86/kbuild: Remove ancient 'arch/i386/' and
 'arch/x86_64/' directory removal 'archclean' target
Message-ID: <aE6tldAZUCnmXJcu@gmail.com>
References: <20250515132719.31868-1-mingo@kernel.org>
 <20250515132719.31868-4-mingo@kernel.org>
 <CAMzpN2jMYaF0eua8FoOPXR74yA62PBGK5f=QOBFYs2Z3O0BeUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMzpN2jMYaF0eua8FoOPXR74yA62PBGK5f=QOBFYs2Z3O0BeUg@mail.gmail.com>


* Brian Gerst <brgerst@gmail.com> wrote:

> On Thu, May 15, 2025 at 9:28 AM Ingo Molnar <mingo@kernel.org> wrote:
> >
> > We have to go back 17 years into Git history, to kernels that won't
> > even build or boot with modern build environments, to come across
> > the obsolete arch/i386/ and arch/x86_64/ directories.
> >
> > Remove some of their last functional residuals in the 'archclean' target.
> >
> > Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: David Woodhouse <dwmw@amazon.co.uk>
> > Cc: H. Peter Anvin <hpa@zytor.com>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > ---
> >  arch/x86/Makefile | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> > index 594723005d95..4e7ac5e4b537 100644
> > --- a/arch/x86/Makefile
> > +++ b/arch/x86/Makefile
> > @@ -348,10 +348,6 @@ $(orc_hash_h): $(srctree)/arch/x86/include/asm/orc_types.h $(orc_hash_sh) FORCE
> >  archprepare: $(orc_hash_h)
> >  endif
> >
> > -archclean:
> > -       $(Q)rm -rf $(objtree)/arch/i386
> > -       $(Q)rm -rf $(objtree)/arch/x86_64
> > -
> >  define archhelp
> >    echo  '* bzImage             - Compressed kernel image (arch/x86/boot/bzImage)'
> >    echo  '  install             - Install kernel using (your) ~/bin/$(INSTALLKERNEL) or'
> 
> This does not remove the code that actually creates these old symlinks:
> 
> $ ll arch/x86_64/boot/bzImage
> lrwxrwxrwx. 1 bgerst bgerst 22 Jun 13 13:06 arch/x86_64/boot/bzImage
> -> ../../x86/boot/bzImage

I've zapped this commit too.

Thanks,

	Ingo
