Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3FB1E9B35
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288131; cv=none; b=JJUPl73E4RIbfDHkAxg74gOPralbHnmEP/9BLZZa9V5OSBPrJ9jd92fXseie3GYP2nmD0YOjmPdkKJgoIL3oY8DBT+n2hs5c08ltImVOv5BM1KtZCLiGEwXrhSRcvV/hNCUt4Vh120ZooXRLdb0/jOwvLWo4zJ1W/kA7J7nzoj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288131; c=relaxed/simple;
	bh=iEhF+6QmLMHUflVLwYD9cgRRfXhpcFOE6WZAlFOppwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFiypm3auK7p8laF7t443xsULcXG5rTSfrI/GLjK2APcb44wCp2owpEOUTR133sWrqhgBUW+fSyyFf1PHCGTa2eKlR+dL2PBBoOULw4ffSVZ+fveQ5sxTegYvc7XzZM9sF2H1kg+Vpu4GNwXkfmIXK677hluVUN3zRDc/bpmjrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5of8+wl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5of8+wl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3F3C4CEE8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744288130;
	bh=iEhF+6QmLMHUflVLwYD9cgRRfXhpcFOE6WZAlFOppwc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G5of8+wlTS4I2n7QLMKGq8q5/sanyZ8PjAYjH9/Wk3uyAz/0rIAbkyJWGCuXcaOIk
	 qmeItDsLQs5slG301DkJTl/3eQY0L5bMOx/ZtaW2IVLXByx1QNgQX8XqOnStE3OlPg
	 +BW1lq9quTp+zKRrFi1WP+scywb6iOv2KYxR+3SUQxU5qHPIifBy6UYIMCbGzsGb+i
	 EX7gjtyIRALZl2q5eDqYgYuDQ/aQX/cLVNpoZbN0jCeM3PzHN80JXbBYwo7lBtFN3r
	 jTA0+Em62XEqdF91XYEUk5XTfAQBWBhbEtBmFQSRtkYctY1YlPv0gWLD4IvS9PD/O9
	 Jd3px9bkz+xNg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b10956398so924082e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:28:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDgH6A5C91kt63ckf52lowgEB78QQ5kwxAJ/0rD0ogStc8oSY/2SIocdHlhXpvFq495g8oGHVGMscB6Uc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN6Bn0pqipQseosXItZ7jXj6eMi9tb48C2XS1BJRQIF/e4s7pX
	JTbsAiz8i67mnRBVqBkMJk/55mJqiq93CCkZpTRn8nnhkz/3abYvmvjMxgBHWnCL+8gudaVd3r1
	gNEvkVyJu4a+Qqf7K9aa0gYBX6mw=
X-Google-Smtp-Source: AGHT+IEk6+pEv1KhjsN+b2LVfZiOU1+lMkalIlqJouC1Hrv7mXEHGQrdk/bizME+BN/G20yuxVH9e+ceAqLyXH7BawM=
X-Received: by 2002:a05:6512:10d5:b0:549:90ac:cca2 with SMTP id
 2adb3069b0e04-54ce2cb7f96mr912096e87.1.1744288129259; Thu, 10 Apr 2025
 05:28:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410074024.1545768-1-anshuman.khandual@arm.com>
In-Reply-To: <20250410074024.1545768-1-anshuman.khandual@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 10 Apr 2025 14:28:37 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGn71CGqXCN2mWokZuq37bbEtnOKkrB=_dddp0dyPTndw@mail.gmail.com>
X-Gm-Features: ATxdqUHgOJV_vjYP4l3C17rNPu2Dtq-En5ozAQwkRwj8d_BpPMRORfCZolLuaaI
Message-ID: <CAMj1kXGn71CGqXCN2mWokZuq37bbEtnOKkrB=_dddp0dyPTndw@mail.gmail.com>
Subject: Re: [PATCH] arm64/mm: Re-organise setting up FEAT_S1PIE registers
 PIRE0_EL1 and PIR_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Anshuman,

On Thu, 10 Apr 2025 at 09:40, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
> as expected if those macro constants contain some 128 bit layout elements,
> required for D128 page tables.

Could you elaborate?

> Fix this problem via first loading up these
> macro constants into a given memory location and then subsequently setting
> up registers PIRE0_EL1 and PIR_EL1 by retrieving the memory stored values.
>

If this is necessary, we could also remove the PTE_MAYBE_xx override hack no?

> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc1
>
>  arch/arm64/kernel/head.S         | 3 +++
>  arch/arm64/kernel/pi/map_range.c | 6 ++++++
>  arch/arm64/kernel/pi/pi.h        | 1 +
>  arch/arm64/mm/mmu.c              | 1 +
>  arch/arm64/mm/proc.S             | 5 +++--
>  5 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index 2ce73525de2c..4950d9cc638a 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -126,6 +126,9 @@ SYM_CODE_START(primary_entry)
>          * On return, the CPU will be ready for the MMU to be turned on and
>          * the TCR will have been set.
>          */
> +       adr_l   x0, pir_data
> +       bl      __pi_load_pir_data
> +
>         bl      __cpu_setup                     // initialise processor
>         b       __primary_switch
>  SYM_CODE_END(primary_entry)
> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
> index 81345f68f9fc..cd9d24e73046 100644
> --- a/arch/arm64/kernel/pi/map_range.c
> +++ b/arch/arm64/kernel/pi/map_range.c
> @@ -103,3 +103,9 @@ asmlinkage u64 __init create_init_idmap(pgd_t *pg_dir, pteval_t clrmask)
>
>         return ptep;
>  }
> +
> +asmlinkage void __init load_pir_data(u64 pir_data[])
> +{
> +       pir_data[0] = PIE_E0;
> +       pir_data[1] = PIE_E1;
> +}
> diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
> index c91e5e965cd3..ae61df4fdb77 100644
> --- a/arch/arm64/kernel/pi/pi.h
> +++ b/arch/arm64/kernel/pi/pi.h
> @@ -34,3 +34,4 @@ void map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
>  asmlinkage void early_map_kernel(u64 boot_status, void *fdt);
>
>  asmlinkage u64 create_init_idmap(pgd_t *pgd, pteval_t clrmask);
> +asmlinkage void load_pir_data(u64 pir_data[]);
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index ea6695d53fb9..762e81ff4e85 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -58,6 +58,7 @@ static bool rodata_is_rw __ro_after_init = true;
>   * with MMU turned off.
>   */
>  long __section(".mmuoff.data.write") __early_cpu_boot_status;
> +unsigned long __section(".mmuoff.data.write") pir_data[2];
>
>  /*
>   * Empty_zero_page is a special page that is used for zero-initialized data
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index fb30c8804f87..7dd28cf101c2 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -524,9 +524,10 @@ alternative_else_nop_endif
>  #define PTE_MAYBE_NG           0
>  #define PTE_MAYBE_SHARED       0
>
> -       mov_q   x0, PIE_E0
> +       adr_l   x1, pir_data
> +       ldr     x0, [x1, #0]
>         msr     REG_PIRE0_EL1, x0
> -       mov_q   x0, PIE_E1
> +       ldr     x0, [x1, #8]
>         msr     REG_PIR_EL1, x0
>
>  #undef PTE_MAYBE_NG
> --
> 2.25.1
>
