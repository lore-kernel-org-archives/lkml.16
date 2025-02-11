Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADC81EEA38
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739274246; cv=none; b=aTns3EVe/sHy8WqJ4lgcZQHB9sp7/IOExDyI60ztD5UGXX9NkKU9Wzh2gUklEnx/lrW3KHVPChxHxstdGevz7F++zGyb6hmQeHA4GDxALQQUX0nG5mdjJEYclRNKBCbkqWukkbwxQugOyaMkN1WNyV2qmiUOf4PHVYx6RIo93zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739274246; c=relaxed/simple;
	bh=YCKM+UgvTxR13x8TG0MIV0MC3d0Smm9a/zTCnF3RNUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XemmIXykHXcq5kyjuU2RG0oZiPqmzILFs++2M8S0vJbIl9Pjo1utNbLoUQpw662UB30FaPcvehUuIhSe653QeDb+VYAq9W4onT5v5G7fMluS2Say1mIj4G+wgjjrkqyQOGeAmv0eEYoA37qkus2bhc0NJoiD1D4dppseC4XDI+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Ysfjx48WNz20qDJ;
	Tue, 11 Feb 2025 19:44:21 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id 52E87140153;
	Tue, 11 Feb 2025 19:43:52 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Feb 2025 19:43:50 +0800
Message-ID: <a715dd5d-f353-371c-f542-7430668f2e12@huawei.com>
Date: Tue, 11 Feb 2025 19:43:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v5 00/22] arm64: entry: Convert to generic entry
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<luto@kernel.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <kees@kernel.org>, <wad@chromium.org>,
	<akpm@linux-foundation.org>, <samitolvanen@google.com>,
	<masahiroy@kernel.org>, <hca@linux.ibm.com>, <aliceryhl@google.com>,
	<rppt@kernel.org>, <xur@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<mbenes@suse.cz>, <puranjay@kernel.org>, <pcc@google.com>, <ardb@kernel.org>,
	<sudeep.holla@arm.com>, <guohanjun@huawei.com>, <rafael@kernel.org>,
	<liuwei09@cestc.cn>, <dwmw@amazon.co.uk>, <Jonathan.Cameron@huawei.com>,
	<liaochang1@huawei.com>, <kristina.martsenko@arm.com>, <ptosi@google.com>,
	<broonie@kernel.org>, <thiago.bauermann@linaro.org>, <kevin.brodsky@arm.com>,
	<joey.gouly@arm.com>, <liuyuntao12@huawei.com>, <leobras@redhat.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xen-devel@lists.xenproject.org>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <c34ebe3f-b78a-1a17-0c6a-48d3874f8be9@huawei.com>
 <Z6nxWM8cnhd32yfW@J2N7QTR9R3>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <Z6nxWM8cnhd32yfW@J2N7QTR9R3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemg200008.china.huawei.com (7.202.181.35)



On 2025/2/10 20:30, Mark Rutland wrote:
> On Sat, Feb 08, 2025 at 09:15:08AM +0800, Jinjie Ruan wrote:
>> On 2024/12/6 18:17, Jinjie Ruan wrote:
>>> Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
>>> to use the generic entry infrastructure from kernel/entry/*. The generic
>>> entry makes maintainers' work easier and codes more elegant, which aslo
>>> removed a lot of duplicate code.
>>>
>>> The main steps are as follows:
>>> - Make arm64 easier to use irqentry_enter/exit().
>>> - Make arm64 closer to the PREEMPT_DYNAMIC code of generic entry.
>>> - Split generic entry into generic irq entry and generic syscall to
>>>   make the single patch more concentrated in switching to one thing.
>>> - Switch to generic irq entry.
>>> - Make arm64 closer to the generic syscall code.
>>> - Switch to generic entry completely.
>>>
>>> Changes in v5:
>>> - Not change arm32 and keep inerrupts_enabled() macro for gicv3 driver.
>>> - Move irqentry_state definition into arch/arm64/kernel/entry-common.c.
>>> - Avoid removing the __enter_from_*() and __exit_to_*() wrappers.
>>> - Update "irqentry_state_t ret/irq_state" to "state"
>>>   to keep it consistently.
>>> - Use generic irq entry header for PREEMPT_DYNAMIC after split
>>>   the generic entry.
>>> - Also refactor the ARM64 syscall code.
>>> - Introduce arch_ptrace_report_syscall_entry/exit(), instead of
>>>   arch_pre/post_report_syscall_entry/exit() to simplify code.
>>> - Make the syscall patches clear separation.
>>> - Update the commit message.
>>
>> Gentle Ping.
> 
> I've left soem comments.
> 
> As I mentioned previously, I'd very much prefer that we do the syscall
> entry logic changes *later* (i.e. as a follow-up patch series), after
> we've got the irq/exception entry logic sorted.
> 
> I reckon we've got just enough time to get the irq/exception entry
> changes ready this cycle, with another round or two of review. So can we
> please put the syscall bits aside for now? ... that and run all the
> tests you mention in patch 22 on the irq/exception entry changes alone.

Sure, it is ok to put the syscall bits aside and split it out .

> 
> Mark.
> 
> 
