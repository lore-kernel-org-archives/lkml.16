Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94EE2417D4
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228238; cv=none; b=ANSpbQxVK/NEi03kQY95/B7WeTOeHVfAjjYq59i2+Ir6mMuzl0IhRxSKsf0AjwLeiF6acaejGbFLx+MqEZBXNqKPddNgey2zvsaXywpvw5004P9yzL2+tygrWV69Emc+PFMmKZ2/EJ3cfjQ3g0N9ZT+piCB5imbPUxvhSc/tHS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228238; c=relaxed/simple;
	bh=4M1BiJ4fQUn4575Pv2IZLCCJAhcWlofdy723u9ZVQrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiKVaq/i6+N1EBtje9qorC3cEvA4gmTpAgb1d2IfHIlgd7rP9Ds6wL9KV866YXXtH8dRllh3VKgnD9iEYzFyFUV/Va/p0IBgBwZScLC5jzDusmwIIO4/JtH6yo7+UbGdZUlEkLxmKbUn907xmSk8TWOB/6u8BwCzvz4gYWV+fvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Pjr5TwQe; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Pjr5TwQe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751228233;
	bh=4M1BiJ4fQUn4575Pv2IZLCCJAhcWlofdy723u9ZVQrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pjr5TwQePK57VngX9Hk/cb7c7MblfBraMssV5FebMswdtLmDGHSO3jizyu4zks2ny
	 vJFlVoDljafZK9JYmAWfUNrFYZQswhQzD1Y13TP+AXu4N1Ftzu359f6O8lizesWsu3
	 8ylCrY4IOORKppYF2H9x7V7Kb0UlTJzRlhuLY2dw=
Date: Sun, 29 Jun 2025 22:17:12 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH v2 1/2] tools/nolibc: make the "headers" target
 install all supported archs
Message-ID: <38941d56-dc2c-465c-99b3-2e986ea58423@t-8ch.de>
References: <20250629170732.16817-1-w@1wt.eu>
 <20250629170732.16817-2-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629170732.16817-2-w@1wt.eu>

On 2025-06-29 19:07:31+0200, Willy Tarreau wrote:
> The efforts we go through by installing a single arch are counter
> productive when the base directory already supports them all, and
> the arch-specific files are really small. Let's make the "headers"
> target simply install headers for all supported archs and stop
> trying to build a hybrid "arch.h" file on the fly, to instead keep
> the generic one.
> 
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  tools/include/nolibc/Makefile | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
> index c69d7bf60c71e..d5be3d213c885 100644
> --- a/tools/include/nolibc/Makefile
> +++ b/tools/include/nolibc/Makefile
> @@ -24,6 +24,8 @@ Q=@
>  endif
>  
>  arch_file := arch-$(ARCH).h

arch_file is unused now.

> +nolibc_supported_archs := arm64 arm loongarch m68k mips powerpc riscv s390 sparc x86

Nitpick:
Instead of having another variable, can we add the arch-foo.h files to
all_files instead? In patch 2 they can be extracted from there with $(filter)?

> +
>  all_files := \
>  		compiler.h \
>  		crt.h \
> @@ -81,7 +83,7 @@ help:
>  	@echo "Supported targets under nolibc:"
>  	@echo "  all                 call \"headers\""
>  	@echo "  clean               clean the sysroot"
> -	@echo "  headers             prepare a sysroot in \$${OUTPUT}sysroot"
> +	@echo "  headers             prepare a multi-arch sysroot in \$${OUTPUT}sysroot"

If multi-arch is the only remaining mode, do we need to mention it?

>  	@echo "  headers_standalone  like \"headers\", and also install kernel headers"
>  	@echo "  help                this help"
>  	@echo ""
> @@ -92,18 +94,12 @@ help:
>  	@echo "  OUTPUT  = $(OUTPUT)"
>  	@echo ""
>  
> +# installs headers for all archs at once.
>  headers:
> -	$(Q)mkdir -p $(OUTPUT)sysroot
> -	$(Q)mkdir -p $(OUTPUT)sysroot/include
> -	$(Q)cp --parents $(all_files) $(OUTPUT)sysroot/include/
> -	$(Q)if [ "$(ARCH)" = "i386" -o "$(ARCH)" = "x86_64" ]; then \
> -		cat arch-x86.h;                 \
> -	elif [ -e "$(arch_file)" ]; then        \
> -		cat $(arch_file);               \
> -	else                                    \
> -		echo "Fatal: architecture $(ARCH) not yet supported by nolibc." >&2; \
> -		exit 1;                         \
> -	fi > $(OUTPUT)sysroot/include/arch.h
> +	$(Q)mkdir -p "$(OUTPUT)sysroot"
> +	$(Q)mkdir -p "$(OUTPUT)sysroot/include"
> +	$(Q)cp --parents $(all_files) arch.h "$(OUTPUT)sysroot/include/"

Can we add arch.h to all_files, to avoid the special case here?

> +	$(Q)cp $(addsuffix .h,$(addprefix arch-,$(nolibc_supported_archs))) "$(OUTPUT)sysroot/include/"
>  
>  headers_standalone: headers
>  	$(Q)$(MAKE) -C $(srctree) headers
> -- 
> 2.17.5
> 
