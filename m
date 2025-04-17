Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464B21FFC48
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 19:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744919040; cv=none; b=cxsxqOzWYJWyrXICjeNX81T65b4HZAaF1b66y8D8HCRsyS2jE4bEQNVfLddlA1jV9Y6dtJ2mNW+Lm2aP+zYi8Cx5sDcQjdkeb/JAQeF2GSgmDcMbzj0dgy82M78/xc0a0O7jGIiQKnGikvPODiVanCoquxytJEkY7v4AvEJrheU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744919040; c=relaxed/simple;
	bh=WOYOzZuOJkNtb7AkbussTPvJ93DfOKWqIQjQgXO7UbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XiypziwlG8sVbW9SgfXBYNN2tsOvFpyt92NH7DEzzK7KvTElynsXqZ5n0NMNdGfyQJMQt5yQSsnYdh2VfgztUwm1+ycS9XwNYSEnEPw04uHiYQdQRORpI9XPFS2QDVZqllpD9Y2iUQb5zLGKFjs/VE+0KIZUseAQW2hSCaPGFfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xodyqcNw; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xodyqcNw"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b06e9bcc986so903061a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744919037; x=1745523837; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rYo3jxKCye0dqDCwno5JHcRnzatOv0mt+5gN6W9sfks=;
        b=xodyqcNwCi/qvHp9oQNBkNEjHy0x3FgnqczgxatuhWKRJOG03gvD39hHvZJKI8No5N
         TKUGe4mr3i4yihYVeLIRXTRx25KCA521dRIKABl2QsLco70/nt1+pRuUGB3YWVEG/V7J
         sfxGCNv9+8dr+vth2GWSvXL3B5hBupTyst/Kmj+Ngc5CNY/efnJc/xgVMrdmP0ov8lvf
         TXToXDsRr1cwgFWznP2lwAVE8YmLren9zPaEqn0UF12GA0TxUboVrJ5RLeBTTj63vgM0
         u3X+23kKcsQdtR6opB5qz1nw/k+o6XZxUS/ZvUlkJGzP2faKWoHoi+Uce/n9kIk9/Cei
         e5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744919037; x=1745523837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYo3jxKCye0dqDCwno5JHcRnzatOv0mt+5gN6W9sfks=;
        b=GXZhAbsT3jfW2cRxnBUfM1pmGrIpb/xKC0IvZR0fIoZDRvPl6haodnJEmYL4AY6ru/
         VELdHuHuDGOUwbmJ7xAwg8mFdDLv/PjpPe9h0gKrJdSKnjvjyssypQohWNhJ3kIlGL9r
         Eu2id/v/F/Snm4VDdSSsptf1Qo17nhWxZwfYkuIZkSaevkbvUrcplRSlOI1AsZuKHlRO
         xv8AbqAHHxt7QbWt01PP3TKPYmmLMLs6qPCh5brqmm/N90k7n9NUQPpgOXWhPDhV6PS0
         PI1jYmZYt6H/Is/NnK+9OrR02yYW/Q7PHSaoy1wk5af7bHLqmRsZCGL41Ter5BVSy48S
         baKw==
X-Forwarded-Encrypted: i=1; AJvYcCXYXZqIQBfDlpCxRz2neHHg9GboDXGp1kuUYaaE3yKtDn5i9/8ZQhVji8KUsVNNGE/eKTQv1iWH+dZTWyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU530iJKx/ydrN4HXFoRvlkMxadRFLKVrGKtMbsHUDDp00WSv/
	2ysy851SQ0g8nqAUMlRWUWUbgMDREc3AAZ9qo9HFIaecHSJ+2LeMsLPEe0jFEkppTQvcC9Q48W6
	gpc8foIg/8XkXlqJ90zkPCcWMoKJddJxZci6I
X-Gm-Gg: ASbGncsf+QO1oAdX+sJmJB3uBgaML7tyRFzodjDx9MvG+rysjNe3+sXTTU8nrpEv9c0
	jXZ7sZc7gLWoJ5XuF83YZyE3LFOPEoZq2sqLFJSsglZcYEDWCeX834WntDi40RPxuQWkazrK5DA
	fI3ZK7w26pbsJFzcoomcLSASjEE9seVaQLJIpFEwz1kvoX9hPgdsqWRFlVUgQXcdPo
