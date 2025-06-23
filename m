Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C36226533
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750717044; cv=none; b=pVxKUfrmJzF8Py2LlDoHpG9m7RJ1PhMnFdBbppZEezrQTgTMhgKrZyqne9hWU+oRz29HBk9zM4t1heJIi63ffVUix4smYYGIvr2+nFVyhIJ/gw40XoL2cB0ePBvA1PE8Tz2z8yUWorOUJj/hI8OGOS7bjW43n/LweZHPQ7EXzDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750717044; c=relaxed/simple;
	bh=MhgGBIYNOOygKR4AR/fb3TJ06syiq6M62XCFqXquIVM=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=KltViDYJE3fYrWvJimn4UubQrkggT+TXeQW+WaxANyDXBZ+jEWCZZDqx2LKIa2MjBDwwSy5s0n/IrdrDGXhuIv5tB+eGpUVDlSm8SZGn/rSmOcsJ+mLrc8mxDwk/vyTab9lmxFA+PhPKS1ArWqjXueLJFk/yyFDM7BmDrYSjnkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=mtGwA0qG; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="mtGwA0qG"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3141f9ce4d1so4266661a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750717040; x=1751321840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwALQ0/M99GpNXm649yfXIYpBjTO5FIrE5mdkDBYsC4=;
        b=mtGwA0qG7zCcnHzQvtBJiYQvwk3bUxtw1hEVL1HJzqRfzXmSOzA7HomlEzDZSCd3uw
         kQB+6szrAgXzQU+OsqoCBknmF8yfnGDgXBQdj3aJgruMrz9BZ+PnWlKrJ2cnvuJB+6fj
         7RjIEnQHPShOOa69YqEfE3Jl8aB4O9baafzncAioOYAOImNLdASf6OdtIkNa+HEpJX7c
         reEV7adIFhjcp/UlbbKh9J/8BiycvPk0yI8vaCx41b0QLGiCk+jFZxE0cOxve2f9hqOi
         CaT+SyQwFs9043Ge4PbjLT3g/AQwhBIup31tX2MfirCdKWsatEO6hboDDd9I7oDi74D2
         Z3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750717040; x=1751321840;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwALQ0/M99GpNXm649yfXIYpBjTO5FIrE5mdkDBYsC4=;
        b=hKe5XJBjMl4es/4ODt6xaYRgDO6JQu7XWSQI4o3e2S4HOBhbBnOftYYBem4DBpm7dv
         sC/1jG0KZ5B/Ar8PloDPTF1MH9vaU3pENxyJCjsfWD0bVOe4MZ5uNrpnoPO6loOIuWmx
         IYB/BjDWUO6wF53fVPz9b0CbDjFAR22platO3Zu5HwTSP/0kYCfjj1SiHGMxWa8Gejhr
         Jt5u3QhUaCIBGypBhcz8OXn2Qtxiv7sb5+xWFDJZe4cF/C0lCeSCItTVlFp6LyzgB3SU
         zeBw8gNKw8PCmY4b1h974jm65YXLUMBaRfTDZaEpmBZfDXyCfmjflbqAQ9TcQXhqQn+N
         hrpw==
X-Forwarded-Encrypted: i=1; AJvYcCUwiFEFtgmkzWy5VKivrwqDzHFvJVYt5XzKrFCHxkTrQoF5MYq5L/Y94KqXmfo2SOkjRh4/wSzFTh65Bno=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWjWK8DXQuDj+61AqsLICMIC2RPjNBLQKS7rP8V+tNFGE5LrLN
	MqgLkHIulMxDLvhJuJPW8woKrAaEGpZpUP3V4vM3PLgqAUfENs7IGQrke4111HSddSU=
X-Gm-Gg: ASbGncvgHM/0eO/vbHppdtCPgFrKTtnB6fH+IpMX/DKc1ZxmSbTuo8GOpP4oo+zcpk3
	odg4j9bpgUR+Qup7CyHdX1MgTzJkdJKX9SGTwSjRkNDOpRnNsuf+YdRyp/Ll8Bjm1wKIkPGiXNr
	DVizi1yrFPl7VuzWpITUHVvdpGAnKPLSUaJO8vSfXVDLTQbaVIcRpDP+ZtqHp+iu+ddaHeQY47X
	sleERcZumymUVh8iBG37jBhhcC+Y3ZjQYuTKyL0YiBEoXE75WO9LtRirvRTa1F9VEasAVTVVXJq
	h4KVxPdfJXrWb2fUlp+uVXO6F0bmo3jtpjq2/OU8u9NTM0C+jTtG9chWrOI0+7PaRndboZ8=
