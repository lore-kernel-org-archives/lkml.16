Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA03C288C8B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514688; cv=none; b=Kz7dBON9MeorB7pFeF7MwpPLUwiT8zdy/qY6WZY9g5fNcxL4+tHHsjPDG4IrBn+ZTFj86bmi7hHEeRuKLiC1V22bQNqCG75ZTL8ZzTlUqE+E6zjIYA9i7sWsjr1Ctdy4ieEYPJqu6f3aA9tt18pvriqzLWNBCfYs8/nTwDwJrzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514688; c=relaxed/simple;
	bh=hJMQbm2yAcHDyIbwlE69fTXMXUCRV6H/ns1KHQiv0DM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5qFTXwDPTQmaxEQV/pJr9dLX/M/6ZMpLuNCgLwczGNkHVVFlp9fG6xOQb/8PLZRtxHevehJ9HPKkkW1yBKQGKmA4GVPxqmo0Yaq/c4NL7SktK6EJvk8I44wuT5tENATjSS59WmfkmNxTalPThsGX16y/nGfOgbPJCrfFv7K3t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D0D71063;
	Thu, 24 Apr 2025 10:11:20 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2039C3F66E;
	Thu, 24 Apr 2025 10:11:22 -0700 (PDT)
Message-ID: <69dac182-1141-40fb-922a-c1fb63c628fe@arm.com>
Date: Thu, 24 Apr 2025 18:11:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 18/21] x86,fs/resctrl: Remove duplicated trace header
 files
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
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-19-james.morse@arm.com>
 <fd59c2fa-1259-4eb0-b0fb-96b823027dc8@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <fd59c2fa-1259-4eb0-b0fb-96b823027dc8@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Fenghua,

On 22/04/2025 15:23, Fenghua Yu wrote:
> On 4/11/25 09:42, James Morse wrote:
>> The copy-pasting python script harmlessly creates some empty trace
>> point header files. Remove them.

>> diff --git a/fs/resctrl/pseudo_lock_trace.h b/fs/resctrl/pseudo_lock_trace.h
>> deleted file mode 100644
>> index 7a6a1983953a..000000000000
>> --- a/fs/resctrl/pseudo_lock_trace.h
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0 */
>> -#undef TRACE_SYSTEM
>> -#define TRACE_SYSTEM resctrl
>> -
>> -#if !defined(_X86_RESCTRL_PSEUDO_LOCK_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
>> -#define _X86_RESCTRL_PSEUDO_LOCK_TRACE_H
>> -
>> -#include <linux/tracepoint.h>
>> -
>> -#endif /* _X86_RESCTRL_PSEUDO_LOCK_TRACE_H */
>> -
>> -#undef TRACE_INCLUDE_PATH
>> -#define TRACE_INCLUDE_PATH .
>> -
>> -#define TRACE_INCLUDE_FILE pseudo_lock_trace
>> -
>> -#include <trace/define_trace.h>

> Will patches 18-21 be merged into patch 17 eventually before they are pushed into upstream?

Up to the maintainers - but that is the plan I describe in the cover letter.
The history of those patches isn't interesting - but they do need to be broken out to be
reviewed.


Thanks,

James
