Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF2F288C01
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907421; cv=none; b=SE+ghlJOyIq4R8zyVbuPI9vPlPcw20KxydQSIeXPLz2GRum1B0f/zRGcqJYg6/rKM5dD6QmypEakwYGwpgN+aLI6qKGcITFUYJNVHoiurEh8w+Tc0cJGWEfwrVafy7cQrGBVdE9L4rvENCaa29Ld+0iBs9nEKUSdCAr13WICa64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907421; c=relaxed/simple;
	bh=AuLOiP1xF7kp5aF4DMq1m3CQMnNMzRmMvE4vxFbZjiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MW7MnvH67c/fnKPE1/XtWMLvWT6ylmAxFlWVQegl9n5H0eRLbNQD/JxMsqvDaKk0kCZukR20/Bc9BtzpD0BwyMU3fnRESKYGmxHd1m2pnJ8uzSilTWZEXNhX5G4YZTPkDwSJYeSRe/vcLUg+GRUwSjTw4b8hOFPPXSDjQ1ybOFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=FPZEvPON; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="FPZEvPON"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a3683d8314so4589247f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747907415; x=1748512215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dtkvsQ8B17dIaoSKOcuekQAZwQezc9EOTs1tyOeIoLE=;
        b=FPZEvPONec1FFFp82Ov1lPfP38jj8M+3014uR1Q8CTWaGrxHBupVwb9S/m5pHTSJNT
         LoPQjiYfLJJ04bTWX+s1HvHOLpQVQUfjnbMBS1IYC7lkjcCzV17FEoj/uE34KAXxRsjH
         uHp44nEykX5dmgyDch/GbyPZZbJe+JFTLczhLUF9xDT5xOzHoFNU3VF/QmfeVglKKvu4
         D1pKz5by30YPJbtiYVny1pIOrp+qvmjdEGRh83fuFvNgmysRxjMojb3ntzoQ4OhQmN/p
         oqJprTk4EAc/4oQEJJUDx+JCLyk2XwO7jSJXtl2guf1ZdrtvFUGSw7/950I13GuBF+FO
         L11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747907415; x=1748512215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dtkvsQ8B17dIaoSKOcuekQAZwQezc9EOTs1tyOeIoLE=;
        b=vkvgRFqNAij7kewalO2ScUxZGZ63f3EGlY2l8WV30CrLKMXhSPlf/bcvncqwn7lraE
         EcFjEFTl/tKq1Fh9ExsaO6v31fDnFm3VotCjeczZVstaxT8xw0UWgfwPFhZ8C9T2JCA2
         S2LmG+u6DzZQWdDhrmbcIktF/t+uWOsP8y06Ja16IerTg4m/k8J32l7KlITR/Me7bAvk
         SNpz0vLgoRkFjWEH32ysGNNB1DRYcgHcqZPD8SL1DIsvvYTNJDFFw0wxImp7jWRBtSuw
         +xnd4Qm39UFqGwsVADGR+uW5phPCUpvwQw57uALXTe7XgAHVyFgxgIfcDganlpC27AUX
         LaJg==
X-Forwarded-Encrypted: i=1; AJvYcCULhVCzN4MedK8ovQU0qpJATD6ytAx3Ivb9exMyCoHlhhhwJHyKCLkfRpaUvmKTDZ+A6PT8QbRwq6YixfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF3k0s7Zmx5c8YzUGoSwl3SiM8Zsc/7eYrGsGiKDQqeUKZmxau
	JXvxOfA4zWbGzvXvzNPzNSgCWN5PzBgLBtMiZ8JL99H79UbsJJVcsK5dzkLDKJ09xgI=