X-Google-Smtp-Source: AGHT+IElt6M7x8aXRpogAoTHdWeL/Uqxi5GNVPzJBQouv9xg34gl6XJEz0EoG9yvqb/nuTqJZTpptA==
X-Received: by 2002:a17:90b:4e83:b0:313:f9f6:309f with SMTP id 98e67ed59e1d1-3159d8f998cmr18402246a91.34.1750717040272;
        Mon, 23 Jun 2025 15:17:20 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d839332bsm92675595ad.40.2025.06.23.15.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:17:19 -0700 (PDT)
Date: Mon, 23 Jun 2025 15:17:19 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 15:17:17 PDT (-0700)
Subject:     Re: [PATCH] riscv: Enable interrupt during exception handling
In-Reply-To: <20250620114346.1740512-1-namcao@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
  linux-rt-devel@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  namcao@linutronix.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: namcao@linutronix.de
Message-ID: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 20 Jun 2025 04:43:46 PDT (-0700), namcao@linutronix.de wrote:
> force_sig_fault() takes a spinlock, which is a sleeping lock with
> CONFIG_PREEMPT_RT=y. However, exception handling calls force_sig_fault()
> with interrupt disabled, causing a sleeping in atomic context warning.
>
> This can be reproduced using userspace programs such as:
>     int main() { asm ("ebreak"); }
> or
>     int main() { asm ("unimp"); }
>
> There is no reason that interrupt must be disabled during exception
> handling.

