Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234312110;
	Tue, 27 May 2025 22:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384203; cv=none; b=bH9P/Rc8h0eFNZ2q5SzKlCQ4vneAfJKc4ESUsAkicaYVQP3drDaihUhU9PHBELcBHzJL38b1xfdmrTzrv2Fe2Vikuix4MUmEaMQMT1yxFSFx2O+zt5H3X9PvoOqGgORcRfJEm6sh3ikLGb25eQw2I0WsO3Qb1LAln70JiHb+aeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384203; c=relaxed/simple;
	bh=MzFRMlqO3bl/CtN3ADTjN4rXHrsrNZHFSUgEmNofhAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmYZLMhgu90oHWq8kQtVtLGEj6qpigl7xM73x8eNZN+cLhLPFnZdU1C/KKav1rLMZSuJhvXajxLj6XqCr5vDXoSzQ94rgJwepRwDGHgvFMe0XKc8kadGIXNFTFjHeyfH/6vrtP4X2uRGXeSuDE4QWgo8bKplSKXja2/aXnVVVzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RviyFI+o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RviyFI+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A05C4CEE9;
	Tue, 27 May 2025 22:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748384202;
	bh=MzFRMlqO3bl/CtN3ADTjN4rXHrsrNZHFSUgEmNofhAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RviyFI+o6Q/1ibO24VNOFDSIyv+MDUsANixhWsTmUx8c0Xm0ngCc7Ch4sinavHrNy
	 RoF+pYsVzzIw0BdqxK1/VjnlMYhGLJhPLvwXloAlBopwutkFfp4kHOyuMaRCDOjO4b
	 bzbwbDbURjpCKRxdLxrwZYn/r6z9Ofg0ujkK9s8aj3Do+0sjeGMROsW9JRtqXgPaFv
	 GKy1k0ufePZpxYGT68+vN2S5JHdY8tWCVFGm7zS0QDeFzBdIarQi5AL3SOTpUVJ6Yr
	 Leb0DXvp3zCea6AUrMBzlYKrK3xxv1eq/Ac+hn+v1ou43dgsMxMJqk4GKBLP6qrESQ
	 cHviQmcqkWoEg==
Date: Tue, 27 May 2025 15:16:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nicolas Schier <nicolas.schier@linux.dev>, llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: replace deprecated T option with --thin for $(AR)
Message-ID: <20250527221637.GA2566504@ax162>
References: <20250525112833.3808220-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525112833.3808220-1-masahiroy@kernel.org>

On Sun, May 25, 2025 at 08:28:31PM +0900, Masahiro Yamada wrote:
> According to 'man ar':
> 
>     T   Deprecated alias for --thin.  T is not recommended because in
>         many ar implementations T has a different meaning, as specified
>         by X/Open System Interface.
> 
> 'man llvm-ar' also states:
> 
>     T   Alias for --thin. In many ar implementations T has a different
>         meaning, as specified by X/Open System interface.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Yeah, seems reasonable to get ahead of the curve in case either
implementation decides to drop it.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> 
>  Makefile               | 6 +++---
>  scripts/Makefile.build | 2 +-
>  scripts/Makefile.lib   | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index efbc0966b82a..682a8002b7a1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1201,12 +1201,12 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
>  KBUILD_MODULES := 1
>  endif
>  
> -# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
> +# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <= 14
>  quiet_cmd_ar_vmlinux.a = AR      $@
>        cmd_ar_vmlinux.a = \
>  	rm -f $@; \
> -	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
> -	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
> +	$(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
> +	$(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
>  
>  targets += vmlinux.a
>  vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 8d8252229895..284931f2a9a2 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -456,7 +456,7 @@ $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
>  quiet_cmd_ar_builtin = AR      $@
>        cmd_ar_builtin = rm -f $@; \
>  	$(if $(real-prereqs), printf "$(obj)/%s " $(patsubst $(obj)/%,%,$(real-prereqs)) | xargs) \
> -	$(AR) cDPrST $@
> +	$(AR) cDPrS --thin $@
>  
>  $(obj)/built-in.a: $(real-obj-y) FORCE
>  	$(call if_changed,ar_builtin)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index d858a3223bcd..e37e2db5f528 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -280,7 +280,7 @@ quiet_cmd_ld = LD      $@
>  # ---------------------------------------------------------------------------
>  
>  quiet_cmd_ar = AR      $@
> -      cmd_ar = rm -f $@; $(AR) cDPrsT $@ $(real-prereqs)
> +      cmd_ar = rm -f $@; $(AR) cDPrs --thin $@ $(real-prereqs)
>  
>  # Objcopy
>  # ---------------------------------------------------------------------------
> -- 
> 2.43.0
> 
