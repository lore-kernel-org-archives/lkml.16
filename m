Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E6620D509
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745493344; cv=none; b=s8A6VkifpJc9ucJt+Pp4Z2076O+67Obfel+X+fEZA/cwZ/N2OY9KB4dwhNPzkcm1hFJnqGPY1jkFwV60iry/iDO7jSw5AOQf8PxVTkHqOtb5lQFsnUzWp5yi3hpnmtyRcAkDb1RO/7k32Y0ovPw1n7FlxOnqGRylf4RNxm26w7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745493344; c=relaxed/simple;
	bh=Jl1oeMziLY0u5/EJ9v3+j0f+if9NVh82NSWVbKKa/hE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D65CfiTtaLSFwmio7t9j+YFIY1kKMkssTc23mD6PKZDAQ2jhAHVKTeN/LtmaDh5OBegmuiv3hpBx2nNRvJolTgAtHF36BEJ1pJgbDe4oqPdR8mOw6kWmc9lb9qaPgqR7zZRECjg105T3tTFbPMqStg0mGJF7NsOeN6Cf0tHovns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E98C1063;
	Thu, 24 Apr 2025 04:15:35 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37C843F59E;
	Thu, 24 Apr 2025 04:15:36 -0700 (PDT)
Message-ID: <a9008c2d-e83d-4bc6-8197-0753666a7ec2@arm.com>
Date: Thu, 24 Apr 2025 12:15:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/21] x86/resctrl: Expand the width of dom_id by
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
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-9-james.morse@arm.com>
 <26402d7f-3da8-4e6d-8503-04e7161e6a5d@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <26402d7f-3da8-4e6d-8503-04e7161e6a5d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 16/04/2025 01:34, Reinette Chatre wrote:
> There is no occurence of "dom_id" in patch other than subject.

Fixed.


> On 4/11/25 9:42 AM, James Morse wrote:
>> MPAM platforms retrieve the cache-id property from the ACPI PPTT table.
>> The cache-id field is 32 bits wide. Under resctrl, the cache-id becomes
>> the domain-id, and is packed into the mon_data_bits union bitfield.
>> The width of cache-id in this field is 14 bits.
>>
>> Expanding the union would break 32bit x86 platforms as this union is
>> stored as the kernfs kn->priv pointer. This saved allocating memory
>> for the priv data storage.
>>
>> The firmware on MPAM platforms have used the PPTT cache-id field to
>> expose the interconnect's id for the cache, which is sparse and uses
>> more than 14 bits. Use of this id is to enable PCIe direct cache
>> injection hints. Using this feature with VFIO means the value provided
>> by the ACPI table should be exposed to user-space.
>>
>> To support cache-id values greater than 14 bits, convert the
>> mon_data_bits union to a structure. These are shared between control
>> and monitor groups, and are allocated on first use. The list of
>> allocated struct mon_data is free'd when the filesystem is umount()ed.

>> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> index 0a0ac5f6112e..159972c3fe73 100644
>> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> @@ -676,17 +676,22 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>>  		goto out;
>>  	}
>>  
>> -	md.priv = of->kn->priv;
>> -	resid = md.u.rid;
>> -	domid = md.u.domid;
>> -	evtid = md.u.evtid;
>> +	md = of->kn->priv;
>> +	if (WARN_ON_ONCE(!md)) {
>> +		ret = -EIO;
>> +		goto out;
>> +	}
>> +
>> +	resid = md->rid;
>> +	domid = md->domid;
>> +	evtid = md->evtid;
> 
> What is not visible in this hunk is the types of these variables, which is:
> 	u32 resid, evtid, domid;
> 
> These types support the previously used bitfields well but now that the
> data is provided via a struct it should be possible to use appropriate
> types and avoid this unnecessary switch between types (more below).

Sure, I left them alone as they were already mismatched...


