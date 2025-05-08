Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549CC21D581
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 19:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746732899; cv=none; b=joASptgijYur3Ne/Zd6QHfGKwqWEYeQ4328nslgnLy7cKH7KmJpernX+L17480gpgYkfunlYNIYha3aHbFEqRzS53712ac++JQUMwdzvqqMF8EFjKdzgBq9tFzAvB24lDpxvrWfITqJMc+fsQcu0HyK0vd/tE1lyZhd3ZNw+hKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746732899; c=relaxed/simple;
	bh=JgapiHZH1QGEE8ZqNzWhPwTnx+v8fD4Ewoj2DHejfHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OEmdUdhhxlAItz3Se6AdHBUnT2xEOBdEdH1jHHXH+fdWGUr6OJZz/HJA58HaHFpQOHcxkwVV0ktBW83QBG1RqW+UDiyemZK7SftmnUcOFy9EfLZSDNx+QKdgHLuTqjjliiE6cUz2gf0JmtcW1CktWQ/ePdHj/YOjLDqvIwtXb5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=2+feaXMV; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2+feaXMV"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ae727e87c26so905207a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 12:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746732895; x=1747337695; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sZ44o+q7/+m0UEn2HMO1rfRkSr213UfSD0BElkfuwOU=;
        b=2+feaXMVFtPKuFi8LM5HClAUWHZWhq4cRbV0c0cY1YgtN9Zn+vhLfpmZtT6VH3PF98
         3sSnp20z8tMy3dKFPgYBU3Rt2CJK9+YWDz+CG9uRP1heGV+o3cj24+y129+dw1oW9fRW
         NvTRmHQx3PKQs/RIOpkndKqLxV1VofWEXn12pheu3m1Gjd1SgNFE//erfRpJW4TM6fk3
         MxiBD+4PBzud8ly/4L1PtvVPUAcqMZQTR13uyq5st4Y7Xn7q3x0k1DdRpjhMPza02xY+
         lRj1atxo7vRidqykDB8rAOL7XqJ0tfiEauyrzCHIWWYExzoVvmyhdB+TROx/SmLcIN+i
         sZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746732895; x=1747337695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZ44o+q7/+m0UEn2HMO1rfRkSr213UfSD0BElkfuwOU=;
        b=EWzKS4k/pRE4pepBwMQs33CawR3oFupjcX+j9qsZhuH6yJK7UxjZCKxiki9TKqCxSW
         0Hvjzgbo9JiSkwlufPO2UV9J7fo9wfltUAz/yFHo4BkXV/8ejRL2dBFkA2Mx/blbCuC7
         I/Cv+31yvBvBz0/R55LQyvzR7sVPged5I66jgI/4MFnIW/5oxaMArS7lpinXj40ODPq3
         4BHrMymvH+ziN+apmVCH+WxxofKetpasLu0Yu533ZdAGuBvoBfg0B7GdsV8cUN1NBQPg
         HnghveKxPstTk122jZJqqM/unPIyp+egwPd8RwKFwgGdwKJoBWXW2UiCIbPhYK8aHChN
         3gww==
X-Forwarded-Encrypted: i=1; AJvYcCV9n8Z0vju2sBmqLSVxRY9s7Uhexgi+P7LQQhDd5AqhOLXhUZjjt97RnTHQ4Is/5L6l/8Po4N+aZFcBg4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyE+16CDeBz0Qw0HVie4nB/STEwuToD5rKNCiaHfzXar9Am7MS
	5yiGcPuef7uv+ByRK7q2zaL2e6zRFHXy/upEo0qpH8SYKc5RlCmI3oWOcXKhYmc=
