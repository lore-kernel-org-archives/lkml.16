Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE3122A1E6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750720789; cv=none; b=UGQGVktjcHD3IXuwALpM/15q//pc2fJpv5RqyOqRwYtD1Y7q0ciBuexuzEckt6t4bu5goXfAcqAOu6+3wDJs0V0L0/sKq8lz7Wnr6MKh9GASHrlnZVpAgnHnU3mTVXjTepWdciZaTsXTFR4wCqXgMToFeGOPIa5S7tFnZK3s+04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750720789; c=relaxed/simple;
	bh=SqCa7T/OWKo0ERBeVEeW9q0S7iyfTdGOPEG3rQz8UM8=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=mQjdlnOl+FnA186mcQHnaIBZZTe2FVUD8dUP7Ey/hb6A+T5oNMjQAc+gFGj+Z2D5/XbUpGfqJThgqwImgRxRPeaHab27JAf397I5sCvw3BwY0taiAzUoEIDvhFvj1IB6wYaRlENUFUr4MNpd1R/Z2bv5tY9aBNjMoa9rNbDCIJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=wRNpBRF9; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="wRNpBRF9"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso3810973b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750720787; x=1751325587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gw6GoMqApL8OI1pFqF47hahg0MqEAjgMuBlQV9Gc5uY=;
        b=wRNpBRF9iYJ4RkuGEfWAQaLSAEK/RfA79Dj9rlZp5U2hN1CFH0/XLZQr6w3Yom8Vwp
         Dp03+cts/N0nMvUCpuAq/EfdnYMbi2WFaQXkt3h1yN84mHjoEL+zHYUI03XVSM4IcEpe
         rMhs89OkTWNQ1GYu5sbVLl3/0okSoP5fz7Isxsk6UkyAw6jo4BGebCEJ47ojOBfEFH/E
         VMaybaIXTnMCRim6RQMUpNOGtjWhQ/nl89WO1BWdJRFpNmXuPqcvzGtwvwTJP5m9NF3f
         S1vrnXKCqRNfg2H3QC8SRcMA9wGU0nyorPHzyA0AvjvtUPNdxwoVZT3+MhQg5tcVxHua
         nzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750720787; x=1751325587;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gw6GoMqApL8OI1pFqF47hahg0MqEAjgMuBlQV9Gc5uY=;
        b=DVhI6kI6hnD/e9yeUdkMbaJHeOvq+MEybvSe9w3mG5BX7cuOPPKEKg4P7koNw8/0rw
         iTO5a8dDBDjGBvuOI4WCsDL4VBRXOZ1NSBYtPp3Lwb3zL2STKY7KhfoOHD3SjY9uBTCN
         A7hr30EoFio4T+uoiy9JAMztlo7f5s1gH6r3xCYXzhSm+XQYEfgijow6aKENAkjMIagt
         Uog7hXKHFuY3RUIR1eNng0SRkPGHVv2TOwp0EFV45FVQ0iIMFfqurJ6aEV3LfPSFdi1J
         zHzW5zxjsZa0gLiS/+Lwh2270AlROoqWGaaRIDkQRW8Ir1WMW08Zyni43IgsRAqrqOnn
         JQ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGJ9l5WnpeXs7BBW8v/6MpOdi0pWdFslizLNCy8yHJNnAl3HHGRi6ycA5t3oFN9cTG06r31QiiyE0a9iU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAO8dGfLxsk+rwkqiTPvPxo4HzdbxkuwtPFpmDUP/DV0igrcxI
	OHFcgVvo75WsKio2y3yF3UGhVwyP1o/+iVeZ8SvIxFBMn/zR3AJ2/4i5cVgBFW3c0B4=
