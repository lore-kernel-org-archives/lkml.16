Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B0721E0BB
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597676; cv=none; b=USK67H+Iavm3yEsZDDk00x9wDvPYunDZiZzqxqj+v+t3wVjyhz10GT+yZl6E7VewmDkHZVL6hHIbrsTxpHCvmQX03BYxt/54PtREcktptOKO3Vcfq1wu6uqMiPHzuRMc3zCCW9/dsNAZe1o3eb3AYqNyBusgm75stqJGBjh5y2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597676; c=relaxed/simple;
	bh=qN296d2kc28YBwiP7NJmVYDN4EdglpN4dAqYkcuO0IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h+n/ME5FtaFBTGPUvpv6ivP+UrwpBfDZQ14EbuCDkFiXLLmfne7jxOGSKn83Z1f7djFRKA4JAFgbK/Wgd49vMlOqwpR9lHmTSA9JPbC9eLIltFxG2tlAit4dunljPvN9sN1oEp9vKOQbygLb3mPIY6flqEPFAWARHI2ufjvNrSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4b7ydw47t0z2CdW8;
	Fri, 30 May 2025 17:30:44 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 6EDB0140113;
	Fri, 30 May 2025 17:34:30 +0800 (CST)
Received: from [10.174.178.24] (10.174.178.24) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 17:34:29 +0800
Message-ID: <c94b97ea-4dd4-7575-2144-81e4272c8fee@huawei.com>
Date: Fri, 30 May 2025 17:34:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] fs/resctrl: Restore the missing rdt_last_cmd_clear()
Content-Language: en-US
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <bobo.shaobowang@huawei.com>, <linux-kernel@vger.kernel.org>,
	<Dave.Martin@arm.com>, <tony.luck@intel.com>, <xiaochen.shen@intel.com>,
	<bp@suse.de>, <fenghua.yu@intel.com>, <james.morse@arm.com>
References: <20250529113353.3275066-1-zengheng4@huawei.com>
 <44a4f211-6723-4fde-822c-d739fa2d603d@intel.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <44a4f211-6723-4fde-822c-d739fa2d603d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf100008.china.huawei.com (7.202.181.222)



On 2025/5/30 6:01, Reinette Chatre wrote:
> Hi Zeng Heng,
> 
> Thank you very much for catching this and providing a fix.
> 
> On 5/29/25 4:33 AM, Zeng Heng wrote:
>> The fixes tag patch resolves the lockdep warning. However, directly
>> removing rdt_last_cmd_clear() would leave the last_cmd_status interface
>> with stale logs, which does not conform to the functional definition before
>> the fix. Therefore, the rdt_last_cmd_clear() operation is performed after
>> successfully acquiring the rdtgroup_mutex.
> 
> I would like to suggest some rework to changelog to meet requirements from
> Documentation/process/maintainer-tip.rst. Specifically the rules about
> imperative tone and structure of the changelog. Below attempts to address
> those requirements but please feel free to rework after you considered the
> rules yourself:
> 
> 	A lockdep fix removed two rdt_last_cmd_clear() calls that were used
> 	to clear the last_cmd_status buffer but called without holding the
> 	required rdtgroup_mutex. The impacted resctrl commands are:
> 	writing to the cpus or cpus_list files and creating a new monitor
> 	or control group. With stale data in the last_cmd_status buffer the
> 	impacted resctrl commands report the stale error on success, or append
> 	its own failure message to the stale error on failure.
> 
> 	Restore the rdt_last_cmd_clear() calls after acquiring rdtgroup_mutex.

Thank you for the correction, I will review the requirements mentioned
in the documents above.

> 
>>
>> Fixes: c8eafe149530 ("x86/resctrl: Fix potential lockdep warning")
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>> ---
>>   fs/resctrl/rdtgroup.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index cc37f58b47dd..4aae9eb74215 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -536,6 +536,8 @@ static ssize_t rdtgroup_cpus_write(struct kernfs_open_file *of,
>>   		goto unlock;
>>   	}
>>   
>> +	rdt_last_cmd_clear();
>> +
>>   	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
>>   	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
>>   		ret = -EINVAL;
>> @@ -3481,6 +3483,8 @@ static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
>>   		goto out_unlock;
>>   	}
>>   
>> +	rdt_last_cmd_clear();
>> +
> 
> Could you please move this to be right after acquiring the mutex? I think clearing
> last_cmd_status at beginning of a resctrl command's work is a good pattern to follow.
> Thus a change like:

The patch will be corrected in version v2. Thank you again.

Best regards，
Zeng Heng
