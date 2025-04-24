Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A662701CC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486148; cv=none; b=qRhL/45dTXR8veUd5FMCvUmqK5ZVB+I+LvOKR6Ma4r8T5sDwE5P++vlNfn94+iOUDiM085SuN+OXzAzP5ihsKpOkjQ5kiFglyRIAZnSs8NXjHF4pJG+5l/xtLDAwQSr9APS808ilXeEq01gE8IDaDbYxgYgATJB5hJNs/p+x+d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486148; c=relaxed/simple;
	bh=lH0VXKxwdyA/RhxUDySD1zQV7bM9MOYr2viJyhlzkyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ciHlkvviokd37AXTwi4fqCLBmqQcJpq7zvE7aEkgMfp10eZxdpJT2g12dlKzwR0gKEIZmCrURh+jqebwUlw7kuPS0SMizFuMo2uaFQjurtGQCjw2twHPU7JYK0TC59cULT3qo7oTL8uUADZ+A7C0JZT5MiaxfA/qqAvJebH+cIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A76F1063;
	Thu, 24 Apr 2025 02:15:40 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64DDB3F66E;
	Thu, 24 Apr 2025 02:15:42 -0700 (PDT)
Message-ID: <fcbb5285-2d78-4181-8ee5-977382a36cde@arm.com>
Date: Thu, 24 Apr 2025 10:15:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/21] x86/resctrl: Add end-marker to the
 resctrl_event_id enum
To: "Luck, Tony" <tony.luck@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Reinette Chatre <reinette.chatre@intel.com>,
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
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-8-james.morse@arm.com> <Z_6rwLFSHqj_BUPq@agluck-desk3>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <Z_6rwLFSHqj_BUPq@agluck-desk3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tony,

On 15/04/2025 19:56, Luck, Tony wrote:
> On Fri, Apr 11, 2025 at 04:42:15PM +0000, James Morse wrote:
>> The resctrl_event_id enum gives names to the counter event numbers on x86.
>> These are used directly by resctrl.
>>
>> To allow the MPAM driver to keep an array of these the size of the enum
>> needs to be known.
>>
>> Add a 'num_events' define which can be used to size an array. This isn't
>> a member of the enum to avoid updating switch statements that would
>> otherwise be missing a case.
> 
> I'm adding more events in this series:
> 
> https://lore.kernel.org/all/20250407234032.241215-1-tony.luck@intel.com/
> 
> Any switches in existing code would need to have a "default:" case

Boo. I much prefer the no-default case as it forces someone adding a new enum entry
to inspect every switch statement. But I'll change it.


> added because the new events are in the same "enum" but totally
> unrelated to the existing events. Other code changes in that series
> deleted many of the switches anyway.

Cool!


> Patch 23 in that series changes QOS_NUM_EVENTS from a #define
> to the last element in the enum without any issues.

I'll do that here and add the defaults in this patch to reduce conflicts.


Thanks,

James
