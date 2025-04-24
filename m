Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35834289367
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514533; cv=none; b=OYUXzk/TlZ3GQP9XtkuWheCv7EqViJw12yriVZkukq6IjsM/DtgU/690VsGKaIsT4l8bH1WjTklF5ITQ6s49JLzTZY+uPqwBdA0syibIgOfpooLKAhwHkv2CldJv/Pu65YYekEvpN/iHiYNYykMz9OM+YWdvkwAMV6ODiJ7u8sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514533; c=relaxed/simple;
	bh=dRf+HTP9y8TK0Nxm2Hr4dr+R4aeeaSFpvCg/5qOZwh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYsHTpmGpAGob4XRspvTbphdQc9QRM5aR9FNcLMUqI7eYcMlDJ2zALSKr7d7bo8AiVWPRvyj+MyZ/c/irqRgVn5JdbwDB/0ambQgMd/Cbdq6TwH2GmOsU4EY68eufY1z5oxOxkUfNEG0VJYgKq5yt/r45xRYVKjdlI94xxcZrds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E1D81063;
	Thu, 24 Apr 2025 10:08:46 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53B5A3F66E;
	Thu, 24 Apr 2025 10:08:48 -0700 (PDT)
Message-ID: <629a1728-cdbe-466d-8057-ef308f9168c7@arm.com>
Date: Thu, 24 Apr 2025 18:08:46 +0100
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
 <f4ab6c75-f6ef-4504-9060-8ca9ab38b0aa@nvidia.com>
 <3404690d-f1cf-4838-aa1a-788a6210b72f@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <3404690d-f1cf-4838-aa1a-788a6210b72f@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Fenghua,

On 15/04/2025 00:21, Fenghua Yu wrote:
> This comment was buried in the middle of this huge patch.
> 
> To see my previous comment easily, I cut all other irrelevant code.

(please do this as a matter of course! Anyone who needs more context can look at the
previous message)

> On 4/11/25 17:18, Fenghua Yu wrote:
>> On 4/11/25 09:42, James Morse wrote:
>>> Resctrl is a filesystem interface to hardware that provides cache
>>> allocation policy and bandwidth control for groups of tasks or CPUs.
>>>
>>> To support more than one architecture, resctrl needs to live in /fs/.
>>>
>>> Move the code that is concerned with the filesystem interface to
>>> /fs/resctrl.

>>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/
>>> rdtgroup.c
>>> index 326b3048d728..c7a7f0ae373a 100644
>>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c 
> 
> [SNIP]
> 
>>> -static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
>>> -                 const char *name, umode_t mode,
>>> -                 enum rdt_group_type rtype, struct rdtgroup **r)
>>> -{
>>> -    struct rdtgroup *prdtgrp, *rdtgrp;
>>> -    unsigned long files = 0;
>>> -    struct kernfs_node *kn;
>>> -    int ret;
>>> -
>>> -    prdtgrp = rdtgroup_kn_lock_live(parent_kn);
>>> -    if (!prdtgrp) {
>>> -        ret = -ENODEV;
>>> -        goto out_unlock;
>>> -    }
>>> -
>>> -    /*
>>> -     * Check that the parent directory for a monitor group is a
>>> -     * "mon_groups" directory.

> The follow is my previous original comment on the merge conflict and the fix:
> 
>> Due to the slight difference between here and the upstream commit 45c2e30bbd64 ("x86/
>> resctrl: Fix rdtgroup_mkdir()'s unlocked use of kernfs_node::name"), merge conflicts.
>>
>> You may consider to add the following patch in patch #17 to fix the conflict?
>>
>>         /*
>> -        * Check that the parent directory for a monitor group is a "mon_groups"
>> -        * directory.
>> +        * Check that the parent directory for a monitor group is a
>> +        * "mon_groups" directory.
>>          */

This patch is generated by the python script that I previously posted - it will make these
changes when I rebase over the upstream'd version of patch 1.


Thanks,

James
