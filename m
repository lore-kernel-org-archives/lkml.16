Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FD915FD13
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738911079; cv=none; b=dfOgsM43V/DSZ+hRANe1I6l4SpM5hyCtbVyymClHMOMe15x82U2FQQc+bzlA2iVdWSg6aO5CGKeSDm+1LwwZDvnaHGyOhAbFW4GxSJPJyVDRiPVq6drRdqv9/MrRtfPfGT7sRtDd5Ttpp6PmpiiLQckhbA83ZR0cUg+HomKkCOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738911079; c=relaxed/simple;
	bh=XOkEWq88HxMGa4q3w3xKhtQkrwRH5QJR3PKEJmTEirI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Xp9ylfEZ3qkfCknl427pzbs0479o9Xyw4LF2jYgzlbOZonp2Rs+BpJxQ2tcnCu6lIvaUrRoqhwdhtgxYJ8r/KWhZmNg4/JC5vwSsBVJ5nadws/iIHzI1/fSsltefHr0Xi0/5u/V6SxnikxCsr+T56t1Syo+zQpjlbTu+UGO+oME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Dx_3NiraVnkk9uAA--.29335S3;
	Fri, 07 Feb 2025 14:51:14 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMDxH+VfraVnT+YDAA--.16729S3;
	Fri, 07 Feb 2025 14:51:11 +0800 (CST)
Subject: Re: [PATCH] loongson: Fix idle VS timer enqueue
To: Marco Crivellari <marco.crivellari@suse.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 Frederic Weisbecker <frederic@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20250206162922.3028861-1-marco.crivellari@suse.com>
 <20250206162922.3028861-2-marco.crivellari@suse.com>
From: bibo mao <maobibo@loongson.cn>
Message-ID: <e820d02d-0359-c45d-11c5-eab3a4fa3569@loongson.cn>
Date: Fri, 7 Feb 2025 14:50:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250206162922.3028861-2-marco.crivellari@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxH+VfraVnT+YDAA--.16729S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF47Xr47ur1DCrW8tFWkAFc_yoWrKw1fpr
	yfuwn8KrsYgrn3X347tw18ur98u34DGa1a9anxArW8AF4jvr10qr1kt34kW3ZYg3y8Gw1F
	vF1rXa42g3WUA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Dl1DUUUUU==

yes, it had better skip out inner loop and let idle framework handle it.

Tested-by: Bibo Mao <maobibo@loongson.cn>

