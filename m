Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FA53FB1B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 21:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750715793; cv=none; b=S8arPwUAbusgrNUV3jONA31LTHA5BnbkJcJgdhIcF/f65k3lLVgQueu6x1RUkRQ9qI4L+J/LA2DxMai/vTveHU35vfmPavH84hfpn46X+dKxqahRq6NMTVSW8KejzJpRw8JbcPLlDmyB5YtZop4v7rVy8s7Q8xEh4TfmQQ/EHKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750715793; c=relaxed/simple;
	bh=zpcy8uYCUNlQXqF2u+uRvBbgMrdF3+42pttZHoQC5xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHxHfI6twlPJiMz1eISeBXL9Ur8nHwdWUbJq8rqAVGJP8lAeGJp074bstjcSlYuhaFseky21sxbi/RnbcK2/vAwxRXWpuR4WfylXFTrTcTvoFxKsFEogr5dVQsw2UFErK1MSOc6TLX0sRan8zxBOjxFaOI9z/S1jn3nK4S9+89k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=WyYq1Gso; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="WyYq1Gso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750715790;
	bh=zpcy8uYCUNlQXqF2u+uRvBbgMrdF3+42pttZHoQC5xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WyYq1GsoewGVs4mMTkKt4hc2ct7KZjVlCea0rSpLfDT6/w8ZsxgVALbPfLEQOEQlB
	 bBxsXVdITrIqB8J95yrZdKe3+CGnMpJpIdHViucDyMlAKV8t15NLFPPEQNpuS4xR0o
	 e7smmYtNRuqYzpQkl9dLtVeeXJj/y6ttYG3Q7WgA=
Date: Mon, 23 Jun 2025 23:56:29 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 2/3] tools/nolibc: add a new target
 "headers_all_archs" to loop over all archs
Message-ID: <4c48147d-aebc-4a2c-a60f-eba2e90584ed@t-8ch.de>
References: <20250620103705.10208-1-w@1wt.eu>
 <20250620103705.10208-3-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620103705.10208-3-w@1wt.eu>

On 2025-06-20 12:37:04+0200, Willy Tarreau wrote:
> This target allows to install the nolibc headers for all supported
> architectures at once, just like it is in the development tree. This
> is a first step to support full multi-architecture support.
> 
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  tools/include/nolibc/Makefile | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
> index 9197c79b267a4..8de6ac5cec425 100644
> --- a/tools/include/nolibc/Makefile
> +++ b/tools/include/nolibc/Makefile
> @@ -23,6 +23,8 @@ else
>  Q=@
>  endif
>  
> +nolibc_supported_archs := aarch64 arm loongarch m68k mips powerpc riscv s390 sparc x86
> +
>  nolibc_arch := $(patsubst arm64,aarch64,$(ARCH))
>  arch_file := arch-$(nolibc_arch).h
>  all_files := \
> @@ -83,6 +85,7 @@ help:
>  	@echo "  all                 call \"headers\""
>  	@echo "  clean               clean the sysroot"
>  	@echo "  headers             prepare a sysroot in \$${OUTPUT}sysroot"
> +	@echo "  headers_all_archs   prepare a multi-arch sysroot in \$${OUTPUT}sysroot"
>  	@echo "  headers_standalone  like \"headers\", and also install kernel headers"
>  	@echo "  help                this help"
>  	@echo ""
> @@ -110,6 +113,13 @@ headers_standalone: headers
>  	$(Q)$(MAKE) -C $(srctree) headers
>  	$(Q)$(MAKE) -C $(srctree) headers_install INSTALL_HDR_PATH=$(OUTPUT)sysroot
>  
> +# installs headers for all archs at once.
> +headers_all_archs:
> +	$(Q)mkdir -p "$(OUTPUT)sysroot"
> +	$(Q)mkdir -p "$(OUTPUT)sysroot/include"
> +	$(Q)cp --parents $(all_files) arch.h "$(OUTPUT)sysroot/include/"
> +	$(Q)cp $(addsuffix .h,$(addprefix arch-,$(nolibc_supported_archs))) "$(OUTPUT)sysroot/include/"

IMO we could always just install all architecture headers.
It's not much code after all.
If it is a problem for a user they can either just delete the
superfluous architectures or do 'mv arch-$foo.h arch.h; rm arch-*.h'.

> +
>  # GCC uses "s390", clang "systemz"
>  CLANG_CROSS_FLAGS := $(subst --target=s390-linux,--target=systemz-linux,$(CLANG_CROSS_FLAGS))
>  
> -- 
> 2.17.5
