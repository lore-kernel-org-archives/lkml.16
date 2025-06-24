Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8775A372
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750746011; cv=none; b=eKZi+QUGSilUCHOpM8CD1grYOfEk9kXRhhTmDPZG2WsOqzqvdpiMOOv0PnwRGc7pUYsXbQoY0sy9BjlgwFpWk867luLsajINHWopRS4DEXpRaQyMOJ6JULzyen4dL85CLdCYg2QT2n05CHe8n6zUFvJ8dg8RHElR2FKDDVkvGN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750746011; c=relaxed/simple;
	bh=6ZtkA2ZD2ZFTX3/7xgHC8DSGJfP2ZnnhLb77TzVGUrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jemIQWyBjw8HFJIj34YlB3PI9tRFapkzvGgShXo5ITmLsfJPqg3T5uQYHK2oYdjc8x1GKEqlulXg6bJhrIxU+As5e542xXmw6Sh81hYZmbsdK8AG6cAMNlmxLEayCb1tDpSu4YMpG0Qlu1GcY1mi/OsXVv9zaQXm0sU3fO/fq68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55O6K3SJ030945;
	Tue, 24 Jun 2025 08:20:03 +0200
Date: Tue, 24 Jun 2025 08:20:02 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 2/3] tools/nolibc: add a new target
 "headers_all_archs" to loop over all archs
Message-ID: <20250624062002.GD30919@1wt.eu>
References: <20250620103705.10208-1-w@1wt.eu>
 <20250620103705.10208-3-w@1wt.eu>
 <4c48147d-aebc-4a2c-a60f-eba2e90584ed@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c48147d-aebc-4a2c-a60f-eba2e90584ed@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Thomas,

On Mon, Jun 23, 2025 at 11:56:29PM +0200, Thomas Weißschuh wrote:
> On 2025-06-20 12:37:04+0200, Willy Tarreau wrote:
> > This target allows to install the nolibc headers for all supported
> > architectures at once, just like it is in the development tree. This
> > is a first step to support full multi-architecture support.
> > 
> > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > ---
> >  tools/include/nolibc/Makefile | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
> > index 9197c79b267a4..8de6ac5cec425 100644
> > --- a/tools/include/nolibc/Makefile
> > +++ b/tools/include/nolibc/Makefile
> > @@ -23,6 +23,8 @@ else
> >  Q=@
> >  endif
> >  
> > +nolibc_supported_archs := aarch64 arm loongarch m68k mips powerpc riscv s390 sparc x86
> > +
> >  nolibc_arch := $(patsubst arm64,aarch64,$(ARCH))
> >  arch_file := arch-$(nolibc_arch).h
> >  all_files := \
> > @@ -83,6 +85,7 @@ help:
> >  	@echo "  all                 call \"headers\""
> >  	@echo "  clean               clean the sysroot"
> >  	@echo "  headers             prepare a sysroot in \$${OUTPUT}sysroot"
> > +	@echo "  headers_all_archs   prepare a multi-arch sysroot in \$${OUTPUT}sysroot"
> >  	@echo "  headers_standalone  like \"headers\", and also install kernel headers"
> >  	@echo "  help                this help"
> >  	@echo ""
> > @@ -110,6 +113,13 @@ headers_standalone: headers
> >  	$(Q)$(MAKE) -C $(srctree) headers
> >  	$(Q)$(MAKE) -C $(srctree) headers_install INSTALL_HDR_PATH=$(OUTPUT)sysroot
> >  
> > +# installs headers for all archs at once.
> > +headers_all_archs:
> > +	$(Q)mkdir -p "$(OUTPUT)sysroot"
> > +	$(Q)mkdir -p "$(OUTPUT)sysroot/include"
> > +	$(Q)cp --parents $(all_files) arch.h "$(OUTPUT)sysroot/include/"
> > +	$(Q)cp $(addsuffix .h,$(addprefix arch-,$(nolibc_supported_archs))) "$(OUTPUT)sysroot/include/"
> 
> IMO we could always just install all architecture headers.
> It's not much code after all.
> If it is a problem for a user they can either just delete the
> superfluous architectures or do 'mv arch-$foo.h arch.h; rm arch-*.h'.

I wanted to do that first, then thought that maybe some would like
to only install the nolibc headers because they already have the
UAPI headers from another source (local libc, distro packages,
toolchain etc). Even for us during nolibc development, not having
to iterate through all archs to reinstall everything is a huge time
saver.

However, I had another idea that floated in my mind, which is that
given that we're only saving a few small arch-* files by not
installing all archs all the time, maybe we should replace the
"headers" target to always install nolibc headers for all archs
like above, and keep the uapi headers install separate (only one
or all). This would remove the need for the target above whose
role is a bit ambiguous. What do you think ?

Thanks!
Willy