X-Gm-Gg: ASbGncvxdrkCanhf5Q4boxP8Mj3+VN6TXbUwuvGgsIFgdjTR/GbD5j1kyXhzUMWgJu7
	o9IwUZn05C0ugPEOJUyjEZTVVmDW2rRgkGzyLQcN8Az6SK9qjqK1I1ccgtbY6pe62B6B0ClXof6
	YofnVglCr8bWyqd6jLvFX4CEJIutivnVe40KtaZTsoBcsu9Hlt0bMPEdB8gJqUMp9lSgEtEbvrP
	0CycX9MFz/pUVPXT0udHrnVaD34DO8WDmgAioSoDQvSGsTVo3sO2NJNXCdNMs1whwAi028EWV6N
	7fKC4viZZYhK6vTTg0HJL3uC3B7fWLaFrBU=
X-Google-Smtp-Source: AGHT+IHTPx7T9l6k4TRqIQMtaCB1xcUyJtbhOgvLPrdR9JpDbal+18vVjOKPxT+Q2KeQn29Fpb8rcA==
X-Received: by 2002:a17:90b:1e53:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-30c3d64d90amr1013425a91.30.1746732895389;
        Thu, 08 May 2025 12:34:55 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:4b9:4737:ae71:4501])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39de72d9sm381921a91.21.2025.05.08.12.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:34:54 -0700 (PDT)
Date: Thu, 8 May 2025 12:34:52 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 2/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <aB0HXDweWAagCofs@ghost>
References: <20240222125059.13331-1-hchauhan@ventanamicro.com>
 <20240222125059.13331-3-hchauhan@ventanamicro.com>
 <aBltPLLrvUNKR857@ghost>
 <014a66e3-1713-4450-a31b-a0619cca7bd3@ventanamicro.com>
 <aBvRacm66QK_UHXF@ghost>
 <57f163bb-1b4e-4f57-8f93-aee6ce1bd317@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57f163bb-1b4e-4f57-8f93-aee6ce1bd317@ventanamicro.com>

On Thu, May 08, 2025 at 05:24:42PM +0530, Himanshu Chauhan wrote:
> On 5/8/25 03:02, Charlie Jenkins wrote:
> > On Wed, May 07, 2025 at 04:58:56PM +0530, Himanshu Chauhan wrote:
> > > Hi Charlie,
> > > 
> > > On 5/6/25 07:30, Charlie Jenkins wrote:
> > > > On Thu, Feb 22, 2024 at 06:20:59PM +0530, Himanshu Chauhan wrote:
> > > > > RISC-V hardware breakpoint framework is built on top of perf subsystem and uses
> > > > > SBI debug trigger extension to install/uninstall/update/enable/disable hardware
> > > > > triggers as specified in Sdtrig ISA extension.
> > > > > 
> > > > > Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> > > > > ---
> > > > >    arch/riscv/Kconfig                     |   1 +
> > > > >    arch/riscv/include/asm/hw_breakpoint.h | 327 ++++++++++++
> > > > >    arch/riscv/include/asm/kdebug.h        |   3 +-
> > > > >    arch/riscv/kernel/Makefile             |   1 +
> > > > >    arch/riscv/kernel/hw_breakpoint.c      | 659 +++++++++++++++++++++++++
> > > > >    arch/riscv/kernel/traps.c              |   6 +
> > > > >    6 files changed, 996 insertions(+), 1 deletion(-)
> > > > >    create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
> > > > >    create mode 100644 arch/riscv/kernel/hw_breakpoint.c
> > > > > 
> > > > ...
> > > > 
> > > > > diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
> > > > > new file mode 100644
> > > > > index 000000000000..7787123c7180
> > > > > --- /dev/null
> > > > > +++ b/arch/riscv/kernel/hw_breakpoint.c
> > > > > +
> > > > > +void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
> > > > > +static int __init arch_hw_breakpoint_init(void)
> > > > > +{
> > > > > +	unsigned int cpu;
> > > > > +	int rc = 0;
> > > > > +
> > > > > +	for_each_possible_cpu(cpu)
> > > > > +		raw_spin_lock_init(&per_cpu(ecall_lock, cpu));
> > > > > +
> > > > > +	if (!dbtr_init)
> > > > > +		init_sbi_dbtr();
> > > > > +
> > > > > +	if (dbtr_total_num) {
> > > > > +		pr_info("%s: total number of type %d triggers: %u\n",
> > > > > +			__func__, dbtr_type, dbtr_total_num);
> > > > > +	} else {
> > > > > +		pr_info("%s: No hardware triggers available\n", __func__);
> > > > > +		goto out;
> > > > > +	}
> > > > > +
> > > > > +	/* Allocate per-cpu shared memory */
> > > > > +	sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
> > > > > +					PAGE_SIZE);
> > > > > +
> > > > > +	if (!sbi_dbtr_shmem) {
> > > > > +		pr_warn("%s: Failed to allocate shared memory.\n", __func__);
> > > > > +		rc = -ENOMEM;
> > > > > +		goto out;
> > > > > +	}
> > > > > +
> > > > > +	/* Hotplug handler to register/unregister shared memory with SBI */
> > > > > +	rc = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> > > > When using this, only hart 0 is getting setup. I think instead we want
> > > > the following to have all harts get setup:
> > > > 
> > > > 	for_each_online_cpu(cpu)
> > > > 		arch_smp_setup_sbi_shmem(cpu);
> > > > 
> > > > 	/* Hotplug handler to register/unregister shared memory with SBI */
> > > > 	rc = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
> > > cpuhp_setup_state() install the callbacks and invoke the @startup callback
> > > (if not NULL) for all online CPUs. So there is no need to call
> > > "arch_smp_setup_sbi_shmem" for each CPU and then install the hotplug
> > > handler.
> > That's what I thought as well, but when testing that is not what was
> > happening.
> 
> I see the initialization happening on all the CPUs. I am using OpenSBI
> Top-of-line.
> 
> Linux kernel is from https://github.com/ventanamicro/linux.git [branch:
> dev-upstream]