X-Gm-Gg: ASbGnctcQDtk2P7H810nROkRCN1v/LCZMSgQ6KvxCTCK6lXEque7LLxLzEruBUt5mUi
	gJNBkFs1oVjgtF7CTTpYWLgSQ9zzN7QrpjEJkpLmZMVUpQlAqb7lhTje/oWl2HKyjiqxKJp65tx
	mRjYWfNUeZskCtcBC4P/DvFl883ICZtrzq8T27dQv4OXxkZUkKd0d7b6PjSGyKMpbuDsVdjrH+0
	eKYO7MtZoBNNJahW3U/OYxIW8qJqeSLxSrSA4VJwxVK5IMakcE9e0lFzMxqtZ3kpz7KNfL107Qo
	umsfjKijBZ3tPd2X5dqVZzpKaB86MnVwG4FbwHuAPiueDD/G6vCc1CZgCSDhA4aKTW+RN9c8s+R
	QYx8hV6FE4oEtgcetWu9I
X-Google-Smtp-Source: AGHT+IEnOItYU5WM0sCRwl4WsiqZbVoHX6XABH5QQv7oIWh/O58Bk+2uf2wrBoZ17OXrGVmGWAWd2Q==
X-Received: by 2002:a5d:64c7:0:b0:3a3:64c2:2a8b with SMTP id ffacd0b85a97d-3a364c22c3emr21129137f8f.49.1747907415252;
        Thu, 22 May 2025 02:50:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d26esm22849957f8f.13.2025.05.22.02.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 02:50:14 -0700 (PDT)
Message-ID: <fe4e170b-02b8-4872-965f-94380ede7323@rivosinc.com>
Date: Thu, 22 May 2025 11:50:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] riscv: add support for SBI Supervisor Software
 Events extension
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>
References: <20250516152355.560448-1-cleger@rivosinc.com>
 <20250516152355.560448-3-cleger@rivosinc.com>
 <87ecwji2ej.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <87ecwji2ej.fsf@all.your.base.are.belong.to.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20/05/2025 20:05, Björn Töpel wrote:
> Clément Léger <cleger@rivosinc.com> writes:
> 
>> The SBI SSE extension allows the supervisor software to be notified by
>> the SBI of specific events that are not maskable. The context switch is
>> handled partially by the firmware which will save registers a6 and a7.
>> When entering kernel we can rely on these 2 registers to setup the stack
>> and save all the registers.
>>
>> Since SSE events can be delivered at any time to the kernel (including
>> during exception handling, we need a way to locate the current_task for
>> context tracking. On RISC-V, it is sotred in scratch when in user space
>> or tp when in kernel space (in which case SSCRATCH is zero). But at a
>> at the beginning of exception handling, SSCRATCH is used to swap tp and
>> check the origin of the exception. If interrupted at that point, then,
>> there is no way to reliably know were is located the current
>> task_struct. Even checking the interruption location won't work as SSE
>> event can be nested on top of each other so the original interruption
>> site might be lost at some point. In order to retrieve it reliably,
>> store the current task in an additionnal __sse_entry_task per_cpu array.
>> This array is then used to retrieve the current task based on the
>> hart ID that is passed to the SSE event handler in a6.
>>
>> That being said, the way the current task struct is stored should
>> probably be reworked to find a better reliable alternative.
>>
>> Since each events (and each CPU for local events) have their own
>> context and can preempt each other, allocate a stack (and a shadow stack
>> if needed for each of them (and for each cpu for local events).
>>
>> When completing the event, if we were coming from kernel with interrupts
>> disabled, simply return there. If coming from userspace or kernel with
>> interrupts enabled, simulate an interrupt exception by setting IE_SIE in
>> CSR_IP to allow delivery of signals to user task. For instance this can
>> happen, when a RAS event has been generated by a user application and a
>> SIGBUS has been sent to a task.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/asm.h         |  14 ++-
>>  arch/riscv/include/asm/scs.h         |   7 ++
>>  arch/riscv/include/asm/sse.h         |  45 +++++++
>>  arch/riscv/include/asm/switch_to.h   |  14 +++
>>  arch/riscv/include/asm/thread_info.h |   1 +
>>  arch/riscv/kernel/Makefile           |   1 +
>>  arch/riscv/kernel/asm-offsets.c      |  12 ++
>>  arch/riscv/kernel/sse.c              | 132 +++++++++++++++++++++
>>  arch/riscv/kernel/sse_entry.S        | 169 +++++++++++++++++++++++++++
>>  9 files changed, 392 insertions(+), 3 deletions(-)
>>  create mode 100644 arch/riscv/include/asm/sse.h
>>  create mode 100644 arch/riscv/kernel/sse.c
>>  create mode 100644 arch/riscv/kernel/sse_entry.S
>>
>> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
>> index a8a2af6dfe9d..982c4be9a9c3 100644
>> --- a/arch/riscv/include/asm/asm.h
>> +++ b/arch/riscv/include/asm/asm.h
>> @@ -90,16 +90,24 @@
>>  #define PER_CPU_OFFSET_SHIFT 3
>>  #endif
>>  
>> -.macro asm_per_cpu dst sym tmp
>> -	REG_L \tmp, TASK_TI_CPU_NUM(tp)
>> -	slli  \tmp, \tmp, PER_CPU_OFFSET_SHIFT
>> +.macro asm_per_cpu_with_cpu dst sym tmp cpu
>> +	slli  \tmp, \cpu, PER_CPU_OFFSET_SHIFT
>>  	la    \dst, __per_cpu_offset
>>  	add   \dst, \dst, \tmp
>>  	REG_L \tmp, 0(\dst)
>>  	la    \dst, \sym
>>  	add   \dst, \dst, \tmp
>>  .endm
>> +
>> +.macro asm_per_cpu dst sym tmp
>> +	REG_L \tmp, TASK_TI_CPU_NUM(tp)
>> +	asm_per_cpu_with_cpu \dst \sym \tmp \tmp
>> +.endm
>>  #else /* CONFIG_SMP */
>> +.macro asm_per_cpu_with_cpu dst sym tmp cpu
>> +	la    \dst, \sym
>> +.endm
>> +
>>  .macro asm_per_cpu dst sym tmp
>>  	la    \dst, \sym
>>  .endm
>> diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
>> index 0e45db78b24b..62344daad73d 100644
>> --- a/arch/riscv/include/asm/scs.h
>> +++ b/arch/riscv/include/asm/scs.h
>> @@ -18,6 +18,11 @@
>>  	load_per_cpu gp, irq_shadow_call_stack_ptr, \tmp
>>  .endm
>>  
>> +/* Load the per-CPU IRQ shadow call stack to gp. */
>> +.macro scs_load_sse_stack reg_evt
>> +	REG_L gp, SSE_REG_EVT_SHADOW_STACK(\reg_evt)
>> +.endm
>> +
>>  /* Load task_scs_sp(current) to gp. */
>>  .macro scs_load_current
>>  	REG_L	gp, TASK_TI_SCS_SP(tp)
>> @@ -41,6 +46,8 @@
>>  .endm
>>  .macro scs_load_irq_stack tmp
>>  .endm
>> +.macro scs_load_sse_stack reg_evt
>> +.endm
>>  .macro scs_load_current
>>  .endm
>>  .macro scs_load_current_if_task_changed prev
>> diff --git a/arch/riscv/include/asm/sse.h b/arch/riscv/include/asm/sse.h
>> new file mode 100644
>> index 000000000000..aaddda77f5b6
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/sse.h
>> @@ -0,0 +1,45 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2024 Rivos Inc.
>> + */
>> +#ifndef __ASM_SSE_H
>> +#define __ASM_SSE_H
>> +
>> +#include <asm/sbi.h>
>> +
>> +#ifdef CONFIG_RISCV_SSE
>> +
>> +struct sse_event_interrupted_state {
>> +	unsigned long a6;
>> +	unsigned long a7;
>> +};
>> +
>> +struct sse_event_arch_data {
>> +	void *stack;
>> +	void *shadow_stack;
>> +	unsigned long tmp;
>> +	struct sse_event_interrupted_state interrupted;
>> +	unsigned long interrupted_state_phys;
> 
> Nit: My OCD would like _state added or removed.
> 
>> +	u32 evt_id;
>> +};
>> +
>> +static inline bool sse_event_is_global(u32 evt)
>> +{
>> +	return !!(evt & SBI_SSE_EVENT_GLOBAL);
>> +}
>> +
>> +struct sse_registered_event;
> 
> Hmm, this can be removed, no?
> 
>> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id,
>> +			int cpu);
>> +void arch_sse_free_event(struct sse_event_arch_data *arch_evt);
>> +int arch_sse_register_event(struct sse_event_arch_data *arch_evt);
>> +
>> +void sse_handle_event(struct sse_event_arch_data *arch_evt,
>> +		      struct pt_regs *regs);
>> +asmlinkage void handle_sse(void);
>> +asmlinkage void do_sse(struct sse_event_arch_data *arch_evt,
>> +				struct pt_regs *reg);
>> +
>> +#endif
>> +
>> +#endif
>> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
>> index 0e71eb82f920..cd1cead0c682 100644
>> --- a/arch/riscv/include/asm/switch_to.h
>> +++ b/arch/riscv/include/asm/switch_to.h
>> @@ -88,6 +88,19 @@ static inline void __switch_to_envcfg(struct task_struct *next)
>>  			:: "r" (next->thread.envcfg) : "memory");
>>  }
>>  
>> +#ifdef CONFIG_RISCV_SSE
>> +DECLARE_PER_CPU(struct task_struct *, __sse_entry_task);
>> +
>> +static inline void __switch_sse_entry_task(struct task_struct *next)
>> +{
>> +	__this_cpu_write(__sse_entry_task, next);
>> +}
>> +#else
>> +static inline void __switch_sse_entry_task(struct task_struct *next)
>> +{
>> +}
>> +#endif
>> +
>>  extern struct task_struct *__switch_to(struct task_struct *,
>>  				       struct task_struct *);
>>  
>> @@ -122,6 +135,7 @@ do {							\
>>  	if (switch_to_should_flush_icache(__next))	\
>>  		local_flush_icache_all();		\
>>  	__switch_to_envcfg(__next);			\
>> +	__switch_sse_entry_task(__next);			\
>>  	((last) = __switch_to(__prev, __next));		\
>>  } while (0)
>>  
>> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
>> index f5916a70879a..28e9805e61fc 100644
>> --- a/arch/riscv/include/asm/thread_info.h
>> +++ b/arch/riscv/include/asm/thread_info.h
>> @@ -36,6 +36,7 @@
>>  #define OVERFLOW_STACK_SIZE     SZ_4K
>>  
>>  #define IRQ_STACK_SIZE		THREAD_SIZE
>> +#define SSE_STACK_SIZE		THREAD_SIZE
> 
> Will these two ever be different? If not I'd just use the IRQ stack...
> 
>>  
>>  #ifndef __ASSEMBLY__
>>  
>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>> index f7480c9c6f8d..d347768d690d 100644
>> --- a/arch/riscv/kernel/Makefile
>> +++ b/arch/riscv/kernel/Makefile
>> @@ -99,6 +99,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
>>  obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
>>  obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
>>  obj-$(CONFIG_RISCV_SBI)		+= sbi.o sbi_ecall.o
>> +obj-$(CONFIG_RISCV_SSE)		+= sse.o sse_entry.o
>>  ifeq ($(CONFIG_RISCV_SBI), y)
>>  obj-$(CONFIG_SMP)		+= sbi-ipi.o
>>  obj-$(CONFIG_SMP) += cpu_ops_sbi.o
>> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
>> index 16490755304e..7b2d0480f772 100644
>> --- a/arch/riscv/kernel/asm-offsets.c
>> +++ b/arch/riscv/kernel/asm-offsets.c
>> @@ -14,6 +14,8 @@
>>  #include <asm/ptrace.h>
>>  #include <asm/cpu_ops_sbi.h>
>>  #include <asm/stacktrace.h>
>> +#include <asm/sbi.h>
>> +#include <asm/sse.h>
>>  #include <asm/suspend.h>
>>  
>>  void asm_offsets(void);
>> @@ -510,4 +512,14 @@ void asm_offsets(void)
>>  	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
>>  	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
>>  #endif
>> +
>> +#ifdef CONFIG_RISCV_SSE
>> +	OFFSET(SSE_REG_EVT_STACK, sse_event_arch_data, stack);
>> +	OFFSET(SSE_REG_EVT_SHADOW_STACK, sse_event_arch_data, shadow_stack);
>> +	OFFSET(SSE_REG_EVT_TMP, sse_event_arch_data, tmp);
>> +
>> +	DEFINE(SBI_EXT_SSE, SBI_EXT_SSE);
>> +	DEFINE(SBI_SSE_EVENT_COMPLETE, SBI_SSE_EVENT_COMPLETE);
>> +	DEFINE(NR_CPUS, NR_CPUS);
>> +#endif
>>  }
>> diff --git a/arch/riscv/kernel/sse.c b/arch/riscv/kernel/sse.c
>> new file mode 100644
>> index 000000000000..b59bda2c1f58
>> --- /dev/null
>> +++ b/arch/riscv/kernel/sse.c
>> @@ -0,0 +1,132 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (C) 2024 Rivos Inc.
>> + */
>> +#include <linux/nmi.h>
>> +#include <linux/scs.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/riscv_sse.h>
>> +#include <linux/percpu-defs.h>
>> +
>> +#include <asm/asm-prototypes.h>
>> +#include <asm/switch_to.h>
>> +#include <asm/irq_stack.h>
>> +#include <asm/sbi.h>
>> +#include <asm/sse.h>
>> +
>> +DEFINE_PER_CPU(struct task_struct *, __sse_entry_task);
>> +
>> +void __weak sse_handle_event(struct sse_event_arch_data *arch_evt, struct pt_regs *regs)
>> +{
>> +}
>> +
>> +void do_sse(struct sse_event_arch_data *arch_evt, struct pt_regs *regs)
>> +{
>> +	nmi_enter();
>> +
>> +	/* Retrieve missing GPRs from SBI */
>> +	sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, arch_evt->evt_id,
>> +		  SBI_SSE_ATTR_INTERRUPTED_A6,
>> +		  (SBI_SSE_ATTR_INTERRUPTED_A7 - SBI_SSE_ATTR_INTERRUPTED_A6) + 1,
>> +		  arch_evt->interrupted_state_phys, 0, 0);
>> +
>> +	memcpy(&regs->a6, &arch_evt->interrupted, sizeof(arch_evt->interrupted));
>> +
>> +	sse_handle_event(arch_evt, regs);
>> +
>> +	/*
>> +	 * The SSE delivery path does not uses the "standard" exception path and
>> +	 * thus does not process any pending signal/softirqs. Some drivers might
>> +	 * enqueue pending work that needs to be handled as soon as possible.
>> +	 * For that purpose, set the software interrupt pending bit which will
>> +	 * be serviced once interrupts are reenabled.
>> +	 */
>> +	if (!user_mode(regs) && !regs_irqs_disabled(regs))
>> +		csr_set(CSR_IP, IE_SIE);
> 
> I'm reading the comments, but still doesn't get it! If we're getting an
> NMI in the exception/interrupt path, you'd still get back to it, and the
> softirq would be handled.
> 
> Please elaborate a bit more why you'd need this!

