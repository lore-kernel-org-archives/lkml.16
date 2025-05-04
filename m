Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC751993B2
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746376487; cv=none; b=Yrr/qwqL0B/rQStvc4yh3w9suPTBGd7xAihgEGcAALDSEjGajbl8QJZPuR1KL01p7xbR2O9Jy+OWfxAKMePaQsouDgb6ZiDsOy1Bc2IEOebVuEc+vj97x8kXMTaPVMbQ7vcllD9MQHcOoeu3KYGwcJJyq/ddZOo0VQelcGFnZkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746376487; c=relaxed/simple;
	bh=+t4i0QAVMT7j/G2Q089b1+ZAySQfMBVIRy81/WSuEgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBCXEmzEyOBhhlpoDjtoiHNVA1c29yknjX1c89KOuGNF41oJ6po+ITqzGquAO2G8vGtdOzFKU803cEiEFllVCoyCdOshbTxTvgZhoGDC3jQ+Ect4MiJLo4JBC9AHZwXMMzmOpmEGDBVtdVFAI40J13z9MxAF9uxH8kMqLpQx0o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Z1qTFbsc; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Z1qTFbsc"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544CTe9T016856;
	Sun, 4 May 2025 16:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HJDHBc
	xiMfvd2+mj90a1kD6w7AvQkG1SQmCtV2+4zqI=; b=Z1qTFbscgZWv3im0R6uyum
	p0tgDj+mp08mR19dv7Nmm/Nh6XwHT/O1+QogebZNDq+K6GLOeEIJg1xUR29rJ/xM
	jmh6kopel07t+tnwvX5WHLK/dTfhqsizVIqyPNIYFgtS6rUiFzc2vinrM13OvUvQ
	MCNDSSNQzNdRkL/4XLbezeDWnVqfGjZP3wbMgPwQKWqCGKx0sHnsWRgHW5dVbSu6
	gQ53HBHIHpLje9PikoSDEesKpOvrQtDGCTbBMxQlgxATC5eLe7hA6ahv60Eg2J7q
	baMKqKNwNjKGqLqBIpT721Y+jomuhfeJsiLO2+kCNxTIAcbfkisG5kC+1YvLV2aA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e65hrudy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 16:34:17 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 544GYGxA009440;
	Sun, 4 May 2025 16:34:16 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e65hrudw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 16:34:16 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 544FvK8F001353;
	Sun, 4 May 2025 16:34:15 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dwft2q4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 16:34:15 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 544GYFXF29491924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 16:34:15 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 487D658051;
	Sun,  4 May 2025 16:34:15 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 425AB5805C;
	Sun,  4 May 2025 16:34:10 +0000 (GMT)
Received: from [9.124.222.192] (unknown [9.124.222.192])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 May 2025 16:34:09 +0000 (GMT)
Message-ID: <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
Date: Sun, 4 May 2025 22:04:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration to
 reduce boot time
To: Mike Rapoport <rppt@kernel.org>
Cc: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
        Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <aBdK2EIMYYRmmEwA@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <aBdK2EIMYYRmmEwA@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=UZ1RSLSN c=1 sm=1 tr=0 ts=68179709 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=3ghOl4lIOoM78I8PcA0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 7mAu6nbjPy75FSL5Pks_rb1aWU0lgfzs
X-Proofpoint-ORIG-GUID: JQfSQtIa4uQ0iY_O25hsJ7DhseHSgvAv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MSBTYWx0ZWRfX2rnzoc4cXSut 319fHwxoba9Kul4zfdxuvdEL9XiCCFe68+n3BBoJFZmvwQjz7TMEJUQAdAIQIhgp/tjz+BLzw8z 2pJyCLe04Pr0T46iczyJ1k5GOctNyHbEKxtz8NDNXE/qkzJLR9a0qTfwGI31YRDCz1djcJV5O0F
 2T+uuBjQf/FKp8gA+SB8m1fm9OXZRykKkB1EBeNzFz6K/VOw9Sar06S0+ql0VP+nEPcY5JdRauK qaeb7NYKEBrTcW5jAqi32lxod6gYPaGlPBNHWPhCLek4mUJlEvB58h/W1/q4PZR7sgID4hlY0rj FcgNNjYqPsH7estV1J7TiZjobEEql7TYAa99hll38oBBGlVi8bxpfwy3EuOB9gpcwAtfnCMwqUj
 +tHqnuoB/Lc5EB52/Td5DTpjaO247J50AbR2jhMyrEQtRJrWLRlzgKkHJHMaIThSNw5TDXvP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040151


