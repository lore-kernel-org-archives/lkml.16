Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6483F380;
	Wed, 11 Jun 2025 18:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667272; cv=none; b=Uc8OH26KWfMOzyHkH2zUa92+xDM8BdqdGKUKZQFw8qgf9DyMSaHx4GObjV+695/ozA3rSeVIbUOamFLp2uoiTpoMRPBgsb86bbzWTjBUsUcVHimtlLBzJhATV6Gq37YXB1yLX5XR9WrtWOsPVMmM3x8GFJCy3FBCJlHnclTMcZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667272; c=relaxed/simple;
	bh=dmSmsOSfNexAj6f4AfOckgvW1QZ58ApdfuCwjYsPsXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JA5n6CcwnKqlINIKqGhQN/iCW+If5h7V6HxGUO4MtNFXoMZBdiPOue558bZfIulpCw6Wl38UW5TrfYLeW64kZUwgWFGT19x66IETJLTmqCya9Ou+QHombdmEzpFuENgeeE0WycYA+ARon8+pjykbj2L8nVEkCBf/wG3fkvwJNxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2A9Q4vU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2A9Q4vU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBA7C4CEE3;
	Wed, 11 Jun 2025 18:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749667271;
	bh=dmSmsOSfNexAj6f4AfOckgvW1QZ58ApdfuCwjYsPsXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2A9Q4vU5kApajaJzbuMwQvcZeWaKTB9Q6kxXVjOVBLJXa64nYFX2LsAsEWaZV2gK
	 8G6reWkkMEBnbz0TEK9wMWCENpeGpglgn7enmbojaeelMZxA+nKe6ohKxRPjeTopdo
	 tQ5KUzDMutTBqRqFdnhzm8ad4ZK2Bzi2I1Lqa82Sb9HAhsozqE92EDhAbbCSrpkvmN
	 GCKPicCY8swm9tGxpTcTwuMc1j361ZDjgjHB7X2Z9/Q1I2p3SZzGZNBLxs27q314mY
	 wDvjVVWT9BiAIxRuIMV7cq0NT+8X/qceUS791LVLWpbqCmrw+jbfV0eI14yGGZEg6A
	 cEa7Jsa/f/Vpw==
Date: Wed, 11 Jun 2025 11:41:06 -0700
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
Subject: Re: [PATCH v3 2/3] riscv: vdso: Disable LTO for the vDSO
Message-ID: <20250611184106.GB2192624@ax162>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-2-47897d73784b@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611-vdso-absolute-reloc-v3-2-47897d73784b@linutronix.de>

On Wed, Jun 11, 2025 at 11:22:13AM +0200, Thomas Weiﬂschuh wrote:
> All the other architectures supporting LTO (x86, arm64, loongarch) do not
> use it for the vDSO.
> 
> Its is problematic for some upcoming compile-time validation of the
> generated object code.
> The LTO object files do not contain the necessary relocation information
> and -flto-fat-objects is not compatible with clang < 16.
> 
> For consistency and to enable the mentioned compile-time checks,
> disable LTO for the vDSO.
> The vDSO heavily uses __always_inline anyways.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Yes, I would agree this has little actual value for the vDSO.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/kernel/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index c19c3c76f7c9f6b2f7523a59269de3b683656323..9f1bf5bae9bd473e43d9fd3022e9e1a185128b73 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -49,7 +49,7 @@ CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
>  endif
>  
>  # Disable -pg to prevent insert call site
> -CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $(CC_FLAGS_LTO)
>  CFLAGS_REMOVE_vgettimeofday.o = $(CFLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_getrandom.o = $(CFLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_hwprobe.o = $(CFLAGS_REMOVE_VDSO)
> 
> -- 
> 2.49.0
> 
