Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3259F2701CC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486124; cv=none; b=XLKTIc9dARhVxYyHLVzOIUHaK9MdvW7iLRBZF18OGQ/TRQccGsR9i5N0f0etlOYlthLv3vjEgtzxoQ4XNxIB6zgsz1ijgtrg/rS3o55G0LanJe0fxGK+3OR1XjiwaJt0fxQxSYtlJHEynTlvWfc1YgLTgxA6/DZfC42/aQqECGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486124; c=relaxed/simple;
	bh=Jrfga0n+DIwSYFtPo/KzGVOxGL6d9C0zVE201GuiIjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZnqzRngaLXUKvCxS4Lg2tpgOjuGkk5VeO3XmNEsE34lq7qy8/K9A5b/4mFSZBr0DUDOrl7RzhrU8fCyX+Hi5+X2014NPaaYPZZAeb4tX5odcds/LeKugCtctmasB45+fWXLoJr9v5mB1NPQIydqPicEF8LM+RYF4KTXsMEbJEwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 977AD1063;
	Thu, 24 Apr 2025 02:15:17 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D27EE3F66E;
	Thu, 24 Apr 2025 02:15:18 -0700 (PDT)
Message-ID: <dfb42daf-74ac-461f-bc56-f1d9ec805e9d@arm.com>
Date: Thu, 24 Apr 2025 10:15:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/21] x86/resctrl: resctrl_exit() teardown resctrl but
 leave the mount point
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
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-5-james.morse@arm.com>
 <81a54d21-40af-438e-8139-322597a7506e@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <81a54d21-40af-438e-8139-322597a7506e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 16/04/2025 01:25, Reinette Chatre wrote:
> On 4/11/25 9:42 AM, James Morse wrote:
>> resctrl_exit() was intended for use when the 'resctrl' module was unloaded.
>> resctrl can't be built as a module, and the kernfs helpers are not exported
>> so this is unlikely to change. MPAM has an error interrupt which indicates
>> the MPAM driver has gone haywire. Should this occur tasks could run with
>> the wrong control values, leading to bad performance for important tasks.
>> In this scenario the MPAM driver will reset the hardware, but it needs
>> a way to tell resctrl that no further configuration should be attempted.
>>
>> In particular, moving tasks between control or monitor groups does not
>> interact with the architecture code, so there is no opportunity for the
>> arch code to indicate that the hardware is no-longer functioning.
>>
>> Using resctrl_exit() for this leaves the system in a funny state as
>> resctrl is still mounted, but cannot be un-mounted because the sysfs
>> directory that is typically used has been removed. Dave Martin suggests
>> this may cause systemd trouble in the future as not all filesystems
>> can be unmounted.
>>
>> Add calls to remove all the files and directories in resctrl, and
>> remove the sysfs_remove_mount_point() call that leaves the system
>> in a funny state. When triggered, this causes all the resctrl files
>> to disappear. resctrl can be unmounted, but not mounted again.


> The caveat here is that resctrl pretends to be mounted (resctrl_mounted == true)
> but there is nothing there. The undocumented part of this is that for this
> to work resctrl fs depends (a lot) on the architecture's callbacks to know
> if they are being called after a resctrl_exit() call so that they return data
> that will direct resctrl fs behavior to safest exit for those
> resctrl fs flows that are still possible after a resctrl_exit(). Not ideal
> layering.

It was the arch code that called resctrl_exit() - there is no other path into it.
I don't think its a problem for the arch code to also know to return an error.
I haven't found anything where which error is returned actually matter - so there
is no 'direction', only errors.

I agree the documentation can be improved.


> I understand from a previous comment [1] that one of the Arm "tricks" is to
> offline all domains. This seems to be a good "catch all" to ensure that at least
> current flows of concern are not running anymore.

Yup, that is necessary to stop the limbo and overflow workers for trying to read the
counters - which is a waste of time.


> Considering this,
> what if there is a new resctrl_error_exit() that does something like below?
> 
> 	void resctrl_error_exit(void)
> 	{
> 		mutex_lock(&rdtgroup_mutex);
> 		WARN_ON_ONCE(resctrl_new_function_returns_true_if_any_resource_has_a_control_or_monitor_domain());
> 		resctrl_fs_teardown();
> 		mutex_unlock(&rdtgroup_mutex);
> 		resctrl_exit();
> 	}

Makes sense - the alternative would be to dig around to cancel the limbo/overflow
work, and a subsequent CPU-online might start them again.

> I do not see this as requiring anything new from architecture but instead
> making what Arm already does a requirement and keeping existing behavior?

I agree.


> This leaves proc_resctrl_show() that relies on resctrl_mounted but as I see
> the resctrl_fs_cleanup() will remove all resource groups that should result
> in the output being as it will be if resctrl is not mounted. No dependence
> on architecture callbacks returning resctrl_exit() aware data here.

Great - I'd missed that one,


>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index fdf2616c7ca0..3f9c37637d7e 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c

>> @@ -4416,11 +4429,26 @@ int __init resctrl_init(void)
>>  	return ret;
>>  }
>>  
>> +/**
>> + * resctrl_exit() - Remove the resctrl filesystem and free resources.
>> + *
>> + * Called by the architecture code in response to a fatal error.
>> + * Resctrl files and structures are removed from kernfs to prevent further
>> + * configuration.
> 
> Please write with imperative tone. For example, "Remove resctrl files and structures ..."
> 
>> + */
>>  void __exit resctrl_exit(void)
>>  {
>> +	mutex_lock(&rdtgroup_mutex);
>> +	resctrl_fs_teardown();
>> +	mutex_unlock(&rdtgroup_mutex);
>> +
>>  	debugfs_remove_recursive(debugfs_resctrl);
> 
> Is it possible for the fatal error handling to trigger multiple calls here?
> To protect against multiple calls causing issues debugfs_resctrl can be set to NULL here.

It's not, the driver keeps track of whether resctrl_init() had been called, and only calls
resctrl_exit() once. But I agree it would be better to make it robust to this.


>>  	unregister_filesystem(&rdt_fs_type);
> 
> unregister_filesystem() seems to handle an already-unregistered filesystem.
> 
>> -	sysfs_remove_mount_point(fs_kobj, "resctrl");
>> +
>> +	/*
>> +	 * The sysfs mount point added by resctrl_init() is not removed so that
>> +	 * it can be used to umount resctrl.
>> +	 */
> 
> (needs imperative)
> 
>>  
>>  	resctrl_mon_resource_exit();
>>  }


Thanks,

James
