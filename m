Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0CE6D17
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 02:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748138480; cv=none; b=b+JuRSeJPHp75mn4tG8nERwz4KAF+7QTwbI14Je/tU2tkknZkflrA9s9wl1dRCiUDzLp9mkxsrspW0MagViYx7is4SNT3nvBYHhL8fLDleWq/zaUuP5awGoXZzIrmcLKjnM32w0Sm98D/GZd7jsAy7Jrs+CgKRfB6p3B51MXzEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748138480; c=relaxed/simple;
	bh=7rvs12mLJDlM3GWwM2Rq4brGchZsoos8Bg4bzMkPmCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fet8uEowJmrRpV9tWhEdgwhQ5Oni2mTtqBGK6D9SE4dpzEFSQgU0+2HcNzOj3PgQUWf4o0qzRFAAwNaehUw2HZ3lCysLkYSpQPuxRDVD+ggozk9hm1NfKozvn50vh8WJIz0p37UBlANysTk6yh5nh6cy7aH0GJ9AWA3Di6wBtXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.128.169])
	by gateway (Coremail) with SMTP id _____8CxeXHqeTJoRkn7AA--.11603S3;
	Sun, 25 May 2025 10:01:14 +0800 (CST)
Received: from mail-yw1-f169.google.com (unknown [209.85.128.169])
	by front1 (Coremail) with SMTP id qMiowMCx7MTneTJoNb_vAA--.26471S3;
	Sun, 25 May 2025 10:01:13 +0800 (CST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70df67e1b17so10169087b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 19:01:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNrP9GcC6mci3RpPJkrH2p8xeT2g35UOvQDHqtKtRBKQZUxQh4FNTRuLJ9d7mZNXKB3945zbnB1tR5z/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd7kfz6p16CMYirgEu6Gv6ci8k+B4FwOpruRLvW3nm1sKQg5ic
	IZy5z0r3SypClAzm194Z98T0drIajtJ+LezljBqvVdKYh2qcAWjZFD9CG84svlrw2nrd8deey9+
	6eV4flsfyg0VkOz+JcRdQ9FdhtmwxRQTf6c7KxPhHYA==
X-Google-Smtp-Source: AGHT+IFv5c9saDgsFbSYywDEgL3x4s8ACvulKeQWBmYteGJbzNQCYknsD4r8LZ5YV3qVpHK2Duwg6rALQ/tdWGN/YfM=
X-Received: by 2002:a05:690c:640d:b0:70d:ed5d:b4cd with SMTP id
 00721157ae682-70e2d9eea50mr36944177b3.17.1748138471084; Sat, 24 May 2025
 19:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524142345.8045-1-chenhuacai@loongson.cn>
In-Reply-To: <20250524142345.8045-1-chenhuacai@loongson.cn>
From: WANG Rui <wangrui@loongson.cn>
Date: Sun, 25 May 2025 10:01:00 +0800
X-Gmail-Original-Message-ID: <CAHirt9hF8zZUh+mm=XQvPwG56r4RDuqvJ6WVGfKEEivfJSiZig@mail.gmail.com>
X-Gm-Features: AX0GCFvmpDiIQOqxTUT87VE8FTx4uYQMHv-wgHqVNf92Kl_jG2mFmQA_AV_N0do
Message-ID: <CAHirt9hF8zZUh+mm=XQvPwG56r4RDuqvJ6WVGfKEEivfJSiZig@mail.gmail.com>
Subject: Re: [PATCH V2] LoongArch: Avoid using $r0/$r1 as "mask" for csrxchg
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Yanteng Si <si.yanteng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:qMiowMCx7MTneTJoNb_vAA--.26471S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXF4UurW8ZF48Gr4xCr4xKrX_yoW5ArW8pF
	WDCr4kKFs5WFyxA39IgrnIv3WUWrWkGwsFvasrCrW7KFyDZw18ArZYkF98XFyUWanYvFyx
	ZFWYkw4fuF4DJabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=

On Sat, May 24, 2025 at 10:24=E2=80=AFPM Huacai Chen <chenhuacai@loongson.c=
n> wrote:
>
> When building kernel with LLVM there are occasionally such errors:
>
> In file included from ./include/linux/spinlock.h:59:
> In file included from ./include/linux/irqflags.h:17:
> arch/loongarch/include/asm/irqflags.h:38:3: error: must not be $r0 or $r1
>    38 |                 "csrxchg %[val], %[mask], %[reg]\n\t"
>       |                 ^
> <inline asm>:1:16: note: instantiated into assembly here
>     1 |         csrxchg $a1, $ra, 0
>       |                       ^
>
>
> To prevent the compiler from allocating $r0 or $r1 for the "mask" of the
> csrxchg instruction, the 'q' constraint must be used but Clang < 22 does
> not support it. So force to use $t0 in the inline asm, in order to avoid
> using $r0/$r1 while keeping the backward compatibility.

Clang < 21

>
> Cc: stable@vger.kernel.org
> Link: https://github.com/llvm/llvm-project/pull/141037
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> Suggested-by: WANG Rui <wangrui@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> V2: Update commit messages.
>
>  arch/loongarch/include/asm/irqflags.h | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/irqflags.h b/arch/loongarch/inclu=
de/asm/irqflags.h
> index 319a8c616f1f..003172b8406b 100644
> --- a/arch/loongarch/include/asm/irqflags.h
> +++ b/arch/loongarch/include/asm/irqflags.h
> @@ -14,40 +14,48 @@
>  static inline void arch_local_irq_enable(void)
>  {
>         u32 flags =3D CSR_CRMD_IE;
> +       register u32 mask asm("t0") =3D CSR_CRMD_IE;
> +
>         __asm__ __volatile__(
>                 "csrxchg %[val], %[mask], %[reg]\n\t"
>                 : [val] "+r" (flags)
> -               : [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD=
)
> +               : [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>                 : "memory");
>  }
>
>  static inline void arch_local_irq_disable(void)
>  {
>         u32 flags =3D 0;
> +       register u32 mask asm("t0") =3D CSR_CRMD_IE;
> +
>         __asm__ __volatile__(
>                 "csrxchg %[val], %[mask], %[reg]\n\t"
>                 : [val] "+r" (flags)
> -               : [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD=
)
> +               : [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>                 : "memory");
>  }
>
>  static inline unsigned long arch_local_irq_save(void)
>  {
>         u32 flags =3D 0;
> +       register u32 mask asm("t0") =3D CSR_CRMD_IE;
> +
>         __asm__ __volatile__(
>                 "csrxchg %[val], %[mask], %[reg]\n\t"
>                 : [val] "+r" (flags)
> -               : [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD=
)
> +               : [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>                 : "memory");
>         return flags;
>  }
>
>  static inline void arch_local_irq_restore(unsigned long flags)
>  {
> +       register u32 mask asm("t0") =3D CSR_CRMD_IE;
> +
>         __asm__ __volatile__(
>                 "csrxchg %[val], %[mask], %[reg]\n\t"
>                 : [val] "+r" (flags)
> -               : [mask] "r" (CSR_CRMD_IE), [reg] "i" (LOONGARCH_CSR_CRMD=
)
> +               : [mask] "r" (mask), [reg] "i" (LOONGARCH_CSR_CRMD)
>                 : "memory");
>  }
>
> --
> 2.47.1
>
>

