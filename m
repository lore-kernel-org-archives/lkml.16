Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D191C36
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745662260; cv=none; b=kSJrBVMPZhFcJYkZjeHFSFXGBlDRm3t+pELH2MHoiH6oIVVoQX0Eg0CyhcacPT7ju6sBT47qJvF2YRnTD++lFNU74F8fsXvcOuGTrhP4iZCU8BmwpV11CAlyPlvqvMdDYXyGY9eQyu5eVijAFVsDFGPDFNpwvM5DPo8xRiqjOw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745662260; c=relaxed/simple;
	bh=34Vprp+6E3b4zP9VQopACHJ5zM9k0l4ljeizGsGabGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYqlDVY80h4tua90h//zbEQ1fzVcttZcknsFtRFo7eYJakutzbcCXyUtFe9XcALYNWq9hE+9RYW1SfQ0F20n7eeW3vOCzDyvC30bmJzDkoVIuZqrwSNdBY8B7lC3RX6daLTbN4shTcBGdzgyALE6445/QiWQZ7L1VBEVOqWSnlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXWxRiNG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXWxRiNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A830C4CEE8
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745662260;
	bh=34Vprp+6E3b4zP9VQopACHJ5zM9k0l4ljeizGsGabGQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CXWxRiNGEhAqvtFAaUDwZbIDJ28gfQJKRj8OF2/WPbBMnmg5QkHWf1TD07j0pTNFu
	 A0IyEy6unykPFPVsgBXadvpPKKVyuaQwPl3keK6lfw1RUvLwt7EayiZQXnYjmXo6rV
	 PGiJCNzqtq5LK0etSguXcSqEXGfl+sh7+x/0VF/54T59rwLZjJS+dyc3AT2mN1Pdxm
	 1umu17eo6PeV/wNno5uz/jAvcYelf/D8G5PAFrJqu3fG7MGEchgCMI/WmKc4ohLWUD
	 2ZeqNSZD5gd0PqZ2+I7VKjqeS+a9Icdi78tzs9BfitSoteOCfjJD2CMa0RaIMnuJt9
	 M1lDXrPCdHUmg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso4631633a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 03:10:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqlmpRtzX+9Az6Ok1/1qII3NHxO1DrPB6VGinR2C4Hug4TBKMO68faXaqlNOxkVOzh5v1TKB3/43Zi0mw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGmDQ7n2cT5Ezno26LNBX2jknHxOKn5waitjDCINPXZSfjBvKV
	DjLyZ5PW+1V4skATCM7XeY7nG2PVfi7cXuINFFy2BkSxj0NwE6/QEFOgDZdcDnDRajpdMFZrgJ6
	Zx2CUFPq9Am21dHvT+emWQDrxR1A=
X-Google-Smtp-Source: AGHT+IGN8xEJaxxZ3panSVMmYUCAILBNCpF47wsCETHa0INItVVOATnIA4c1R1N3Hb3IBuPZ4B5CXbjkSELR6v9kLAY=
X-Received: by 2002:a17:907:c28:b0:aca:c687:6ca2 with SMTP id
 a640c23a62f3a-ace71107449mr497022666b.26.1745662258491; Sat, 26 Apr 2025
 03:10:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415091930.19529-1-yangtiezhu@loongson.cn>
