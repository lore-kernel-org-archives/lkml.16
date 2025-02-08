Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B25A55
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 01:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738977324; cv=none; b=KkDowEje1u26PhTz5fufr7UnCVDRThFhX1WOkLEMw33NcUu2K69z54meuc4p8CxAjiS2TpwXhCvpD7+V/y5XyqeElmWWhjVcWw5E0Qss0fwk1Yix4Ewp3L6MUCuzflxWDB3rBVmtrnk9Ab1aZdgUUDOclVlZfl9s489v2yJTbZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738977324; c=relaxed/simple;
	bh=X0h+aaCVWOrryt4aw4oh5HDnXFVpo5IpFhZbBgmrV+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oreRH5xTxtqU1NYAiom13pdOnb9+sZ/qJVnEteZR7NHd9h35uzd0Qz4wJtC4tFCcQUce4acMJD7wKuHIVjkaQfIxA7Kh9GuLIt0cb834baCDc/ttMGxJ2YmEmjc1GqmFSnTf8HPUEzqIv07cpEGVYpGxBeskLiLhepbMcaERI6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YqXvw3Mjhz20q27;
	Sat,  8 Feb 2025 09:15:40 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id DFB99180043;
	Sat,  8 Feb 2025 09:15:11 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 8 Feb 2025 09:15:10 +0800
Message-ID: <c34ebe3f-b78a-1a17-0c6a-48d3874f8be9@huawei.com>
Date: Sat, 8 Feb 2025 09:15:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v5 00/22] arm64: entry: Convert to generic entry
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<luto@kernel.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <kees@kernel.org>, <wad@chromium.org>,
	<akpm@linux-foundation.org>, <samitolvanen@google.com>,
	<masahiroy@kernel.org>, <hca@linux.ibm.com>, <aliceryhl@google.com>,
	<rppt@kernel.org>, <xur@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<mbenes@suse.cz>, <puranjay@kernel.org>, <mark.rutland@arm.com>,
	<pcc@google.com>, <ardb@kernel.org>, <sudeep.holla@arm.com>,
	<guohanjun@huawei.com>, <rafael@kernel.org>, <liuwei09@cestc.cn>,
	<dwmw@amazon.co.uk>, <Jonathan.Cameron@huawei.com>, <liaochang1@huawei.com>,
	<kristina.martsenko@arm.com>, <ptosi@google.com>, <broonie@kernel.org>,
	<thiago.bauermann@linaro.org>, <kevin.brodsky@arm.com>, <joey.gouly@arm.com>,
	<liuyuntao12@huawei.com>, <leobras@redhat.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xen-devel@lists.xenproject.org>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20241206101744.4161990-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200008.china.huawei.com (7.202.181.35)



