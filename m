Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D829120B20A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746705290; cv=none; b=AM40iPMFHfoLensGdfioV3sARKxYhQ/9blOBuCYN1TqrPdsokq2Er2+HvR2RyBFCgSUyHTDJir4lm4QQXPlWA/LPY1vAWvyQVzhrnBV9nUNp77zDdShRmmaIvELgJaFKpcCsLEnmZL8/DojAMkt3pUqf8zxmbWGCZRE4EohhQt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746705290; c=relaxed/simple;
	bh=vBvEtiCuUrQw6cxYTqEPBmMcBNc/TgG+qB++L+wXBng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jkpRVtKZiAe8vYJ6lF6VY4/E57lB97vnwktj7vfHT/lsKAqUbbAaogI82AJTIybOeGZ9qzvGXoST1/cLVmW0JHfkcyvI3s1GzO20dvzmBQxfEsVPYedla2DgfXoVqZK+hlOkcFIMHRV18ul5PrvPdbnNW7m3/mMCkrYJ94I/viM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=J33z0ra3; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="J33z0ra3"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e76850b80so6644525ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 04:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746705288; x=1747310088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NQ5nx7BEtPQhnhB8LNMmTDa+6EsEVgHuuZJiFmNN9Ms=;
        b=J33z0ra3q7WlYYn9PIoa/L8m0ltJyHstsLAT/lCv4R2JHksEBrXhgHBumuXtnl8oFC
         JHr84tqt0ZLsETPnnuWy40g1jNVQqFYI+VQJwBabSm2RddTmQtGtSyaOAPfbnZ7RlRDR
         BTE+KsQ0nDeFHVx4df0VymZUM+1L0cA+fn4XgIu2By/AFUUw1wYJkp7KmZu8fDgR3u/h
         FG8aHi0REtNT3SEyVOA5SNe6QEFsc8lLGgjoIUI3TgPInFGCjx4xyOXOATzVVzE+wIfo
         xQest9XQJWwwx4+BQeyHfSlQmJoPZOmJbaNVz5Wm4gjL96tDf3s4B069QSyN05Xm9q4H
         jFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746705288; x=1747310088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ5nx7BEtPQhnhB8LNMmTDa+6EsEVgHuuZJiFmNN9Ms=;
        b=J8OnsmF7TzzHzeYPWodv0Yjq9g82a9SN54D5fDxTLcZe0v6e9eCvAvWTJ3fGkWvzWo
         gleFGiBIB8/Lb8DQWBZqqo8NAjBgXpBHZGeiRwI6hFaYjgLw0RAjGCT9Upx76k91rXuR
         PX4MDJ7Ym8IBAso2YkP5pWurAmqSD3ETzkHCeQfDsuDZp9c4HuhF2rUBksPPWVavAKtr
         NhQFr7bJjMTFw9GO9h0njj6EPf0mBCPE0kdP4NHcE/t+PyP664Ce8a5cdp973PT4KkUX
         GEi6H0Erl50QKwOwQphAWOUWMdIeCyuxcpNOKQRV9j/+LmtjmF9QVNfR3buD+QHFl0hs
         FNmg==
X-Forwarded-Encrypted: i=1; AJvYcCW8oLkBxi7H2E39Cs0Znv3hLRUHxweZ1PolTSpi/kb2bH0BKRhvWEG11FhDshs375nb+EMoOkfjJrq38MY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSirla8IHrGojJEQ/NC4HsppWZimvIs3SbHzPioubOXgqeRy64
	YI7hfpyUZliXtNyehR2HS6hMI+j5rVZRIK/SV70fIv0FNsouGOYLoAJvXZlHgj8=
X-Gm-Gg: ASbGncsLDMTPYba+rKf47iTdXJfTuynbJ4WH+mvgt7UrJHS7fZMlsHTylcliLwiN7FT
	wuMfLf0nWJNzLkNqeP59Y31xNWL+D6RHc/ENEl81j0tHcRlH5mnfKrI+zeUyevlFCqBS9VgAPb+
	bWN8IapVnxwpPKWeDfUYUBYdIsJUy6COOwHn2j1OSdnaCnIjlQDzulZbHGxTYcuVOcqPlHOkRor
	xo04PnitdzZjHX3nOEFEElJI9ylOdOCPA30Wd0Eanop3GZP2FEkfWNOaP62877EW36MbhcdVPt+
	Mbge8YToWZkAv5NLftMrUb7Yrg7ZUMwyWtKiOUcswBmrU+Co8tYiTg==