On 5/4/25 4:39 PM, Mike Rapoport wrote:
> On Sat, May 03, 2025 at 11:10:12AM +0530, Donet Tom wrote:
>> During node device initialization, `memory blocks` are registered under
>> each NUMA node. The `memory blocks` to be registered are identified using
>> the node’s start and end PFNs, which are obtained from the node's pg_data
>>
>> However, not all PFNs within this range necessarily belong to the same
>> node—some may belong to other nodes. Additionally, due to the
>> discontiguous nature of physical memory, certain sections within a
>> `memory block` may be absent.
>>
>> As a result, `memory blocks` that fall between a node’s start and end
>> PFNs may span across multiple nodes, and some sections within those blocks
>> may be missing. `Memory blocks` have a fixed size, which is architecture
>> dependent.
>>
>> Due to these considerations, the memory block registration is currently
>> performed as follows:
>>
>> for_each_online_node(nid):
>>      start_pfn = pgdat->node_start_pfn;
>>      end_pfn = pgdat->node_start_pfn + node_spanned_pages;
>>      for_each_memory_block_between(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn))
>>          mem_blk = memory_block_id(pfn_to_section_nr(pfn));
>>          pfn_mb_start=section_nr_to_pfn(mem_blk->start_section_nr)
>>          pfn_mb_end = pfn_start + memory_block_pfns - 1
>>          for (pfn = pfn_mb_start; pfn < pfn_mb_end; pfn++):
>>              if (get_nid_for_pfn(pfn) != nid):
>>                  continue;
>>              else
>>                  do_register_memory_block_under_node(nid, mem_blk,
>>                                                          MEMINIT_EARLY);
>>
>> Here, we derive the start and end PFNs from the node's pg_data, then
>> determine the memory blocks that may belong to the node. For each
>> `memory block` in this range, we inspect all PFNs it contains and check
>> their associated NUMA node ID. If a PFN within the block matches the
>> current node, the memory block is registered under that node.
>>
>> If CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, get_nid_for_pfn() performs
>> a binary search in the `memblock regions` to determine the NUMA node ID
>> for a given PFN. If it is not enabled, the node ID is retrieved directly
>> from the struct page.
>>
>> On large systems, this process can become time-consuming, especially since
>> we iterate over each `memory block` and all PFNs within it until a match is
>> found. When CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, the additional
>> overhead of the binary search increases the execution time significantly,
>> potentially leading to soft lockups during boot.
>>
>> In this patch, we iterate over `memblock region` to identify the
>> `memory blocks` that belong to the current NUMA node. `memblock regions`
>> are contiguous memory ranges, each associated with a single NUMA node, and
>> they do not span across multiple nodes.
>>
>> for_each_online_node(nid):
>>    for_each_memory_region(r): // r => region
>>      if (r->nid != nid):
>>        continue;
>>      else
>>        for_each_memory_block_between(r->base, r->base + r->size - 1):
>>          do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
>>
>> We iterate over all `memblock regions` and identify those that belong to
>> the current NUMA node. For each `memblock region` associated with the
>> current node, we calculate the start and end `memory blocks` based on the
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
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>>
>> ---
>> v2 -> v3
>>
>> Fixed indentation issues, made `start_block_id` and `end_block_id` constants,
>> and moved variable declarations to the places where they are needed.
>>
>> v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
>> v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
>> ---
>>   drivers/base/memory.c  |  4 ++--
>>   drivers/base/node.c    | 38 ++++++++++++++++++++++++++++++++++++++
>>   include/linux/memory.h |  2 ++
>>   include/linux/node.h   | 11 +++++------
>>   4 files changed, 47 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>> index 19469e7f88c2..7f1d266ae593 100644
>> --- a/drivers/base/memory.c
>> +++ b/drivers/base/memory.c
>> @@ -60,7 +60,7 @@ static inline unsigned long pfn_to_block_id(unsigned long pfn)
>>   	return memory_block_id(pfn_to_section_nr(pfn));
>>   }
>>   
>> -static inline unsigned long phys_to_block_id(unsigned long phys)
>> +unsigned long phys_to_block_id(unsigned long phys)
>>   {
>>   	return pfn_to_block_id(PFN_DOWN(phys));
>>   }
>> @@ -632,7 +632,7 @@ int __weak arch_get_memory_phys_device(unsigned long start_pfn)
>>    *
>>    * Called under device_hotplug_lock.
>>    */
>> -static struct memory_block *find_memory_block_by_id(unsigned long block_id)
>> +struct memory_block *find_memory_block_by_id(unsigned long block_id)
>>   {
>>   	struct memory_block *mem;
>>   
>> diff --git a/drivers/base/node.c b/drivers/base/node.c
>> index cd13ef287011..0f8a4645b26c 100644
>> --- a/drivers/base/node.c
>> +++ b/drivers/base/node.c
>> @@ -20,6 +20,7 @@
>>   #include <linux/pm_runtime.h>
>>   #include <linux/swap.h>
>>   #include <linux/slab.h>
>> +#include <linux/memblock.h>
>>   
>>   static const struct bus_type node_subsys = {
>>   	.name = "node",
>> @@ -850,6 +851,43 @@ void unregister_memory_block_under_nodes(struct memory_block *mem_blk)
>>   			  kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
>>   }
>>   
>> +/*
>> + * register_memory_blocks_under_node_early : Register the memory
>> + *		  blocks under the current node.
>> + * @nid : Current node under registration
>> + *
>> + * This function iterates over all memblock regions and identifies the regions
>> + * that belong to the current node. For each region which belongs to current
>> + * node, it calculates the start and end memory blocks based on the region's
>> + * start and end PFNs. It then registers all memory blocks within that range
>> + * under the current node.
>> + */
>> +void register_memory_blocks_under_node_early(int nid)
>> +{
>> +	struct memblock_region *r;
>> +
>> +	for_each_mem_region(r) {
>> +		if (r->nid != nid)
>> +			continue;
>> +
>> +		const unsigned long start_block_id = phys_to_block_id(r->base);
>> +		const unsigned long end_block_id = phys_to_block_id(r->base + r->size - 1);
>> +		unsigned long block_id;
>> +
>> +		for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
>> +			struct memory_block *mem;
>> +
>> +			mem = find_memory_block_by_id(block_id);
>> +			if (!mem)
>> +				continue;
>> +
>> +			do_register_memory_block_under_node(nid, mem, MEMINIT_EARLY);
>> +			put_device(&mem->dev);
>> +		}
>> +
>> +	}
>> +}
>> +
>>   void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>>   				       unsigned long end_pfn,
>>   				       enum meminit_context context)
>> diff --git a/include/linux/memory.h b/include/linux/memory.h
>> index 12daa6ec7d09..cb8579226536 100644
>> --- a/include/linux/memory.h
>> +++ b/include/linux/memory.h
>> @@ -171,6 +171,8 @@ struct memory_group *memory_group_find_by_id(int mgid);
>>   typedef int (*walk_memory_groups_func_t)(struct memory_group *, void *);
>>   int walk_dynamic_memory_groups(int nid, walk_memory_groups_func_t func,
>>   			       struct memory_group *excluded, void *arg);
>> +unsigned long phys_to_block_id(unsigned long phys);
>> +struct memory_block *find_memory_block_by_id(unsigned long block_id);
>>   #define hotplug_memory_notifier(fn, pri) ({		\
>>   	static __meminitdata struct notifier_block fn##_mem_nb =\
>>   		{ .notifier_call = fn, .priority = pri };\
>> diff --git a/include/linux/node.h b/include/linux/node.h
>> index 2b7517892230..93beefe8f179 100644
>> --- a/include/linux/node.h
>> +++ b/include/linux/node.h
>> @@ -114,12 +114,16 @@ extern struct node *node_devices[];
>>   void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>>   				       unsigned long end_pfn,
>>   				       enum meminit_context context);
>> +void register_memory_blocks_under_node_early(int nid);
>>   #else
>>   static inline void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>>   						     unsigned long end_pfn,
>>   						     enum meminit_context context)
>>   {
>>   }
>> +static inline void register_memory_blocks_under_node_early(int nid)
>> +{
>> +}
>>   #endif
>>   
>>   extern void unregister_node(struct node *node);
>> @@ -134,15 +138,10 @@ static inline int register_one_node(int nid)
>>   	int error = 0;
>>   
>>   	if (node_online(nid)) {
>> -		struct pglist_data *pgdat = NODE_DATA(nid);
>> -		unsigned long start_pfn = pgdat->node_start_pfn;
>> -		unsigned long end_pfn = start_pfn + pgdat->node_spanned_pages;
>> -
>>   		error = __register_one_node(nid);
>>   		if (error)
>>   			return error;
>> -		register_memory_blocks_under_node(nid, start_pfn, end_pfn,
>> -						  MEMINIT_EARLY);
>> +		register_memory_blocks_under_node_early(nid);
> Does not that change mean that when register_one_node() is called from
> memory hotplug it will always try to iterate memblock regions?
> This would be a problem on architectures that don't keep memblock around
> after boot.


Hi Mike

Apologies — I wasn’t aware about CONFIG_ARCH_KEEP_MEMBLOCK.
Thank you for pointing it out.

If this configuration is disabled, the current patchset would not function
correctly, and node device initialization could fail during the hotplug path.

To address this, How should we proceed?

1. If CONFIG_ARCH_KEEP_MEMBLOCK is enabled, use
for_each_mem_region() for both boot-time and hotplug calls to
register_one_node(). If it is not enabled, use for_each_mem_region()
only during boot-time initialization, and fall back to the existing method
for adding memory blocks during hotplug.

2. Or, we could  always use for_each_mem_region() only during boot,
and retaining the current approach for memory block handling during
hotplug.

Could you please advise on the preferred approach?


Thanks

Donet

>
> I thought that the for_each_mem_region() loop should be in node_dev_init()
> when we know for sure that memblock is available.
>
>>   	}
>>   
>>   	return error;
>> -- 
>> 2.48.1
>>
