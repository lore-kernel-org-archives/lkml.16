Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C874F23ED56
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943047; cv=none; b=JNcysxIvO7xEV6qYtVVooanA/HeM45mlX8MwWGig4LTr8zU/Lztm5NLTD1OkGebU26Afqfd8rRer87DEdXQWWzdh1ar54wf29d3tB4NS/etsl/2+Ccp1DpKcn+1TrOZEk/DZpfDG8Eg1rNiukSFfSB9en4mRWxTvBj2lKcykDRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943047; c=relaxed/simple;
	bh=Ba2G0NIqA7lMC1ql4gfYuF13yoOPA2fjN4qtRUxWmdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WA53EgTY8uAcqpJcGSQpB9v/07FQ3DPm/DpwOJMRInMmZcEfJ3GnNGFeJLXWWIAGnon5e+eVPukdyLnBPMVZ9emNXLW5CDLbraj0rqVUGkag5OekfVKFAZsLjTu9Ouy6+8QCFR5ywdS/rY8gvasoyuIejyEfazHKOT0GW1hZg1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEFBC1E7D;
	Fri,  7 Feb 2025 07:44:27 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A67DA3F58B;
	Fri,  7 Feb 2025 07:44:01 -0800 (PST)
Message-ID: <f4bd5866-ba8d-46de-a073-2ad44ac8306e@arm.com>
Date: Fri, 7 Feb 2025 15:44:00 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/40] x86/resctrl: Rewrite and move the
 for_each_*_rdt_resource() walkers
To: Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 H Peter Anvin <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20241004180347.19985-1-james.morse@arm.com>
 <20241004180347.19985-18-james.morse@arm.com>
 <441b7021-a423-4689-8330-c6675c4ece60@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <441b7021-a423-4689-8330-c6675c4ece60@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 23/10/2024 22:51, Reinette Chatre wrote:
> On 10/4/24 11:03 AM, James Morse wrote:
>> The for_each_*_rdt_resource() helpers walk the architecture's array
>> of structures, using the resctrl visible part as an iterator. These
>> became over-complex when the structures were split into a
>> filesystem and architecture-specific struct. This approach avoided
>> the need to touch every call site, and was done before there was a
>> helper to retrieve a resource by rid.
>>
>> Once the filesystem parts of resctrl are moved to /fs/, both the
>> architecture's resource array, and the definition of those structures
>> is no longer accessible. To support resctrl, each architecture would
>> have to provide equally complex macros.
>>
>> Rewrite the macro to make use of resctrl_arch_get_resource(), and
>> move these to the core header so existing x86 arch code continues
>> to use them.
> 
> The last part is not clear, why does it need to be moved to core
> header for x86 to use it?

If it moves to fs/resctrl/internal.h, this works for the filesystem code, but not x86.
If stays in arch/x86/kernel/cpu/resctrl/internal.h, then the existing filesystem users break.

Moving it to include/linux/resctrl.h means both filesystem and arch code can include it.
I'll add the header file path to the commit message.


>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 8894aed3c593..f75f0409ae09 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -26,6 +26,24 @@ int proc_resctrl_show(struct seq_file *m,
>>  /* max value for struct rdt_domain's mbps_val */
>>  #define MBA_MAX_MBPS   U32_MAX
>>  
>> +/* Walk all possible resources, with variants for only controls or monitors. */
>> +#define for_each_rdt_resource(_r)						\
>> +	for ((_r) = resctrl_arch_get_resource(0);				\
>> +	     (_r)->rid < RDT_NUM_RESOURCES - 1;					\

> I do not think this reaches all resources ... should this perhaps be:
> 	(_r) && (_r)->rid < RDT_NUM_RESOURCES

Good catch - I wrongly assumed I was off-by-one when this blew up because the increment is
executed before this expression, and the existing 'RDT_NUM_RESOURCES - 1' reinforced that.
Adding the "(_r) &&" was the correct fix.


Thanks!

James
