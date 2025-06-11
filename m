Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E631D5CDD;
	Wed, 11 Jun 2025 18:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668252; cv=none; b=EUtIfhxPBG93bn2F/ESj7/ixwpxkzzzft09PyN5ptnvXRM1M3Y5yebvBMnhc/d65dAdlbG7FY3h3Zk2d12RZMyhCkDbtY8RRhCkmYmGgNKA3IMHhmiqB06lJvawiZCfyoPASs7o6ctVmuCoUWc72cnBgS3oW0c3tkzSp1LRfqFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668252; c=relaxed/simple;
	bh=FA4/cN74JMJAalmgbqNaeO1ru918vWjigUxWd4NER0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiIG/9MVGo5p0WLdUbDsvQEvj4SAWyTb+cDV1YSfal3HtBW+am713odabMNdC5OLkDWbGvH4dX+L+lgnv0gC96f9SWfyvLRdhYQrXIIkK+OeWDEZL2S6akmWx3dhu6iV3JJCW+rToQwso9k6THrhaNkEknkNUIVKkiDiO29rrq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XT6eiIWI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XT6eiIWI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CCEC4CEE3;
	Wed, 11 Jun 2025 18:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749668252;
	bh=FA4/cN74JMJAalmgbqNaeO1ru918vWjigUxWd4NER0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XT6eiIWIMaG0Ss0mBqQm9OyIlONbS8GrNWdECj9HI8lh1+FNzsqnE35rx+2ZsnY1F
	 aPxzJZwSezIa3QWVXRTpFTPLiUu0Opy22io2/TWDrnMlrvH5z5d4HC8FmoWdoc4Ry5
	 m/JzQlN7MeZleb2DlnPfPTc/DzqdkC62QYl+A6zCNsQnGXBEzm/eCiZC2X9xt85X17
	 rwlgUbt4b1fIki0Z8TwU8RYkMbc5aMQRPo93qexzpNZ3dkEkHlbRU78zxC2hdw98wE
	 rhAsW2DowdlqmZa+6BYYnIjocCyvhSC4NYUQsa9fVburmAu+AfbANyrqmgSpf1oqE6
	 DUmUH4rygfWMA==
Date: Wed, 11 Jun 2025 11:57:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
Message-ID: <20250611185727.GC2192624@ax162>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>

On Wed, Jun 11, 2025 at 11:22:14AM +0200, Thomas Weiﬂschuh wrote:
> All vDSO code needs to be completely position independent.
> Symbol references are marked as hidden so the compiler emits
> PC-relative relocations. However there are cases where the compiler may
> still emit absolute relocations, as they are valid in regular PIC DSO code.
> These would be resolved by the linker and will break at runtime.
> This has been observed on arm64 under some circumstances, see
> commit 0c314cda9325 ("arm64: vdso: Work around invalid absolute relocations from GCC")
> 
> Introduce a build-time check for absolute relocations.
> The check is done on the object files as the relocations will not exist
> anymore in the final DSO. As there is no extension point for the
> compilation of each object file, perform the validation in vdso_check.
> 
> Debug information can contain legal absolute relocations and readelf can
> not print relocations from the .text section only. Make use of the fact
> that all global vDSO symbols follow the naming pattern "vdso_u_".
> 
> Link: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120002
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

I ran this through a few different architectures with LLVM=1 and did not
see anything interesting.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  lib/vdso/Makefile.include | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
> index cedbf15f80874d4bb27c097244bc5b11272f261c..04257d0f28c0ed324e31adbb68497181085752f8 100644
> --- a/lib/vdso/Makefile.include
> +++ b/lib/vdso/Makefile.include
> @@ -12,7 +12,13 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrand
>  #
>  # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
>  # dynamic relocations, ignore R_*_NONE.
> +#
> +# Also validate that no absolute relocations against global symbols are present
> +# in the object files.
>  quiet_cmd_vdso_check = VDSOCHK $@

I do not see VDSOCHK in the normal build log but I do see the check
being executed with V=1. That's obviously an outstanding issue but
figured it was worth mentioning.

>        cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
>  		       then (echo >&2 "$@: dynamic relocations are not supported"; \
> +			     rm -f $@; /bin/false); fi && \
> +		       if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " R_\w*_ABS.*vdso_u_"; \
> +		       then (echo >&2 "$@: absolute relocations are not supported"; \
>  			     rm -f $@; /bin/false); fi
> 
> -- 
> 2.49.0
> 
