Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE9372617
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750751168; cv=none; b=jaflj4Bk/4l/LLMYsc4yV4Ff7z84GZu8xLx2EOfgGGPugVb3xnfgAveFjl03/EQTKN7ATW9S9Vw1fCgTam0U0n08sxP/5S44OXRRccoj+DPR5e0hh48fNn3mP6Ln536WcFmCJ1EfipkyWxoGjYVh6bZn+mGtXrlJw3urhnnp7Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750751168; c=relaxed/simple;
	bh=vlL/YfOAh6ZfyEaYxM/VBBUTlhM3GzXsVMD5GoAJ7Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejcvWEnLmngKmD/fYfNo8LNqn6fcza7Cx+rRqZqrO3Eff79BsDvdPq0XVGXYGpPhNIC/COetqJnzqz3RaEEn3ia7sfTiYlXpExTMSuXa0bRHpyGEwjJakYAesL8zqBalu3skuqpAG09C719aLuRVUjykyRgo8kvQplNL2pZHBl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=kU1rFC9u; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="kU1rFC9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750751160;
	bh=vlL/YfOAh6ZfyEaYxM/VBBUTlhM3GzXsVMD5GoAJ7Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kU1rFC9ugJyr0FZotbyThQpa7ifP7PNoPaACC3KeLBVxUad+HDSGs/T9vWaPioaTB
	 mOyBAzsonASxGpM0Jj88DMRC72Krimpz3UrdQv2gkr2Ch4fo86rJZ3DFeglyvHX33h
	 gP0Bnq8N3MDV3DnIilImV35+hYB6VIfjOYlCcYHs=
Date: Tue, 24 Jun 2025 09:46:00 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 2/3] tools/nolibc: add a new target
 "headers_all_archs" to loop over all archs
Message-ID: <a7bf2a5f-1d72-460e-8cff-1c7e31bda3c8@t-8ch.de>
References: <20250620103705.10208-1-w@1wt.eu>
 <20250620103705.10208-3-w@1wt.eu>
 <4c48147d-aebc-4a2c-a60f-eba2e90584ed@t-8ch.de>
 <20250624062002.GD30919@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624062002.GD30919@1wt.eu>

On 2025-06-24 08:20:02+0200, Willy Tarreau wrote:
> On Mon, Jun 23, 2025 at 11:56:29PM +0200, Thomas Weißschuh wrote:
> > On 2025-06-20 12:37:04+0200, Willy Tarreau wrote:
> > > This target allows to install the nolibc headers for all supported
> > > architectures at once, just like it is in the development tree. This
> > > is a first step to support full multi-architecture support.
> > > 
> > > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > > ---
> > >  tools/include/nolibc/Makefile | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
> > > index 9197c79b267a4..8de6ac5cec425 100644
> > > --- a/tools/include/nolibc/Makefile
> > > +++ b/tools/include/nolibc/Makefile
> > > @@ -23,6 +23,8 @@ else
> > >  Q=@
> > >  endif
> > >  
> > > +nolibc_supported_archs := aarch64 arm loongarch m68k mips powerpc riscv s390 sparc x86
> > > +
> > >  nolibc_arch := $(patsubst arm64,aarch64,$(ARCH))
> > >  arch_file := arch-$(nolibc_arch).h
> > >  all_files := \
> > > @@ -83,6 +85,7 @@ help:
> > >  	@echo "  all                 call \"headers\""
> > >  	@echo "  clean               clean the sysroot"
> > >  	@echo "  headers             prepare a sysroot in \$${OUTPUT}sysroot"
> > > +	@echo "  headers_all_archs   prepare a multi-arch sysroot in \$${OUTPUT}sysroot"
> > >  	@echo "  headers_standalone  like \"headers\", and also install kernel headers"
> > >  	@echo "  help                this help"
> > >  	@echo ""
> > > @@ -110,6 +113,13 @@ headers_standalone: headers
> > >  	$(Q)$(MAKE) -C $(srctree) headers
> > >  	$(Q)$(MAKE) -C $(srctree) headers_install INSTALL_HDR_PATH=$(OUTPUT)sysroot
> > >  
> > > +# installs headers for all archs at once.
> > > +headers_all_archs:
> > > +	$(Q)mkdir -p "$(OUTPUT)sysroot"
> > > +	$(Q)mkdir -p "$(OUTPUT)sysroot/include"
> > > +	$(Q)cp --parents $(all_files) arch.h "$(OUTPUT)sysroot/include/"
> > > +	$(Q)cp $(addsuffix .h,$(addprefix arch-,$(nolibc_supported_archs))) "$(OUTPUT)sysroot/include/"
> > 
> > IMO we could always just install all architecture headers.
> > It's not much code after all.
> > If it is a problem for a user they can either just delete the
> > superfluous architectures or do 'mv arch-$foo.h arch.h; rm arch-*.h'.
> 
> I wanted to do that first, then thought that maybe some would like
> to only install the nolibc headers because they already have the
> UAPI headers from another source (local libc, distro packages,
> toolchain etc). Even for us during nolibc development, not having
> to iterate through all archs to reinstall everything is a huge time
> saver.
>
> However, I had another idea that floated in my mind, which is that
> given that we're only saving a few small arch-* files by not
> installing all archs all the time, maybe we should replace the
> "headers" target to always install nolibc headers for all archs
> like above, and keep the uapi headers install separate (only one
> or all). This would remove the need for the target above whose
> role is a bit ambiguous. What do you think ?

That is exactly what I tried to express :-)


Thomas
