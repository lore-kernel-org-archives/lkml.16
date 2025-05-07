Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3898D22B59C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746653551; cv=none; b=efPNuCDp7Xi/FxnGu3x+pXliGpf5Fn6GtOcYqkMOtJM/0AcztLZqH8l1knJ6hz6Us0By6lezqhhvXa5aMPwn+VODolasHyle1d3nAkqPUqtMYYikbjULaBJ+EfPoWhJwEkysdDF/f3IiI+D+9GXEAxILpr5WFLaLuHB6qGQa/V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746653551; c=relaxed/simple;
	bh=B8nww3ZcL8SqCC74TUvg2ARUhXGfwSkUcCJy9ddLYa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGFz6hIHBi8NlmMFjYy3hmlGLAxLW7P3ih2hX/bF/HN8Ek2jm5Rq7wbGR5LH3xZkhPKW+BrBU+LpxTXXyA7siwQ/RyZjSsYILe+v8bEyi03IgmOFB4us8Jiue+63S7hda84pKdcWmL9qi0IvqXu7pUkOohgFNRdwcPOHpHoNMQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=exM0QRaP; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="exM0QRaP"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso392688a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 14:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746653548; x=1747258348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gFGRMash8A7LD509JYKnhMgwpOv6oeLiiO3InY3LVWU=;
        b=exM0QRaPa9DMtR8e9HzlcDFGz9lQsNW6tdIGnyjjVQBerFnIO13qtP7a1D+gJE7+ON
         SuFwE2+WJbTFyncOCh22kdT690nI/dnpDVqAZZX+oYwwH0KF6PXhHEl97Yq+AzWP9tjr
         /xKM3aLjTO4MiWGreSbZnhlsVWuKJjVSWUvuhFtLx94zy1M5DPl7/agc53YrFM1YhLCe
         Q1PPOW+rVXGZn8GOyALUSV/naecDrL1UWJFfuiCuvkUNt8RHQDrHZJK04DrlXzVz4N4j
         NIlnqDjTpFVW2a5Himb21Q4/RKQijxIukQQwaNgAHKFOCAyf7mFODzAQKYy5LsPCtpAr
         bdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746653548; x=1747258348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFGRMash8A7LD509JYKnhMgwpOv6oeLiiO3InY3LVWU=;
        b=VtljrGkr5Euf1mzRfJjbr+Xp2XvROJqfcMpyzVwu32synx9SfwElMb8JEG28QLblB5
         zurmpb1S8RD4IXXymrakmhE5RmHUU0uG3uFd3/kJCaTYQnwiHY8dyRSX+dciXaLRUl4J
         EcEsH9ayQO6lfBRrUaNZuBgKclWFsEM2g2OlXupfJUpRuSZ5PLU4m3syeydIILSGbkic
         cEaHQ8PwxzG4bi5DQ/QC2FhtVI/m33+1hiSvevYvlnxBYZ3eDPXsxgJ9X6ZX60O11RNc
         Pz/Yjt2+25f2BEmVXWHzY5MhTWvdebxAmAPZHgwjR6tq/7GS2TYNAkg0P24Dx6uI5njG
         hr3w==
X-Forwarded-Encrypted: i=1; AJvYcCVa9Y9GpDipc3/D4t8uK/cf5wCe8VfykB0tqWinxGpz27TFtN8o1tGhKcKtMhzSgSjp7opUf5y4BlKNqmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp97B/ltey/PeI92AgvgHaltGs73Meby2nX2yrqkSGtggQs53R
	2VgH5GGYYFKgjnjDKjWFSdj3b3HP6/1pz3JMdUIrr0L2F87rHSg0QaVXiYd8iLg=
X-Gm-Gg: ASbGncuMzRwDQaIVPMfAfi2Mvm7ZfA9Jf3hARb4Jk5YosIAjuwkqcoN2+om0UwiZ8Kd
	fBT1DzD3mYwzbQO3fSOrTF2r9ycTp02MCpKAbl3vmgXpKqHWFSprH4UjalmWRJq+TQ0HIpQj0L0
	lufjM6SftWE2PQrkqHtw2gZyvei6MnISCml36p+qp9O20oNekNpTA9/3i4ekz/XOPYd+ffkQuAd
	R0uuHToYEZzP9cXbuE91Gu3A7Slc6EPnJx+2EYdCg6K0Z4jrg8hmNOIsOrXKEqHQAdH3waXTWJc
	pTnZPejIDz/x/GoLh7zrbK0bvxX1JX+gGI2P
X-Google-Smtp-Source: AGHT+IFuckCQJA/Z1pGhl1AI2gxo6NDr1aYdEtjiV2Vr+hBxmBoSDhDeRiMuUCjcDiKYsW/jJlGhrg==
X-Received: by 2002:a17:90b:3947:b0:2ff:58e1:2bb4 with SMTP id 98e67ed59e1d1-30b3a6d2ee0mr865751a91.22.1746653548300;
        Wed, 07 May 2025 14:32:28 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:a06c:2581:5189:32ce])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4b40eb3sm736231a91.17.2025.05.07.14.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 14:32:27 -0700 (PDT)
Date: Wed, 7 May 2025 14:32:25 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 2/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <aBvRacm66QK_UHXF@ghost>
References: <20240222125059.13331-1-hchauhan@ventanamicro.com>
 <20240222125059.13331-3-hchauhan@ventanamicro.com>
 <aBltPLLrvUNKR857@ghost>
 <014a66e3-1713-4450-a31b-a0619cca7bd3@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <014a66e3-1713-4450-a31b-a0619cca7bd3@ventanamicro.com>