In-Reply-To: <20250415091930.19529-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 26 Apr 2025 18:10:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6sQ4akmdraW_bd6gdr_Me9EYte-rbofumD3=04HA1MQA@mail.gmail.com>
X-Gm-Features: ATxdqUFgg9pEa1Nj0-CLUQWdLfyvHj_jetSlY8wyXh_tJhkI2bjfa0qbY5BR-ks
Message-ID: <CAAhV-H6sQ4akmdraW_bd6gdr_Me9EYte-rbofumD3=04HA1MQA@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: Handle fp, lsx, lasx and lbt assembly symbols
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Tue, Apr 15, 2025 at 5:19=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> Like the other relevant symbols, export some fp, lsx, lasx and lbt
> assembly symbols and put the function declarations in header files
> rather than source files.
>
> While at it, use "asmlinkage" for the other existing C prototypes
> of assembly functions and also do not use the "extern" keyword with
> function declarations according to the document coding-style.rst.
>
> Cc: stable@vger.kernel.org # 6.6+
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/fpu.h | 38 ++++++++++++++++++--------------
>  arch/loongarch/include/asm/lbt.h | 10 ++++++---
>  arch/loongarch/kernel/fpu.S      |  6 +++++
>  arch/loongarch/kernel/lbt.S      |  4 ++++
>  arch/loongarch/kernel/signal.c   | 21 ------------------
>  5 files changed, 39 insertions(+), 40 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/as=
m/fpu.h
> index 3177674228f8..23f5a4b9c32d 100644
> --- a/arch/loongarch/include/asm/fpu.h
> +++ b/arch/loongarch/include/asm/fpu.h
> @@ -22,22 +22,28 @@
>  struct sigcontext;
>
>  #define kernel_fpu_available() cpu_has_fpu
> -extern void kernel_fpu_begin(void);
> -extern void kernel_fpu_end(void);
> -
> -extern void _init_fpu(unsigned int);
> -extern void _save_fp(struct loongarch_fpu *);
> -extern void _restore_fp(struct loongarch_fpu *);
> -
> -extern void _save_lsx(struct loongarch_fpu *fpu);
> -extern void _restore_lsx(struct loongarch_fpu *fpu);
> -extern void _init_lsx_upper(void);
> -extern void _restore_lsx_upper(struct loongarch_fpu *fpu);
> -
> -extern void _save_lasx(struct loongarch_fpu *fpu);
> -extern void _restore_lasx(struct loongarch_fpu *fpu);
> -extern void _init_lasx_upper(void);
> -extern void _restore_lasx_upper(struct loongarch_fpu *fpu);
> +void kernel_fpu_begin(void);
> +void kernel_fpu_end(void);
> +
> +asmlinkage void _init_fpu(unsigned int);
> +asmlinkage void _save_fp(struct loongarch_fpu *);
> +asmlinkage void _restore_fp(struct loongarch_fpu *);
> +asmlinkage int _save_fp_context(void __user *fpregs, void __user *fcc, v=
oid __user *csr);
> +asmlinkage int _restore_fp_context(void __user *fpregs, void __user *fcc=
, void __user *csr);
> +
> +asmlinkage void _save_lsx(struct loongarch_fpu *fpu);
> +asmlinkage void _restore_lsx(struct loongarch_fpu *fpu);
> +asmlinkage void _init_lsx_upper(void);
> +asmlinkage void _restore_lsx_upper(struct loongarch_fpu *fpu);
> +asmlinkage int _save_lsx_context(void __user *fpregs, void __user *fcc, =
void __user *fcsr);
> +asmlinkage int _restore_lsx_context(void __user *fpregs, void __user *fc=
c, void __user *fcsr);
> +
> +asmlinkage void _save_lasx(struct loongarch_fpu *fpu);
> +asmlinkage void _restore_lasx(struct loongarch_fpu *fpu);
> +asmlinkage void _init_lasx_upper(void);
> +asmlinkage void _restore_lasx_upper(struct loongarch_fpu *fpu);
> +asmlinkage int _save_lasx_context(void __user *fpregs, void __user *fcc,=
 void __user *fcsr);
