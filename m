Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783262853F3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514672; cv=none; b=dlo6LBb4pEql3xrZAzJYYzhHML4hbeaIo6Q5wK0bVM8VG98hfA/Eug2CnMR3vE6wJIkGD15so6YLk+vXf+JQXUFmDh3lzU93SCFjMpjsJysPCtxPXEqJt9ye0YZyzzpC1WBLjIbq++5OczvmxnxPR7S1MlxeUycd3OldrrKIUC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514672; c=relaxed/simple;
	bh=2Pjf7Ww9xM54M59pUDtS4/gQXy14QMURqqRjds4qe7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvjfIkz/DPrw27wIHJC6LTqNghXqh4LdFEsTtE2rQCyZr8Q2AeetfdfcYAR6REPhciCp+4375AZfmUV9yZ18/jhd7irFBgalbH2iclo9lZPkbtbTin8DHokbr3l7nP6s9HPYNiKL9KkajOLhBUiVYpscWt3X4kGzcWS8WTL1Nf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 906331063;
	Thu, 24 Apr 2025 10:11:04 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94A713F66E;
	Thu, 24 Apr 2025 10:11:05 -0700 (PDT)
Message-ID: <b1861568-ed29-418b-b2de-ed24498e54d6@arm.com>
Date: Thu, 24 Apr 2025 18:11:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 18/21] x86,fs/resctrl: Remove duplicated trace header
 files
To: Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-19-james.morse@arm.com>
 <373c32c1-3f8e-493a-989b-9250e939adf2@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <373c32c1-3f8e-493a-989b-9250e939adf2@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 16/04/2025 03:18, Reinette Chatre wrote:
> On 4/11/25 9:42 AM, James Morse wrote:
>> The copy-pasting python script harmlessly creates some empty trace
>> point header files. Remove them.

>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor_trace.h b/arch/x86/kernel/cpu/resctrl/monitor_trace.h
>> deleted file mode 100644
>> index b5a142dd0f0e..000000000000
>> --- a/arch/x86/kernel/cpu/resctrl/monitor_trace.h
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0 */
>> -#undef TRACE_SYSTEM
>> -#define TRACE_SYSTEM resctrl
>> -
>> -#if !defined(_FS_RESCTRL_MONITOR_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
>> -#define _FS_RESCTRL_MONITOR_TRACE_H
>> -
>> -#include <linux/tracepoint.h>
>> -
>> -#endif /* _FS_RESCTRL_MONITOR_TRACE_H */
>> -
>> -#undef TRACE_INCLUDE_PATH
>> -#define TRACE_INCLUDE_PATH .
>> -
>> -#define TRACE_INCLUDE_FILE monitor_trace
>> -
>> -#include <trace/define_trace.h>

> Should the "CFLAGS_monitor.o = -I$(src)" be removed from arch/x86/kernel/cpu/resctrl/Makefile
> as part of the above changes?

Yes! It took a while of staring at build errors to work out what those things were about...

I'll also fix the 'harmless' comment in the commit message with Fenghua's description of
the ftrace thing.


Thanks,

James
