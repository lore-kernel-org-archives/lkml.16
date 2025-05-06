Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3939F2F94DE
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 02:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746496835; cv=none; b=vCjPLM8DK83k21vm9M/jMsUF3IcQlFfGJE0LhKuIU4+9Xt1dSbJFfOHsTlrOYdG4ktDLbUIECrrE8ElU4BjVMRrcUHBg9HCu11SlRjIYr+xmFTRsKsvSHeoG8C14YTgbRDI+w7KNq3nM0Hqvoo3rWRq3bOe0V4HK6TM+9fWfS+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746496835; c=relaxed/simple;
	bh=ry0aJgSb3sCbxCwVp83cf+hVEA3YU6KQUqMGgzP39dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WD/BGRXjmX+zOBguwNqm3Gp2yfENwZWNuP17jA7X558ZIr5LsaEEgv56CtIcffW5CQZfMcuCWdW6kwyDcv1mqDIpQm/8W+E94m3mZ8XwDLi/BLUukJYeh5brtd8sbksJp+fip53GewjVe5EI09Hi9i+ysyc0tbDVrm7OE5fuvTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=S2nmGBhv; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="S2nmGBhv"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736b350a22cso4223153b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 19:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746496831; x=1747101631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YQByGO6N0rnX/TuW9q2WHCZc5Qs2xvL6Ul/xODxMQm8=;
        b=S2nmGBhvcd+xAbHr8c2BDfyEJvcBBlBD4/aTXsPaxbWzcH3sqJxd2QCsx2bSYmUESd
         pXsqVH8gFym1izqvfr21rMaQIuj/sjHvygW6mWv2SshjnlPdLb5QL3DLYFVZ/JNFz9/Y
         3CDx+cJIDFn1eAI28P299mpkMk7LARt0Zka12hFTZMP4yi6uYedeh8mETk5Z3XqsMAXr
         bdS3/9bZWCIF4fePE9sHKT4Uo6PImZZl1mfH2qbefDgWGoxjlgVra3BTzW0I+npq/3O0
         ZEFaAtKonoZBCIWg3JUljZQbxZ+3GL7D/DTUUW7onvxYAMp4lRluExhF0+fjatC5N0l/
         15IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746496831; x=1747101631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQByGO6N0rnX/TuW9q2WHCZc5Qs2xvL6Ul/xODxMQm8=;
        b=RGdGCBnRy6G25Jx+reJ6hvEn+UFMdv0/ESGJd9iv7ZODNM6fICylAdTDVPr4d08dVr
         u7a8aDRNq0s3zFyEw4e19tDHIcTWLoyFEuYz0H0AYGUG/fenE/4b+ZNKmVXnsanGHoXp
         i6e1grF7Yg2aR/xFlix6ZNnSc+xfIB2590qDxR7H7dCmLnyLpSvvfLYBnf7U7S1boo+N
         ujU8DozxvtmlUb/+ogsk/5GbwJPJSWGFyOBm3DwegZXWaqljN6l8uxWbkHun7I10326Q
         9HBDMV+9Q1fn78nn2T3dOrkVA69tSxvPxsqcKsKIQPa78y5rGnSQ6CMIPcQU/IspI85q
         lbqA==
X-Forwarded-Encrypted: i=1; AJvYcCUyP0812ndFa8DfNIDaBi1lwDBXZkwU6A84xKYk8ra98Tf18+zIsVPsOfYGOf09wxoXui9ktvuiqJbq4kU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFu/Xpbut+1JKbEeVQeR5oKy7RvqFEFzO/SSWcyN9DCgSEE9BQ
	+PoNlMq+K7aELFuepLuKUkgGTYeK7q6qrr9qNYSpC1dT5lg2mCczwarg3xZkqpc=
X-Gm-Gg: ASbGncuocU2tuSqMbzragU1cixyiHVCpiW3uSPuk88VJW563r1OiWuqyBH5xhh3xiXS
	2T2nhGjIqQJ+5Oz4C80JTptyfLLpCoHe8SOK8BhyCxxAr7VW+lB3VI+CKgCPfEvi9kVq5aqan6x
	C2KZt9iDQyG+mfyvpGvgc+UlxDvmN4t+95Q1YNIjzKjJ0sX9LaApGDXz8RoHj165+Fd1oHknpiI
	MV958pZTjgmAywj4ooMgFS4YpZ7xvUxuQC/Aqs+HEgOCZ6/0bqM86UWeIQ1Xr8ryMlq/x1LwnsD
	Rc6VEj8erBXhnwDu/kicIhrUDRJ5lx4nh1WV
