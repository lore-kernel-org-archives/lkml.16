Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CC71EEA2D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744312029; cv=none; b=iB3XhYQ8f3GPwXWnbXJx0twvFdVS7zsYM4HojSxXR53lCAEn3K4o1hqKlqzhZMI7n2tmcDOXdL5bsP4B6tYUKvGRQep+IekCKhuBKEvejf33Xd31efSgnIEy9ok0ahFyJ0MjI9mekCEoQfrkreytSH+qB8NIbdRDW2o5hO7cIhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744312029; c=relaxed/simple;
	bh=wms/tgl8Fns7eUrYAxRP0444fnOKVf5HDVop8N0UsOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwC++Z7vCLJvF73JkrgBt+l80U5blzj7pU+C8whmsgEoSAGvURwwR9UrL1O2gE2qSj9HjTmkiwDonEqfSWw9bHoJq2dmYbzIGJJcMJKYo8dz6RuIzR0cdueADiV+jZaZwn6GIgPT124OnW0+MXuq5xAVBfvbv2O6+IbO0F343yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=aM1jGn4g; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="aM1jGn4g"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AE26Rb021540;
	Thu, 10 Apr 2025 19:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JcvjJ5
	vpXYiW+Zr7SRmRYvYFTlxe3D4bleS17oQA+JY=; b=aM1jGn4gQHxUNkCGfKjm2D
	Q2OkIBAeU6IrAmOfpIvto6bXOFFEldQU+OUEFRz/pkw5XVD+mM09+KMdHI6p5aJU
	u/cwIZdMTiVo+98w6igzq05060f/7la2HmOBsOpLqPiGBLjItKiTBGxdy4wLIHrk
	GMaXKZgGZGq1BM0bXD+zG40VAyAIMwkxd1se8hsmawNV4HZ8ZSlJmVwhcQyamB1b
	JIICyVcWX7+QqRZe82oT15PzHvFWwZ53f9mSYavUkQPSxn4Wt8dtAgePY1ObQiwN
	x4Kg1iL7X8mFyzm8Eyc6Jg7dfE6cv2J14lbDHmodMLPjchCoy+3nwi//IVOfImEg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x02qeqfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 19:06:58 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53AJ6wvd010117;
	Thu, 10 Apr 2025 19:06:58 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x02qeqfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 19:06:58 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFoEAg011522;
	Thu, 10 Apr 2025 19:06:57 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45uf7yypve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 19:06:57 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53AJ6ucH27263726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 19:06:56 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6874658045;
	Thu, 10 Apr 2025 19:06:56 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 615D758052;
	Thu, 10 Apr 2025 19:06:53 +0000 (GMT)
Received: from [9.39.24.129] (unknown [9.39.24.129])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 10 Apr 2025 19:06:53 +0000 (GMT)
Message-ID: <242ff7ba-704f-43e4-803d-3fbfe6487388@linux.ibm.com>
Date: Fri, 11 Apr 2025 00:36:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/memblock: Added a New Memblock Function to Check
 if the Current Node's Memblock Region Intersects with a Memory Block
To: Mike Rapoport <rppt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
References: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>
 <Z_d4CvSjQFK55wfQ@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <Z_d4CvSjQFK55wfQ@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6MmbwQg4ubZ6BEEGdDboh_dMo_it0LKS
X-Proofpoint-ORIG-GUID: M0bzxETn5dXlZaILD2ARn3n6LYvFAiRV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100137


On 4/10/25 1:19 PM, Mike Rapoport wrote:
> Hi,
>
> On Wed, Apr 09, 2025 at 10:57:56AM +0530, Donet Tom wrote:
>> A new function, curr_node_memblock_intersect_memory_block, has been
>> added to check if the current node's NID intersects with a memory block.
> As Andrew mentioned, the name is too long :)
Sorry, I will reduce the name length from next time.
> Maybe memblock_range_intersects_node(), but I think intersection is not the
> right thing to check (see below).
>
> Also, memblock does not care about sysfs representation of memory blocks,
> please use "range" rather than "memory block" in changelog and comments.

sure.

>   
>> This function takes the start and end PFN of a memory block, along with
>> the node ID being registered. It then finds the memblock region of the
>> current node and check if the passed memory block intersects with it. If
>> there is an intersection, the function returns true; otherwise, itreturns
>> false.
>   
> Please describe here what problem you are solving and why you need this
> functionality rather than what the new function does.
>
>> There are two scenarios to consider during the search:
>>
>> 1. The memory block size is greater than the memblock region size.
>>
>> This means that multiple memblocks can be present within a single
>> memory block. If the start or end of the memblock is within the
>> start and end of the memory block, it indicates that the memblock
>> is part of that memory block. Therefore, the memory block can be
>> added to the node where the memblock resides.
> If a range crosses several memblocks, it's possible that they belong to a
> different nodes.
>   
>> 2. The memory block size is less than or equal to the memblock size
>>
>> This means that multiple memory blocks can be part of a single memblock
>> region. If the start or end of the memory block is within the start and
>> end of the memblock, it indicates that the memory block is part of the
>> memblock. Therefore, the memory block can be added to the node where
>> the memblock resides.
>>
>> In the current implementation, during node device initialization, to
>> find the memory block NID, it iterates over each PFN of the memory
>> block until it finds a match. On large systems, this can take a
>> long time.
> Why won't you replace the loop over each PFN with a loop over memblock
> memory regions in the node device initialization?
>
The same question I have ,do you mean that we should iterate
over all memblock regions, identify the regions belonging to the current
node, and then retrieve the corresponding memory blocks to register them
under that node?