The patch in that branch is different! In this series there is:

#if __riscv_xlen == 64
#define MEM_HI(_m)	((u64)_m >> 32)
#define MEM_LO(_m)	((u64)_m & 0xFFFFFFFFUL)
#elif __riscv_xlen == 32
#define MEM_HI(_m)	(((u64)_m >> 32) & 0x3)
#define MEM_LO(_m)	((u64)_m & 0xFFFFFFFFUL)
#else
#error "Unknown __riscv_xlen"
#endif

static int arch_smp_setup_sbi_shmem(unsigned int cpu)
{
	struct sbi_dbtr_shmem_entry *dbtr_shmem;
	unsigned long shmem_pa;
	struct sbiret ret;
	int rc;

	dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
	if (!dbtr_shmem) {
		pr_err("Invalid per-cpu shared memory for debug triggers\n");
		return -ENODEV;
	}

	shmem_pa = __pa(dbtr_shmem);

	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
			(!MEM_LO(shmem_pa) ? 0xFFFFFFFFUL : MEM_LO(shmem_pa)),
			(!MEM_HI(shmem_pa) ? 0xFFFFFFFFUL : MEM_HI(shmem_pa)),
			 0, 0, 0, 0);

But in the Ventana branch there is:


#if __riscv_xlen == 64
#define MEM_HI(_m)	0
#define MEM_LO(_m)	((u64)_m)
#elif __riscv_xlen == 32
#define MEM_HI(_m)	((u64)_m >> 32)
#define MEM_LO(_m)	((u64)_m & 0xFFFFFFFFUL)
#else
#error "Unknown __riscv_xlen"
#endif

static int arch_smp_setup_sbi_shmem(unsigned int cpu)
{
	struct sbi_dbtr_shmem_entry *dbtr_shmem;
	unsigned long shmem_pa;
	struct sbiret ret;
	int rc;

	dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
	if (!dbtr_shmem) {
		pr_err("Invalid per-cpu shared memory for debug triggers\n");
		return -ENODEV;
	}

	shmem_pa = __pa(dbtr_shmem);

	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
			MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);


I suppose this was causing the shmem setup to fail and preventing the
kernel from bringing up the other harts.

