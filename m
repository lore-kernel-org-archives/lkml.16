Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60C71DEFE9
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 20:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750969093; cv=none; b=EfKPGgp053NXqaEvxotiJQ+MTKreiCCiDuJ8TpMUHzbYuHiIFcaBpJsfK9pBzNJw3tR56sBShDyPlArwSLmlCKTlR2QUEFKofkWvDSt7ZanfeCYnQ31p4vqCXoQP0WCVWajXZ7ujDhEE7zzOxAp5OEp5BjYJrQT/0Tra28M1h+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750969093; c=relaxed/simple;
	bh=aIRf0oseyZrQI43Sg+44ZR1Mrl8CCGzfg6802gOD/T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sg0q2Qw9ATyCDbuYL7yUSNbiHUI0JTuSFc0Gu+1SkV1kKmbM2E4uEHbNZopOYe5sg+7YRQMArh+0yyvepLGO9H3SMShBkzfJDY/ZDOAbe2bjxn4CW4pHKWNhPUib+QUd72cYYJiMJYtTCP5ys/RddE07a4jxhqETog9D0jRzHaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=l6quOM6g; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="l6quOM6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750969082;
	bh=aIRf0oseyZrQI43Sg+44ZR1Mrl8CCGzfg6802gOD/T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l6quOM6gzsLWg/lcI7yrOn1zwXhVzDiSEk2xCijsM/Tg2nkJFAlhwylTW6+dK7f65
	 cl6vNLnK5OLHXH/gn7BEnGMoy+nuG2sQKeY2aTcEBooyK9QtrilE1B1eoJr8QMeqsd
	 h4p8RtxGIFgC4lnJGj+VAlcuMOh3MdpjVwwa4LjM=
Date: Thu, 26 Jun 2025 22:18:01 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 3/3] tools/nolibc: add a new "install_all_archs"
 target
Message-ID: <92eda9ff-116e-4ec1-930c-7474da9652fc@t-8ch.de>
References: <20250620103705.10208-1-w@1wt.eu>
 <20250620103705.10208-4-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620103705.10208-4-w@1wt.eu>

On 2025-06-20 12:37:05+0200, Willy Tarreau wrote:
> This installs all supported archs together, both from nolibc and kernel
> headers. The arch-specific asm/ subdirs are renamed to asm-arch-$arch,
> and asm/ is rebuilt from all these files in order to include the right
> one depending on the build architecture.
> 
> This allows to use a single unified sysroot for all archs, and to only
> change the compiler or the target architecture. This way, a complete
> sysroot is much easier to use (a single directory is needed) and much
> smaller.
> 
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  tools/include/nolibc/Makefile | 39 +++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
> index 8de6ac5cec425..b6ed11d0b5419 100644
> --- a/tools/include/nolibc/Makefile
> +++ b/tools/include/nolibc/Makefile
> @@ -88,6 +88,7 @@ help:
>  	@echo "  headers_all_archs   prepare a multi-arch sysroot in \$${OUTPUT}sysroot"
>  	@echo "  headers_standalone  like \"headers\", and also install kernel headers"
>  	@echo "  help                this help"
> +	@echo "  install_all_archs   install a multi-arch sysroot + kernel headers in \$${OUTPUT}sysroot"
>  	@echo ""
>  	@echo "These targets may also be called from tools as \"make nolibc_<target>\"."
>  	@echo ""
> @@ -120,6 +121,44 @@ headers_all_archs:
>  	$(Q)cp --parents $(all_files) arch.h "$(OUTPUT)sysroot/include/"
>  	$(Q)cp $(addsuffix .h,$(addprefix arch-,$(nolibc_supported_archs))) "$(OUTPUT)sysroot/include/"
>  
> +install_all_archs: headers_all_archs
> +	@# install common headers for any arch, take them all. This will clear everything.
> +	$(Q)$(MAKE) -C $(srctree) ARCH=x86 mrproper
> +	$(Q)$(MAKE) -C $(srctree) ARCH=x86 headers_install no-export-headers= INSTALL_HDR_PATH="$(OUTPUT)sysroot"
> +	@# remove the contents of the unused asm dir which we will rebuild from the arch ones
> +	$(Q)rm -rf "$(OUTPUT)sysroot/include/asm"
> +	$(Q)mkdir -p "$(OUTPUT)sysroot/include/asm"
> +	@# Now install headers for all archs
> +	$(Q)for arch in $(patsubst aarch64,arm64,$(nolibc_supported_archs)); do \
> +		echo "# installing $$arch"; \
> +		if ! [ -d $(OUTPUT)sysroot/include/asm-arch-$$arch ]; then \
> +			$(MAKE) -C $(srctree) ARCH=$$arch mrproper; \
> +			$(MAKE) -C $(srctree) ARCH=$$arch headers_install no-export-headers= \
> +				INSTALL_HDR_PATH="$(OUTPUT)sysroot/include/$$arch" >/dev/null; \
> +			mv "$(OUTPUT)sysroot/include/$$arch/include/asm" "$(OUTPUT)sysroot/include/asm-arch-$$arch"; \
> +			rm -rf "$(OUTPUT)sysroot/include/$$arch"; \
> +			case "$$arch" in \
> +				arm)       cond="defined(__ARM_EABI__)" ;; \
> +				arm64)     cond="defined(__aarch64__)" ;; \
> +				loongarch) cond="defined(__loongarch__)" ;; \
> +				m68k)      cond="defined(__m68k__)" ;; \
> +				mips)      cond="defined(__mips__)" ;; \
> +				powerpc)   cond="defined(__powerpc__)" ;; \
> +				riscv)     cond="defined(__riscv__)" ;; \
> +				s390)      cond="defined(__s390__) || defined(__s390x__)" ;; \
> +				sparc)     cond="defined(__sparc__)" ;; \
> +				x86)       cond="defined(__i386__) || defined(__i486__) || defined(__i586__) || defined(__i686__) || defined(__x86_64__)";; \
> +				*)         echo "Unsupported arch" >&2; exit 1;; \
> +			esac;\
> +			for file in "$(OUTPUT)sysroot/include/asm-arch-$$arch/"*.h; do \
> +				base="$${file##*/}"; \
> +				( echo "#if $$cond"; \
> +				  echo "#include \"../asm-arch-$$arch/$$base\""; \
> +				  echo "#endif" ) >> "$(OUTPUT)sysroot/include/asm/$$base"; \
> +			done; \

I'm not a fan of the loop to build the ifdeffery. It is a duplication
of what we have in tools/include/nolibc/arch.h and horrible to look at.
Can we stick this into a reusable header file?
Something along the lines of this:

	/* asm/foo.h */
	#define _NOLIBC_PER_ARCH_HEADER "foo.h"
	#include "_nolibc_include_per_arch_header.h"


	/* _nolibc_include_per_arch_header.h */
	#if defined(__i386__)
	#include CONCAT("asm-arch-x86/", _NOLIBC_PER_ARCH_HEADER)
	#elif
	...

However, so far I couldn't get it to work.
Also it would be great if we can use it for the current arch.h, too.

> +		fi;\
> +	done
> +
>  # GCC uses "s390", clang "systemz"
>  CLANG_CROSS_FLAGS := $(subst --target=s390-linux,--target=systemz-linux,$(CLANG_CROSS_FLAGS))
>  
> -- 
> 2.17.5
