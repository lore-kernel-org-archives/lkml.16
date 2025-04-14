Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8973C38
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622010; cv=none; b=OJK8QdXzNMj7VOxga7vGFfgBF/gz1LMXUWHFUKtaMwHvytvoKloDfEL8TiY6MfaIpf4wguuyDlYBfHDRPSLSm3IiAN7FO5xEsQpxGnPzY4e2wG/OBL8UQQrS4Z1+jfbeFqACIIE7k4Sl4/fYHTUnbNqcX6Ig9auaZ+ioZ+0I88M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622010; c=relaxed/simple;
	bh=y6mNHLrPhZ057ZpoO4lZDZX8I5SwD7dPWI4WftoahbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=T43CN8UlgDxOvwSP/+oQfvvIMz4sToeffBz/RHdHVLxHsOuW8T7fguGfDd48sCjFFmX44AhOzyxOtK1YDLB5IpZPn14lLYZdwZouk24TPrHZ5VzCt6C22XEkfZL32JMUns7crdcuCenrEtAaTSt3CAdgCxorT+pOnkWOitGyBkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZbhR32MCFz1j5vR;
	Mon, 14 Apr 2025 17:13:19 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id CEA761A016C;
	Mon, 14 Apr 2025 17:13:23 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 14 Apr 2025 17:13:21 +0800
Message-ID: <f090fcbf-5593-2e37-efc7-3ec14990ab27@huawei.com>
Date: Mon, 14 Apr 2025 17:13:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v6 0/8] arm64: entry: Convert to generic irq entry
Content-Language: en-US
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<luto@kernel.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <kees@kernel.org>, <aliceryhl@google.com>,
	<ojeda@kernel.org>, <samitolvanen@google.com>, <masahiroy@kernel.org>,
	<rppt@kernel.org>, <xur@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<mark.rutland@arm.com>, <puranjay@kernel.org>, <broonie@kernel.org>,
	<mbenes@suse.cz>, <sudeep.holla@arm.com>, <guohanjun@huawei.com>,
	<prarit@redhat.com>, <liuwei09@cestc.cn>, <Jonathan.Cameron@huawei.com>,
	<dwmw@amazon.co.uk>, <kristina.martsenko@arm.com>, <liaochang1@huawei.com>,
	<ptosi@google.com>, <thiago.bauermann@linaro.org>, <kevin.brodsky@arm.com>,
	<Dave.Martin@arm.com>, <joey.gouly@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <xen-devel@lists.xenproject.org>
References: <20250213130007.1418890-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20250213130007.1418890-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemg200008.china.huawei.com (7.202.181.35)



On 2025/2/13 20:59, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
> to use the generic entry infrastructure from kernel/entry/*. The generic
> entry makes maintainers' work easier and codes more elegant, which will
> make PREEMPT_DYNAMIC and PREEMPT_LAZY available and remove a lot of
> duplicate code.
> 
> This patch series split the generic entry into generic irq entry and
> generic syscall entry first, and then convert arm64 to use the generic
> irq entry. arm64 will be completely converted to generic entry in another
> patch series.
> 
> The main convert steps are as follows:
> - Split generic entry into generic irq entry and generic syscall to
>   make the single patch more concentrated in switching to one thing.
> - Make arm64 easier to use irqentry_enter/exit().
> - Make arm64 closer to the PREEMPT_DYNAMIC code of generic entry.
> - Switch to generic irq entry.

Gentle Ping.

> 
> Changes in v6:
> - Rebased on 6.14 rc2 next.
> - Put the syscall bits aside and split it out.
> - Have the split patch before the arm64 changes.
> - Merge some tightly coupled patches.
> - Adjust the order of some patches to make them more reasonable.
> - Define regs_irqs_disabled() by inline function.
> - Define interrupts_enabled() in terms of regs_irqs_disabled().
> - Delete the fast_interrupts_enabled() macro.
> - irqentry_state_t -> arm64_irqentry_state_t.
> - Remove arch_exit_to_user_mode_prepare() and pull local_daif_mask() later
>   in the arm64 exit sequence
> - Update the commit message.
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
> Jinjie Ruan (8):
>   entry: Split generic entry into generic exception and syscall entry
>   arm64: ptrace: Replace interrupts_enabled() with regs_irqs_disabled()
>   arm64: entry: Refactor the entry and exit for exceptions from EL1
>   arm64: entry: Rework arm64_preempt_schedule_irq()
>   arm64: entry: Use preempt_count() and need_resched() helper
>   arm64: entry: Refactor preempt_schedule_irq() check code
>   arm64: entry: Move arm64_preempt_schedule_irq() into
>     __exit_to_kernel_mode()
>   arm64: entry: Switch to generic IRQ entry
> 
>  MAINTAINERS                           |   1 +
>  arch/Kconfig                          |   9 +
>  arch/arm64/Kconfig                    |   1 +
>  arch/arm64/include/asm/daifflags.h    |   2 +-
>  arch/arm64/include/asm/entry-common.h |  56 ++++
>  arch/arm64/include/asm/preempt.h      |   2 -
>  arch/arm64/include/asm/ptrace.h       |  13 +-
>  arch/arm64/include/asm/xen/events.h   |   2 +-
>  arch/arm64/kernel/acpi.c              |   2 +-
>  arch/arm64/kernel/debug-monitors.c    |   2 +-
>  arch/arm64/kernel/entry-common.c      | 378 ++++++++-----------------
>  arch/arm64/kernel/sdei.c              |   2 +-
>  arch/arm64/kernel/signal.c            |   3 +-
>  include/linux/entry-common.h          | 382 +------------------------
>  include/linux/irq-entry-common.h      | 389 ++++++++++++++++++++++++++
>  kernel/entry/Makefile                 |   3 +-
>  kernel/entry/common.c                 | 176 ++----------
>  kernel/entry/syscall-common.c         | 159 +++++++++++
>  kernel/sched/core.c                   |   8 +-
>  19 files changed, 766 insertions(+), 824 deletions(-)
>  create mode 100644 arch/arm64/include/asm/entry-common.h
>  create mode 100644 include/linux/irq-entry-common.h
>  create mode 100644 kernel/entry/syscall-common.c
> 