On 2024/12/6 18:17, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
> to use the generic entry infrastructure from kernel/entry/*. The generic
> entry makes maintainers' work easier and codes more elegant, which aslo
> removed a lot of duplicate code.
> 
> The main steps are as follows:
> - Make arm64 easier to use irqentry_enter/exit().
> - Make arm64 closer to the PREEMPT_DYNAMIC code of generic entry.
> - Split generic entry into generic irq entry and generic syscall to
>   make the single patch more concentrated in switching to one thing.
> - Switch to generic irq entry.
> - Make arm64 closer to the generic syscall code.
> - Switch to generic entry completely.
> 
> Changes in v5:
> - Not change arm32 and keep inerrupts_enabled() macro for gicv3 driver.
> - Move irqentry_state definition into arch/arm64/kernel/entry-common.c.
> - Avoid removing the __enter_from_*() and __exit_to_*() wrappers.
> - Update "irqentry_state_t ret/irq_state" to "state"
>   to keep it consistently.
> - Use generic irq entry header for PREEMPT_DYNAMIC after split
>   the generic entry.
> - Also refactor the ARM64 syscall code.
> - Introduce arch_ptrace_report_syscall_entry/exit(), instead of
>   arch_pre/post_report_syscall_entry/exit() to simplify code.
> - Make the syscall patches clear separation.
> - Update the commit message.

Gentle Ping.

> 
> Changes in v4:
> - Rework/cleanup split into a few patches as Mark suggested.
> - Replace interrupts_enabled() macro with regs_irqs_disabled(), instead
>   of left it here.
> - Remove rcu and lockdep state in pt_regs by using temporary
>   irqentry_state_t as Mark suggested.
> - Remove some unnecessary intermediate functions to make it clear.
> - Rework preempt irq and PREEMPT_DYNAMIC code
>   to make the switch more clear.
> - arch_prepare_*_entry/exit() -> arch_pre_*_entry/exit().
> - Expand the arch functions comment.
> - Make arch functions closer to its caller.
> - Declare saved_reg in for block.
> - Remove arch_exit_to_kernel_mode_prepare(), arch_enter_from_kernel_mode().
> - Adjust "Add few arch functions to use generic entry" patch to be
>   the penultimate.
> - Update the commit message.
> - Add suggested-by.
> 
> Changes in v3:
> - Test the MTE test cases.
> - Handle forget_syscall() in arch_post_report_syscall_entry()
> - Make the arch funcs not use __weak as Thomas suggested, so move
>   the arch funcs to entry-common.h, and make arch_forget_syscall() folded
>   in arch_post_report_syscall_entry() as suggested.
> - Move report_single_step() to thread_info.h for arm64
> - Change __always_inline() to inline, add inline for the other arch funcs.
> - Remove unused signal.h for entry-common.h.
> - Add Suggested-by.
> - Update the commit message.
> 
> Changes in v2:
> - Add tested-by.
> - Fix a bug that not call arch_post_report_syscall_entry() in
>   syscall_trace_enter() if ptrace_report_syscall_entry() return not zero.
> - Refactor report_syscall().
> - Add comment for arch_prepare_report_syscall_exit().
> - Adjust entry-common.h header file inclusion to alphabetical order.
> - Update the commit message.
> 
> Jinjie Ruan (22):
>   arm64: ptrace: Replace interrupts_enabled() with regs_irqs_disabled()
>   arm64: entry: Refactor the entry and exit for exceptions from EL1
>   arm64: entry: Move arm64_preempt_schedule_irq() into
>     __exit_to_kernel_mode()
>   arm64: entry: Rework arm64_preempt_schedule_irq()
>   arm64: entry: Use preempt_count() and need_resched() helper
>   arm64: entry: Expand the need_irq_preemption() macro ahead
>   arm64: entry: preempt_schedule_irq() only if PREEMPTION enabled
>   arm64: entry: Use different helpers to check resched for
>     PREEMPT_DYNAMIC
>   entry: Split generic entry into irq and syscall
>   entry: Add arch_irqentry_exit_need_resched() for arm64
>   arm64: entry: Switch to generic IRQ entry
>   arm64/ptrace: Split report_syscall() function
>   arm64/ptrace: Refactor syscall_trace_enter()
>   arm64/ptrace: Refactor syscall_trace_exit()
>   arm64/ptrace: Refator el0_svc_common()
>   entry: Make syscall_exit_to_user_mode_prepare() not static
>   arm64/ptrace: Return early for ptrace_report_syscall_entry() error
>   arm64/ptrace: Expand secure_computing() in place
>   arm64/ptrace: Use syscall_get_arguments() heleper
>   entry: Add arch_ptrace_report_syscall_entry/exit()
>   entry: Add has_syscall_work() helepr
>   arm64: entry: Convert to generic entry
> 
>  MAINTAINERS                           |   1 +
>  arch/Kconfig                          |   8 +
>  arch/arm64/Kconfig                    |   1 +
>  arch/arm64/include/asm/daifflags.h    |   2 +-
>  arch/arm64/include/asm/entry-common.h | 134 +++++++++
>  arch/arm64/include/asm/preempt.h      |   2 -
>  arch/arm64/include/asm/ptrace.h       |  11 +-
>  arch/arm64/include/asm/syscall.h      |   6 +-
>  arch/arm64/include/asm/thread_info.h  |  23 +-
>  arch/arm64/include/asm/xen/events.h   |   2 +-
>  arch/arm64/kernel/acpi.c              |   2 +-
>  arch/arm64/kernel/debug-monitors.c    |   9 +-
>  arch/arm64/kernel/entry-common.c      | 377 ++++++++-----------------
>  arch/arm64/kernel/ptrace.c            |  90 ------
>  arch/arm64/kernel/sdei.c              |   2 +-
>  arch/arm64/kernel/signal.c            |   3 +-
>  arch/arm64/kernel/syscall.c           |  31 +-
>  include/linux/entry-common.h          | 384 +------------------------
>  include/linux/irq-entry-common.h      | 389 ++++++++++++++++++++++++++
>  kernel/entry/Makefile                 |   3 +-
>  kernel/entry/common.c                 | 176 ++----------
>  kernel/entry/syscall-common.c         | 198 +++++++++++++
>  kernel/sched/core.c                   |   8 +-
>  23 files changed, 909 insertions(+), 953 deletions(-)
>  create mode 100644 arch/arm64/include/asm/entry-common.h
>  create mode 100644 include/linux/irq-entry-common.h
>  create mode 100644 kernel/entry/syscall-common.c
> 