On 2025/2/7 上午12:29, Marco Crivellari wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> Loongson re-enables interrupts on its idle routine and performs a
> TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.
> 
> The IRQs firing between the check and the idling instruction may set the
> TIF_NEED_RESCHED flag. In order to deal with the such a race, IRQs
> interrupting __arch_cpu_idle() rollback their return address to the
> beginning of __arch_cpu_idle() so that TIF_NEED_RESCHED is checked
> again before going back to sleep.
> 
> However idle IRQs can also queue timers that may require a tick
> reprogramming through a new generic idle loop iteration but those timers
> would go unnoticed here because __arch_cpu_idle() only checks
> TIF_NEED_RESCHED. It doesn't check for pending timers.
> 
> Fix this with fast-forwarding idle IRQs return value to the end of the
> idle routine instead of the beginning, so that the generic idle loop
> handles both TIF_NEED_RESCHED and pending timers.
> 
> Fixes: 0603839b18f4 ("LoongArch: Add exception/interrupt handling")
> Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>   arch/loongarch/kernel/genex.S | 33 +++++++++++++++++++--------------
>   arch/loongarch/kernel/idle.c  |  3 +--
>   arch/loongarch/kernel/reset.c | 23 ++++++++++++++---------
>   3 files changed, 34 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/loongarch/kernel/genex.S b/arch/loongarch/kernel/genex.S
> index 86d5d90ebefe..ab2e9a262ee2 100644
> --- a/arch/loongarch/kernel/genex.S
> +++ b/arch/loongarch/kernel/genex.S
> @@ -18,28 +18,33 @@
>   
>   	.align	5
>   SYM_FUNC_START(__arch_cpu_idle)
> -	/* start of rollback region */
> -	LONG_L	t0, tp, TI_FLAGS
> -	nop
> -	andi	t0, t0, _TIF_NEED_RESCHED
> -	bnez	t0, 1f
> -	nop
> -	nop
> -	nop
> +	/* start of idle interrupt region */
> +	li.w	t0, CSR_CRMD_IE
> +	/* idle instruction needs irq enabled */
> +	csrxchg	t0, t0, LOONGARCH_CSR_CRMD
> +	/*
> +	 * If an interrupt lands here; between enabling interrupts above and
> +	 * going idle on the next instruction, we must *NOT* go idle since the
> +	 * interrupt could have set TIF_NEED_RESCHED or caused an timer to need
> +	 * reprogramming. Fall through -- see handle_vint() below -- and have
> +	 * the idle loop take care of things.
> +	 */
>   	idle	0
> -	/* end of rollback region */
> -1:	jr	ra
> +	nop
> +	/* end of idle interrupt region */
> +SYM_INNER_LABEL(__arch_cpu_idle_exit, SYM_L_LOCAL)
> +	jr	ra
>   SYM_FUNC_END(__arch_cpu_idle)
>   
>   SYM_CODE_START(handle_vint)
>   	UNWIND_HINT_UNDEFINED
>   	BACKUP_T0T1
>   	SAVE_ALL
> -	la_abs	t1, __arch_cpu_idle
> +	la_abs	t1, __arch_cpu_idle_exit
>   	LONG_L	t0, sp, PT_ERA
> -	/* 32 byte rollback region */
> -	ori	t0, t0, 0x1f
> -	xori	t0, t0, 0x1f
> +	/* 16 byte idle interrupt region */
> +	ori	t0, t0, 0x0f
> +	addi.d	t0, t0, 1
>   	bne	t0, t1, 1f
>   	LONG_S	t0, sp, PT_ERA
>   1:	move	a0, sp
> diff --git a/arch/loongarch/kernel/idle.c b/arch/loongarch/kernel/idle.c
> index 0b5dd2faeb90..54b247d8cdb6 100644
> --- a/arch/loongarch/kernel/idle.c
> +++ b/arch/loongarch/kernel/idle.c
> @@ -11,7 +11,6 @@
>   
>   void __cpuidle arch_cpu_idle(void)
>   {
> -	raw_local_irq_enable();
> -	__arch_cpu_idle(); /* idle instruction needs irq enabled */
> +	__arch_cpu_idle();
>   	raw_local_irq_disable();
>   }
> diff --git a/arch/loongarch/kernel/reset.c b/arch/loongarch/kernel/reset.c
> index 1ef8c6383535..d78e8a1064a1 100644
> --- a/arch/loongarch/kernel/reset.c
> +++ b/arch/loongarch/kernel/reset.c
> @@ -20,6 +20,11 @@
>   void (*pm_power_off)(void);
>   EXPORT_SYMBOL(pm_power_off);
>   
> +static __always_inline void native_halt(void)
> +{
> +	asm volatile("idle 0" : : : "memory");
> +}
> +
>   void machine_halt(void)
>   {
>   #ifdef CONFIG_SMP
> @@ -32,9 +37,9 @@ void machine_halt(void)
>   	pr_notice("\n\n** You can safely turn off the power now **\n\n");
>   	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
>   
> -	while (true) {
> -		__arch_cpu_idle();
> -	}
> +	while (1) {
> +		native_halt();
> +	};
>   }
>   
>   void machine_power_off(void)
> @@ -52,9 +57,9 @@ void machine_power_off(void)
>   	efi.reset_system(EFI_RESET_SHUTDOWN, EFI_SUCCESS, 0, NULL);
>   #endif
>   
> -	while (true) {
> -		__arch_cpu_idle();
> -	}
> +	while (1) {
> +		native_halt();
> +	};
>   }
>   
>   void machine_restart(char *command)
> @@ -73,7 +78,7 @@ void machine_restart(char *command)
>   	if (!acpi_disabled)
>   		acpi_reboot();
>   
> -	while (true) {
> -		__arch_cpu_idle();
> -	}
> +	while (1) {
> +		native_halt();
> +	};
>   }
> 