X-Google-Smtp-Source: AGHT+IEdlH1n0D+wkqN6hRoakc2to2f4rJ9K96RWI2O330Mu8H40SWlfPZyCMdCvXpGOn/xBhGlcuw==
X-Received: by 2002:a05:6a00:6ca1:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-740589050bdmr23874814b3a.3.1746496831312;
        Mon, 05 May 2025 19:00:31 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:4221:9525:e8d6:875f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405901e1f9sm7613285b3a.87.2025.05.05.19.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 19:00:30 -0700 (PDT)
Date: Mon, 5 May 2025 19:00:28 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 2/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <aBltPLLrvUNKR857@ghost>
References: <20240222125059.13331-1-hchauhan@ventanamicro.com>
 <20240222125059.13331-3-hchauhan@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222125059.13331-3-hchauhan@ventanamicro.com>

On Thu, Feb 22, 2024 at 06:20:59PM +0530, Himanshu Chauhan wrote:
> RISC-V hardware breakpoint framework is built on top of perf subsystem and uses
> SBI debug trigger extension to install/uninstall/update/enable/disable hardware
> triggers as specified in Sdtrig ISA extension.
> 
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  arch/riscv/Kconfig                     |   1 +
>  arch/riscv/include/asm/hw_breakpoint.h | 327 ++++++++++++
>  arch/riscv/include/asm/kdebug.h        |   3 +-
>  arch/riscv/kernel/Makefile             |   1 +
>  arch/riscv/kernel/hw_breakpoint.c      | 659 +++++++++++++++++++++++++
>  arch/riscv/kernel/traps.c              |   6 +
>  6 files changed, 996 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
>  create mode 100644 arch/riscv/kernel/hw_breakpoint.c
> 

...

> diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
> new file mode 100644
> index 000000000000..7787123c7180
> --- /dev/null
> +++ b/arch/riscv/kernel/hw_breakpoint.c
> +
> +void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
> +static int __init arch_hw_breakpoint_init(void)
> +{
> +	unsigned int cpu;
> +	int rc = 0;
> +
> +	for_each_possible_cpu(cpu)
> +		raw_spin_lock_init(&per_cpu(ecall_lock, cpu));
> +
> +	if (!dbtr_init)
> +		init_sbi_dbtr();
> +
> +	if (dbtr_total_num) {
> +		pr_info("%s: total number of type %d triggers: %u\n",
> +			__func__, dbtr_type, dbtr_total_num);
> +	} else {
> +		pr_info("%s: No hardware triggers available\n", __func__);
> +		goto out;
> +	}
> +
> +	/* Allocate per-cpu shared memory */
> +	sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
> +					PAGE_SIZE);
> +
> +	if (!sbi_dbtr_shmem) {
> +		pr_warn("%s: Failed to allocate shared memory.\n", __func__);
> +		rc = -ENOMEM;
> +		goto out;
> +	}
> +
> +	/* Hotplug handler to register/unregister shared memory with SBI */
> +	rc = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,

When using this, only hart 0 is getting setup. I think instead we want
the following to have all harts get setup:

	for_each_online_cpu(cpu)
		arch_smp_setup_sbi_shmem(cpu);

	/* Hotplug handler to register/unregister shared memory with SBI */
	rc = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,


However, I am testing against tip-of-tree opensbi and am hitting an
issue during the setup on all harts:

[    0.202332] arch_smp_setup_sbi_shmem: Invalid address parameter (18446744073709551611)
[    0.202794] CPU 0: HW Breakpoint shared memory registered.

Additionally, this seems like it should be a fatal error, but it
continues on to print that the shared memory is registered because there
is no check before printing this seemingly successful message.

I know I am reviving an old thread, but do you have any insight into
what might be happening?

- Charlie

> +			       "riscv/hw_breakpoint:prepare",
> +			       arch_smp_setup_sbi_shmem,
> +			       arch_smp_teardown_sbi_shmem);
> +
> +	if (rc < 0) {
> +		pr_warn("%s: Failed to setup CPU hotplug state\n", __func__);
> +		free_percpu(sbi_dbtr_shmem);
> +		return rc;
> +	}
> + out:
> +	return rc;
> +}
> +arch_initcall(arch_hw_breakpoint_init);
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index a1b9be3c4332..53e1dfe5746b 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -277,6 +277,12 @@ void handle_break(struct pt_regs *regs)
>  	if (probe_breakpoint_handler(regs))
>  		return;
>  
> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> +	if (notify_die(DIE_DEBUG, "EBREAK", regs, 0, regs->cause, SIGTRAP)
> +	    == NOTIFY_STOP)
> +		return;
> +#endif
> +
>  	current->thread.bad_cause = regs->cause;
>  
>  	if (user_mode(regs))
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
