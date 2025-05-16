Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6823139E
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747393233; cv=none; b=SAc4aQgY8u1THc3V8ooYgiGUxuq1aibjV2aaJNE4jJPEqoSHY03roAVs+qTNiSJZNnxYLWE67pdwS6JBuk9Xe0GotaeK/xpTEhi889LYIetWot3xecataIcmE9f8nTMQSh7lL5uZcprgmLCoitDSIHemOUO2gB7qX7C3M31B4xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747393233; c=relaxed/simple;
	bh=Ky29sSNq9fx28wAmiFrqeelNGYzAF3eM3H47dZL9oxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvRW0jWSRVp9HGSxt1MS83sjPSEAC/mz3FYrkqXwErNXOZM3Zhy03q3ikja0lilkAS3z/aXEoT3TTeoCYjYmMZ4iQMjjIRXDDgC6eyg5+wLJpKkWxHODNJLMIFYLoHeFsHtpW1LOxbRQPhQ3uuKxcFneoecsKOPDr0Rgi3OZ08g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EPOROwWM; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="EPOROwWM"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G5uf0q009624;
	Fri, 16 May 2025 11:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=t933GD
	6bfKbN0Yx5jvfdm/CiQh9Ah1ntbP2oJWa8tuo=; b=EPOROwWMJfRg4vKPcBza1U
	R4Z/QGDIVLaCbeYLqJysbbabKEfikaTqMmEDM/Vhdk6CFkX1FpSPGAROhlvMqXxc
	rUceNWyUXHFc/aBFmc8eJWrYpWqFED6OL9IZeVlAfzcKlMnwpEwFfuIkvOcnhBVd
	WbkwKdo17Yhz9IQMk0cXNw0CSlL3OqMOhUiA5HEKNVtN9BbS96E5nmyH8Bvv3TIN
	kC3HZ27xn7PWI+RTeEozGd8SVCL3lQq8u/V7+Fstb4S8wVM4FqeMMtp4OyswpZof
	bGPLMyuA4YjP3sUVznvLjpv4onUWI1t0ubGADK5nI1q/1xIu9cAUKtOVC4cF0n5Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46nny7bhjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:00:12 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54GAwlL6025410;
	Fri, 16 May 2025 11:00:11 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46nny7bhjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:00:11 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54GAF9U8021459;
	Fri, 16 May 2025 11:00:11 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfry5bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:00:11 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54GB0ASI19530444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 11:00:10 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D55E58056;
	Fri, 16 May 2025 11:00:10 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FEA65805A;
	Fri, 16 May 2025 11:00:05 +0000 (GMT)
Received: from [9.109.245.113] (unknown [9.109.245.113])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 May 2025 11:00:05 +0000 (GMT)
Message-ID: <bc6d0f03-bedb-4afe-ab4b-b63c2eadea1a@linux.ibm.com>
Date: Fri, 16 May 2025 16:30:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] driver/base: Optimize memory block registration to
 reduce boot time
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Zi Yan <ziy@nvidia.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
 <56cb2494-56ba-4895-9dd1-23243c2eecdb@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <56cb2494-56ba-4895-9dd1-23243c2eecdb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7zVFZCfKJpEp08E7WL-vUJ64UTyJdxVr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwMCBTYWx0ZWRfX9/grniVhS/He 1hwM5Iw4f1QpfctAaAzLVNkbiJNNQJzUDUhNXlsJr9ea7Q5ny2xpkCQeQpqK6uJIlRRgb7+Az45 BCGIFGKBF9Os4d9D4HWBN1GiNrJqtgv8y+lzcOnWNhGPKwMqlAoAIURYtAEHwCBsRULqU8FVMBi
 5vWTgaBtS3LBnZ+6+da/J6NPU0Dx0gzrvea34UitfpBNsT4Q+U287BCGX+s66VBt4qC+iQq5el/ aLuQQr+Em4X33yR4pMB4P4aeFqogtUA3oEKKHxNjP93fQrp71V6OoChHJ6esxVCvv1tA9KBfHNM MHWvc2CxFxE5slzYk06vqA2YvnOolCHwBM7rWbr+710SNvjXaygbX+niAtK9LRmDLV571K7sQ0N
 HWetmWytdkm4+0Kx4McqI2cojDWmPHkbmXWbnAWpqCk4T2on4fN83S1z4uRN3Zc/Krs/8c9h
X-Proofpoint-GUID: 9hf4-WfxqQWSchL9cszP0kyaJsP0VCSd
X-Authority-Analysis: v=2.4 cv=CfwI5Krl c=1 sm=1 tr=0 ts=68271abc cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8
 a=Q7DgAMeZpv6U4eSGxUkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160100


