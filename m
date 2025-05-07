Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278AA28C2CB
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636497; cv=none; b=bTC9N3XHa/Druv1pPW4VUgHdNRxYVbwqE41yUtvOxpjD1GSyuO5Wd8vlTGbU3IYAEwP6nK7SBBZ+CwIgxl+pR9DBgVwdAV+y4Va7bxkGGlYpaG1YZdSoB8WEVNm7+Iu12ZQf9VaBBSweaRoc/oeuESdV61Ltf3Do1UytNT6NDfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636497; c=relaxed/simple;
	bh=9GkcMa1y+mhEUVclN/fj0VWYGn75LzkiJYMzjkOde+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=seMWa/G9/TAgjA6e89kTlJl4Wj4gqxOwUj72sDYlLxG7cQGZZblLkMtdeY2T7aESwN8gi8SKnvZHkbTZGRa27A7zaDxP05QG2skAfYNUPrlPOglQBS8RszBV7sFJf6hv+vIvs9nw4d1u7457LYJ5CL3cFhQwbQY/efKxpybjUbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D49F1CC4;
	Wed,  7 May 2025 09:48:05 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 377203F58B;
	Wed,  7 May 2025 09:48:10 -0700 (PDT)
Message-ID: <8e14da3a-7335-471f-aa4c-f871e67c9862@arm.com>
Date: Wed, 7 May 2025 17:48:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/27] x86/resctrl: Expand the width of domid by
 replacing mon_data_bits
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
 Tony Luck <tony.luck@intel.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-9-james.morse@arm.com>
 <ac19ac7e-e230-4310-9b70-b9d57ee4439e@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <ac19ac7e-e230-4310-9b70-b9d57ee4439e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 01/05/2025 18:04, Reinette Chatre wrote:
> On 4/25/25 10:37 AM, James Morse wrote:
>> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> index 0a0ac5f6112e..159972c3fe73 100644
>> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> @@ -667,7 +667,7 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>>  	u32 resid, evtid, domid;
> 
> I was expecting this to look differently after reading 
> https://lore.kernel.org/lkml/a9008c2d-e83d-4bc6-8197-0753666a7ec2@arm.com/

I changed the structure, but missed the usage here.


> I believe u32 was used for resid, evtid, and domid because of how they
> used to be initialized from the bitfield within the union. With the switch to
> a struct that now has the proper types these can also use proper types.
> 
> 	enum resctrl_res_level resid;
> 	enum resctrl_event_id evtid;
> 	int domid;
> 
> This highlights that the incorrect type propagated from rdtgroup_mondata_show()
> to mon_event_read() where its "int evtid" parameter should also be
> "enum resctrl_event_id evtid", which is a good complement to patch #14
> that fixes the type used by functions called by mon_event_read().

Fixed now.

[...]

>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index eccdfcb1a6f5..7ef5cf0c4d1d 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -45,6 +45,12 @@ LIST_HEAD(rdt_all_groups);

>> +/**
>> + * mon_get_kn_priv() - Get the mon_data priv data for this event.
>> + *
>> + * The same values are used across the mon_data directories of all control and
>> + * monitor groups for the same event in the same domain. Keep a list of
>> + * allocated structures and re-use an existing one with the same values for
>> + * @rid, @domid, etc.
>> + *
>> + * @rid:    The resource id for the event file being created.
>> + * @domid:  The domain id for the event file being created.
>> + * @mevt:   The type of event file being created.
>> + * @do_sum: Whether SNC summing monitors are being created.
>> + */
>> +static struct mon_data *mon_get_kn_priv(int rid, int domid,
> 
> "int rid" -> "enum resctrl_res_level rid"

Fixed.


Thanks,

James
