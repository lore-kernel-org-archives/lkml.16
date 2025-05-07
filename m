Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1CE19AD5C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636492; cv=none; b=eSGhZv+umwPq4CMuR9A2oCqR6ZlWA3F45s9z6T14SUre/xwHQKf8Fejk4BaiAbGc3cLtt2oA88eyuDdsR1exALEkSEzKOW4IYwxulBZTHn12M5vgnubCc0CzhcXaXTN99d6Vvszo3rdFHHXYYN5l9GEAAe6AaWVm/uBQinZ9Z28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636492; c=relaxed/simple;
	bh=LS8TmSOg3Gs2T4+wkm7KOtnzj+KPoFKvmIzZI/C6wmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W++RxZ7bc2jZPt5nB91jNsT+XbkWsMyWk8li4Cp6j+3uUDj43k22OKgnca/Gg+0MCahv8RZ+4ww1evPalhne096ubfjy5dIS/P2AE5tf3r25Kd4hsebmfn+Ysal8cLNcMK2YaZ2ycV6rRzs6fIwQnDwNtruCvjBJTSb8TCd6n78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A548816F2;
	Wed,  7 May 2025 09:47:59 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9136F3F58B;
	Wed,  7 May 2025 09:48:04 -0700 (PDT)
Message-ID: <37db00d7-6839-447c-914f-31d2f4d8737d@arm.com>
Date: Wed, 7 May 2025 17:48:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/27] x86/resctrl: resctrl_exit() teardown resctrl but
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
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-5-james.morse@arm.com>
 <669c32d0-384a-4224-87db-f8af551fd6d3@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <669c32d0-384a-4224-87db-f8af551fd6d3@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 01/05/2025 18:03, Reinette Chatre wrote:
> On 4/25/25 10:37 AM, James Morse wrote:
>> @@ -4432,23 +4445,42 @@ static bool __exit resctrl_online_domains_exist(void)
>>  	return false;
>>  }
>>  
>> -/*
>> +/**

> Why make the switch to kernel-doc now? The benefit is not clear considering
> resctrl_init() is not using kernel-doc.

Just the ratcheting of 'add a comment' eventually leading to 'put it in kernel-doc'
once the comment becomes sufficiently long.


>>   * resctrl_exit() - Remove the resctrl filesystem and free resources.
>>   *
>> + * Called by the architecture code in response to a fatal error.
>> + * Removes resctrl files and structures from kernfs to prevent further
>> + * configuration.
>> + *
>>   * When called by the architecture code, all CPUs and resctrl domains must be
>>   * offline. This ensures the limbo and overflow handlers are not scheduled to
>>   * run, meaning the data structures they access can be freed by
>>   * resctrl_mon_resource_exit().
>> + *
>> + * After this function has returned, the architecture code should return an

> nit: "After this function has returned," -> "After resctrl_exit() returns, "

Sure,

> "should return an" -> "should return an error"?

Fixed, thanks!


>> + * from all resctrl_arch_ functions that can do this.
>> + * resctrl_arch_get_resource() must continue to return struct rdt_resources
>> + * with the correct rid field to ensure the filesystem can be unmounted.

> Is this to get through set_mba_sc() and the for_each_alloc_capable_rdt_resource(r)
> loop in rdt_kill_sb() or is there something more subtle?

The for_each walkers, which may also get used by the arch code. I don't have an example of
where this would go wrong, but felt it was worth noting that resctrl_arch_get_resource()
should not return NULL for all possible resources in this case - resctrl doesn't expect
that for any entry in the enum. Adding that error handling was too noisy, given that today
x86 has all the resources.

Tony suggested that get changed to searching a list if the list of possible resources
starts to grow.


>>   */
>>  void __exit resctrl_exit(void)
>>  {
>>  	cpus_read_lock();
>>  	WARN_ON_ONCE(resctrl_online_domains_exist());
>> +
>> +	mutex_lock(&rdtgroup_mutex);
>> +	resctrl_fs_teardown();
>> +	mutex_unlock(&rdtgroup_mutex);
>> +
>>  	cpus_read_unlock();
>>  
>>  	debugfs_remove_recursive(debugfs_resctrl);
>> +	debugfs_resctrl = NULL;
>>  	unregister_filesystem(&rdt_fs_type);
>> -	sysfs_remove_mount_point(fs_kobj, "resctrl");
>> +
>> +	/*
>> +	 * Do not remove the sysfs mount point added by resctrl_init() so that
>> +	 * it can be used to umount resctrl.
>> +	 */
>>  
>>  	resctrl_mon_resource_exit();
>>  }
> 
> Looks good to me.


Thanks!

James
