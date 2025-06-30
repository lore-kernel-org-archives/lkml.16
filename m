Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954FF28DB7E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301742; cv=none; b=JN8Iigf5ohqhea8OO/nzeNAUDFborUPh0GWFsNSeVjexFfmddn8Vz4unJbdtx5cyzv73Vi0skdNu2m83uxW5AmhZHxngNVbTjYET3cjSEuLrz1ewm/Dh8RvwGqTNkskmXCiRqF1bpYdiscBAdvMyFQ6CvTuWQHa0FRwq1Dta4pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301742; c=relaxed/simple;
	bh=fyg25kUdxi56X5fN8C4I80OctwwXPUDBJYonfzwtL5E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iEQoE00C+XVWM5LRoPcATnr8m01aRV2LWlZo7P4fYnNrG3ljaC+F4u6IuiGdtNWJnHS8jWGq8yOQST4d79T6/QXNzSQPqXGVgnZj3uhV/eDOHNpAaqKcZoKHiiQctReJzG1EK5Pw8rNlPpyC6liZGSopRkn4PjBeFOTebaFzOPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0QLuLkXG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1hhxprSW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0QLuLkXG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1hhxprSW"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751301737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sF9E1GcllfD1MFNQQKAvA1nbW2DQm7ww8CpX+oG79/k=;
	b=0QLuLkXGxPR90Hu6jSCWbi9iQAdgVpK26eGkLiR+JeCdTd65Gs8Mx9DWIo7cvlN3ZTFDsV
	qPDDHsTECqv9lzWjPRQKbIMz9oE5V7eJO5xDTnztzXYvgM0r2ShS2MU0LO9mDIN0lrEaja
	ntIvsZB5CjbK8gt/8MWz9uV0xOl8wEDeBffzlYtUjDpMEal1D5cd5YTR6EEuyLUT2x0QLo
	TZAaEtdSdIGRYgL7i3jgvSK3664PZHjU5DHZ4oieUBk42DAr9In5Ha1HwN5ppMO/7JoGTC
	b0MURD6pP5Nqje1SnYWG7uOcaNgDUOId0Tvj+zQmpOzGAFE8/PwPmkRunC/jwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751301737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sF9E1GcllfD1MFNQQKAvA1nbW2DQm7ww8CpX+oG79/k=;
	b=1hhxprSW9LLIbEziJad/YMrC7HvzvCzaWcNgQ3bHKUibPplVR5gR7P8Fu/LoFbisMj4N/1
	v7jmGC9s/6QxF1Bw==
To: Khalid Ali <khaliidcaliy@gmail.com>, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, linux-kernel@vger.kernel.org, Khalid Ali
 <khaliidcaliy@gmail.com>, Kai Huang <kai.huang@intel.com>
Subject: Re: [RESEND PATCH v5] x86/boot: Don't return encryption mask from
 __startup_64()
In-Reply-To: <20250625160238.734-1-khaliidcaliy@gmail.com>
References: <20250625160238.734-1-khaliidcaliy@gmail.com>
Date: Mon, 30 Jun 2025 18:42:16 +0200
Message-ID: <87qzz1mb9z.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Khalid!

On Wed, Jun 25 2025 at 16:02, Khalid Ali wrote:
> From: Khalid Ali <khaliidcaliy@gmail.com>
>
> Currently, __startup_64() returns encryption mask to the caller, however
> caller can directly access the encryption.
>
> The C code can access encryption by including
> arch/x86/include/asm/setup.h and calling sme_get_me_mask(). The assembly
> code can access directly via "sme_me_mask" variable.
>
> This patches accounts that, by adjusting __startup_64() to not return

This patch.... I pointed you to the tip tree documentation before ....

> encryption mask, and update startup_64() to access "sme_me_mask" only if
> CONFIG_AMD_MEM_ENCRYPT is set.
>
> This cleans up the function and does seperation of concern.
> __startup_64() should focus on action like encrypting the kernel, and
> let the caller retrieve the mask directly.
>
> CHanges in v5:
>  * Improve commit message for better clarity.
>  * Fix some issues returned by kernel test robot.
>  * Add Huang, Kai Ack tag.

Please put this behind the --- seperator. It's not part of the change
log. That's documented too.

> Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
> Acked-by: Kai Huang <kai.huang@intel.com>
> ---
>  arch/x86/boot/startup/map_kernel.c | 11 +++--------
>  arch/x86/include/asm/setup.h       |  2 +-
>  arch/x86/kernel/head_64.S          |  8 +++-----
>  3 files changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/arch/x86/boot/startup/map_kernel.c b/arch/x86/boot/startup/map_kernel.c
> index 332dbe6688c4..0425d49be16e 100644
> --- a/arch/x86/boot/startup/map_kernel.c
> +++ b/arch/x86/boot/startup/map_kernel.c
> @@ -30,7 +30,7 @@ static inline bool check_la57_support(void)
>  	return true;
>  }
>  
> -static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
> +static void __head sme_postprocess_startup(struct boot_params *bp,
>  						    pmdval_t *pmd,
>  						    unsigned long p2v_offset)

See documentation about parameter alignment.

>  {
> @@ -68,11 +68,6 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
>  		}
>  	}
>  
> -	/*
> -	 * Return the SME encryption mask (if SME is active) to be used as a
> -	 * modifier for the initial pgdir entry programmed into CR3.
> -	 */
> -	return sme_get_me_mask();
>  }
>  
>  /*
> @@ -84,7 +79,7 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
>   * the 1:1 mapping of memory. Kernel virtual addresses can be determined by
>   * subtracting p2v_offset from the RIP-relative address.
>   */
> -unsigned long __head __startup_64(unsigned long p2v_offset,
> +void __head __startup_64(unsigned long p2v_offset,
>  				  struct boot_params *bp)

Ditto

>  	/*
>  	 * Perform pagetable fixups. Additionally, if SME is active, encrypt
> -	 * the kernel and retrieve the modifier (SME encryption mask if SME
> -	 * is active) to be added to the initial pgdir entry that will be
> -	 * programmed into CR3.
> +	 * the kernel.

Why are you dropping valuable information from that comment, instead of
moving the important information about the SME mask next to the code
which retrieves it?

Thanks,

        tglx
