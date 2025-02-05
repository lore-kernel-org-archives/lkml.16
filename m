Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744E1156C5E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770249; cv=none; b=kI4qwipJOxvM/bWGA2ujuKN1x6x2P+MQKDLC3O58+pikWwZ3F5fLfREjY+6HtHQxLSUsgB1+56UKujryxQUBDFYifcFLan06wK2vIiyuvfEkb8tlA/KeDk05pe7DswN/ows8ZgMjuslX/6fDDSWXL/5ccFAdzAczgItb/W8Jbso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770249; c=relaxed/simple;
	bh=LkiRrBe/u7+smKTt6y90//gTQnERHtniEpyIZ23+TtE=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=Q+rWQ6BT0oWdSCF8AWbu65xKNf9pGdPMjVlXhvsrOgyyA9FWEuz8P3pIE0ui1NfkIlIiLOvZQbRpItja+cGToPSNPmiUWumMwn/pm/L3fSJ0vvFut2CrQ/rxbIUvmStikUp1OCZ5iPw5oKpv0xoc1ula5v8/z1hpK39t68Qh7jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=ISBO4WIa; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="ISBO4WIa"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21619108a6bso116833115ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1738770246; x=1739375046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zT69bL9JfaLAq+SWLvU2+Hx0fbYsb5+ukoBMV4EDjU=;
        b=ISBO4WIaRE5SrsNuy8k+bw6dBsXoIlgsKupaRujKPXotEDD10ehTXjB5D7aTnI0T12
         FMiZYWul263M7io8LYTaSDMq2vXSIbG5FOpKEBGQX9h3AQsvCYtxtoSPfou2y0xuXj8X
         fQ+7daF9dIsjpMrDU6FUT+fS6lVET5Z/faigUZ4ajJdZvkG1CkUmWS7AyfyjonxtSRr2
         nIz8jiTyo0pW4wLDnVUI59LW0kZ8svfTMe5ZXWPDFkNZYl3lYZyGH/Pd7UofXWs/uBrE
         2JGmdafKzQKcIuh70lwb5UbI2kVjCHCfH85iz07xmpme1dxELJmdQawbN2rdG3RB7iiM
         iiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738770246; x=1739375046;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zT69bL9JfaLAq+SWLvU2+Hx0fbYsb5+ukoBMV4EDjU=;
        b=iSI2ss4E1ksevEauQmfAmsQNw3B+r5wOs5gTrnNIbcD/at35amq5+P4Ec6rVyHbGU8
         FLkt+QEW2DlxpxBj5KPUMbZrrexotqpqJDGsMAQE9dZJvQUBt8lV6LZo1xvNxJZB4BNe
         XR39dCpjAbXwi6fGSurHtiznlV4e6LOZvrhcyTisGolT7ExJIhf93XW3Q0ElYH+RfIQJ
         EexwQEsJTq1xqIk6a9KkRMFsL5PBwQ1AroLZf9LHNxZp+XTTce0qkHyB5mzk0mv0wVxH
         k4JlUDPpBhmlRBkqeWghp6GIVXG+SgD5cf0QClYCZ08OimTDuQnMAYKwz8FjHyxo62qj
         VsJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/kOXl1kSU1RWyTqgS+fnNiOUa1CayZb08307DWNyqRPqAPdo5op1uux0AnnLCZmgqn3BrF2wBrYxZX6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNI2uUfO2K7/ONsSJMVYloJ2klPJdB84wrJ5WpqnGePGpPHErK
	2SXES+pPHrRdLhGLKKUJTkBRx4hXSXMWoHGmsxjiFQZXtoDswsjSLvRRGuE6o5c=
X-Gm-Gg: ASbGncuBWq5rikPELxj3VzN/b8mbU88dcJq0tgqhY0oMtU41dgvTHCiURmv+UUGpJlr
	TwDz1iXBVj8RTKeSdXl/ZXb6GdMsq9FSuviG2iPhePXbtVzYubcDLXuqxbnd1XfJgUVozHmx9uZ
	Q96/1hEX6IBI/NES/f1exszlhmnuhH7+rh7itWnl1VVFVOGzCkJyv2IXeGcGBnmPk0av2bzR9wx
	SJlWthyu0IXxYGBkpst/tW51VEm+M8+t3mZltz8nXoognIs9ZpD20khhxwvKgpRxyRLqsyuZjPf
	vqs9Wn50f2tV