Can you send a version 2 that reflects the version in the Ventana tree?

- Charlie

> 
> Part of boot log:
> 
> [    0.267250] arch_hw_breakpoint_init: total number of type 6 triggers: 2
> [    0.268108] CPU 0: HW Breakpoint shared memory registered.
> [    0.268835] CPU 1: HW Breakpoint shared memory registered.
> [    0.269932] CPU 2: HW Breakpoint shared memory registered.
> [    0.270468] CPU 3: HW Breakpoint shared memory registered.
> [    0.276554] sse: SBI SSE extension detected
> [    0.308172] HugeTLB: allocation took 0ms with
> hugepage_allocation_threads=1
> [    0.309682] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> 
> Can you please send me your config and bootlog?
> 
> Regards
> 
> Himanshu
> 
> 
> > > If you are running this on QEMU, could you please share the qemu command you
> > > are invoking? I will test at my end and update you.
> > This is my qemu command:
> > 
> > qemu-system-riscv64 -nographic -m 1G -machine virt -smp 4 \
> >      -kernel arch/riscv/boot/Image -bios /home/charlie/opensbi/build/platform/generic/firmware/fw_dynamic.bin \
> >      -append "root=/dev/vda rw earlycon console=ttyS0" \
> >      -drive file=/home/charlie/buildroot/output/images/rootfs.ext2,format=raw,id=hd0,if=none \
> >      -cpu rv64,zicond=true \
> >      -device virtio-blk-device,drive=hd0 -gdb tcp::1234
> > 
> > - Charlie
> > 
> > > Regards
> > > 
> > > Himanshu
> > > 
> > > > 
> > > > However, I am testing against tip-of-tree opensbi and am hitting an
> > > > issue during the setup on all harts:
> > > > 
> > > > [    0.202332] arch_smp_setup_sbi_shmem: Invalid address parameter (18446744073709551611)
> > > > [    0.202794] CPU 0: HW Breakpoint shared memory registered.
> > > > 
> > > > Additionally, this seems like it should be a fatal error, but it
> > > > continues on to print that the shared memory is registered because there
> > > > is no check before printing this seemingly successful message.
> > > > 
> > > > I know I am reviving an old thread, but do you have any insight into
> > > > what might be happening?
> > > > 
> > > > - Charlie
> > > > 
> > > > > +			       "riscv/hw_breakpoint:prepare",
> > > > > +			       arch_smp_setup_sbi_shmem,
> > > > > +			       arch_smp_teardown_sbi_shmem);
> > > > > +
> > > > > +	if (rc < 0) {
> > > > > +		pr_warn("%s: Failed to setup CPU hotplug state\n", __func__);
> > > > > +		free_percpu(sbi_dbtr_shmem);
> > > > > +		return rc;
> > > > > +	}
> > > > > + out:
> > > > > +	return rc;
> > > > > +}
> > > > > +arch_initcall(arch_hw_breakpoint_init);
> > > > > diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> > > > > index a1b9be3c4332..53e1dfe5746b 100644
> > > > > --- a/arch/riscv/kernel/traps.c
> > > > > +++ b/arch/riscv/kernel/traps.c
> > > > > @@ -277,6 +277,12 @@ void handle_break(struct pt_regs *regs)
> > > > >    	if (probe_breakpoint_handler(regs))
> > > > >    		return;
> > > > > +#ifdef CONFIG_HAVE_HW_BREAKPOINT
> > > > > +	if (notify_die(DIE_DEBUG, "EBREAK", regs, 0, regs->cause, SIGTRAP)
> > > > > +	    == NOTIFY_STOP)
> > > > > +		return;
> > > > > +#endif
> > > > > +
> > > > >    	current->thread.bad_cause = regs->cause;
> > > > >    	if (user_mode(regs))
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > > > 
> > > > > _______________________________________________
> > > > > linux-riscv mailing list
> > > > > linux-riscv@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-riscv
