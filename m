Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA8928BAB6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514676; cv=none; b=de1+dvtjliZg6c/u0hiTZprSisB5tFH/Qyl2oBhYgsSgqYDT0zW5r5e3Tec9HIdiQdqA0scLD2YI+z6p2mdowdCZhOxIx4FH22StGs5Ch+R5loHvMD8fsMYVw3roysRtuOm+Feb8/wRLGMOZMX0tfW1fkLBBlklVV/NGRpyNLIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514676; c=relaxed/simple;
	bh=FbNZA7FZpI5LHnhD9TAvtGfikaCnjMnwaNQG29IxC2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K96RLlCJpi18XxWtPzTb2xm2wKeSN8y1S6C4OaRy7BeS1HEXb733qQZgtBpCMCL7HI+dxy/sWKnwvNOXS6AcLWswvY6bDJyitjgbq7XJgpdsYO83WQLfRcFUw/2HXQJ8FaFlABaLFWJtinwtf9L0UBIHEpC6hYYhZ6VLqftYgE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7919106F;
	Thu, 24 Apr 2025 10:11:08 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 151F53F66E;
	Thu, 24 Apr 2025 10:11:09 -0700 (PDT)
Message-ID: <a4285bef-c4f7-4679-87ab-788dd7fef661@arm.com>
Date: Thu, 24 Apr 2025 18:11:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/21] x86,fs/resctrl: Move the resctrl filesystem code
 to live in /fs/resctrl
To: Fenghua Yu <fenghuay@nvidia.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
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
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-18-james.morse@arm.com>
 <9dd487d7-9414-4aa6-be21-692dda655553@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <9dd487d7-9414-4aa6-be21-692dda655553@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Fenghua,

On 15/04/2025 01:27, Fenghua Yu wrote:
> On 4/11/25 09:42, James Morse wrote:
>> Resctrl is a filesystem interface to hardware that provides cache
>> allocation policy and bandwidth control for groups of tasks or CPUs.
>>
>> To support more than one architecture, resctrl needs to live in /fs/.
>>
>> Move the code that is concerned with the filesystem interface to
>> /fs/resctrl.

>> diff --git a/fs/resctrl/pseudo_lock_trace.h b/fs/resctrl/pseudo_lock_trace.h
>> index e69de29bb2d1..7a6a1983953a 100644
>> --- a/fs/resctrl/pseudo_lock_trace.h
>> +++ b/fs/resctrl/pseudo_lock_trace.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#undef TRACE_SYSTEM
>> +#define TRACE_SYSTEM resctrl
>> +
>> +#if !defined(_X86_RESCTRL_PSEUDO_LOCK_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
>> +#define _X86_RESCTRL_PSEUDO_LOCK_TRACE_H
>> +
>> +#include <linux/tracepoint.h>
>> +
>> +#endif /* _X86_RESCTRL_PSEUDO_LOCK_TRACE_H */
>> +
>> +#undef TRACE_INCLUDE_PATH
>> +#define TRACE_INCLUDE_PATH .
>> +
>> +#define TRACE_INCLUDE_FILE pseudo_lock_trace
>> +
>> +#include <trace/define_trace.h>

> If applying patch 1-17, building the kernel reports this error, which will cause bisect
> failure:
> 
>   CC      fs/resctrl/pseudo_lock.o
> In file included from fs/resctrl/pseudo_lock_trace.h:17,
>                  from fs/resctrl/pseudo_lock.c:35:
> ./include/trace/define_trace.h:110:42: fatal error: ./pseudo_lock_trace.h: No such file or
> directory
>   110 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
>       |                                          ^
> compilation terminated.
> make[4]: *** [scripts/Makefile.build:203: fs/resctrl/pseudo_lock.o] Error 1
> 
> Again combining patch 18 with this patch together makes the error go away.
> 
> But you said combining them together may cause the conversion python tool complex:
> https://lore.kernel.org/lkml/97aeaf87-b2db-4efb-9d81-43769c6f27b0@arm.com/
> 
> Is there a better way to resolve this error? Maybe update the tool not to generate or
> include fs/resctrl/pseudo_lock_trace.h at all?

Please see my previous description of this, also described in the cover letter:
| Patches X-Y should be squashed together when merged - they are posted like
| this to allow folk to re-generate patch N, then review the differences on
| op. Not squashing them together would expose a ftrace build warning
| during bisect. (but who does that!)
| That would look like this:
| git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v8_final

Amusingly, I forgot to fix 'X-Y', that should read as 17-21.

I can post that 'final' version with everything squashed together once patches 18-21 have
been reviewed - but doing that before makes it harder to review the deliberate changes
separately from the mechanical changes. This patch is just the mechanical changes.


Thanks,

James
