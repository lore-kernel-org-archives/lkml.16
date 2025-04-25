Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1C825C700
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745596584; cv=none; b=PuBp/gSO9z7OkonPIDzI5JGqb8ws7nkIg0P2PP0jWyFq2JSW25qSqioM1vH5JXNyGp8AduKeXu50gXJttJF6t2XBhlbrzfZVaqxuksrXhyFevvFKmeVojlFNJ3LGvQbg6Vq/wwfKaa2QW6p+gfJ8e8ta1mN/2EwOx/cmerZ9tek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745596584; c=relaxed/simple;
	bh=ihBvz5aDubLbpbWy2LkhaRgHFCWr/hLl1e0ejNzEnY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCUiushVkISh9EmpxA5oFZx3kzFN2rB4M3xrJfwAm+r/c5OFOJ41NhLCyoi5WbTByXSDUZF9J/NdExfaL+lbJhdP3/Zq9JjyTfFbt4XQTwuTz2WjTM43+B0Kkc6i2jrg3QoRrq+PEWsihH5raB6lvHK5llRcxI5CEc8+7SkkK9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C33D4106F;
	Fri, 25 Apr 2025 08:56:16 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 331043F66E;
	Fri, 25 Apr 2025 08:56:19 -0700 (PDT)
Message-ID: <a86e72d1-1a1d-4348-9e2d-34b799571518@arm.com>
Date: Fri, 25 Apr 2025 16:56:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/21] x86/resctrl: Remove the limit on the number of
 CLOSID
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>,
 "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 Jamie Iles <quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "amitsinght@marvell.com" <amitsinght@marvell.com>,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-3-james.morse@arm.com>
 <OSZPR01MB879824B7EBE583C7EB4EA7128B842@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB879824B7EBE583C7EB4EA7128B842@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shaopeng Tan,

On 25/04/2025 03:56, Shaopeng Tan (Fujitsu) wrote:
>> From: Amit Singh Tomar <amitsinght@marvell.com>
>>
>> Resctrl allocates and finds free CLOSID values using the bits of a u32.
>> This restricts the number of control groups that can be created by user-space.
>>
>> MPAM has an architectural limit of 2^16 CLOSID values, Intel x86 could be
>> extended beyond 32 values. There is at least one MPAM platform which
>> supports more than 32 CLOSID values.
>>
>> Replace the fixed size bitmap with calls to the bitmap API to allocate an array of
>> a sufficient size.
>>
>> ffs() returns '1' for bit 0, hence the existing code subtracts 1 from the index to
>> get the CLOSID value. find_first_bit() returns the bit number which does not
>> need adjusting.

>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 776c8e347654..4e0308040c6e 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c

>> @@ -2765,20 +2775,22 @@ static int rdt_get_tree(struct fs_context *fc)
>>  		goto out_ctx;
>>  	}

> Not relevant to this patch, but some of the code around here needs improvement. Maybe consider fixing it together?

>        ret = schemata_list_create();
>        if (ret) {
> -              schemata_list_destroy();
> -              goto out_ctx;
> +             goto out_schemata_free;
>        }

Hmmm, that doesn't make a difference, but it does save a line. As I'm not changing that
code in this series, I don't want to touch it as part of this series. (its already getting
too big!)

It got written like that because list_create() doesn't do all the cleanup when it fails,
this makes it the odd one out..

If you think this version is better, please send a patch!


Thanks,

James