On 5/16/25 2:45 PM, David Hildenbrand wrote:
> On 16.05.25 10:19, Donet Tom wrote:
>> During node device initialization, `memory blocks` are registered under
>> each NUMA node. The `memory blocks` to be registered are identified 
>> using
>> the node’s start and end PFNs, which are obtained from the node's 
>> pg_data
>>
>> However, not all PFNs within this range necessarily belong to the same
>> node—some may belong to other nodes. Additionally, due to the
>> discontiguous nature of physical memory, certain sections within a
>> `memory block` may be absent.
>>
>> As a result, `memory blocks` that fall between a node’s start and end
>> PFNs may span across multiple nodes, and some sections within those 
>> blocks
>> may be missing. `Memory blocks` have a fixed size, which is architecture
>> dependent.
>>
>> Due to these considerations, the memory block registration is currently
>> performed as follows:
>>
>> for_each_online_node(nid):
>>      start_pfn = pgdat->node_start_pfn;
>>      end_pfn = pgdat->node_start_pfn + node_spanned_pages;
>>      for_each_memory_block_between(PFN_PHYS(start_pfn), 
>> PFN_PHYS(end_pfn))
>>          mem_blk = memory_block_id(pfn_to_section_nr(pfn));
>> pfn_mb_start=section_nr_to_pfn(mem_blk->start_section_nr)
>>          pfn_mb_end = pfn_start + memory_block_pfns - 1
>>          for (pfn = pfn_mb_start; pfn < pfn_mb_end; pfn++):
>>              if (get_nid_for_pfn(pfn) != nid):
>>                  continue;
>>              else
>>                  do_register_memory_block_under_node(nid, mem_blk,
>> MEMINIT_EARLY);
>>
>> Here, we derive the start and end PFNs from the node's pg_data, then
>> determine the memory blocks that may belong to the node. For each
>> `memory block` in this range, we inspect all PFNs it contains and check
>> their associated NUMA node ID. If a PFN within the block matches the
>> current node, the memory block is registered under that node.
>>
>> If CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, get_nid_for_pfn() 
>> performs
>> a binary search in the `memblock regions` to determine the NUMA node ID
>> for a given PFN. If it is not enabled, the node ID is retrieved directly
>> from the struct page.
>>
>> On large systems, this process can become time-consuming, especially 
>> since
>> we iterate over each `memory block` and all PFNs within it until a 
>> match is
>> found. When CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, the additional
>> overhead of the binary search increases the execution time 
>> significantly,
>> potentially leading to soft lockups during boot.
>>
>> In this patch, we iterate over `memblock region` to identify the
>> `memory blocks` that belong to the current NUMA node. `memblock regions`
>> are contiguous memory ranges, each associated with a single NUMA 
>> node, and
>> they do not span across multiple nodes.
>>
>> for_each_online_node(nid):
>>    for_each_memory_region(r): // r => region
>>      if (r->nid != nid):
>>        continue;
>>      else
>>        for_each_memory_block_between(r->base, r->base + r->size - 1):
>>          do_register_memory_block_under_node(nid, mem_blk, 
>> MEMINIT_EARLY);
>>
>> We iterate over all `memblock regions` and identify those that belong to
>> the current NUMA node. For each `memblock region` associated with the
>> current node, we calculate the start and end `memory blocks` based on 
>> the
>> region's start and end PFNs. We then register all `memory blocks` within
>> that range under the current node.
>>
>> Test Results on My system with 32TB RAM
>> =======================================
>> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
>>
>> Without this patch
>> ------------------
>> Startup finished in 1min 16.528s (kernel)
>>
>> With this patch
>> ---------------
>> Startup finished in 17.236s (kernel) - 78% Improvement
>>
>> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
>>
>> Without this patch
>> ------------------
>> Startup finished in 28.320s (kernel)
>>
>> With this patch
>> ---------------
>> Startup finished in 15.621s (kernel) - 46% Improvement
>>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Acked-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>>
>> ---
>> v3 -> v4
>>
>> Addressed Mike's comment by making node_dev_init() call 
>> __register_one_node().
>>
>> V3 - 
>> https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
>> v2 - 
>> https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
>> v1 - 
>> https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
>> ---
>>   drivers/base/memory.c  |  4 ++--
>>   drivers/base/node.c    | 41 ++++++++++++++++++++++++++++++++++++++++-
>>   include/linux/memory.h |  2 ++
>>   include/linux/node.h   |  3 +++
>>   4 files changed, 47 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>> index 19469e7f88c2..7f1d266ae593 100644
>> --- a/drivers/base/memory.c
>> +++ b/drivers/base/memory.c
>> @@ -60,7 +60,7 @@ static inline unsigned long 
>> pfn_to_block_id(unsigned long pfn)
>>       return memory_block_id(pfn_to_section_nr(pfn));
>>   }
>>   -static inline unsigned long phys_to_block_id(unsigned long phys)
>> +unsigned long phys_to_block_id(unsigned long phys)
>>   {
>>       return pfn_to_block_id(PFN_DOWN(phys));
>>   }
>
>
> I was wondering whether we should move all these helpers into a 
> header, and export sections_per_block instead. Probably doesn't really 
> matter for your use case.