X-Google-Smtp-Source: AGHT+IEbvLm74tB9QeA3AB7BPVHY71k0Svu1/4ArTBvt42h6W+lJpKoF/Mdw0QhQrJd2PpaKY6vuC7uPqOlb+cOHLK8=
X-Received: by 2002:a17:90b:1f8d:b0:2ee:af31:a7bd with SMTP id
 98e67ed59e1d1-3087bb3965bmr397478a91.5.1744919037245; Thu, 17 Apr 2025
 12:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-4-glider@google.com>
In-Reply-To: <20250416085446.480069-4-glider@google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 17 Apr 2025 21:43:20 +0200
X-Gm-Features: ATxdqUEE9-qQchyPLigAckRascGi6jw_Ms76PRy6A848FlY7vwM_NhxkCcDNZEw
Message-ID: <CANpmjNNmyXd9YkYSTpWrKRqBzJp5bBaEZEuZLHK9Tw-D6NDezQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] kcov: x86: introduce CONFIG_KCOV_ENABLE_GUARDS
To: Alexander Potapenko <glider@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 10:55, Alexander Potapenko <glider@google.com> wrote:
>
> The new config switches coverage instrumentation to using
>   __sanitizer_cov_trace_pc_guard(u32 *guard)
> instead of
>   __sanitizer_cov_trace_pc(void)
>
> Each callback receives a unique 32-bit guard variable residing in the
> __sancov_guards section. Those guards can be used by kcov to deduplicate
> the coverage on the fly.
>
> As a first step, we make the new instrumentation mode 1:1 compatible with
> the old one.
>
> Cc: x86@kernel.org
> Signed-off-by: Alexander Potapenko <glider@google.com>
> ---
>  arch/x86/kernel/vmlinux.lds.S     |  1 +
>  include/asm-generic/vmlinux.lds.h | 14 ++++++-
>  include/linux/kcov.h              |  2 +
>  kernel/kcov.c                     | 61 +++++++++++++++++++++----------
>  lib/Kconfig.debug                 | 16 ++++++++
>  scripts/Makefile.kcov             |  4 ++
>  scripts/module.lds.S              | 23 ++++++++++++
>  tools/objtool/check.c             |  1 +
>  8 files changed, 101 insertions(+), 21 deletions(-)
>
> diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
> index 0deb4887d6e96..2acfbbde33820 100644
> --- a/arch/x86/kernel/vmlinux.lds.S
> +++ b/arch/x86/kernel/vmlinux.lds.S
> @@ -390,6 +390,7 @@ SECTIONS
>                 . = ALIGN(PAGE_SIZE);
>                 __bss_stop = .;
>         }
> +       SANCOV_GUARDS_BSS

Right now this will be broken on other architectures, right?