When handling the SSE event, the SSE handling path won't process any
kernel softirqs when resuming to the SSE interrupted context. In order
to allow that (since the drivers using SSE currently needs it (PMU,
GHES), we set the software interrupt bit so that at some point in a the
future, we know an interrupt will be triggered and thus, the pending
softirqs will be handled when resuming to the IRQ interrupted state.

The check for user mode or interrupts enabled seems actually more
harmful than anything since the effect is that it will delay the
softirqs handling for such interrupted states.  I'll delete that check
as well, thus allowing the softirqs to always be handled as fast as
possible.

Does that makes it clearer ?

> 
>> +
>> +	nmi_exit();
>> +}
>> +
>> +#ifdef CONFIG_VMAP_STACK
>> +static unsigned long *sse_stack_alloc(unsigned int cpu, unsigned int size)
>> +{
>> +	return arch_alloc_vmap_stack(size, cpu_to_node(cpu));
>> +}
>> +
>> +static void sse_stack_free(unsigned long *stack)
>> +{
>> +	vfree(stack);
>> +}
>> +#else /* CONFIG_VMAP_STACK */
>> +
> 
> Nit: Please be consistent with the newlines. Pick one style. *NIT* ;-) 
> 
>> +static unsigned long *sse_stack_alloc(unsigned int cpu, unsigned int size)
>> +{
>> +	return kmalloc(size, GFP_KERNEL);
>> +}
>> +
>> +static void sse_stack_free(unsigned long *stack)
>> +{
>> +	kfree(stack);
>> +}
>> +
>> +#endif /* CONFIG_VMAP_STACK */
>> +
>> +static int sse_init_scs(int cpu, struct sse_event_arch_data *arch_evt)
>> +{
>> +	void *stack;
>> +
>> +	if (!scs_is_enabled())
>> +		return 0;
>> +
>> +	stack = scs_alloc(cpu_to_node(cpu));
>> +	if (!stack)
>> +		return -ENOMEM;
>> +
>> +	arch_evt->shadow_stack = stack;
>> +
>> +	return 0;
>> +}
>> +
>> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id, int cpu)
>> +{
>> +	void *stack;
>> +
>> +	arch_evt->evt_id = evt_id;
>> +	stack = sse_stack_alloc(cpu, SSE_STACK_SIZE);
>> +	if (!stack)
>> +		return -ENOMEM;
>> +
>> +	arch_evt->stack = stack + SSE_STACK_SIZE;
>> +
>> +	if (sse_init_scs(cpu, arch_evt)) {
>> +		sse_stack_free(arch_evt->stack - SSE_STACK_SIZE);
> 
> Wdyt about folding the pointer adjustment in the alloc/free functions?

Yeah, makes sense and the size argument of the stack alloc function
could be removed as well and folded in the alloc function.

Thanks,

Clément

> 
>> +		return -ENOMEM;
>> +	}
>> +
>> +	if (sse_event_is_global(evt_id)) {
>> +		arch_evt->interrupted_state_phys =
>> +					virt_to_phys(&arch_evt->interrupted);
>> +	} else {
>> +		arch_evt->interrupted_state_phys =
>> +				per_cpu_ptr_to_phys(&arch_evt->interrupted);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +void arch_sse_free_event(struct sse_event_arch_data *arch_evt)
>> +{
>> +	scs_free(arch_evt->shadow_stack);
>> +	sse_stack_free(arch_evt->stack - SSE_STACK_SIZE);
>> +}
>> +
>> +int arch_sse_register_event(struct sse_event_arch_data *arch_evt)
>> +{
>> +	struct sbiret sret;
>> +
>> +	sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_REGISTER, arch_evt->evt_id,
>> +			 (unsigned long) handle_sse, (unsigned long) arch_evt,
>> +			 0, 0, 0);
>> +
>> +	return sbi_err_map_linux_errno(sret.error);
>> +}
>> diff --git a/arch/riscv/kernel/sse_entry.S b/arch/riscv/kernel/sse_entry.S
>> new file mode 100644
>> index 000000000000..c860fc4f36c5
>> --- /dev/null
>> +++ b/arch/riscv/kernel/sse_entry.S
>> @@ -0,0 +1,169 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2024 Rivos Inc.
>> + */
>> +
>> +#include <linux/init.h>
>> +#include <linux/linkage.h>
>> +
>> +#include <asm/asm.h>
>> +#include <asm/csr.h>
>> +#include <asm/scs.h>
>> +
>> +/* When entering handle_sse, the following registers are set:
>> + * a6: contains the hartid
>> + * a7: contains struct sse_registered_event pointer
>> + */
>> +SYM_CODE_START(handle_sse)
>> +	/* Save stack temporarily */
>> +	REG_S sp, SSE_REG_EVT_TMP(a7)
>> +	/* Set entry stack */
>> +	REG_L sp, SSE_REG_EVT_STACK(a7)
>> +
>> +	addi sp, sp, -(PT_SIZE_ON_STACK)
>> +	REG_S ra, PT_RA(sp)
>> +	REG_S s0, PT_S0(sp)
>> +	REG_S s1, PT_S1(sp)
>> +	REG_S s2, PT_S2(sp)
>> +	REG_S s3, PT_S3(sp)
>> +	REG_S s4, PT_S4(sp)
>> +	REG_S s5, PT_S5(sp)
>> +	REG_S s6, PT_S6(sp)
>> +	REG_S s7, PT_S7(sp)
>> +	REG_S s8, PT_S8(sp)
>> +	REG_S s9, PT_S9(sp)
>> +	REG_S s10, PT_S10(sp)
>> +	REG_S s11, PT_S11(sp)
>> +	REG_S tp, PT_TP(sp)
>> +	REG_S t0, PT_T0(sp)
>> +	REG_S t1, PT_T1(sp)
>> +	REG_S t2, PT_T2(sp)
>> +	REG_S t3, PT_T3(sp)
>> +	REG_S t4, PT_T4(sp)
>> +	REG_S t5, PT_T5(sp)
>> +	REG_S t6, PT_T6(sp)
>> +	REG_S gp, PT_GP(sp)
>> +	REG_S a0, PT_A0(sp)
>> +	REG_S a1, PT_A1(sp)
>> +	REG_S a2, PT_A2(sp)
>> +	REG_S a3, PT_A3(sp)
>> +	REG_S a4, PT_A4(sp)
>> +	REG_S a5, PT_A5(sp)
>> +
>> +	/* Retrieve entry sp */
>> +	REG_L a4, SSE_REG_EVT_TMP(a7)
>> +	/* Save CSRs */
>> +	csrr a0, CSR_EPC
>> +	csrr a1, CSR_SSTATUS
>> +	csrr a2, CSR_STVAL
>> +	csrr a3, CSR_SCAUSE
>> +
>> +	REG_S a0, PT_EPC(sp)
>> +	REG_S a1, PT_STATUS(sp)
>> +	REG_S a2, PT_BADADDR(sp)
>> +	REG_S a3, PT_CAUSE(sp)
>> +	REG_S a4, PT_SP(sp)
>> +
>> +	/* Disable user memory access and floating/vector computing */
>> +	li t0, SR_SUM | SR_FS_VS
>> +	csrc CSR_STATUS, t0
>> +
>> +	load_global_pointer
>> +	scs_load_sse_stack a7
>> +
>> +	/* Restore current task struct from __sse_entry_task */
>> +	li t1, NR_CPUS
>> +	move t3, zero
> 
> Let's use mv, instead, given that this is a new shiny file!
> 
>> +
>> +#ifdef CONFIG_SMP
>> +	/* Find the CPU id associated to the hart id */
>> +	la t0, __cpuid_to_hartid_map
>> +.Lhart_id_loop:
>> +	REG_L t2, 0(t0)
>> +	beq t2, a6, .Lcpu_id_found
>> +
>> +	/* Increment pointer and CPU number */
>> +	addi t3, t3, 1
>> +	addi t0, t0, RISCV_SZPTR
>> +	bltu t3, t1, .Lhart_id_loop
>> +
>> +	/*
>> +	 * This should never happen since we expect the hart_id to match one
>> +	 * of our CPU, but better be safe than sorry
>> +	 */
>> +	la tp, init_task
>> +	la a0, sse_hart_id_panic_string
>> +	la t0, panic
>> +	jalr t0
>> +
>> +.Lcpu_id_found:
>> +#endif
>> +	asm_per_cpu_with_cpu t2 __sse_entry_task t1 t3
>> +	REG_L tp, 0(t2)
>> +
>> +	move a1, sp /* pt_regs on stack */
> 
> Dito.
> 
>> +
>> +	/*
>> +	 * Save sscratch for restoration since we might have interrupted the
>> +	 * kernel in early exception path and thus, we don't know the content of
>> +	 * sscratch.
>> +	 */
>> +	csrr s4, CSR_SSCRATCH
>> +	/* In-kernel scratch is 0 */
>> +	csrw CSR_SCRATCH, x0
>> +
>> +	move a0, a7
> 
> Dito.
> 
> 
> Cheers!
> Björn
> 
>> +
>> +	call do_sse
>> +
>> +	csrw CSR_SSCRATCH, s4
>> +
>> +	REG_L a0, PT_EPC(sp)
>> +	REG_L a1, PT_STATUS(sp)
>> +	REG_L a2, PT_BADADDR(sp)
>> +	REG_L a3, PT_CAUSE(sp)
>> +	csrw CSR_EPC, a0
>> +	csrw CSR_SSTATUS, a1
>> +	csrw CSR_STVAL, a2
>> +	csrw CSR_SCAUSE, a3
>> +
>> +	REG_L ra, PT_RA(sp)
>> +	REG_L s0, PT_S0(sp)
>> +	REG_L s1, PT_S1(sp)
>> +	REG_L s2, PT_S2(sp)
>> +	REG_L s3, PT_S3(sp)
>> +	REG_L s4, PT_S4(sp)
>> +	REG_L s5, PT_S5(sp)
>> +	REG_L s6, PT_S6(sp)
>> +	REG_L s7, PT_S7(sp)
>> +	REG_L s8, PT_S8(sp)
>> +	REG_L s9, PT_S9(sp)
>> +	REG_L s10, PT_S10(sp)
>> +	REG_L s11, PT_S11(sp)
>> +	REG_L tp, PT_TP(sp)
>> +	REG_L t0, PT_T0(sp)
>> +	REG_L t1, PT_T1(sp)
>> +	REG_L t2, PT_T2(sp)
>> +	REG_L t3, PT_T3(sp)
>> +	REG_L t4, PT_T4(sp)
>> +	REG_L t5, PT_T5(sp)
>> +	REG_L t6, PT_T6(sp)
>> +	REG_L gp, PT_GP(sp)
>> +	REG_L a0, PT_A0(sp)
>> +	REG_L a1, PT_A1(sp)
>> +	REG_L a2, PT_A2(sp)
>> +	REG_L a3, PT_A3(sp)
>> +	REG_L a4, PT_A4(sp)
>> +	REG_L a5, PT_A5(sp)
>> +
>> +	REG_L sp, PT_SP(sp)
>> +
>> +	li a7, SBI_EXT_SSE
>> +	li a6, SBI_SSE_EVENT_COMPLETE
>> +	ecall
>> +
>> +SYM_CODE_END(handle_sse)
>> +
>> +SYM_DATA_START_LOCAL(sse_hart_id_panic_string)
>> +    .ascii "Unable to match hart_id with cpu\0"
>> +SYM_DATA_END(sse_hart_id_panic_string)
>> -- 
>> 2.49.0
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