X-Gm-Gg: ASbGncuuLa0HDGB5BhD5z7akEDrNJP2HYP+dROS8StqFF3/6q6dObJNH/QlTDklcg2r
	y8ik7xg8sh+6nkplRdyelKh5t8/pGhFACrzEblaTKB4j5tLageLfM7o9PsEC1oD6azEf/Mlg/6y
	3GuDiwqHZzUNc/vYAIMDnQPLT0ZiKksDX/vP2yLlb9wG/zthKK4NDby9FTMe7I0dHowqRu9i6U9
	gdstHs6iRnm9IkHKMtN+Ky+6YZmsbnmEhBSyHl8XrlDBojcsSVgBUNhHBF3kPV1dSmI1vigFSoB
	a5TXl6s5QTZ6OLqMhH8i2vkzs1L5qdUYkO6CtYtUyDiwv4sHplX7NMhtHUt/
X-Google-Smtp-Source: AGHT+IECSVjx/mmkypzRcN8ZzuvF0xqk1KDzf8++bj1/I4kCpcXXhWVnUjiOYCJWPfh8V+CjlVYRLg==
X-Received: by 2002:a05:6a00:14c1:b0:742:4545:2d2b with SMTP id d2e1a72fcca58-7490d66537fmr24687533b3a.3.1750720786597;
        Mon, 23 Jun 2025 16:19:46 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-749c8850c86sm234745b3a.112.2025.06.23.16.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 16:19:46 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:19:46 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 16:19:42 PDT (-0700)
Subject:     Re: [PATCH V8 2/3] riscv: mm: Add soft-dirty page tracking support
In-Reply-To: <20250619065232.1786470-3-zhangchunyan@iscas.ac.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org, linux-riscv@lists.infradead.org, debug@rivosinc.com,
  Vedvyas Shanbhogue <ved@rivosinc.com>, linux-kernel@vger.kernel.org, zhang.lyra@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhangchunyan@iscas.ac.cn
Message-ID: <mhng-2543F392-0764-425E-ACB2-C897B7834C6C@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 18 Jun 2025 23:52:31 PDT (-0700), zhangchunyan@iscas.ac.cn wrote:
> The Svrsw60t59b extension allows to free the PTE reserved bits 60 and 59
> for software, this patch uses bit 59 for soft-dirty.
>
> To add swap PTE soft-dirty tracking, we borrow bit 3 which is available
> for swap PTEs on RISC-V systems.
>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>  arch/riscv/Kconfig                    |  1 +
>  arch/riscv/include/asm/pgtable-bits.h | 19 +++++++
>  arch/riscv/include/asm/pgtable.h      | 71 ++++++++++++++++++++++++++-
>  3 files changed, 89 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 01e4c15bee12..5c787c09f4dc 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -141,6 +141,7 @@ config RISCV
>  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
>  	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>  	select HAVE_ARCH_SECCOMP_FILTER
> +	select HAVE_ARCH_SOFT_DIRTY if 64BIT && MMU && RISCV_ISA_SVRSW60T59B
>  	select HAVE_ARCH_STACKLEAK
>  	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
>  	select HAVE_ARCH_TRACEHOOK
> diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> index a8f5205cea54..a6fa871dc19e 100644
> --- a/arch/riscv/include/asm/pgtable-bits.h
> +++ b/arch/riscv/include/asm/pgtable-bits.h
> @@ -20,6 +20,25 @@
>
>  #define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
>  #define _PAGE_DEVMAP    (1 << 9)    /* RSW, devmap */
> +
> +#ifdef CONFIG_MEM_SOFT_DIRTY
> +
> +/* ext_svrsw60t59b: bit 59 for software dirty tracking */
> +#define _PAGE_SOFT_DIRTY						\
> +	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
> +	 (1UL << 59) : 0)

I haven't fully followed the code paths here, but it looks like we'll 
unconditionally enable VM_SOFTDIRTY and thus allow 
vma_soft_dirty_enabled() to return true even when we don't have support 
in hardware.

I'm not exactly sure what could go wrong there, but it seems like at 
least userspace could be told that soft dirty is around and thus get 
confused.  It also looks like debug_vm_pgtable() will start failing 
tests on these systems, which will probably trigger some bug reports.

At a bare minimum someone who understands the core MM code should look 
here.  Maybe the best way to do that is to convert those static 
CONFIG_MEM_SOFT_DIRTY checks to some sort of arch-implemented callback 
so this can be dynamic, and then see what people say?

