Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F94233129
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617344; cv=none; b=bpsaMgSkE6/oVBPPchAC0qW34RjtYqJJXODNTO89/0jAojQoAP4Cme7pwNNtMkDPF+KfzcdImJ5TekQrH3DDho/Ep3mbK0drEMbw7g92A0/CPaMspe5lxv7c29eyUafVkUckJ/DiTeS9svJlWvKoiR8SFFt1CkW8MBncv/L8A74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617344; c=relaxed/simple;
	bh=uLB9T+cChgYekbDjW6M3byFDER4wbS1GW71aAxAYwUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jfurFR1eXenlSuDSPXFrIjyTXc40JDIH22A/JrqoOLxDtPxieF6C4eXQkw99pOpiOUaUIN3NNRpS4zixiJB5HnuMY47lo6OHI4dQXVtXi897u9ZmZX6Zz2T02y33rQBC5sgalxXjLxC3bmishl7CdeLMF6BD946gU6O90sZpIWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=IAhogI+e; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="IAhogI+e"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b07d607dc83so5712908a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 04:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746617342; x=1747222142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sttONq6C7vjvpabOEe6Nl/nb6a/BYUM2iobwsWyFxG0=;
        b=IAhogI+ereC4namTtezQOzx/yf/0GR030BAwKxQGIAYjCSE4zYR9PeTviNgf0RzB6e
         S3NDczLlEGbBIiZl8x0p8zAmDG4QNyZrEwhKc5kZp0pRu7t9spvBNEOcA7nbj3kYe4GI
         i+7MjpWMDe4gudJPTMtVeBUwpM1NS+VfFC4aU0j376X8Nrv8kMlgIpi5zBR3qpP1dwbQ
         CblIdwr7VnMKC8eztNWo+upPddAX/dkuIfk0pPXIMOC1jbr3QPeippSVuKhtfOHbLDMw
         tpo5/RLLJCA7SQVlz5Qz85KrxpqwzVuyaIEHD07wVrLlEFSOt7FzUe4CsdrMay3TMxS2
         ruqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746617342; x=1747222142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sttONq6C7vjvpabOEe6Nl/nb6a/BYUM2iobwsWyFxG0=;
        b=lDaqGQnJK1UgDgarHV6ovZKdHaU3z8RgF9ZgW1330YGAhIDzZI4yT+pbNAV8p4sWW8
         4gFegNg4GtHyiPiUv1Hrypv1507+Oy3F+KMYWLGvnZFaxpVH0SJsKiEBCfBGsBA5xWHi
         djP6Jen9nQlBtcPMoIMuE187JIQBrYB6NNIDOaw/cJXQ0SAch86aEzzluBqUpcYqfU0M
         Wnf2nbjlSOTo+pzH+rd65ekiB+z6Wf4NcIhSRpqWLcpnDB9Ahc5Np2fwpgKn6lk/NJDI
         FI7NERyKOZzZ8vkASHPeagx0pneocfL3UiJbWFGhqawrcojUZeRXDOruCIX5ZBxETY1r
         mtmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb7whb07OTNW0sM/0g4LlWog7MDkXIKvAX7DXaZHWwKEAcZDfjEITE+BBjoOfxumTYj/LivBFKMu01w88=@vger.kernel.org
X-Gm-Message-State: AOJu0YwolQ1oAOzDqptgfZ6ZBFgSuAwQ0MRhsvhxZiYj0NNoXmaFiEOs
	wojpULVZqbtP0s8yMR/90A44G+EhhOfVjnBU110eUXGf8inVB5CKqKCbOEVhgVg=
X-Gm-Gg: ASbGnctcyJ64lk5Flgbki8Bl/2C0Ve9eAfGI4tQgxxp61KdoBcPBdb1krfOP6UCSC8c
	ZMhVCeV7KJ1rLi0oy99CqDPV5JlkIykxuvhioF4vBfuN4t+8LshlG66cr6mr/2kLwRXGW1S/Rqp
	JNa4B3t4ZF+ykEe1yq+LHKDvfht/KwNRxOTe8IT15Td3WrOxCesd5y2DA6SCk7nT15+BNp4e1Hs
	Hp0wfFCrn+6u2X75Ir2rQN2vVs6rnOkVybyUVpTgH9muGw7ds8IrnNEZD2Q5iYJX7iOTJHjGS7B
	9xkJ1qqfnKv0u92tL3K5qEX1J4AEDajNyCIOWO68plpRBfHP0/1yFyyO55F18AhXAiJVgWtPd+a
	7einQCD2qvJ7oQAz0modeEFU=
X-Google-Smtp-Source: AGHT+IG0tWDBCkB5n9QIjsb9/8DjWrsdfDefC415eDCLuX/h+jgmPObe4nyyj6NIY6hM4/giQEdftA==
X-Received: by 2002:a17:90b:4d04:b0:2ff:6488:e01c with SMTP id 98e67ed59e1d1-30aac2a3241mr4289150a91.29.1746617341806;
        Wed, 07 May 2025 04:29:01 -0700 (PDT)