Thanks
Donet

>   
>> With this function, the boot time is reduced.
>>
>> Boot time without this function - 32TB RAM
>> ==========================================
>> Startup finished in 1min 12.413s (kernel)
>>
>> Boot time with this function -  32TB RAM
>> ========================================
>> Startup finished in 18.031s (kernel)
>>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>> ---
>>   include/linux/memblock.h |  2 ++
>>   mm/memblock.c            | 67 +++++++++++++++++++++++++++++++++++++++-
>>   2 files changed, 68 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
>> index ef5a1ecc6e59..db87f7daa46c 100644
>> --- a/include/linux/memblock.h
>> +++ b/include/linux/memblock.h
>> @@ -277,6 +277,8 @@ static inline bool memblock_is_driver_managed(struct memblock_region *m)
>>   
>>   int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
>>   			    unsigned long  *end_pfn);
>> +bool curr_node_memblock_intersect_memory_block(unsigned long start_pfn,
>> +				unsigned long end_pfn, int curr_nid);
>>   void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
>>   			  unsigned long *out_end_pfn, int *out_nid);
>>   
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index 0a53db4d9f7b..570ab7ac4dce 100644
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -6,6 +6,8 @@
>>    * Copyright (C) 2001 Peter Bergner.
>>    */
>>   
>> +#include "linux/stddef.h"
>> +#include "linux/types.h"
>>   #include <linux/kernel.h>
>>   #include <linux/slab.h>
>>   #include <linux/init.h>
>> @@ -17,7 +19,7 @@
>>   #include <linux/seq_file.h>
>>   #include <linux/memblock.h>
>>   #include <linux/mutex.h>
>> -
>> +#include <linux/minmax.h>
>>   #include <asm/sections.h>
>>   #include <linux/io.h>
>>   
>> @@ -1909,6 +1911,69 @@ bool __init_memblock memblock_is_map_memory(phys_addr_t addr)
>>   	return !memblock_is_nomap(&memblock.memory.regions[i]);
>>   }
>>   
>> +/**
>> + * curr_node_memblock_intersect_memory_block:  checks if the current node's memblock
>> + * region intersects with the memory block.
>> + * @start_pfn: memory block start pfn
>> + * @end_pfn: memory block end_pfn
>> + * @curr_nid: Current node
>> + *
>> + * This function takes the start and end PFN of a memory block, as well as the node ID
>> + * that is being registered. It then finds the memblock region of the current node and
>> + * checks if the passed memory block intersects with the memblock. If there is an
>> + * intersection, the function returns true; otherwise, it returns false.
>> + *
>> + * Return:
>> + * If the current node's memblock region intersects with the memory block, it returns
>> + * true; otherwise, it returns false.
>> + */
>> +bool __init_memblock curr_node_memblock_intersect_memory_block(unsigned long start_pfn,
>> +						unsigned long end_pfn, int curr_nid)
>> +{
>> +	struct memblock_region *r;
>> +	unsigned long r_start, r_end;
>> +	unsigned long size = end_pfn - start_pfn;
>> +	unsigned long r_size = 0;
>> +
>> +	for_each_mem_region(r) {
>> +		r_start = PFN_DOWN(r->base);
>> +		r_end = PFN_DOWN(r->base + r->size);
>> +		r_size = r_end - r_start;
>> +
>> +		if (r->nid == curr_nid) {
> r->nid is not defined for !NUMA configurations, please use
> memblock_get_region_node()
>
>> +			if (size > r_size) {
>> +				/*
>> +				 * The memory block size is greater than the memblock
>> +				 * region size, meaning multiple memblocks can be present
>> +				 * within a single memory block. If the memblock's start
>> +				 * or end is within the memory block's start and end, It
>> +				 * indicates that the memblock is part of this memory block.
>> +				 * Therefore, the memory block can be added to the node
>> +				 * where the memblock resides.
>> +				 */
>> +				if (in_range(r_start, start_pfn, size) ||
>> +						in_range(r_end, start_pfn, size))
>> +					return true;
>> +			} else {
>> +				/*
>> +				 * The memory block size is less than or equal to the
>> +				 * memblock size, meaning multiple memory blocks can
>> +				 * be part of a single memblock region. If the memory
>> +				 * block's start or end is within the memblock's start
>> +				 * and end, it indicates that the memory block is part of
>> +				 * the memblock. Therefore, the memory block can be added
>> +				 * to the node where the memblock resides.
>> +				 */
>> +				if (in_range(start_pfn, r_start, r_size) ||
>> +						in_range(end_pfn, r_start, r_size))
>> +					return true;
>> +			}
>> +		}
>> +	}
>> +	return false;
>> +}
>> +
>> +
>>   int __init_memblock memblock_search_pfn_nid(unsigned long pfn,
>>   			 unsigned long *start_pfn, unsigned long *end_pfn)
>>   {
>> -- 
>> 2.48.1
>>