So, memory_block_id(), pfn_to_block_id(), and phys_to_block_id() should 
be moved to memory.h, right?

I will do it and send the next version.


>
>> @@ -632,7 +632,7 @@ int __weak arch_get_memory_phys_device(unsigned 
>> long start_pfn)
>>    *
>>    * Called under device_hotplug_lock.
>>    */
>> -static struct memory_block *find_memory_block_by_id(unsigned long 
>> block_id)
>> +struct memory_block *find_memory_block_by_id(unsigned long block_id)
>>   {
>>       struct memory_block *mem;
>>   diff --git a/drivers/base/node.c b/drivers/base/node.c
>> index cd13ef287011..f8cafd8c8fb1 100644
>> --- a/drivers/base/node.c
>> +++ b/drivers/base/node.c
>> @@ -20,6 +20,7 @@
>>   #include <linux/pm_runtime.h>
>>   #include <linux/swap.h>
>>   #include <linux/slab.h>
>> +#include <linux/memblock.h>
>>     static const struct bus_type node_subsys = {
>>       .name = "node",
>> @@ -850,6 +851,43 @@ void unregister_memory_block_under_nodes(struct 
>> memory_block *mem_blk)
>> kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
>>   }
>>   +/*
>> + * register_memory_blocks_under_node_early : Register the memory
>> + *          blocks under the current node.
>> + * @nid : Current node under registration
>> + *
>> + * This function iterates over all memblock regions and identifies 
>> the regions
>> + * that belong to the current node. For each region which belongs to 
>> current
>> + * node, it calculates the start and end memory blocks based on the 
>> region's
>> + * start and end PFNs. It then registers all memory blocks within 
>> that range
>> + * under the current node.
>> + */
>> +static void register_memory_blocks_under_node_early(int nid)
>> +{
>> +    struct memblock_region *r;
>> +
>> +    for_each_mem_region(r) {
>> +        if (r->nid != nid)
>> +            continue;
>> +
>> +        const unsigned long start_block_id = phys_to_block_id(r->base);
>> +        const unsigned long end_block_id = phys_to_block_id(r->base 
>> + r->size - 1);
>> +        unsigned long block_id;
>
> This should definitely be above the if().
>
Sure, I will change it.

>
>> +
>> +        for (block_id = start_block_id; block_id <= end_block_id; 
>> block_id++) {
>> +            struct memory_block *mem;
>> +
>> +            mem = find_memory_block_by_id(block_id);
>> +            if (!mem)
>> +                continue;
>> +
>> +            do_register_memory_block_under_node(nid, mem, 
>> MEMINIT_EARLY);
>> +            put_device(&mem->dev);
>> +        }
>> +
>> +    }
>> +}
>> +
>>   void register_memory_blocks_under_node(int nid, unsigned long 
>> start_pfn,
>>                          unsigned long end_pfn,
>>                          enum meminit_context context)
>> @@ -974,8 +1012,9 @@ void __init node_dev_init(void)
>>        * to applicable memory block devices and already created cpu 
>> devices.
>>        */
>>       for_each_online_node(i) {
>> -        ret = register_one_node(i);
>> +        ret =  __register_one_node(i);
>>           if (ret)
>>               panic("%s() failed to add node: %d\n", __func__, ret);
>> +        register_memory_blocks_under_node_early(i);
>>       }
>
> In general, LGTM.
>
>
> BUT :)
>
> I was wondering whether having a register_memory_blocks_early() call 
> *after* the for_each_online_node(), and walking all memory regions 
> only once would make a difference.
>
> We'd have to be smart about memory blocks that fall into multiple 
> regions, but it should be a corner case and doable.
>
> OTOH, we usually don't expect having a lot of regions, so iterating 
> over them is probably not a big bottleneck? Anyhow, just wanted to 
> raise it.
>