Received: from ?IPV6:2401:4900:7aa3:bb0a:8dbc:b918:6297:af68? ([2401:4900:7aa3:bb0a:8dbc:b918:6297:af68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae4fd109sm1761398a91.1.2025.05.07.04.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 04:29:01 -0700 (PDT)
Message-ID: <014a66e3-1713-4450-a31b-a0619cca7bd3@ventanamicro.com>
Date: Wed, 7 May 2025 16:58:56 +0530
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
Content-Language: en-US
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
In-Reply-To: <aBltPLLrvUNKR857@ghost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Charlie,

On 5/6/25 07:30, Charlie Jenkins wrote:
> On Thu, Feb 22, 2024 at 06:20:59PM +0530, Himanshu Chauhan wrote:
>> RISC-V hardware breakpoint framework is built on top of perf subsystem and uses
>> SBI debug trigger extension to install/uninstall/update/enable/disable hardware
>> triggers as specified in Sdtrig ISA extension.
>>
>> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
>> ---
>>   arch/riscv/Kconfig                     |   1 +
>>   arch/riscv/include/asm/hw_breakpoint.h | 327 ++++++++++++
>>   arch/riscv/include/asm/kdebug.h        |   3 +-
>>   arch/riscv/kernel/Makefile             |   1 +
>>   arch/riscv/kernel/hw_breakpoint.c      | 659 +++++++++++++++++++++++++
>>   arch/riscv/kernel/traps.c              |   6 +
>>   6 files changed, 996 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
>>   create mode 100644 arch/riscv/kernel/hw_breakpoint.c
>>
> ...
>
>> diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
>> new file mode 100644
>> index 000000000000..7787123c7180
>> --- /dev/null
>> +++ b/arch/riscv/kernel/hw_breakpoint.c
>> +
>> +void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
>> +static int __init arch_hw_breakpoint_init(void)
>> +{
>> +	unsigned int cpu;
>> +	int rc = 0;
>> +
>> +	for_each_possible_cpu(cpu)
>> +		raw_spin_lock_init(&per_cpu(ecall_lock, cpu));
>> +
>> +	if (!dbtr_init)
>> +		init_sbi_dbtr();
>> +
>> +	if (dbtr_total_num) {
>> +		pr_info("%s: total number of type %d triggers: %u\n",
>> +			__func__, dbtr_type, dbtr_total_num);
>> +	} else {
>> +		pr_info("%s: No hardware triggers available\n", __func__);
>> +		goto out;
>> +	}
>> +
>> +	/* Allocate per-cpu shared memory */
>> +	sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
>> +					PAGE_SIZE);
>> +
>> +	if (!sbi_dbtr_shmem) {
>> +		pr_warn("%s: Failed to allocate shared memory.\n", __func__);
>> +		rc = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	/* Hotplug handler to register/unregister shared memory with SBI */
>> +	rc = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> When using this, only hart 0 is getting setup. I think instead we want
> the following to have all harts get setup:
>
> 	for_each_online_cpu(cpu)
> 		arch_smp_setup_sbi_shmem(cpu);
>
> 	/* Hotplug handler to register/unregister shared memory with SBI */
> 	rc = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,

cpuhp_setup_state() install the callbacks and invoke the @startup 
callback (if not NULL) for all online CPUs. So there is no need to call 
"arch_smp_setup_sbi_shmem" for each CPU and then install the hotplug 
handler.

If you are running this on QEMU, could you please share the qemu command 
you are invoking? I will test at my end and update you.

Regards

Himanshu

>
>
> However, I am testing against tip-of-tree opensbi and am hitting an
> issue during the setup on all harts:
>
> [    0.202332] arch_smp_setup_sbi_shmem: Invalid address parameter (18446744073709551611)
> [    0.202794] CPU 0: HW Breakpoint shared memory registered.
>
> Additionally, this seems like it should be a fatal error, but it
> continues on to print that the shared memory is registered because there
> is no check before printing this seemingly successful message.
>
> I know I am reviving an old thread, but do you have any insight into
> what might be happening?
>
> - Charlie
>
>> +			       "riscv/hw_breakpoint:prepare",
>> +			       arch_smp_setup_sbi_shmem,
>> +			       arch_smp_teardown_sbi_shmem);
>> +
>> +	if (rc < 0) {
>> +		pr_warn("%s: Failed to setup CPU hotplug state\n", __func__);
>> +		free_percpu(sbi_dbtr_shmem);
>> +		return rc;
>> +	}
>> + out:
>> +	return rc;
>> +}
>> +arch_initcall(arch_hw_breakpoint_init);
>> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>> index a1b9be3c4332..53e1dfe5746b 100644
>> --- a/arch/riscv/kernel/traps.c
>> +++ b/arch/riscv/kernel/traps.c
>> @@ -277,6 +277,12 @@ void handle_break(struct pt_regs *regs)
>>   	if (probe_breakpoint_handler(regs))
>>   		return;
>>   
>> +#ifdef CONFIG_HAVE_HW_BREAKPOINT
>> +	if (notify_die(DIE_DEBUG, "EBREAK", regs, 0, regs->cause, SIGTRAP)
>> +	    == NOTIFY_STOP)
>> +		return;
>> +#endif
>> +
>>   	current->thread.bad_cause = regs->cause;
>>   
>>   	if (user_mode(regs))
>> -- 
>> 2.34.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