On Wed, May 07, 2025 at 04:58:56PM +0530, Himanshu Chauhan wrote:
> Hi Charlie,
> 
> On 5/6/25 07:30, Charlie Jenkins wrote:
> > On Thu, Feb 22, 2024 at 06:20:59PM +0530, Himanshu Chauhan wrote:
> > > RISC-V hardware breakpoint framework is built on top of perf subsystem and uses
> > > SBI debug trigger extension to install/uninstall/update/enable/disable hardware
> > > triggers as specified in Sdtrig ISA extension.
> > > 
> > > Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> > > ---
> > >   arch/riscv/Kconfig                     |   1 +
> > >   arch/riscv/include/asm/hw_breakpoint.h | 327 ++++++++++++
> > >   arch/riscv/include/asm/kdebug.h        |   3 +-
> > >   arch/riscv/kernel/Makefile             |   1 +
> > >   arch/riscv/kernel/hw_breakpoint.c      | 659 +++++++++++++++++++++++++
> > >   arch/riscv/kernel/traps.c              |   6 +
> > >   6 files changed, 996 insertions(+), 1 deletion(-)
> > >   create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
> > >   create mode 100644 arch/riscv/kernel/hw_breakpoint.c
> > > 
> > ...
> > 
> > > diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
> > > new file mode 100644
> > > index 000000000000..7787123c7180
> > > --- /dev/null
> > > +++ b/arch/riscv/kernel/hw_breakpoint.c
> > > +
> > > +void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
> > > +static int __init arch_hw_breakpoint_init(void)
> > > +{
> > > +	unsigned int cpu;
> > > +	int rc = 0;
> > > +
> > > +	for_each_possible_cpu(cpu)
> > > +		raw_spin_lock_init(&per_cpu(ecall_lock, cpu));
> > > +
> > > +	if (!dbtr_init)
> > > +		init_sbi_dbtr();
> > > +
> > > +	if (dbtr_total_num) {
> > > +		pr_info("%s: total number of type %d triggers: %u\n",
> > > +			__func__, dbtr_type, dbtr_total_num);
> > > +	} else {
> > > +		pr_info("%s: No hardware triggers available\n", __func__);
> > > +		goto out;
> > > +	}
> > > +
> > > +	/* Allocate per-cpu shared memory */
> > > +	sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
> > > +					PAGE_SIZE);
> > > +
> > > +	if (!sbi_dbtr_shmem) {
> > > +		pr_warn("%s: Failed to allocate shared memory.\n", __func__);
> > > +		rc = -ENOMEM;
> > > +		goto out;
> > > +	}
> > > +
> > > +	/* Hotplug handler to register/unregister shared memory with SBI */
> > > +	rc = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> > When using this, only hart 0 is getting setup. I think instead we want
> > the following to have all harts get setup:
> > 
> > 	for_each_online_cpu(cpu)
> > 		arch_smp_setup_sbi_shmem(cpu);
> > 
> > 	/* Hotplug handler to register/unregister shared memory with SBI */
> > 	rc = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
> 
> cpuhp_setup_state() install the callbacks and invoke the @startup callback
> (if not NULL) for all online CPUs. So there is no need to call
> "arch_smp_setup_sbi_shmem" for each CPU and then install the hotplug
> handler.

That's what I thought as well, but when testing that is not what was
happening.

> 
> If you are running this on QEMU, could you please share the qemu command you
> are invoking? I will test at my end and update you.

This is my qemu command:

qemu-system-riscv64 -nographic -m 1G -machine virt -smp 4 \
    -kernel arch/riscv/boot/Image -bios /home/charlie/opensbi/build/platform/generic/firmware/fw_dynamic.bin \
    -append "root=/dev/vda rw earlycon console=ttyS0" \
    -drive file=/home/charlie/buildroot/output/images/rootfs.ext2,format=raw,id=hd0,if=none \
    -cpu rv64,zicond=true \
    -device virtio-blk-device,drive=hd0 -gdb tcp::1234

- Charlie

> 
> Regards
> 
> Himanshu
> 
> > 
> > 
> > However, I am testing against tip-of-tree opensbi and am hitting an
> > issue during the setup on all harts:
> > 
> > [    0.202332] arch_smp_setup_sbi_shmem: Invalid address parameter (18446744073709551611)
> > [    0.202794] CPU 0: HW Breakpoint shared memory registered.
> > 
> > Additionally, this seems like it should be a fatal error, but it
> > continues on to print that the shared memory is registered because there
> > is no check before printing this seemingly successful message.
> > 
> > I know I am reviving an old thread, but do you have any insight into
> > what might be happening?
> > 
> > - Charlie
> > 
> > > +			       "riscv/hw_breakpoint:prepare",
> > > +			       arch_smp_setup_sbi_shmem,
> > > +			       arch_smp_teardown_sbi_shmem);
> > > +
> > > +	if (rc < 0) {
> > > +		pr_warn("%s: Failed to setup CPU hotplug state\n", __func__);
> > > +		free_percpu(sbi_dbtr_shmem);
> > > +		return rc;
> > > +	}
> > > + out:
> > > +	return rc;
> > > +}
> > > +arch_initcall(arch_hw_breakpoint_init);
> > > diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> > > index a1b9be3c4332..53e1dfe5746b 100644
> > > --- a/arch/riscv/kernel/traps.c
> > > +++ b/arch/riscv/kernel/traps.c
> > > @@ -277,6 +277,12 @@ void handle_break(struct pt_regs *regs)
> > >   	if (probe_breakpoint_handler(regs))
> > >   		return;
> > > +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> > > +	if (notify_die(DIE_DEBUG, "EBREAK", regs, 0, regs->cause, SIGTRAP)
> > > +	    == NOTIFY_STOP)
> > > +		return;
> > > +#endif
> > > +
> > >   	current->thread.bad_cause = regs->cause;
> > >   	if (user_mode(regs))
> > > -- 
> > > 2.34.1
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
