Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71418380;
	Wed, 11 Jun 2025 18:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667224; cv=none; b=EArDWkyPvmDLHDwwU3bmuG51sOkWycsWUFtRwW8qqxIPo22C1aUCAI8H7pGYzK6swN4gf/sgVkMOLVjImq7OvrhoPmNtSzt+idYu9j8jemeDjZBVcmg9iYbEy3ZgAkCFRdBxCJX0lCHp0pMe79b35Ra/lT+irFuzgI9idHRhPeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667224; c=relaxed/simple;
	bh=OYZ3IBW7iSebcv5mN2/PuO3N2mNLKbX+gEmihh5UK9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r36De5jM5TRSNQF+AvBTXLbeYWi2wfKyz1hLgaP+bq2WZxC2tWfdAX65aCANXl6VHYaVBUmhoKqqYwTNXpmaVkv3wehpqlvv3qXjmbvJBXiebdHA7+5U/iJpn0JAWX8a2GuLCl6d6Q//V8pGXyIdHAbXt34j9NNGHpS/PrKCiYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5R/mwt7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5R/mwt7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7B2C4CEE3;
	Wed, 11 Jun 2025 18:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749667224;
	bh=OYZ3IBW7iSebcv5mN2/PuO3N2mNLKbX+gEmihh5UK9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N5R/mwt7cCu9NIPBBfHKXspsm/RHqc/ioVM2fEuYVCisCrJl4qsvvwKzLZakh4n2+
	 O0XxiO5XuqIIY+DbV84jcyHxy/H+bxjZOpj+0179fnLE+n6eiseg253l9D/uL1wHrx
	 XmF3VcnVt2lsyGlvDWABuieNM/+2CWwpTuIXSFORwKdD6jmyjcV1qoAT0xnElz4iV5
	 p66q9+Ua0kcaLHs6kfsNwGtzTPOKY2IW6zEtTVytTzoFBq/NAo4DK2DYmIUx/VnEGl
	 /M4ggdU+bfhYGhWFxSh94jDaJUTpIHxHGnKQPalXRN+MrlfKzl9Pf4ImJBt/Lz9qPN
	 DwgcFzwLkw1gA==
Date: Wed, 11 Jun 2025 11:40:18 -0700
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
Subject: Re: [PATCH v3 1/3] riscv: vdso: Deduplicate CFLAGS_REMOVE_* variables
Message-ID: <20250611184018.GA2192624@ax162>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-1-47897d73784b@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611-vdso-absolute-reloc-v3-1-47897d73784b@linutronix.de>

On Wed, Jun 11, 2025 at 11:22:12AM +0200, Thomas Weiﬂschuh wrote:
> All vDSO objects need the same treatment.
> To make changes to both the list of objects and the list of removed flags
> easier, introduce a helper variable.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/kernel/vdso/Makefile | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 9ebb5e590f93a3228c451dca58e6d5cfbbc03ff7..c19c3c76f7c9f6b2f7523a59269de3b683656323 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -49,9 +49,10 @@ CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
>  endif
>  
>  # Disable -pg to prevent insert call site
> -CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> -CFLAGS_REMOVE_getrandom.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> -CFLAGS_REMOVE_hwprobe.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_vgettimeofday.o = $(CFLAGS_REMOVE_VDSO)
> +CFLAGS_REMOVE_getrandom.o = $(CFLAGS_REMOVE_VDSO)
> +CFLAGS_REMOVE_hwprobe.o = $(CFLAGS_REMOVE_VDSO)
>  
>  # Force dependency
>  $(obj)/vdso.o: $(obj)/vdso.so
> 
> -- 
> 2.49.0
> 
