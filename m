Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC23828C00F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636502; cv=none; b=dvHz4boI84xE9ZAyWe6tDH5PhvGy+ye/kHL/n0uAvZ1+vOYzfLJE0Nvy8t+dvOeoIrObmgaanlovTryLOy2EfoXXp7YdI/ZumXNHdH2VyeOzLW5BgHRbiTrOct3Jx2UIRGHtBH0VeVKU4z9VsqNFJU6bVIOwNUKn3a9bCy0+qPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636502; c=relaxed/simple;
	bh=rOvohfCENtENAB4/EA3oOL7IXo000SwuoSaLxrFVLxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qO8jssLNX0jIc1RZRMKQHcDrdsKOSwEUEQ4PommBjUrtVQ2uugvZpnjWF121py/D/+pN2+mXBZFueK0m7vXo9KQQx7vegM4nBGKgkdm0MS8SIdxNSDbMvHtbxGy5iXSZVZU6bD4x73IlNvOa/VrKbWm1jRj5vTwAGJ1YskjF/kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 256562008;
	Wed,  7 May 2025 09:48:10 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 002C63F58B;
	Wed,  7 May 2025 09:48:15 -0700 (PDT)
Message-ID: <5d5e01a7-db25-4175-b1ae-0635660e44e7@arm.com>
Date: Wed, 7 May 2025 17:48:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/27] x86/resctrl: Move enum resctrl_event_id to
 resctrl.h
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
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-14-james.morse@arm.com>
 <269c7175-3226-468b-86fb-6f37da684307@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <269c7175-3226-468b-86fb-6f37da684307@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 01/05/2025 18:19, Reinette Chatre wrote:
> On 4/25/25 10:37 AM, James Morse wrote:
>> A previous patch moved enum resctrl_event_id into a smaller header file,
> 
> We have had trouble using "previous patch" and "next patch" in changelogs
> because of how patches may be re-organized after merge and backports and such.

I glossed over this because it was the distant past!

> Considering this I'd propose something like (please feel free to improve):
> 
>   resctrl_types.h contains common types and constants to enable architectures
>   to use these types in their definitions within asm/resctrl.h.
>   
>   enum resctrl_event_id was placed in resctrl_types.h for
>   resctrl_arch_get_cdp_enabled() and resctrl_arch_set_cdp_enabled(), but
>   these two functions are no longer inlined by any architecture.
> 
>   Move enum resctrl_event_id to resctrl.h.

I've taken this as it is.


> With "previous patch" addressed:
> | Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>


Thanks!

James
