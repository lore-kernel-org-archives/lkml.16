Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDB9C147;
	Fri, 30 May 2025 02:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748572253; cv=none; b=CNsyoDiG21FxOHp4xH4KsgNxI6ZhPqJckYGE+23CiPrxAoANpXNtU9koPv7nYk+Crfe/fdPU/5Gw8ScUFxwQ0FUHmOvURCjkrxdaWantJTLTdtHRre2p54jtMxwmtsMXJyX4sB6uhIaxZpZi4czEdiuCnxVJ/3PNovrKpQIKb7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748572253; c=relaxed/simple;
	bh=78K/uRg12LAyCDBBxuqUJOtxtkUyuf3T7qNs8Ajqr1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arbbMN49Pj2zXOJmy9nBU3ezjMBLLDcNbqs402sOnQnzoeh4UwpdgGOQEahjEri3odBgtGUniKHpIipoJ6mt2+yr3MnBTtyH6LmMOXRShScUzPl+5caXC1fnaMTRSKY6yl0rU5+T7dug+jszrYMzFNiZhQiWsXmusopStbyqsKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGsAMSae; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGsAMSae"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3B2C4CEE7;
	Fri, 30 May 2025 02:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748572252;
	bh=78K/uRg12LAyCDBBxuqUJOtxtkUyuf3T7qNs8Ajqr1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dGsAMSae1+Fy/8DwH38881VMtRy90s/TjF3AjeZk+y8b2EpAimPc7MteEpTbhfz9+
	 2mheFacNrNCa5WlNQCT5woXFswHoeIIYj/7q1nQZiB5fW8UMqOOmk2MRz1b4CquHgD
	 sUJs/efjr4HX2QU3urc0MoTQFdBtHB6rkAFk7z7+S/nwi73zdAlalZbzK57+MovsFF
	 +gt/QFCyLpKN4KtB1Hk7MQSSlmp30i7+Hnj0G0QIXiugyuUnUBaejnQHApDgn5rkbD
	 HCn4AbEIWoP59+YIprel/r+tBcLUqfMm3qpcbPkB6ZO1iD3VrdlgfItVjcSy2+SuLh
	 HJeyHopfO/qAg==
Date: Thu, 29 May 2025 19:30:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, will@kernel.org,
	catalin.marinas@arm.com, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
Message-ID: <20250530023048.GA1491122@ax162>
References: <20250529073507.2984959-2-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529073507.2984959-2-ardb+git@google.com>

On Thu, May 29, 2025 at 09:35:08AM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> It turns out that the way LLD handles ASSERT()s in the linker script can
> result in spurious failures, so disable them for the newly introduced
> BSS symbol export checks.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/2094
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

You could add Fangrui's commit as a reference to why LLD 21 is needed
for this to work but it is probably not worth a v2 by itself.

https://github.com/llvm/llvm-project/commit/5859863bab7fb1cd98b6028293cba6ba25f7d514

> ---
>  arch/arm64/kernel/image-vars.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index c5266430284b..86f088a16147 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -10,6 +10,10 @@
>  #error This file should only be included in vmlinux.lds.S
>  #endif
>  
> +#if defined(CONFIG_LD_IS_LLD) && CONFIG_LLD_VERSION < 210000
> +#define ASSERT(...)
> +#endif
> +
>  #define PI_EXPORT_SYM(sym)		\
>  	__PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
>  #define __PI_EXPORT_SYM(sym, pisym, msg)\
> @@ -142,4 +146,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
>  _kernel_codesize = ABSOLUTE(__inittext_end - _text);
>  #endif
>  
> +#undef ASSERT
> +
>  #endif /* __ARM64_KERNEL_IMAGE_VARS_H */
> -- 
> 2.49.0.1238.gf8c92423fb-goog
> 
> 