X-Google-Smtp-Source: AGHT+IGhvzhj/sPSSySjwJxgqhyIRQS/xgF2hYsjdkcaL/BJc0FerzBk8alME0oRGF5q9MkpJ9ggog==
X-Received: by 2002:a05:6a21:100f:b0:1e1:ccf3:a72 with SMTP id adf61e73a8af0-1ede88ad424mr6321997637.28.1738770244131;
        Wed, 05 Feb 2025 07:44:04 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bee1sm12617542b3a.2.2025.02.05.07.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:44:03 -0800 (PST)
Date: Wed, 05 Feb 2025 07:44:03 -0800 (PST)
X-Google-Original-Date: Wed, 05 Feb 2025 07:44:01 PST (-0800)
Subject:     Re: [PATCH v3] riscv: Fix the PAUSE Opcode for MIPS P8700.
In-Reply-To: <20250129131703.733098-1-arikalo@gmail.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, ajones@ventanamicro.com, christoph.muellner@vrull.eu, arikalo@gmail.com,
  linux-kernel@vger.kernel.org, djordje.todorovic@htecgroup.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: arikalo@gmail.com
Message-ID: <mhng-c1c0b3c0-f358-40ce-ba1d-e33d2b85d9cc@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 29 Jan 2025 05:17:03 PST (-0800), arikalo@gmail.com wrote:
> From: Djordje Todorovic <djordje.todorovic@htecgroup.com>
>
> The riscv MIPS P8700 uses a different opcode for PAUSE.
> It is a ‘hint’ encoding of the SLLI instruction, with rd=0, rs1=0 and
> imm=5. It will behave as a NOP instruction if no additional behavior
> beyond that of SLLI is implemented.

We need to expose it to userspace, then, as it's a user-visible erratum 
-- really it's just a totally different custom extension than 
Zihintpause, but I don't think it really makes much of a difference what 
we call it.

If you have other custom stuff it's probably a good time to expose 
those, too, as then it'll be easier for userspace to sort out.

