Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E753D2FB
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146551; cv=none; b=CCkzHWwHl2k1MqygFUKYSN628Ie2SAx8yer3WD8lzgjMnbXEWjH4zlFLETm4mkL1v0HpMqiOQ7QcDHFPYtm502mWxJ1smKM1apjnO7YrWW3fBxwAuZz2hbB7BnH6afXl8yl39TQal3Kw5xTcX/wnk0fWQllqPuAMLEJ7r//9+TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146551; c=relaxed/simple;
	bh=edgKKuKIHXNY19Bf7dXcjsr8rGZB29QD7qjrFQ312ZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GL+70Q8BJgijvANChGovlFMRlEPFGLsII9Z5dbjd+Z+xUOty8LJXQx4iU6PmmCWQ6oHkOYHkLvM0JmXlV7WsbRyFod+71LZPa6E34vE7biv7MujpxAaHdZ4IFm1tQRw4ABllSLhy32QYFb84c2QWKfRaRp2y5z4G8Gw1y63PKAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qg2ZV+7M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qg2ZV+7M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1636C4AF0B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750146551;
	bh=edgKKuKIHXNY19Bf7dXcjsr8rGZB29QD7qjrFQ312ZU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qg2ZV+7M6wDk5oEos5QuLkHbnWwF6jPYFE78H5PCAba13QBuBDy35OYFoMhglpeW5
	 NBag6k8dEESHzN8Q4vUqE4JWFUbtpOHYKQcDd6VUMvP4TkWZNzyJhBI3JTYcpFnL6B
	 0rm2+kHekDrTqYpWRvFNXOgUZ8sTa/5hNOlUq9jT+yT+7JPmZi458L+jYT7I21mPl9
	 F5jpDgf1PwDzXIC+cd+QGt3SNHv4r+RSnoWHbRdr4Q1vC8s4eofVBnO4e87NYU91U8
	 4MCPOgblmY72XartoFJndIWWnvzdPo4AY9xyThgeGPYaDZGDA9HWpiw00Dt+9Pay1s
	 YBRWjkrPJvF8Q==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-310447fe59aso54948951fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:49:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJ/O4zPIkLEe4FADNZHQuEa1bnvOWqnhfh1vj7oq3ZyFbhluiy9eHOaJK48Wgv5OCRFwARK3FICwLsy7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8k2EJwZ7h+Zu/p2ipyWpoms0OmJIvaC9zOsuZOlDjFR9Quw49
	Ctp/dWIzr8qO6JGaNvq+hiSpBYjTrKpRthf2XzhlHE7h16YLMggr9w40Iu8BIbv4lccstLhtXQz
	a11ko8dnwDY44OcG/VBYr2csn5VROw6A=
X-Google-Smtp-Source: AGHT+IHrRIPcTTe7BlmbCtWLApFzRGHworOqkbPXOiF9QRjABzfBe8quyQOD07oWuiKgft2iwTO2AezAGElWEQA8PXA=
X-Received: by 2002:a05:6512:1181:b0:553:cc61:170f with SMTP id
 2adb3069b0e04-553cc611901mr289711e87.31.1750146549176; Tue, 17 Jun 2025
 00:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617073733.760-1-khaliidcaliy@gmail.com>
In-Reply-To: <20250617073733.760-1-khaliidcaliy@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 17 Jun 2025 09:48:57 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHAkpynA9avioMtVO1escDhWV4SjzDHt_7enLXQDPx+Tg@mail.gmail.com>
X-Gm-Features: AX0GCFvqMdBv9k2uHFwQQCR6TRz4_1obSANqbzc1N7IhmKxnNO5-fwVuNy3b5-o
Message-ID: <CAMj1kXHAkpynA9avioMtVO1escDhWV4SjzDHt_7enLXQDPx+Tg@mail.gmail.com>
Subject: Re: [PATCH v3] x86/boot: Don't return encryption mask from __startup_64()
To: Khalid Ali <khaliidcaliy@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 09:38, Khalid Ali <khaliidcaliy@gmail.com> wrote:
>
> Avoid returning the SME encryption mask from __startup_64(), and instead
> let the function handle encryption directly as needed. The encryption
> mask is already available to callers and can be accessed via
> sme_get_me_mask() in C code, or directly through the sme_me_mask symbol
> in assembly, if CONFIG_AMD_MEM_ENCRYPT is enabled.
>
> This change aligns with how secondary_startup_64_no_verify handles SME
> and keeps the behavior consistent. For Intel CPUs, SME is not relevant,
> so there is no need to retrieve the mask unless CONFIG_AMD_MEM_ENCRYPT
> is enabled.
>
> Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506171012.Ji3c5sJh-lkp@intel.com/