> +asmlinkage int _restore_lasx_context(void __user *fpregs, void __user *f=
cc, void __user *fcsr);
>
>  static inline void enable_lsx(void);
>  static inline void disable_lsx(void);
> diff --git a/arch/loongarch/include/asm/lbt.h b/arch/loongarch/include/as=
m/lbt.h
> index e671978bf552..38566574e562 100644
> --- a/arch/loongarch/include/asm/lbt.h
> +++ b/arch/loongarch/include/asm/lbt.h
> @@ -12,9 +12,13 @@
>  #include <asm/loongarch.h>
>  #include <asm/processor.h>
>
> -extern void _init_lbt(void);
> -extern void _save_lbt(struct loongarch_lbt *);
> -extern void _restore_lbt(struct loongarch_lbt *);
> +asmlinkage void _init_lbt(void);
> +asmlinkage void _save_lbt(struct loongarch_lbt *);
> +asmlinkage void _restore_lbt(struct loongarch_lbt *);
> +asmlinkage int _save_lbt_context(void __user *regs, void __user *eflags)=
;
> +asmlinkage int _restore_lbt_context(void __user *regs, void __user *efla=
gs);
> +asmlinkage int _save_ftop_context(void __user *ftop);
> +asmlinkage int _restore_ftop_context(void __user *ftop);
>
>  static inline int is_lbt_enabled(void)
>  {
> diff --git a/arch/loongarch/kernel/fpu.S b/arch/loongarch/kernel/fpu.S
> index 6ab640101457..28caf416ae36 100644
> --- a/arch/loongarch/kernel/fpu.S
> +++ b/arch/loongarch/kernel/fpu.S
> @@ -458,6 +458,7 @@ SYM_FUNC_START(_save_fp_context)
>         li.w            a0, 0                           # success
>         jr              ra
>  SYM_FUNC_END(_save_fp_context)
> +EXPORT_SYMBOL_GPL(_save_fp_context)
>
>  /*
>   * a0: fpregs
> @@ -471,6 +472,7 @@ SYM_FUNC_START(_restore_fp_context)
>         li.w            a0, 0                           # success
>         jr              ra
>  SYM_FUNC_END(_restore_fp_context)
> +EXPORT_SYMBOL_GPL(_restore_fp_context)
>
>  /*
>   * a0: fpregs
> @@ -484,6 +486,7 @@ SYM_FUNC_START(_save_lsx_context)
>         li.w    a0, 0                                   # success
>         jr      ra
>  SYM_FUNC_END(_save_lsx_context)
> +EXPORT_SYMBOL_GPL(_save_lsx_context)
>
>  /*
>   * a0: fpregs
> @@ -497,6 +500,7 @@ SYM_FUNC_START(_restore_lsx_context)
>         li.w    a0, 0                                   # success
>         jr      ra
>  SYM_FUNC_END(_restore_lsx_context)
> +EXPORT_SYMBOL_GPL(_restore_lsx_context)
>
>  /*
>   * a0: fpregs
> @@ -510,6 +514,7 @@ SYM_FUNC_START(_save_lasx_context)
>         li.w    a0, 0                                   # success
>         jr      ra
>  SYM_FUNC_END(_save_lasx_context)
> +EXPORT_SYMBOL_GPL(_save_lasx_context)
>
>  /*
>   * a0: fpregs
> @@ -523,6 +528,7 @@ SYM_FUNC_START(_restore_lasx_context)
>         li.w    a0, 0                                   # success
>         jr      ra
>  SYM_FUNC_END(_restore_lasx_context)
> +EXPORT_SYMBOL_GPL(_restore_lasx_context)
>
>  .L_fpu_fault:
>         li.w    a0, -EFAULT                             # failure
> diff --git a/arch/loongarch/kernel/lbt.S b/arch/loongarch/kernel/lbt.S
> index 001f061d226a..71678912d24c 100644
> --- a/arch/loongarch/kernel/lbt.S
> +++ b/arch/loongarch/kernel/lbt.S
> @@ -90,6 +90,7 @@ SYM_FUNC_START(_save_lbt_context)
>         li.w            a0, 0                   # success
>         jr              ra
>  SYM_FUNC_END(_save_lbt_context)
> +EXPORT_SYMBOL_GPL(_save_lbt_context)
>
>  /*
>   * a0: scr
> @@ -110,6 +111,7 @@ SYM_FUNC_START(_restore_lbt_context)
>         li.w            a0, 0                   # success
>         jr              ra
>  SYM_FUNC_END(_restore_lbt_context)
> +EXPORT_SYMBOL_GPL(_restore_lbt_context)
>
>  /*
>   * a0: ftop
> @@ -120,6 +122,7 @@ SYM_FUNC_START(_save_ftop_context)
>         li.w            a0, 0                   # success
>         jr              ra
>  SYM_FUNC_END(_save_ftop_context)
> +EXPORT_SYMBOL_GPL(_save_ftop_context)
>
>  /*
>   * a0: ftop
> @@ -150,6 +153,7 @@ SYM_FUNC_START(_restore_ftop_context)
>         li.w            a0, 0                   # success
>         jr              ra
>  SYM_FUNC_END(_restore_ftop_context)
> +EXPORT_SYMBOL_GPL(_restore_ftop_context)
>
>  .L_lbt_fault:
>         li.w            a0, -EFAULT             # failure
> diff --git a/arch/loongarch/kernel/signal.c b/arch/loongarch/kernel/signa=
l.c
> index 7a555b600171..4740cb5b2388 100644
> --- a/arch/loongarch/kernel/signal.c
> +++ b/arch/loongarch/kernel/signal.c
> @@ -51,27 +51,6 @@
>  #define lock_lbt_owner()       ({ preempt_disable(); pagefault_disable()=
; })
>  #define unlock_lbt_owner()     ({ pagefault_enable(); preempt_enable(); =
})
>
> -/* Assembly functions to move context to/from the FPU */
> -extern asmlinkage int
> -_save_fp_context(void __user *fpregs, void __user *fcc, void __user *csr=
);
> -extern asmlinkage int
> -_restore_fp_context(void __user *fpregs, void __user *fcc, void __user *=
csr);
> -extern asmlinkage int
> -_save_lsx_context(void __user *fpregs, void __user *fcc, void __user *fc=
sr);
> -extern asmlinkage int
> -_restore_lsx_context(void __user *fpregs, void __user *fcc, void __user =
*fcsr);
> -extern asmlinkage int
> -_save_lasx_context(void __user *fpregs, void __user *fcc, void __user *f=
csr);
> -extern asmlinkage int
> -_restore_lasx_context(void __user *fpregs, void __user *fcc, void __user=
 *fcsr);
> -
> -#ifdef CONFIG_CPU_HAS_LBT
> -extern asmlinkage int _save_lbt_context(void __user *regs, void __user *=
eflags);
> -extern asmlinkage int _restore_lbt_context(void __user *regs, void __use=
r *eflags);
> -extern asmlinkage int _save_ftop_context(void __user *ftop);
> -extern asmlinkage int _restore_ftop_context(void __user *ftop);
> -#endif
> -
>  struct rt_sigframe {
>         struct siginfo rs_info;
>         struct ucontext rs_uctx;
> --
> 2.42.0
>
>
