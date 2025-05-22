Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF0B1E487
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917020; cv=none; b=oH8pTJAQ8NBIc0DBf3/a6oPatIsZjjlapsfQWno2VeARlySUIHMESN8KuukbjH+EGwoAxma4If0eRpla3EtYtjPC/IzZuJP0k8w+QjXhIQeQwFtrXVQdvty26DZltewDfXM47YPQuqdw4OAUlr4JG9kV9Ebc4Dwf/lrfNK17vVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917020; c=relaxed/simple;
	bh=VJkAUKMjsMORE2HA6HDV+ffhGRCRQywhAASWNhApCrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ga9lGuULiNJvRZo1jVJhdNalmObQT6VFCfIoJNyoTZanqv9E9fmGelAfbbPHTIJ1YoAEXPAz80j8e+Q4RW+ts1/STLHzJiziNb/MoFinKdaPP8diu+NdD72/B6sKx++RalvIO5og3OpBKCHQVJcD0Kt9M/xXhYpjMcuojFS3Up8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ZAV1fYyg; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ZAV1fYyg"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M6Jbd9010410;
	Thu, 22 May 2025 12:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+9niOY
	9KGWXhB2ZYcvbWwPkjG3fGSy/zKwDCsuGVriU=; b=ZAV1fYygyeL+ClcO6jQKLX
	LUnZPJiaP2VbRufSr3a+JZAE2oogepjuzy7UtEoSLuxjj+8TWUWUHsstAvj6RbZd
	GZR5VT59T/gOWlvbAO3giiVrfW31QnbYcVXtIg+gqvhJTxm5bTsKanx7pk1gG2wv
	t68OXiK7O4SgO2uh7Y78rKtUBYTGb8tSznVjvKzSZUW1lxff/Oiwf//INcqAXGR8
	X6/hP5L9ffch0bdisRtaFtAKd4wtRjztQR82LgzGxDEA8Vo/e8djS1g+fasQeX3S
	xIxrTsAyKc63xyj+I5jNQbGcbu5ksMcUmKwATmISh47OCqGBkvsYrZRK0nAG3P6A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sxhw9ng3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 12:30:00 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54MCLROs000442;
	Thu, 22 May 2025 12:29:59 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sxhw9ng0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 12:29:59 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54M9cHjf032087;
	Thu, 22 May 2025 12:29:58 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46rwnmhcnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 12:29:58 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54MCTs1A24511034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 May 2025 12:29:54 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D54965804E;
	Thu, 22 May 2025 12:29:57 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 916FC5803F;
	Thu, 22 May 2025 12:29:52 +0000 (GMT)
Received: from [9.109.245.113] (unknown [9.109.245.113])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 May 2025 12:29:52 +0000 (GMT)
Message-ID: <942308c1-2dfd-4c61-8ec5-d70b26d7642c@linux.ibm.com>
Date: Thu, 22 May 2025 17:59:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drivers/base/node: Optimize memory block
 registration to reduce boot time
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>
References: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
 <aeb5cfd2-ca8c-4e69-b27e-74c6ab4de520@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <aeb5cfd2-ca8c-4e69-b27e-74c6ab4de520@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyMyBTYWx0ZWRfXx9OMsnck1a9X vbkaTEmJF/ujqP+82IpbEeC+Yd1hDGs1EkxB69laYqpLhQFuSVa6SGVEC91L1QvaI3ca7tPgJgb QI1/Fm0sa/oHQPxl3/pwnnfz/Tththn+x+lXj9/KqWqP9/6Fx/xraiqnqzSxu7fMmFfPIHaZQdU
 6+KZErkbl8MxMpeaeKO4g7bXQ7poQyoy9c8Z7K0smPLKXrSseQ4T4Ndk6LiSOayv/moKaCqBKDF TyJDVhQRHqSQqjdtfOmqNLDQWq0mnxZSKTR/+zXD1FOBiAV7v60YydLSOpApmshk9rNoBfS5EuG ryYpls73MFamHSYmzaXCZ2Ul/hqWq8IHVerBiT6gBOLwHV4jv/eiaUqIECogELnh4uaB1qkA51z
 qZZfRBqo4CTrGyn/4kIl2H5t7Iuv7n3f+0QitKEeu2W7etZG9qiC/OK0YACrBhNeaOEfZcgM