>>  	r = resctrl_arch_get_resource(resid);
>>  
>> -	if (md.u.sum) {
>> +	if (md->sum) {
>>  		/*
>>  		 * This file requires summing across all domains that share
>>  		 * the L3 cache id that was provided in the "domid" field of the
>> -		 * mon_data_bits union. Search all domains in the resource for
>> +		 * struct mon_data. Search all domains in the resource for
>>  		 * one that matches this cache id.
>>  		 */
>>  		list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index 36a862a4832f..d932dd1eaa74 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -103,27 +103,26 @@ struct mon_evt {
>>  };
>>  
>>  /**
>> - * union mon_data_bits - Monitoring details for each event file.
>> - * @priv:              Used to store monitoring event data in @u
>> - *                     as kernfs private data.
>> - * @u.rid:             Resource id associated with the event file.
>> - * @u.evtid:           Event id associated with the event file.
>> - * @u.sum:             Set when event must be summed across multiple
>> - *                     domains.
>> - * @u.domid:           When @u.sum is zero this is the domain to which
>> - *                     the event file belongs. When @sum is one this
>> - *                     is the id of the L3 cache that all domains to be
>> - *                     summed share.
>> - * @u:                 Name of the bit fields struct.
>> + * struct mon_data - Monitoring details for each event file.
>> + * @list:            Member of list of all allocated structures.

> To help readers this can mention the name of the list. Can simply be
> 	@list:          Entry in @listname.

Sure,
| Member of the global @mon_data_kn_priv_list list.

I was curious how kernel-doc would resolves references like that - turns out its just
formatting.


>> + * @rid:             Resource id associated with the event file.
>> + * @evtid:           Event id associated with the event file.
>> + * @sum:             Set when event must be summed across multiple
>> + *                   domains.
>> + * @domid:           When @sum is zero this is the domain to which
>> + *                   the event file belongs. When @sum is one this
>> + *                   is the id of the L3 cache that all domains to be
>> + *                   summed share.
>> + *
>> + * Stored in the kernfs kn->priv field, readers and writers must hold
>> + * rdtgroup_mutex.
> 
> "Stored in the kernfs kn->priv field" can be made more specific with, for example,
> "Pointed to by kernfs kn->priv field of monitoring event file"

Sure,


>>   */
>> -union mon_data_bits {
>> -	void *priv;
>> -	struct {
>> -		unsigned int rid		: 10;
>> -		enum resctrl_event_id evtid	: 7;
>> -		unsigned int sum		: 1;
>> -		unsigned int domid		: 14;
>> -	} u;
>> +struct mon_data {
>> +	struct list_head list;
>> +	unsigned int rid;
>> +	enum resctrl_event_id evtid;
>> +	unsigned int sum;
>> +	unsigned int domid;
>>  };
> 
> The usage of the unsigned int was in support for the bitfield, but now
> the most appropriate types can be used instead? rid can be int, or even enum
> resctrl_res_level, domid can be int, and sum can be bool.

Yup. This was just left as is as its the existing behaviour.


> Also, every struct in this file follows the custom as documented in
> maintainer-tip.rst: "Struct declarations should align the struct member
> names in a tabular fashion". This struct should follow custom.

Fixed.


>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index c69ed978aa50..aa0bc57e1c7f 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -45,6 +45,12 @@ LIST_HEAD(rdt_all_groups);
>>  /* list of entries for the schemata file */
>>  LIST_HEAD(resctrl_schema_all);
>>  
>> +/*
>> + * List of struct mon_data 'priv' structures for rdtgroup_mondata_show().
> 
> "struct mon_data 'priv' structures" seems redundant use of struct/structures?

Heh, this is because I go back and add 'struct' before structure names as a second pass.


> How about:
> "List of struct mon_data containing private data of event files for use by rdtgroup_mondata_show()."

Done!


>> + * Protected by rdtgroup_mutex.
>> + */
>> +static LIST_HEAD(kn_priv_list);
> 
> Considering all the different "kn" involved in resctrl I find this name
> very generic for a global variable. I am not sure if something like
> "mon_data_kn_priv_list" would be considered too long? Open to recommendations.

Its suitably descriptive and doesn't cause a line length problems. Done.


>> +
>>  /* The filesystem can only be mounted once. */
>>  bool resctrl_mounted;
>>  
>> @@ -3089,6 +3095,62 @@ static void rmdir_all_sub(void)
>>  	kernfs_remove(kn_mondata);
>>  }
>>  
>> +/**
>> + * mon_get_kn_priv() - Get the mon_data priv data for this event.
>> + *
>> + * The same values are used in multiple directories. Keep a list
> 
> "The same values are used in multiple directories." is vague.
> How about "The same values are used across the mon_data directories
> of all control and monitor groups." Please feel free to improve.

I've tacked "for the same event in the same domain" on the end, otherwise
it reads like there is a single set of values.


>> + * of allocated structures and re-use an existing one with the same
>> + * list of values for rid, domain, etc.
> 
> "list of values" -> "values"?

Fixed,


> Also, if using "rid", which is parameter name, why use "domain" instead
> of "domid"? If using parameter names the kernel-doc "@" can be used
> for highlighting.

Done,


> With the many usages of "event type being created" below the above description
> will be helpful if it could define what is meant with an "event type".

I'll change these to 'event file', which at least matches the earlier comments.


>> + *
>> + * @rid:    The resource id for the event type being created.
>> + * @domid:  The domain id for the event type being created.
>> + * @mevt:   The event type being created.
>> + * @do_sum: Whether SNC summing monitors are being created.
>> + */
>> +static struct mon_data *mon_get_kn_priv(int rid, int domid,
>> +					struct mon_evt *mevt,
>> +					bool do_sum)


Thanks,

James
