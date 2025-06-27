Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44521DDC18
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751001110; cv=none; b=sGyuaObqFkCbRXjvNhIU2dBlF0W5gL4qsPSacjionw4sUrkUqnMSxLgamCmJp2lCKBut9Goit3kqe7K5AvYkbbWP7l9rwotyJ4LuBecddd6pk39Ua5w0zackRDNNp3oBuA9UJRx5HGHNOqWHoy0fux3rNjdmXFtspoGD87a96FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751001110; c=relaxed/simple;
	bh=MJvRIhPa9PArrO7PG94uOGF9pwk6XLUMymLUuFR8d3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyXAws4vsOPOLAKHVKekKGs2dDOg6+IygJlFbmC2kX9n0wbyuj/FpwyBK8kIXysST5MhZ3sy/MUBEAJOtgzVSMIjFbkWyqHpbrq+bqcgUdap6MbKU0bH5lxCiokBgSWMv7FeZjhFtW22fRJ4w2ZkjGFQ1W/SPlGfYsI8bWH2PC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=a9Bk/ijF; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="a9Bk/ijF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751001106;
	bh=MJvRIhPa9PArrO7PG94uOGF9pwk6XLUMymLUuFR8d3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9Bk/ijFnQpWL7GCR4DrZ83hbmg1qjtU/zgLImzt0inXWZNATUvxyP81lWN/8LuDu
	 bsXCY2P6K9T8R8p+2GCNu0K+iGANnlvoBS2kFDpn170ksSF0Qwt36l6gLN8z8iOKkO
	 BH+gcSmMednHwwOhU7F3RyLTH4bdPQDE001U6q1c=
Date: Fri, 27 Jun 2025 07:11:45 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Willy Tarreau <w@1wt.eu>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RFC PATCH 3/3] tools/nolibc: add a new "install_all_archs"
 target
Message-ID: <89a2e713-edfd-4556-b321-cdccc3437a43@t-8ch.de>
References: <20250620103705.10208-1-w@1wt.eu>
 <20250620103705.10208-4-w@1wt.eu>
 <92eda9ff-116e-4ec1-930c-7474da9652fc@t-8ch.de>
 <b14da196-84cc-4d13-baa2-952ba22f5a3e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b14da196-84cc-4d13-baa2-952ba22f5a3e@app.fastmail.com>

On 2025-06-26 23:15:07+0200, Arnd Bergmann wrote:
> On Thu, Jun 26, 2025, at 22:18, Thomas Weißschuh wrote:
> > On 2025-06-20 12:37:05+0200, Willy Tarreau wrote:
> >> This installs all supported archs together, both from nolibc and kernel
> >> headers. The arch-specific asm/ subdirs are renamed to asm-arch-$arch,
> >> and asm/ is rebuilt from all these files in order to include the right
> >> one depending on the build architecture.
> >> 
> >> This allows to use a single unified sysroot for all archs, and to only
> >> change the compiler or the target architecture. This way, a complete
> >> sysroot is much easier to use (a single directory is needed) and much
> >> smaller.
> >> 
> >> +	$(Q)rm -rf "$(OUTPUT)sysroot/include/asm"
> >> +	$(Q)mkdir -p "$(OUTPUT)sysroot/include/asm"
> >> +	@# Now install headers for all archs
> >> +	$(Q)for arch in $(patsubst aarch64,arm64,$(nolibc_supported_archs)); do \
> >> +		echo "# installing $$arch"; \
> >> +		if ! [ -d $(OUTPUT)sysroot/include/asm-arch-$$arch ]; then \
> >> +			$(MAKE) -C $(srctree) ARCH=$$arch mrproper; \
> >> +			$(MAKE) -C $(srctree) ARCH=$$arch headers_install no-export-headers= \
> >> +				INSTALL_HDR_PATH="$(OUTPUT)sysroot/include/$$arch" >/dev/null; \
> 
> >
> > I'm not a fan of the loop to build the ifdeffery. It is a duplication
> > of what we have in tools/include/nolibc/arch.h and horrible to look at.
> > Can we stick this into a reusable header file?
> > Something along the lines of this:
> >
> > 	/* asm/foo.h */
> > 	#define _NOLIBC_PER_ARCH_HEADER "foo.h"
> > 	#include "_nolibc_include_per_arch_header.h"
> >
> >
> > 	/* _nolibc_include_per_arch_header.h */
> > 	#if defined(__i386__)
> > 	#include CONCAT("asm-arch-x86/", _NOLIBC_PER_ARCH_HEADER)
> > 	#elif
> > 	...
> >
> > However, so far I couldn't get it to work.
> > Also it would be great if we can use it for the current arch.h, too.
> 
> I'm not sure either of those is better than the version we
> had until commit f3c8d4c7a728 ("kbuild: remove headers_{install,check}_all").
> which simply relied on a symlink to the architecture specific
> directory to be set.

Thanks for the pointer, that probably answers the question if this could
be part of kbuild proper. It shouldn't.

With the symlink, a given generic UAPI tree can be specialized to one
specific architecture. But here we want to create a full sysroot that works
for all architectures *at the same time*. So a symlink would not be enough.

> If it's indeed possible to concatenate the path name (I couldn't
> figure that out either), that could also be done in place of the
> symlink but simpler than the #if/#elif/#elif/... block, like
> 
> #include <arch.h> // defines ARCH_PREFIX
> #include CONCAT(ARCH_PREFIX, ioctl.h)

If we can't get it to work like this I would still prefer to have a
template header file which gets specialized with sed instead of the
Makefile loop.


Thomas
