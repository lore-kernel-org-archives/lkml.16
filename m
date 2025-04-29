Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D54A2D1F78
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935775; cv=none; b=aguVAjjECv1/Ydyl/8zc+OGB1fgyER/N1KIgEVTDVOlJQUUZCYvVkTYUUwDANPdejSis+WjfJYsUwzWR/0s48/kdP/jBAWCjrvcWbzrAzbOa7ozJ1QT27GY8Dhznabcn4WARaXbAGvUKSlC2iW9CTmpjF8W2EIZAIsa3hZGlcFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935775; c=relaxed/simple;
	bh=YwuhRX0tkvqCJhrQVeHhnzq2Xk5aB6qUP8G/vwaLN60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pOHWrJQTVz0eL/FTXaiuoPw9M7YfhQphMNVCqWpsHQ1Mr17Q2hIdcpL7VbwfRJ/aEPAZlxxSKso/ciHyw/Q752uXTDcLNJD1mj/MDnybZXL1bkg9/6yICHwrF6Ylicwqn/y7f3hitH4Nrhy+S4QMUzpxb2VuYEWtyA1gMJg69as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=O8XTZMSZ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="O8XTZMSZ"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T4EdWu026747;
	Tue, 29 Apr 2025 14:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8fQA3D
	TFAQ6XF38YFYQgZVRYg95r4NVgeNp5RdlIWB4=; b=O8XTZMSZlwSf4/o9qjNVgV
	5IoImELAv3OGJdRwKcVPzQYXJBEqx3qnzaNVOUzB1o18QPtbEXbXd1+V5/p2nVbN
	jUmwxaGIQqpPRhNBf3ud+QkXVzSqgW0uiURAmvHYa/VuXnk57qbwe1ujWI1qKSnd
	8dt2GL0TyjSe9DrziyUQcQLkbB2xqrqB1RiC+t/uW7u42097X8psAP68PEZVu0Hm
	VuFbpxloFgwZh9cwh4Bn8WNN7nwmhn8WIlNUdLonRlJthSUewR5RPo4o0UVh6lnh
	BwXOsOREFljAIvlvvCcbnVhRSbnqTVECkqRew8M8SQYhEy72VU4pedRkn1HnFQBg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ahtwkceb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 14:09:07 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53TDi9In029585;
	Tue, 29 Apr 2025 14:09:07 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ahtwkce7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 14:09:07 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAGsBa024662;
	Tue, 29 Apr 2025 14:09:06 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 469c1m39ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 14:09:06 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53TE95FU12452594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 14:09:05 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8B8F58061;
	Tue, 29 Apr 2025 14:09:05 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42C7C58057;
	Tue, 29 Apr 2025 14:09:01 +0000 (GMT)
Received: from [9.39.31.64] (unknown [9.39.31.64])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Apr 2025 14:09:00 +0000 (GMT)
Message-ID: <1f750ad6-b6b1-41de-9cdd-9abe64c14eae@linux.ibm.com>
Date: Tue, 29 Apr 2025 19:38:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] driver/base: Optimize memory block registration to
 reduce boot time
To: David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
        Oscar Salvador <osalvador@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
 <da9c6b2f-5b4b-444c-a453-cf72272c2fb7@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <da9c6b2f-5b4b-444c-a453-cf72272c2fb7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwNSBTYWx0ZWRfX/S4hOCsK+GPE 50pklfhfW2USyJChZkwlQc/E7EKKz9Jt3+EHt6NSft5UVRaBSoccjxbJBtxJAeqsRtkQvwzjrK4 3oMDoGb3dmquNb1IC71BJbe6UWSXvFlHtdKP+Pa1ShVbXDyhZpa5TmCKmMb+wXnk8QaLvATs+jN
 qbbiHmjlOt+ah4+ioSMiOETnuZWs1IPK2n9HdIcIRbds1B7l3slysu8c9SPR8Ht8+kYjL6fErk2 s39KjVN9TxxiPY0MwrlYXT9mHOIvG+NlASbaTO7ncEaTidavvMjgRcy1gB+AXL41JZYpmyTx5X8 JW2Bi6qZPKs+P/z9o+Sqcs/oKcwKnm3XsZz/tgj1DUKeGqK/oqAKsQJE+gAs1wtloFJ950PlPMp
 C0LAGNGW9snjhZ1XnVaWcKjeTNzbWQlHa1nrzlgdN2IjZFu7S5bewDuIswgILf1fYZrb4hd4