>         /*
>          * The memory occupied from _text to here, __end_of_kernel_reserve, is
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index 0d5b186abee86..3ff150f152737 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -102,7 +102,8 @@
>   * sections to be brought in with rodata.
>   */
>  #if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CLANG) || \
> -defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
> +       defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG) || \
> +       defined(CONFIG_KCOV_ENABLE_GUARDS)
>  #define TEXT_MAIN .text .text.[0-9a-zA-Z_]*
>  #else
>  #define TEXT_MAIN .text
> @@ -121,6 +122,17 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
>  #define SBSS_MAIN .sbss
>  #endif
>
> +#if defined(CONFIG_KCOV_ENABLE_GUARDS)
> +#define SANCOV_GUARDS_BSS                      \
> +       __sancov_guards(NOLOAD) : {             \
> +               __start___sancov_guards = .;    \
> +               *(__sancov_guards);             \
> +               __stop___sancov_guards = .;     \
> +       }
> +#else
> +#define SANCOV_GUARDS_BSS
> +#endif
> +
>  /*
>   * GCC 4.5 and later have a 32 bytes section alignment for structures.
>   * Except GCC 4.9, that feels the need to align on 64 bytes.
> diff --git a/include/linux/kcov.h b/include/linux/kcov.h
> index e1f7d793c1cb3..7ec2669362fd1 100644
> --- a/include/linux/kcov.h
> +++ b/include/linux/kcov.h
> @@ -107,6 +107,8 @@ typedef unsigned long long kcov_u64;
>  #endif
>
>  void __sanitizer_cov_trace_pc(void);
> +void __sanitizer_cov_trace_pc_guard(u32 *guard);
> +void __sanitizer_cov_trace_pc_guard_init(uint32_t *start, uint32_t *stop);
>  void __sanitizer_cov_trace_cmp1(u8 arg1, u8 arg2);
>  void __sanitizer_cov_trace_cmp2(u16 arg1, u16 arg2);
>  void __sanitizer_cov_trace_cmp4(u32 arg1, u32 arg2);
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 8fcbca236bec5..b97f429d17436 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -193,27 +193,15 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
>         return ip;
>  }
>
> -/*
> - * Entry point from instrumented code.
> - * This is called once per basic-block/edge.
> - */
> -void notrace __sanitizer_cov_trace_pc(void)
> +static void sanitizer_cov_write_subsequent(unsigned long *area, int size,

notrace is missing.

Can we give this a more descriptive name? E.g. "kcov_append" ?

> +                                          unsigned long ip)
>  {
> -       struct task_struct *t;
> -       unsigned long *area;
> -       unsigned long ip = canonicalize_ip(_RET_IP_);
> -       unsigned long pos;
> -
> -       t = current;
> -       if (!check_kcov_mode(KCOV_MODE_TRACE_PC, t))
> -               return;
> -
> -       area = t->kcov_state.s.area;
>         /* The first 64-bit word is the number of subsequent PCs. */
> -       pos = READ_ONCE(area[0]) + 1;
> -       if (likely(pos < t->kcov_state.s.size)) {
> -               /* Previously we write pc before updating pos. However, some
> -                * early interrupt code could bypass check_kcov_mode() check
> +       unsigned long pos = READ_ONCE(area[0]) + 1;
> +
> +       if (likely(pos < size)) {
> +               /*
> +                * Some early interrupt code could bypass check_kcov_mode() check
>                  * and invoke __sanitizer_cov_trace_pc(). If such interrupt is
>                  * raised between writing pc and updating pos, the pc could be
>                  * overitten by the recursive __sanitizer_cov_trace_pc().
> @@ -224,7 +212,40 @@ void notrace __sanitizer_cov_trace_pc(void)
>                 area[pos] = ip;
>         }
>  }
> +
> +/*
> + * Entry point from instrumented code.
> + * This is called once per basic-block/edge.
> + */
> +#ifndef CONFIG_KCOV_ENABLE_GUARDS

Negation makes it harder to read - just #ifdef, and swap the branches below.

> +void notrace __sanitizer_cov_trace_pc(void)
> +{
> +       if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
> +               return;
> +
> +       sanitizer_cov_write_subsequent(current->kcov_state.s.area,
> +                                      current->kcov_state.s.size,
> +                                      canonicalize_ip(_RET_IP_));
> +}
>  EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
> +#else
> +void notrace __sanitizer_cov_trace_pc_guard(u32 *guard)
> +{
> +       if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
> +               return;
> +
> +       sanitizer_cov_write_subsequent(current->kcov_state.s.area,
> +                                      current->kcov_state.s.size,
> +                                      canonicalize_ip(_RET_IP_));
> +}
> +EXPORT_SYMBOL(__sanitizer_cov_trace_pc_guard);
> +
> +void notrace __sanitizer_cov_trace_pc_guard_init(uint32_t *start,
> +                                                uint32_t *stop)
> +{
> +}
> +EXPORT_SYMBOL(__sanitizer_cov_trace_pc_guard_init);
> +#endif
>
>  #ifdef CONFIG_KCOV_ENABLE_COMPARISONS
>  static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
> @@ -252,7 +273,7 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
>         start_index = 1 + count * KCOV_WORDS_PER_CMP;
>         end_pos = (start_index + KCOV_WORDS_PER_CMP) * sizeof(u64);
>         if (likely(end_pos <= max_pos)) {
> -               /* See comment in __sanitizer_cov_trace_pc(). */
> +               /* See comment in sanitizer_cov_write_subsequent(). */
>                 WRITE_ONCE(area[0], count + 1);
>                 barrier();
>                 area[start_index] = type;
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 35796c290ca35..a81d086b8e1ff 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2135,6 +2135,8 @@ config ARCH_HAS_KCOV
>  config CC_HAS_SANCOV_TRACE_PC
>         def_bool $(cc-option,-fsanitize-coverage=trace-pc)
>
> +config CC_HAS_SANCOV_TRACE_PC_GUARD
> +       def_bool $(cc-option,-fsanitize-coverage=trace-pc-guard)
>
>  config KCOV
>         bool "Code coverage for fuzzing"
> @@ -2151,6 +2153,20 @@ config KCOV
>
>           For more details, see Documentation/dev-tools/kcov.rst.
>
> +config KCOV_ENABLE_GUARDS

The "ENABLE" here seems redundant.
Just KCOV_GUARDS should be clear enough.

> +       depends on KCOV
> +       depends on CC_HAS_SANCOV_TRACE_PC_GUARD
> +       bool "Use fsanitize-coverage=trace-pc-guard for kcov"

The compiler option is an implementation detail - it might be more
helpful to have this say "Use coverage guards for kcov".

> +       help
> +         Use coverage guards instrumentation for kcov, passing
> +         -fsanitize-coverage=trace-pc-guard to the compiler.
> +
> +         Every coverage callback is associated with a global variable that
> +         allows to efficiently deduplicate coverage at collection time.
> +
> +         This comes at a cost of increased binary size (4 bytes of .bss
> +         per basic block, plus 1-2 instructions to pass an extra parameter).
> +
>  config KCOV_ENABLE_COMPARISONS
>         bool "Enable comparison operands collection by KCOV"
>         depends on KCOV
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 67e8cfe3474b7..ec63d471d5773 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -1,5 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +ifeq ($(CONFIG_KCOV_ENABLE_GUARDS),y)
> +kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC_GUARD) += -fsanitize-coverage=trace-pc-guard

This can just be kcov-flags-y, because CONFIG_KCOV_ENABLE_GUARDS
implies CONFIG_CC_HAS_SANCOV_TRACE_PC_GUARD.

> +else
>  kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)    += -fsanitize-coverage=trace-pc
> +endif
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   += -fsanitize-coverage=trace-cmp
>  kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)         += -fplugin=$(objtree)/scripts/gcc-plugins/sancov_plugin.so
>
> diff --git a/scripts/module.lds.S b/scripts/module.lds.S
> index 450f1088d5fd3..ec7e9247f8de6 100644
> --- a/scripts/module.lds.S
> +++ b/scripts/module.lds.S
> @@ -64,6 +64,29 @@ SECTIONS {
>                 MOD_CODETAG_SECTIONS()
>         }
>  #endif
> +
> +#ifdef CONFIG_KCOV_ENABLE_GUARDS
> +       __sancov_guards(NOLOAD) : {
> +               __start___sancov_guards = .;
> +               *(__sancov_guards);
> +               __stop___sancov_guards = .;
> +       }
> +
> +       .text : {
> +               *(.text .text.[0-9a-zA-Z_]*)
> +               *(.text..L*)
> +       }
> +
> +       .init.text : {
> +               *(.init.text .init.text.[0-9a-zA-Z_]*)
> +               *(.init.text..L*)
> +       }
> +       .exit.text : {
> +               *(.exit.text .exit.text.[0-9a-zA-Z_]*)
> +               *(.exit.text..L*)
> +       }
> +#endif
> +
>         MOD_SEPARATE_CODETAG_SECTIONS()
>  }
>
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index ce973d9d8e6d8..a5db690dd2def 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -1149,6 +1149,7 @@ static const char *uaccess_safe_builtin[] = {
>         "write_comp_data",
>         "check_kcov_mode",
>         "__sanitizer_cov_trace_pc",
> +       "__sanitizer_cov_trace_pc_guard",
>         "__sanitizer_cov_trace_const_cmp1",
>         "__sanitizer_cov_trace_const_cmp2",
>         "__sanitizer_cov_trace_const_cmp4",
> --
> 2.49.0.604.gff1f9ca942-goog
>