> +/*
> + * Bit 3 is always zero for swap entry computation, so we
> + * can borrow it for swap page soft-dirty tracking.
> + */
> +#define _PAGE_SWP_SOFT_DIRTY						\
> +	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
> +	 _PAGE_EXEC : 0)
> +#else
> +#define _PAGE_SOFT_DIRTY	0
> +#define _PAGE_SWP_SOFT_DIRTY	0
> +#endif /* CONFIG_MEM_SOFT_DIRTY */
> +
>  #define _PAGE_TABLE     _PAGE_PRESENT
>
>  /*
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index a11816bbf9e7..efc2da97f124 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -434,7 +434,7 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
>
>  static inline pte_t pte_mkdirty(pte_t pte)
>  {
> -	return __pte(pte_val(pte) | _PAGE_DIRTY);
> +	return __pte(pte_val(pte) | _PAGE_DIRTY | _PAGE_SOFT_DIRTY);
>  }
>
>  static inline pte_t pte_mkclean(pte_t pte)
> @@ -467,6 +467,38 @@ static inline pte_t pte_mkhuge(pte_t pte)
>  	return pte;
>  }
>
> +#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> +static inline bool pte_soft_dirty(pte_t pte)
> +{
> +	return !!(pte_val(pte) & _PAGE_SOFT_DIRTY);
> +}
> +
> +static inline pte_t pte_mksoft_dirty(pte_t pte)
> +{
> +	return __pte(pte_val(pte) | _PAGE_SOFT_DIRTY);
> +}
> +
> +static inline pte_t pte_clear_soft_dirty(pte_t pte)
> +{
> +	return __pte(pte_val(pte) & ~(_PAGE_SOFT_DIRTY));
> +}
> +
> +static inline bool pte_swp_soft_dirty(pte_t pte)
> +{
> +	return !!(pte_val(pte) & _PAGE_SWP_SOFT_DIRTY);
> +}
> +
> +static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
> +{
> +	return __pte(pte_val(pte) | _PAGE_SWP_SOFT_DIRTY);
> +}
> +
> +static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
> +{
> +	return __pte(pte_val(pte) & ~(_PAGE_SWP_SOFT_DIRTY));
> +}
> +#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
> +
>  #ifdef CONFIG_RISCV_ISA_SVNAPOT
>  #define pte_leaf_size(pte)	(pte_napot(pte) ?				\
>  					napot_cont_size(napot_cont_order(pte)) :\
> @@ -819,6 +851,40 @@ static inline pud_t pud_mkspecial(pud_t pud)
>  }
>  #endif
>
> +#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> +static inline bool pmd_soft_dirty(pmd_t pmd)
> +{
> +	return pte_soft_dirty(pmd_pte(pmd));
> +}
> +
> +static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
> +{
> +	return pte_pmd(pte_mksoft_dirty(pmd_pte(pmd)));
> +}
> +
> +static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
> +{
> +	return pte_pmd(pte_clear_soft_dirty(pmd_pte(pmd)));
> +}
> +
> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> +static inline bool pmd_swp_soft_dirty(pmd_t pmd)
> +{
> +	return pte_swp_soft_dirty(pmd_pte(pmd));
> +}
> +
> +static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
> +{
> +	return pte_pmd(pte_swp_mksoft_dirty(pmd_pte(pmd)));
> +}
> +
> +static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
> +{
> +	return pte_pmd(pte_swp_clear_soft_dirty(pmd_pte(pmd)));
> +}
> +#endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
> +
>  static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>  				pmd_t *pmdp, pmd_t pmd)
>  {
> @@ -1005,7 +1071,8 @@ static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
>   *
>   * Format of swap PTE:
>   *	bit            0:	_PAGE_PRESENT (zero)
> - *	bit       1 to 3:       _PAGE_LEAF (zero)
> + *	bit       1 to 2:	(zero)
> + *	bit            3:	_PAGE_SWP_SOFT_DIRTY
>   *	bit            5:	_PAGE_PROT_NONE (zero)
>   *	bit            6:	exclusive marker
>   *	bits      7 to 11:	swap type