X-Google-Smtp-Source: AGHT+IHNkr+cYmPtqEDKPUm8A/UvsVB8Ee40tnr1fJFsnH5tHlLIOarW/VG1HJ4MVlRL7k8EI2tcYQ==
X-Received: by 2002:a17:903:22c9:b0:224:249f:9734 with SMTP id d9443c01a7336-22e85613e37mr50522725ad.4.1746705288109;
        Thu, 08 May 2025 04:54:48 -0700 (PDT)
Received: from [192.168.62.7] ([110.226.169.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e84956656sm14404295ad.79.2025.05.08.04.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 04:54:47 -0700 (PDT)
Message-ID: <57f163bb-1b4e-4f57-8f93-aee6ce1bd317@ventanamicro.com>
Date: Thu, 8 May 2025 17:24:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] riscv: Introduce support for hardware
 break/watchpoints
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
References: <20240222125059.13331-1-hchauhan@ventanamicro.com>
 <20240222125059.13331-3-hchauhan@ventanamicro.com> <aBltPLLrvUNKR857@ghost>
 <014a66e3-1713-4450-a31b-a0619cca7bd3@ventanamicro.com>
 <aBvRacm66QK_UHXF@ghost>
Content-Language: en-US
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
In-Reply-To: <aBvRacm66QK_UHXF@ghost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/8/25 03:02, Charlie Jenkins wrote:
> On Wed, May 07, 2025 at 04:58:56PM +0530, Himanshu Chauhan wrote:
>> Hi Charlie,
>>
>> On 5/6/25 07:30, Charlie Jenkins wrote:
>>> On Thu, Feb 22, 2024 at 06:20:59PM +0530, Himanshu Chauhan wrote:
>>>> RISC-V hardware breakpoint framework is built on top of perf subsystem and uses
>>>> SBI debug trigger extension to install/uninstall/update/enable/disable hardware
>>>> triggers as specified in Sdtrig ISA extension.
>>>>
>>>> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
>>>> ---
>>>>    arch/riscv/Kconfig                     |   1 +
>>>>    arch/riscv/include/asm/hw_breakpoint.h | 327 ++++++++++++
>>>>    arch/riscv/include/asm/kdebug.h        |   3 +-
>>>>    arch/riscv/kernel/Makefile             |   1 +
>>>>    arch/riscv/kernel/hw_breakpoint.c      | 659 +++++++++++++++++++++++++
>>>>    arch/riscv/kernel/traps.c              |   6 +
>>>>    6 files changed, 996 insertions(+), 1 deletion(-)
>>>>    create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
>>>>    create mode 100644 arch/riscv/kernel/hw_breakpoint.c
>>>>
>>> ...
>>>
>>>> diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
>>>> new file mode 100644
>>>> index 000000000000..7787123c7180
>>>> --- /dev/null
>>>> +++ b/arch/riscv/kernel/hw_breakpoint.c
>>>> +
>>>> +void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
>>>> +static int __init arch_hw_breakpoint_init(void)
>>>> +{
>>>> +	unsigned int cpu;
>>>> +	int rc = 0;
>>>> +
>>>> +	for_each_possible_cpu(cpu)
>>>> +		raw_spin_lock_init(&per_cpu(ecall_lock, cpu));
>>>> +
>>>> +	if (!dbtr_init)
>>>> +		init_sbi_dbtr();
>>>> +
>>>> +	if (dbtr_total_num) {
>>>> +		pr_info("%s: total number of type %d triggers: %u\n",
>>>> +			__func__, dbtr_type, dbtr_total_num);
>>>> +	} else {
>>>> +		pr_info("%s: No hardware triggers available\n", __func__);
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	/* Allocate per-cpu shared memory */
>>>> +	sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
>>>> +					PAGE_SIZE);
>>>> +
>>>> +	if (!sbi_dbtr_shmem) {
>>>> +		pr_warn("%s: Failed to allocate shared memory.\n", __func__);
>>>> +		rc = -ENOMEM;
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	/* Hotplug handler to register/unregister shared memory with SBI */
>>>> +	rc = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>>> When using this, only hart 0 is getting setup. I think instead we want
>>> the following to have all harts get setup:
>>>
>>> 	for_each_online_cpu(cpu)
>>> 		arch_smp_setup_sbi_shmem(cpu);
>>>
>>> 	/* Hotplug handler to register/unregister shared memory with SBI */
>>> 	rc = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
>> cpuhp_setup_state() install the callbacks and invoke the @startup callback
>> (if not NULL) for all online CPUs. So there is no need to call
>> "arch_smp_setup_sbi_shmem" for each CPU and then install the hotplug
>> handler.
> That's what I thought as well, but when testing that is not what was
> happening.

I see the initialization happening on all the CPUs. I am using OpenSBI 
Top-of-line.

Linux kernel is from https://github.com/ventanamicro/linux.git [branch: 
dev-upstream]

Part of boot log:

[    0.267250] arch_hw_breakpoint_init: total number of type 6 triggers: 2
[    0.268108] CPU 0: HW Breakpoint shared memory registered.
[    0.268835] CPU 1: HW Breakpoint shared memory registered.
[    0.269932] CPU 2: HW Breakpoint shared memory registered.
[    0.270468] CPU 3: HW Breakpoint shared memory registered.
[    0.276554] sse: SBI SSE extension detected
[    0.308172] HugeTLB: allocation took 0ms with 
hugepage_allocation_threads=1
[    0.309682] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages

Can you please send me your config and bootlog?

Regards

Himanshu


>> If you are running this on QEMU, could you please share the qemu command you
>> are invoking? I will test at my end and update you.
> This is my qemu command:
>
> qemu-system-riscv64 -nographic -m 1G -machine virt -smp 4 \
>      -kernel arch/riscv/boot/Image -bios /home/charlie/opensbi/build/platform/generic/firmware/fw_dynamic.bin \
>      -append "root=/dev/vda rw earlycon console=ttyS0" \
>      -drive file=/home/charlie/buildroot/output/images/rootfs.ext2,format=raw,id=hd0,if=none \
>      -cpu rv64,zicond=true \
>      -device virtio-blk-device,drive=hd0 -gdb tcp::1234
>
> - Charlie
>
>> Regards
>>
>> Himanshu
>>
>>>
>>> However, I am testing against tip-of-tree opensbi and am hitting an
>>> issue during the setup on all harts:
>>>
>>> [    0.202332] arch_smp_setup_sbi_shmem: Invalid address parameter (18446744073709551611)
>>> [    0.202794] CPU 0: HW Breakpoint shared memory registered.
>>>
>>> Additionally, this seems like it should be a fatal error, but it
>>> continues on to print that the shared memory is registered because there
>>> is no check before printing this seemingly successful message.
>>>
>>> I know I am reviving an old thread, but do you have any insight into
>>> what might be happening?
>>>
>>> - Charlie
>>>
>>>> +			       "riscv/hw_breakpoint:prepare",
>>>> +			       arch_smp_setup_sbi_shmem,
>>>> +			       arch_smp_teardown_sbi_shmem);
>>>> +
>>>> +	if (rc < 0) {
>>>> +		pr_warn("%s: Failed to setup CPU hotplug state\n", __func__);
>>>> +		free_percpu(sbi_dbtr_shmem);
>>>> +		return rc;
>>>> +	}
>>>> + out:
>>>> +	return rc;
>>>> +}
>>>> +arch_initcall(arch_hw_breakpoint_init);
>>>> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>>>> index a1b9be3c4332..53e1dfe5746b 100644
>>>> --- a/arch/riscv/kernel/traps.c
>>>> +++ b/arch/riscv/kernel/traps.c
>>>> @@ -277,6 +277,12 @@ void handle_break(struct pt_regs *regs)
>>>>    	if (probe_breakpoint_handler(regs))
>>>>    		return;
>>>> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
>>>> +	if (notify_die(DIE_DEBUG, "EBREAK", regs, 0, regs->cause, SIGTRAP)
>>>> +	    == NOTIFY_STOP)
>>>> +		return;
>>>> +#endif
>>>> +
>>>>    	current->thread.bad_cause = regs->cause;
>>>>    	if (user_mode(regs))
>>>> -- 
>>>> 2.34.1
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-riscv mailing list
>>>> linux-riscv@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