X-Proofpoint-GUID: Msro3rcb3RW2hXFs1P8ijJcjCsn-LEy8
X-Authority-Analysis: v=2.4 cv=O685vA9W c=1 sm=1 tr=0 ts=682f18c8 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Ikd4Dj_1AAAA:8 a=beigy43P22xSNeY8svIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: TOa3eb-SkIoL5ihox1TYomiYu6LnP3pS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220123


On 5/22/25 5:39 PM, David Hildenbrand wrote:
> On 22.05.25 11:17, Donet Tom wrote:
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
>> for_each_memory_region(r): // r => region
>>    if (!node_online(r->nid)):
>>      continue;
>>    else
>>      for_each_memory_block_between(r->base, r->base + r->size - 1):
>>        do_register_memory_block_under_node(r->nid, mem_blk, 
>> MEMINIT_EARLY);
>>
>> We iterate over all memblock regions, and if the node associated with 
>> the
>> region is online, we calculate the start and end memory blocks based 
>> on the
>> region's start and end PFNs. We then register all the memory blocks 
>> within
>> that range under the region node.
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
>> Acked-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>>
>> ---
>> v4 -> v5
>>
>> 1. Moved all helpers(memory_block_id(), pfn_to_block_id(), and 
>> phys_to_block_id())
>>     into memory.h and exported sections_per_block.
>> 2. register_memory_blocks_early() moved out of for_each_online_node().
>>     Now we iterate over all memory regions at once and register the
>>     memory blocks.
>>
>>     Tested corner cases where memory blocks span across multiple 
>> memblock regions; it
>>     is working fine.
>>
>>     #cd /sys/devices/system/node/
>>     # find node1/  |grep memory0
>>     node1/memory0
>>     # find node0/  |grep memory0
>>     node0/memory0
>>     # find node0/  |grep memory0
>>     node2/memory0
>>     # cat node0/memory0/valid_zones
>>     none
>>
>> V4 - 
>> https://lore.kernel.org/all/f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com/
>> V3 - 
>> https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
>> v2 - 
>> https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
>> v1 - 
>> https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
>> ---
>>   drivers/base/memory.c  | 21 ++++----------------
>>   drivers/base/node.c    | 45 ++++++++++++++++++++++++++++++++++++++++--
>>   include/linux/memory.h | 19 +++++++++++++++++-
>>   include/linux/node.h   |  3 +++
>>   4 files changed, 68 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>> index 19469e7f88c2..39fcc075a36f 100644
>> --- a/drivers/base/memory.c
>> +++ b/drivers/base/memory.c
>> @@ -22,6 +22,7 @@
>>   #include <linux/stat.h>
>>   #include <linux/slab.h>
>>   #include <linux/xarray.h>
>> +#include <linux/export.h>
>>     #include <linux/atomic.h>
>>   #include <linux/uaccess.h>
>> @@ -48,22 +49,8 @@ int mhp_online_type_from_str(const char *str)
>>     #define to_memory_block(dev) container_of(dev, struct 
>> memory_block, dev)
>>   -static int sections_per_block;
>> -
>> -static inline unsigned long memory_block_id(unsigned long section_nr)
>> -{
>> -    return section_nr / sections_per_block;
>> -}
>> -
>> -static inline unsigned long pfn_to_block_id(unsigned long pfn)
>> -{
>> -    return memory_block_id(pfn_to_section_nr(pfn));
>> -}
>> -
>> -static inline unsigned long phys_to_block_id(unsigned long phys)
>> -{
>> -    return pfn_to_block_id(PFN_DOWN(phys));
>> -}
>> +int sections_per_block;
>> +EXPORT_SYMBOL(sections_per_block);
>>     static int memory_subsys_online(struct device *dev);
>>   static int memory_subsys_offline(struct device *dev);
>> @@ -632,7 +619,7 @@ int __weak arch_get_memory_phys_device(unsigned 
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
>> index cd13ef287011..e8b6f6b9ce51 100644
>> --- a/drivers/base/node.c
>> +++ b/drivers/base/node.c
>> @@ -20,6 +20,7 @@
>>   #include <linux/pm_runtime.h>
>>   #include <linux/swap.h>
>>   #include <linux/slab.h>
>> +#include <linux/memblock.h>
>>     static const struct bus_type node_subsys = {
>>       .name = "node",
>> @@ -850,6 +851,41 @@ void unregister_memory_block_under_nodes(struct 
>> memory_block *mem_blk)
>> kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
>>   }
>>   +/*
>> + * register_memory_blocks_under_node_early : Register the memory blocks
>> + *                 under the nodes.
>
> "register_memory_blocks_under_nodes"
>
>> + *
>> + * This function iterates over all memblock regions, and if the node 
>> associated with
>
> "the node" does not apply.
>
>> + * the region is online, calculates the start and end memory blocks 
>> based on the
>> + * region's start and end PFNs. Then, registers all the memory 
>> blocks within that
>> + * range under the region node.
>
> More like "registers all memory blocks under the corresponding nodes 
> ..." then clarify that a block might get registered under multiple 
> nodes etc.
>
>> + */
>> +static void register_memory_blocks_under_node_early(void)
>> +{
>> +    struct memblock_region *r;
>> +
>> +    for_each_mem_region(r) {
>> +        const unsigned long start_block_id = phys_to_block_id(r->base);
>> +        const unsigned long end_block_id = phys_to_block_id(r->base 
>> + r->size - 1);
>> +        unsigned long block_id;
>> +
>> +        if (!node_online(r->nid))
>> +            continue;
>> +
>> +        for (block_id = start_block_id; block_id <= end_block_id; 
>> block_id++) {
>> +            struct memory_block *mem;
>> +
>> +            mem = find_memory_block_by_id(block_id);
>> +            if (!mem)
>> +                continue;
>> +
>> +            do_register_memory_block_under_node(r->nid, mem, 
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
>> @@ -971,11 +1007,16 @@ void __init node_dev_init(void)
>>         /*
>>        * Create all node devices, which will properly link the node
>> -     * to applicable memory block devices and already created cpu 
>> devices.
>> +     * to already created cpu devices.
>>        */
>>       for_each_online_node(i) {
>> -        ret = register_one_node(i);
>> +        ret =  __register_one_node(i);
>>           if (ret)
>>               panic("%s() failed to add node: %d\n", __func__, ret);
>>       }
>> +
>> +    /*
>> +     * Link the node to memory block devices
>> +     */
>> +    register_memory_blocks_under_node_early();
> >   }> diff --git a/include/linux/memory.h b/include/linux/memory.h
>> index 12daa6ec7d09..2a61088e17ad 100644
>> --- a/include/linux/memory.h
>> +++ b/include/linux/memory.h
>> @@ -171,12 +171,30 @@ struct memory_group 
>> *memory_group_find_by_id(int mgid);
>>   typedef int (*walk_memory_groups_func_t)(struct memory_group *, 
>> void *);
>>   int walk_dynamic_memory_groups(int nid, walk_memory_groups_func_t 
>> func,
>>                      struct memory_group *excluded, void *arg);
>> +struct memory_block *find_memory_block_by_id(unsigned long block_id);
>>   #define hotplug_memory_notifier(fn, pri) ({        \
>>       static __meminitdata struct notifier_block fn##_mem_nb =\
>>           { .notifier_call = fn, .priority = pri };\
>>       register_memory_notifier(&fn##_mem_nb);            \
>>   })
>>   +extern int sections_per_block;
>> +
>> +static inline unsigned long memory_block_id(unsigned long section_nr)
>> +{
>> +    return section_nr / sections_per_block;
>> +}
>> +
>> +static inline unsigned long pfn_to_block_id(unsigned long pfn)
>> +{
>> +    return memory_block_id(pfn_to_section_nr(pfn));
>> +}
>> +
>> +static inline unsigned long phys_to_block_id(unsigned long phys)
>> +{
>> +    return pfn_to_block_id(PFN_DOWN(phys));
>> +}
>> +
>>   #ifdef CONFIG_NUMA
>>   void memory_block_add_nid(struct memory_block *mem, int nid,
>>                 enum meminit_context context);
>> @@ -188,5 +206,4 @@ void memory_block_add_nid(struct memory_block 
>> *mem, int nid,
>>    * can sleep.
>>    */
>>   extern struct mutex text_mutex;
>> -
>
> Unrelated change.
>
>
Thank you, David.

I will make the changes and send the next version.


>
>
> Apart from that LGTM
>