X-Proofpoint-GUID: ZZ-4DrQ-mrc1jE70m3YdAZRSlKVsrK2s
X-Authority-Analysis: v=2.4 cv=KtxN2XWN c=1 sm=1 tr=0 ts=6810dd83 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=hDAVcJoJGwRf6u5NEeoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: zr9kNah8aQuDCFQ7fkf1-52da0INA5kC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290105


On 4/29/25 2:49 AM, David Hildenbrand wrote:
> On 28.04.25 19:03, Donet Tom wrote:
>> During node device initialization, `memory blocks` are registered under
>> each NUMA node. The `memory blocks` to be registered are identified 
>> using
>> the node’s start and end PFNs, which are obtained from the node's 
>> pg_data
>>
>> However, not all PFNs within this range necessarily belong to the same
>> node—some may belong to other nodes. Additionally, due to the
>> discontiguous nature of physical memory, certain sections within a
>> `memory block` may be absent.> As a result, `memory blocks` that fall 
>> between a node’s start and end
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
>
> Yes, makes sense.
>
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
>
> Wow!
>
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
>
> Also very nice!
>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>> ---
>>
>> v1->v2
>>
>> Reworked the implementation according to suggestions from
>> Mike Rapoport[1]
>>
>> [1] - https://lore.kernel.org/all/Z_j2Gv9n4DOj6LSs@kernel.org/
>>
>> v1 - 
>> https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
>> ---
>>   drivers/base/memory.c  |  4 ++--
>>   drivers/base/node.c    | 39 +++++++++++++++++++++++++++++++++++++++
>>   include/linux/memory.h |  2 ++
>>   include/linux/node.h   | 11 +++++------
>>   4 files changed, 48 insertions(+), 8 deletions(-)
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
>> index cd13ef287011..4869333d366d 100644
>> --- a/drivers/base/node.c
>> +++ b/drivers/base/node.c
>> @@ -20,6 +20,7 @@
>>   #include <linux/pm_runtime.h>
>>   #include <linux/swap.h>
>>   #include <linux/slab.h>
>> +#include <linux/memblock.h>
>>     static const struct bus_type node_subsys = {
>>       .name = "node",
>> @@ -850,6 +851,44 @@ void unregister_memory_block_under_nodes(struct 
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
>> + *
>> + */
>> +void register_memory_blocks_under_node_early(int nid)
>> +{
>> +    struct memblock_region *r;
>
> You almost achieved a reverse x-mas tree :)
>
>> +    unsigned long start_block_id;
>> +    unsigned long end_block_id;
>> +    struct memory_block *mem;
>> +    unsigned long block_id;
>> +
>> +    for_each_mem_region(r) {
>> +        if (r->nid == nid) {
>
> To reduce indentation
>
> if (r->nid != nid)
>     continue;


ok.


>
>> +            start_block_id = phys_to_block_id(r->base);
>> +            end_block_id = phys_to_block_id(r->base + r->size - 1);
>
> Probably you could make them const in the for loop
>
>     const unsigned long start_block_id = phys_to_block_id(r->base);
>     const unsigned long end_block_id = phys_to_block_id(r->base + 
> r->size - 1);


ok. I will add this change.


>
> Okay, so end is inclusive as well.


yes


>
>> +
>> +            for (block_id = start_block_id; block_id <= 
>> end_block_id; block_id++) {
>> +                mem = find_memory_block_by_id(block_id);
>> +                if (!mem)
>> +                    continue;
>> +
>> +                do_register_memory_block_under_node(nid, mem, 
>> MEMINIT_EARLY);
>
