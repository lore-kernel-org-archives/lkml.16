Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8038A15E97;
	Fri, 30 May 2025 13:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612298; cv=none; b=WZ13PQ2L2gdFvzOp7X10WyRo1kusunhYo/9bW9Bz1dy+Il3tQKajsNfMOup4l9EgcLBMkfU9gI7AqtoqwzMIgLOJeRFcMAwOEvGtOQupWAZnyuZNUDztuwcFHyQHS3GjlvIunGjJ5bOu5Wtv2KqhmiGlfLf/K+ZZccpc7nHYLx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612298; c=relaxed/simple;
	bh=oErVW9B+sUdfA4HxRdKhLGzTWK6paqVXGRHYPARTOEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xqg52a1sEhGNMIxPaIXncvngj4J5TcYaR1vfXvniY9Q7FPIo+wd3YkttXxD1HEmdoYfQr/iQmn0TFYvXczZ5Y9wxmI8gVLJZ78zI/JMIDfC0HhmOpWJPZCn6lhjRLQp+TWTqu5uUR72vdFTe+ywy0CMqBwMN5P0j9v9EKFFrIZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFYy2kW1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFYy2kW1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7316DC4CEEB;
	Fri, 30 May 2025 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748612296;
	bh=oErVW9B+sUdfA4HxRdKhLGzTWK6paqVXGRHYPARTOEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFYy2kW1qmK0GWogVV0GRDlXo7mBPSS2bH4NQ1ny7s7gqibNDBod4dnfNi5ied47e
	 f4JC+WOBnW5wR+Vxhrf3wSHL80QEg3C7uZ+rGmEkRwa/RLaN+uabxIOmYW6+bFuekR
	 MEzlekglA30jtfTgCzKXpYo28fDi8qfWW8oQVHBPtalM4rRidb0mcLKo6wbEGXIAmz
	 gJlugk5fRBuO5TlCitpcuegepTmsD7YIZOagfxMiFy0Df5rjqLTmPoLATclIRfp3yw
	 pNXz4JFBEtiuqPT43wJ4apGWXy97XUKY5WfvITMl51YG7m6BU3dmUMgisfuAcU+3I8
	 vbDQxXSDU6cTg==
Date: Fri, 30 May 2025 14:38:12 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	nathan@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
Message-ID: <20250530133811.GB30622@willie-the-truck>
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
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, May 29, 2025 at 09:35:08AM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> It turns out that the way LLD handles ASSERT()s in the linker script can
> result in spurious failures, so disable them for the newly introduced
> BSS symbol export checks.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/2094
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
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

What about the ASSERT()s at the end of vmlinux.lds.S? Are they not
affected by the bug, for some reason?

Also, even with this patch applied, I still see a link failure:

  | ld.lld: error: assignment to symbol __init_end does not converge

with the .config you sent me off-list.

Will
