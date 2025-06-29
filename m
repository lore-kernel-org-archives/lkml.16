Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92921E0DE3
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751229875; cv=none; b=iB+LQhRVMJFAOXg2dU2zGdT6zs/mKNWvl79UfnCp6CZBhgH0u9XRHc4DLhEyxxdsfPAxXd9w+3lorDDo81dwVDnXifgL9d5aZeHqOtmw2CPLamDp3fK/EjsMBaYjXCRfkNW7gryODJeqqVFxrK+od/XO/NgNV+1+bq0Hoc2WZSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751229875; c=relaxed/simple;
	bh=CM+hyGLSbPSFNOegUuS+ldtUO9qTcz8TX+NxxYpLjWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wi0vwqZ0cKZdmRB+MVQWxFe0E6l6AyCaTqDUr+6TDcP+8jSiuQS4o9ETCAjbpHD64DDiVqjYeqcNXxMTunc1b9vGVcE/W/FTehyTf0ge7c/aJ4XjnvhHNHxREKoZm1umwOduIwdLn8y5IdhjOc62LSmou0OogAE5B3nBBNx/E+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=V/VpDRT5; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="V/VpDRT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1751229871; bh=CM+hyGLSbPSFNOegUuS+ldtUO9qTcz8TX+NxxYpLjWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/VpDRT5wCOfkmHpvUFSvz3gQv53WvvdSJ5c67nGGDZdl2+k45ZIEwSzu2Y46eNIX
	 Fh/nkI7paKSbCgaz9EbPYtKy2rZKuxSOCQE4s2zDbUnTf/vuq7iGALCQ4kgXJmPE6D
	 9H9QXnBcWiUmGmrLPBefFe7wEqOYpOjz+XaO8HuM=
Date: Sun, 29 Jun 2025 22:44:31 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Willy Tarreau <w@1wt.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH v2 2/2] tools/nolibc: add a new "install_all_archs"
 target
Message-ID: <2363c2c9-a3ba-4b2b-849e-cd9e4d73297c@t-8ch.de>
References: <20250629170732.16817-1-w@1wt.eu>
 <20250629170732.16817-3-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629170732.16817-3-w@1wt.eu>

On 2025-06-29 19:07:32+0200, Willy Tarreau wrote:
> This installs all supported archs together, both from nolibc and kernel
> headers. The arch-specific asm/ subdirs are renamed to asm-arch-$arch,
> and asm/ is rebuilt from all these files in order to include the right
> one depending on the build architecture. This is done by reusing a
> template file (asm-template.h) for each file found under asm-arch-*,
> and including the right sub-dir depending on the current arch.

Personally I would slightly prefer the shorter asm-$arch/ over
asm-arch-$arch/. Similar how the arch-*.h files are named.

> This allows to use a single unified sysroot for all archs, and to only
> change the compiler or the target architecture. This way, a complete
> sysroot is much easier to use (a single directory is needed) and much
> smaller.

What is the base commit for this series?

> 
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  tools/include/nolibc/Makefile       | 24 ++++++++++++++++++++++++
>  tools/include/nolibc/asm-template.h | 25 +++++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644 tools/include/nolibc/asm-template.h
> 
> diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
> index d5be3d213c885..c47559a066f35 100644
> --- a/tools/include/nolibc/Makefile
> +++ b/tools/include/nolibc/Makefile
> @@ -86,6 +86,7 @@ help:
>  	@echo "  headers             prepare a multi-arch sysroot in \$${OUTPUT}sysroot"
>  	@echo "  headers_standalone  like \"headers\", and also install kernel headers"
>  	@echo "  help                this help"
> +	@echo "  install_all_archs   install a multi-arch sysroot + kernel headers in \$${OUTPUT}sysroot"

"headers_multiarch" Would be more consistent with the other targets.
Also should be above "help".