> Add ERRATA_MIPS and ERRATA_MIPS_P8700_PAUSE_OPCODE configs.
> Handle errata for MIPS CPUs.
>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> Signed-off-by: Raj Vishwanathan4 <rvishwanathan@mips.com>
> ---
>  arch/riscv/Kconfig.errata                     | 23 +++++++++++
>  arch/riscv/errata/Makefile                    |  1 +
>  arch/riscv/errata/mips/Makefile               |  5 +++
>  arch/riscv/errata/mips/errata.c               | 41 +++++++++++++++++++
>  arch/riscv/include/asm/alternative.h          |  3 ++
>  arch/riscv/include/asm/cmpxchg.h              |  3 +-
>  arch/riscv/include/asm/errata_list.h          | 20 ++++++++-
>  arch/riscv/include/asm/vdso/processor.h       |  4 +-
>  arch/riscv/include/asm/vendorid_list.h        |  1 +
>  arch/riscv/kernel/alternative.c               |  5 +++
>  arch/riscv/kernel/entry.S                     |  2 +
>  arch/riscv/mm/init.c                          |  1 +
>  tools/arch/riscv/include/asm/vdso/processor.h |  5 ++-
>  13 files changed, 110 insertions(+), 4 deletions(-)
>  create mode 100644 arch/riscv/errata/mips/Makefile
>  create mode 100644 arch/riscv/errata/mips/errata.c
>
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 2acc7d876e1f..1589528fdc30 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -21,6 +21,29 @@ config ERRATA_ANDES_CMO
>
>  	  If you don't know what to do here, say "Y".
>
> +config ERRATA_MIPS
> +	bool "MIPS errata"
> +	depends on RISCV_ALTERNATIVE
> +	help
> +	  All MIPS errata Kconfig depend on this Kconfig. Disabling
> +	  this Kconfig will disable all MIPS errata. Please say "Y"
> +	  here if your platform uses MIPS CPU cores.
> +
> +	  Otherwise, please say "N" here to avoid unnecessary overhead.
> +
> +config ERRATA_MIPS_P8700_PAUSE_OPCODE
> +	bool "Fix the PAUSE Opcode for MIPS P8700"
> +	depends on ERRATA_MIPS && 64BIT
> +	default n
> +	help
> +	   The RISCV MIPS P8700 uses a different opcode for PAUSE.
> +	   It is a 'hint' encoding of the SLLI instruction,
> +	   with rd=0, rs1=0 and imm=5. It will behave as a NOP
> +	   instruction if no additional behavior beyond that of
> +	   SLLI is implemented.
> +
> +	   If you are not using the P8700 processor, say n.
> +
>  config ERRATA_SIFIVE
>  	bool "SiFive errata"
>  	depends on RISCV_ALTERNATIVE
> diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
> index f0da9d7b39c3..156cafb338c1 100644
> --- a/arch/riscv/errata/Makefile
> +++ b/arch/riscv/errata/Makefile
> @@ -9,5 +9,6 @@ endif
>  endif
>
>  obj-$(CONFIG_ERRATA_ANDES) += andes/
> +obj-$(CONFIG_ERRATA_MIPS) += mips/
>  obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
>  obj-$(CONFIG_ERRATA_THEAD) += thead/
> diff --git a/arch/riscv/errata/mips/Makefile b/arch/riscv/errata/mips/Makefile
> new file mode 100644
> index 000000000000..6278c389b801
> --- /dev/null
> +++ b/arch/riscv/errata/mips/Makefile
> @@ -0,0 +1,5 @@
> +ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
> +CFLAGS_errata.o := -mcmodel=medany
> +endif
> +
> +obj-y += errata.o
> diff --git a/arch/riscv/errata/mips/errata.c b/arch/riscv/errata/mips/errata.c
> new file mode 100644
> index 000000000000..998bbcaa50d1
> --- /dev/null
> +++ b/arch/riscv/errata/mips/errata.c
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 MIPS.
> + */
> +
> +#include <linux/memory.h>
> +#include <linux/module.h>
> +#include <asm/text-patching.h>
> +#include <asm/alternative.h>
> +#include <asm/errata_list.h>
> +#include <asm/vendorid_list.h>
> +#include <asm/vendor_extensions.h>
> +
> +void mips_errata_patch_func(struct alt_entry *begin,
> +					     struct alt_entry *end,
> +					     unsigned long archid,
> +					     unsigned long impid,
> +					     unsigned int stage)
> +{
> +	struct alt_entry *alt;
> +
> +	BUILD_BUG_ON(ERRATA_MIPS_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
> +
> +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return;
> +
> +	for (alt = begin; alt < end; alt++) {
> +		if (alt->vendor_id != MIPS_VENDOR_ID)
> +			continue;
> +
> +		if (alt->patch_id >= ERRATA_MIPS_NUMBER) {
> +			WARN(1, "MIPS errata id:%d not in kernel errata list\n",
> +			     alt->patch_id);
> +			continue;
> +		}
> +
> +		mutex_lock(&text_mutex);
> +		patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt), alt->alt_len);
> +		mutex_unlock(&text_mutex);
> +	}
> +}
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> index 3c2b59b25017..bc3ada8190a9 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -48,6 +48,9 @@ struct alt_entry {
>  void andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
>  			     unsigned long archid, unsigned long impid,
>  			     unsigned int stage);
> +void mips_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> +			      unsigned long archid, unsigned long impid,
> +			      unsigned int stage);
>  void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
>  			      unsigned long archid, unsigned long impid,
>  			      unsigned int stage);
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 4cadc56220fe..2f5705f49dcc 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -13,6 +13,7 @@
>  #include <asm/hwcap.h>
>  #include <asm/insn-def.h>
>  #include <asm/cpufeature-macros.h>
> +#include <asm/errata_list.h>
>
>  #define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,		\
>  			   swap_append, r, p, n)				\
> @@ -404,7 +405,7 @@ static __always_inline void __cmpwait(volatile void *ptr,
>  	return;
>
>  no_zawrs:
> -	asm volatile(RISCV_PAUSE : : : "memory");
> +	ALT_RISCV_PAUSE();
>  }
>
>  #define __cmpwait_relaxed(ptr, val) \
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 7c8a71a526a3..68c46ccb9b7c 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -5,7 +5,6 @@
>  #ifndef ASM_ERRATA_LIST_H
>  #define ASM_ERRATA_LIST_H
>
> -#include <asm/alternative.h>
>  #include <asm/csr.h>
>  #include <asm/insn-def.h>
>  #include <asm/hwcap.h>
> @@ -28,6 +27,11 @@
>  #define	ERRATA_THEAD_NUMBER 2
>  #endif
>
> +#ifdef CONFIG_ERRATA_MIPS
> +#define ERRATA_MIPS_P8700_PAUSE_OPCODE 0
> +#define ERRATA_MIPS_NUMBER 1
> +#endif
> +
>  #ifdef __ASSEMBLY__
>
>  #define ALT_INSN_FAULT(x)						\
> @@ -58,6 +62,20 @@ asm(ALTERNATIVE("sfence.vma %0, %1", "sfence.vma", SIFIVE_VENDOR_ID,	\
>  		ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)	\
>  		: : "r" (addr), "r" (asid) : "memory")
>
> +#ifdef CONFIG_ERRATA_MIPS_P8700_PAUSE_OPCODE
> +#define ALT_RISCV_PAUSE()                                               \
> +asm volatile(ALTERNATIVE(                                               \
> +    RISCV_PAUSE,                /* Original RISC‑V pause insn */        \
> +    ".4byte 0x00501013",        /* Replacement for MIPS P8700 */        \
> +    MIPS_VENDOR_ID,             /* Vendor ID to match */                \
> +    ERRATA_MIPS_P8700_PAUSE_OPCODE, /* patch_id */                      \
> +    CONFIG_ERRATA_MIPS_P8700_PAUSE_OPCODE)                              \
> +    : /* no outputs */ : /* no inputs */ : "memory")
> +#else
> +#define ALT_RISCV_PAUSE() \
> +    asm volatile(RISCV_PAUSE : : : "memory")
> +#endif
> +
>  /*
>   * _val is marked as "will be overwritten", so need to set it to 0
>   * in the default case.
> diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
> index 8f383f05a290..8f749552ecfe 100644
> --- a/arch/riscv/include/asm/vdso/processor.h
> +++ b/arch/riscv/include/asm/vdso/processor.h
> @@ -5,6 +5,8 @@
>  #ifndef __ASSEMBLY__
>
>  #include <asm/barrier.h>
> +
> +#include <asm/errata_list.h>
>  #include <asm/insn-def.h>
>
>  static inline void cpu_relax(void)
> @@ -19,7 +21,7 @@ static inline void cpu_relax(void)
>  	 * Reduce instruction retirement.
>  	 * This assumes the PC changes.
>  	 */
> -	__asm__ __volatile__ (RISCV_PAUSE);
> +	ALT_RISCV_PAUSE();
>  	barrier();
>  }
>
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
> index a5150cdf34d8..3b09874d7a6d 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -9,5 +9,6 @@
>  #define MICROCHIP_VENDOR_ID	0x029
>  #define SIFIVE_VENDOR_ID	0x489
>  #define THEAD_VENDOR_ID		0x5b7
> +#define MIPS_VENDOR_ID		0x722
>
>  #endif
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index 7eb3cb1215c6..7642704c7f18 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -47,6 +47,11 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info
>  		cpu_mfr_info->patch_func = andes_errata_patch_func;
>  		break;
>  #endif
> +#ifdef CONFIG_ERRATA_MIPS
> +	case MIPS_VENDOR_ID:
> +		cpu_mfr_info->patch_func = mips_errata_patch_func;
> +		break;
> +#endif
>  #ifdef CONFIG_ERRATA_SIFIVE
>  	case SIFIVE_VENDOR_ID:
>  		cpu_mfr_info->patch_func = sifive_errata_patch_func;
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 33a5a9f2a0d4..2007d9de7f27 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -15,6 +15,8 @@
>  #include <asm/thread_info.h>
>  #include <asm/asm-offsets.h>
>  #include <asm/errata_list.h>
> +#include <asm/alternative.h>
> +
>  #include <linux/sizes.h>
>
>  	.section .irqentry.text, "ax"
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 722178ae3488..ee8a2c5b40f8 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -35,6 +35,7 @@
>  #include <asm/soc.h>
>  #include <asm/sparsemem.h>
>  #include <asm/tlbflush.h>
> +#include <asm/alternative.h>
>
>  #include "../kernel/head.h"
>
> diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> index 662aca039848..880f26a24f69 100644
> --- a/tools/arch/riscv/include/asm/vdso/processor.h
> +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> @@ -14,7 +14,10 @@ static inline void cpu_relax(void)
>  	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
>  #endif
>
> -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> +#ifdef CONFIG_ERRATA_MIPS_P8700_PAUSE_OPCODE
> +    /* MIPS P8700 pause opcode */
> +    __asm__ __volatile__ (".4byte 0x00501013");
> +#elif CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
>  	/*
>  	 * Reduce instruction retirement.
>  	 * This assumes the PC changes.
