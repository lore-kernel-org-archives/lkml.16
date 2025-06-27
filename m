Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964DB8BEC
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750994787; cv=none; b=PiqVbyQYDGsrcoPdEYzuMD1jkbR1PyeYJOqoB+vNOCP3O5rcRSf3qIH6/lxuWDX7Oc7eYcM6mVDHRvNL87hWrnm2UcwGKV5KULl6SvkBqXcUnvetSwweGqDVeKmEQJAUZ5E3A+uqmVSHCL1kU+8ektw0i8ZzizQ8501haqjynLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750994787; c=relaxed/simple;
	bh=nbcxj2HwxVXW/AcNNNnyvVd/3Eu6o1vR/wr1lQYDeUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YI1th4VkpZoVJ2o98iVXyC3Q+Rj5aQFjoR5LsbqAKJtiv2g9IVfXntqWKR2GKGso+PmqagyDo07+Ix/zaH/v/sxbAJCPUGsDT3YbHmwr6DFwLI+9aq0JwKS0d43tFpbxd/YMXLOnDfjneNnsF4o6eQDBWy0SJi8b6FcYXAYBjzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55R3Ppb5004330;
	Fri, 27 Jun 2025 05:25:51 +0200
Date: Fri, 27 Jun 2025 05:25:51 +0200
From: Willy Tarreau <w@1wt.eu>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RFC PATCH 3/3] tools/nolibc: add a new "install_all_archs"
 target
Message-ID: <20250627032551.GA4224@1wt.eu>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b14da196-84cc-4d13-baa2-952ba22f5a3e@app.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Jun 26, 2025 at 11:15:07PM +0200, Arnd Bergmann wrote:
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
> 
> If it's indeed possible to concatenate the path name (I couldn't
> figure that out either), that could also be done in place of the
> symlink but simpler than the #if/#elif/#elif/... block, like
> 
> #include <arch.h> // defines ARCH_PREFIX
> #include CONCAT(ARCH_PREFIX, ioctl.h)

I have never found how it would be possible to do that, let alone in a
more or less portable way, because #include doesn't take a C-string in
argument but a special syntax which is specific to it ("x" or <x>). It
doesn't support concatenating strings for example:

  #include "stdio"".h"

  $ gcc -E inc.h
  inc.h:1:17: warning: extra tokens at end of #include directive
      1 | #include "stdio"".h"
        |                 ^~~~
  inc.h:1:10: fatal error: stdio: No such file or directory
      1 | #include "stdio"".h"
        |          ^~~~~~~

Willy