Looks like they used to and we lost it as of f0bddf50586d ("riscv: 
entry: Convert to generic entry"), where we'd check the PIE bit and 
quickly re-enable interrupts if they were enabled before.

This way of doing it also seems fine, and it's kind of nice that we can 
just read the code to figure out how the interrupt contexts are managed.  
So I think it's fine to keep it this way, even though it's more code.

I'm kind of split on a Fixes tag here.  One could argue it's a 
regression, as having interrupts disabled during exceptions is going to 
cause all sorts of performance issues for users.  Seems a bit risk to 
just backport, though...

That said, if nobody noticed then it's probably a good sign nobody is 
really paying attention and we should just backport it before anyone 
notices...

> Considering the previous struggle with a similar bug [1][2], fix
> this problem once for all by enabling interrupt during exception handling
> whenever possible:
>   - If exception comes from user (interrupt handling was for sure enabled)
>   - If exception comes from kernel and interrupt handling was enabled
>
> This also has the added benefit of avoiding unnecessary delays in interrupt
> handling.
>
> This patch mimics x86's implementation.
>
> Link: https://lore.kernel.org/linux-riscv/20250411073850.3699180-3-nylon.chen@sifive.com [1]
> Link: https://lore.kernel.org/linux-riscv/20250422162324.956065-3-cleger@rivosinc.com [2]
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>  arch/riscv/kernel/traps.c | 36 ++++++++++++++++++++++++++++++------
>  arch/riscv/mm/fault.c     |  4 ----
>  2 files changed, 30 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 9c83848797a78..f7d2372dc0eb6 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -6,6 +6,7 @@
>  #include <linux/cpu.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/irqflags.h>
>  #include <linux/randomize_kstack.h>
>  #include <linux/sched.h>
>  #include <linux/sched/debug.h>
> @@ -72,6 +73,18 @@ static void dump_instr(const char *loglvl, struct pt_regs *regs)
>  	printk("%sCode: %s\n", loglvl, str);
>  }
>  
> +static void cond_local_irq_enable(struct pt_regs *regs)
> +{
> +	if (!regs_irqs_disabled(regs))
> +		local_irq_enable();
> +}
> +
> +static void cond_local_irq_disable(struct pt_regs *regs)
> +{
> +	if (!regs_irqs_disabled(regs))
> +		local_irq_disable();
> +}
> +
>  void die(struct pt_regs *regs, const char *str)
>  {
>  	static int die_counter;
> @@ -151,11 +164,15 @@ asmlinkage __visible __trap_section void name(struct pt_regs *regs)		\
>  {										\
>  	if (user_mode(regs)) {							\
>  		irqentry_enter_from_user_mode(regs);				\
> +		local_irq_enable();						\
>  		do_trap_error(regs, signo, code, regs->epc, "Oops - " str);	\
> +		local_irq_disable();						\
>  		irqentry_exit_to_user_mode(regs);				\
>  	} else {								\
>  		irqentry_state_t state = irqentry_nmi_enter(regs);		\
> +		cond_local_irq_enable(regs);					\
>  		do_trap_error(regs, signo, code, regs->epc, "Oops - " str);	\
> +		cond_local_irq_disable(regs);					\
>  		irqentry_nmi_exit(regs, state);					\
>  	}									\
>  }
> @@ -173,24 +190,23 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
>  
>  	if (user_mode(regs)) {
>  		irqentry_enter_from_user_mode(regs);
> -
>  		local_irq_enable();
>  
>  		handled = riscv_v_first_use_handler(regs);
> -
> -		local_irq_disable();
> -
>  		if (!handled)
>  			do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
>  				      "Oops - illegal instruction");
>  
> +		local_irq_disable();
>  		irqentry_exit_to_user_mode(regs);
>  	} else {
>  		irqentry_state_t state = irqentry_nmi_enter(regs);
> +		cond_local_irq_enable(regs);
>  
>  		do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
>  			      "Oops - illegal instruction");
>  
> +		cond_local_irq_disable(regs);
>  		irqentry_nmi_exit(regs, state);
>  	}
>  }
> @@ -225,6 +241,7 @@ static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type
>  		local_irq_enable();
>  	} else {
>  		state = irqentry_nmi_enter(regs);
> +		cond_local_irq_enable(regs);
>  	}
>  
>  	if (misaligned_handler[type].handler(regs))
> @@ -235,6 +252,7 @@ static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type
>  		local_irq_disable();
>  		irqentry_exit_to_user_mode(regs);
>  	} else {
> +		cond_local_irq_disable(regs);
>  		irqentry_nmi_exit(regs, state);
>  	}
>  }
> @@ -308,15 +326,19 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
>  {
>  	if (user_mode(regs)) {
>  		irqentry_enter_from_user_mode(regs);
> +		local_irq_enable();
>  
>  		handle_break(regs);
>  
> +		local_irq_disable();
>  		irqentry_exit_to_user_mode(regs);
>  	} else {
>  		irqentry_state_t state = irqentry_nmi_enter(regs);
> +		cond_local_irq_enable(regs);
>  
>  		handle_break(regs);
>  
> +		cond_local_irq_disable(regs);
>  		irqentry_nmi_exit(regs, state);
>  	}
>  }
> @@ -355,10 +377,12 @@ void do_trap_ecall_u(struct pt_regs *regs)
>  		syscall_exit_to_user_mode(regs);
>  	} else {
>  		irqentry_state_t state = irqentry_nmi_enter(regs);
> +		cond_local_irq_enable(regs);
>  
>  		do_trap_error(regs, SIGILL, ILL_ILLTRP, regs->epc,
>  			"Oops - environment call from U-mode");
>  
> +		cond_local_irq_disable(regs);
>  		irqentry_nmi_exit(regs, state);
>  	}
>  
> @@ -368,11 +392,11 @@ void do_trap_ecall_u(struct pt_regs *regs)
>  asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
>  {
>  	irqentry_state_t state = irqentry_enter(regs);
> +	cond_local_irq_enable(regs);
>  
>  	handle_page_fault(regs);
>  
> -	local_irq_disable();
> -
> +	cond_local_irq_disable(regs);
>  	irqentry_exit(regs, state);
>  }
>  #endif
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 0194324a0c506..6d23ed0ce8a28 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -306,10 +306,6 @@ void handle_page_fault(struct pt_regs *regs)
>  		return;
>  	}
>  
> -	/* Enable interrupts if they were enabled in the parent context. */
> -	if (!regs_irqs_disabled(regs))
> -		local_irq_enable();
> -
>  	/*
>  	 * If we're in an interrupt, have no user context, or are running
>  	 * in an atomic region, then we must not take the fault.
> -- 
> 2.39.5