Please drop these lines ^^^ (but no need to resend just for that)

As it says on the page:

"If you fix the issue in a separate patch/commit (i.e. not just a new
version of the same patch/commit), kindly add following tags"


> ---
>  arch/x86/boot/startup/map_kernel.c | 11 +++--------
>  arch/x86/include/asm/setup.h       |  2 +-
>  arch/x86/kernel/head_64.S          | 10 ++++------
>  3 files changed, 8 insertions(+), 15 deletions(-)
>
> diff --git a/arch/x86/boot/startup/map_kernel.c b/arch/x86/boot/startup/map_kernel.c
> index 332dbe6688c4..6fdb340e9147 100644
> --- a/arch/x86/boot/startup/map_kernel.c
> +++ b/arch/x86/boot/startup/map_kernel.c
> @@ -30,7 +30,7 @@ static inline bool check_la57_support(void)
>         return true;
>  }
>
> -static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
> +static void __head sme_postprocess_startup(struct boot_params *bp,
>                                                     pmdval_t *pmd,
>                                                     unsigned long p2v_offset)
>  {
> @@ -68,11 +68,6 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
>                 }
>         }
>
> -       /*
> -        * Return the SME encryption mask (if SME is active) to be used as a
> -        * modifier for the initial pgdir entry programmed into CR3.
> -        */
> -       return sme_get_me_mask();
>  }
>
>  /*
> @@ -84,7 +79,7 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
>   * the 1:1 mapping of memory. Kernel virtual addresses can be determined by
>   * subtracting p2v_offset from the RIP-relative address.
>   */
> -unsigned long __head __startup_64(unsigned long p2v_offset,
> +void __head __startup_64(unsigned long p2v_offset,
>                                   struct boot_params *bp)
>  {
>         pmd_t (*early_pgts)[PTRS_PER_PMD] = rip_rel_ptr(early_dynamic_pgts);
> @@ -213,5 +208,5 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
>         for (; i < PTRS_PER_PMD; i++)
>                 pmd[i] &= ~_PAGE_PRESENT;
>
> -       return sme_postprocess_startup(bp, pmd, p2v_offset);
> +        sme_postprocess_startup(bp, pmd, p2v_offset);
>  }
> diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
> index 692af46603a1..29ea24bb85ff 100644
> --- a/arch/x86/include/asm/setup.h
> +++ b/arch/x86/include/asm/setup.h
> @@ -50,7 +50,7 @@ extern unsigned long acpi_realmode_flags;
>
>  extern void reserve_standard_io_resources(void);
>  extern void i386_reserve_resources(void);
> -extern unsigned long __startup_64(unsigned long p2v_offset, struct boot_params *bp);
> +extern void __startup_64(unsigned long p2v_offset, struct boot_params *bp);
>  extern void startup_64_setup_gdt_idt(void);
>  extern void startup_64_load_idt(void *vc_handler);
>  extern void early_setup_idt(void);
> diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
> index 3e9b3a3bd039..4390a28f7dad 100644
> --- a/arch/x86/kernel/head_64.S
> +++ b/arch/x86/kernel/head_64.S
> @@ -106,18 +106,16 @@ SYM_CODE_START_NOALIGN(startup_64)
>
>         /*
>          * Perform pagetable fixups. Additionally, if SME is active, encrypt
> -        * the kernel and retrieve the modifier (SME encryption mask if SME
> -        * is active) to be added to the initial pgdir entry that will be
> -        * programmed into CR3.
> +        * the kernel.
>          */
>         movq    %r15, %rsi
>         call    __startup_64
>
>         /* Form the CR3 value being sure to include the CR3 modifier */
> -       leaq    early_top_pgt(%rip), %rcx
> -       addq    %rcx, %rax
> -
> +       leaq    early_top_pgt(%rip), %rax
> +
>  #ifdef CONFIG_AMD_MEM_ENCRYPT
> +       addq    sme_me_mask(%rip), %rax
>         mov     %rax, %rdi
>
>         /*
> --
> 2.49.0
>