>  	@echo ""
>  	@echo "These targets may also be called from tools as \"make nolibc_<target>\"."
>  	@echo ""
> @@ -105,6 +106,29 @@ headers_standalone: headers
>  	$(Q)$(MAKE) -C $(srctree) headers
>  	$(Q)$(MAKE) -C $(srctree) headers_install INSTALL_HDR_PATH=$(OUTPUT)sysroot
>  
> +install_all_archs: headers
> +	@# install common headers for any arch, take them all. This will clear everything.
> +	$(Q)$(MAKE) -C $(srctree) ARCH=x86 mrproper
> +	$(Q)$(MAKE) -C $(srctree) ARCH=x86 headers_install no-export-headers= INSTALL_HDR_PATH="$(OUTPUT)sysroot"
> +	@# remove the contents of the unused asm dir which we will rebuild from the arch ones
> +	$(Q)rm -rf "$(OUTPUT)sysroot/include/asm"
> +	$(Q)mkdir -p "$(OUTPUT)sysroot/include/asm"
> +	@# Now install headers for all archs
> +	$(Q)for arch in $(nolibc_supported_archs); do \
> +		echo "# installing $$arch"; \
> +		if ! [ -d $(OUTPUT)sysroot/include/asm-arch-$$arch ]; then \

I don't understand this check. If used with an existing sysroot, the
files won't be updated.

> +			$(MAKE) -C $(srctree) ARCH=$$arch mrproper; \

For the defconfig target we tried to avoid implicitly deleting files.
Maybe letting make erroring out would be less surprising.
A clean source tree is necessary for the testsuite anyways.

> +			$(MAKE) -C $(srctree) ARCH=$$arch headers_install no-export-headers= \
> +				INSTALL_HDR_PATH="$(OUTPUT)sysroot/include/$$arch" >/dev/null; \
> +			mv "$(OUTPUT)sysroot/include/$$arch/include/asm" "$(OUTPUT)sysroot/include/asm-arch-$$arch"; \
> +			rm -rf "$(OUTPUT)sysroot/include/$$arch"; \
> +		fi;\
> +	done; \
> +	mkdir -p "$(OUTPUT)sysroot/include/asm"; \
> +	for file in $$(find "$(OUTPUT)sysroot/include/"asm-arch-* -maxdepth 1 -name '*.h' -printf '%P\n'); do \
> +		sed -e "s!_ASMFILE_!$$file!" asm-template.h > "$(OUTPUT)sysroot/include/asm/$$file"; \
> +	done

I think it should be possible to use the existing arch.h as template.
That would avoid some duplication and busywork.

> +
>  # GCC uses "s390", clang "systemz"
>  CLANG_CROSS_FLAGS := $(subst --target=s390-linux,--target=systemz-linux,$(CLANG_CROSS_FLAGS))
>  
> diff --git a/tools/include/nolibc/asm-template.h b/tools/include/nolibc/asm-template.h
> new file mode 100644
> index 0000000000000..84930c4761d16
> --- /dev/null
> +++ b/tools/include/nolibc/asm-template.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
> +
> +#if defined(__x86_64__) || defined(__i386__) || defined(__i486__) || defined(__i586__) || defined(__i686__)
> +#include "../asm-arch-x86/_ASMFILE_"
> +#elif defined(__ARM_EABI__)
> +#include "../asm-arch-arm/_ASMFILE_"
> +#elif defined(__aarch64__)
> +#include "../asm-arch-arm64/_ASMFILE_"
> +#elif defined(__mips__)
> +#include "../asm-arch-mips/_ASMFILE_"
> +#elif defined(__powerpc__)
> +#include "../asm-arch-powerpc/_ASMFILE_"
> +#elif defined(__riscv)
> +#include "../asm-arch-riscv/_ASMFILE_"
> +#elif defined(__s390x__) || defined(__s390__)
> +#include "../asm-arch-s390/_ASMFILE_"
> +#elif defined(__loongarch__)
> +#include "../asm-arch-loongarch/_ASMFILE_"
> +#elif defined(__sparc__)
> +#include "../asm-arch-sparc/_ASMFILE_"
> +#elif defined(__m68k__)
> +#include "../asm-arch-m68k/_ASMFILE_"
> +#else
> +#error Unsupported Architecture
> +#endif
> -- 
> 2.17.5
> 
