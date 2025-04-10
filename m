Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8851F27EC7C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 18:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744311474; cv=none; b=glVUN41SCGFvsJHQXKUFLcPc3PmK907vAneTYBqm+pIkceTe369aZ3itC/7y6NGclJevP22szcQwkeoEGDmNAlI3f+Cnt4W06KAdfM80MQaiTdn+0bUiO71NOIxCvljSzC7n4Us63ZQFX7UpBEZ66P1TUXK1TZDIXoAHArjY7jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744311474; c=relaxed/simple;
	bh=px83eTbN1atoTwnVQYBzci5zeaeFxKY7DuI5x56wt3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVnjBXfvVJLPtfHdW1iR4T5Z6raHuyy5TADKJp7kUK4rO3wfRFHFhg5yJaLq7VEvp+8/KxFVUOW7aW5chl4/DFbcjLk+64HgOpFipRZKwixP1IlEInE8fIptKgvLoewOitoSy8iFo4RM9KZM9YarfKSGUvQfIvvQ/Ukg2fTkbxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ZhSVbdlF; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ZhSVbdlF"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ACs5bb018157;
	Thu, 10 Apr 2025 18:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1oD4Gf
	1AXYEjsWVe68UDKFo7+ivIYIIbn8jh/JtKRbY=; b=ZhSVbdlFeC/WjVuZvQrGPC
	KhLbY93FyJsEvWPMtnhNii26kzGFnC1pstkiNqvk08S3pWPdJhbYWCrdjU/7n5Nr
	znoGtMHAKfXh+d+pduUXRzb8j2eGUyP3EKnvSlMWy9oRvUvZxV2UiFgL2XiGHlLX
	gAatoTXWk06jjS8PminW2ptzmBdsZaApgxpmbpdSUf19Oi0mq7PwYp3zA4KJqs6A
	8wQI9pakl4xsTijtmTFpzoAg4hcHPUOKMPffeGlbph4RJVyWXe9VSXivK0iKCQ18
	zJPwvni9oST6UMv3D7XPc6C44N+DxMRDTvorXpXtw+TQTgYXfKNoVSiWhlZcNTog
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x6ca4vta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 18:57:36 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53AIdd94012582;
	Thu, 10 Apr 2025 18:57:36 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x6ca4vt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 18:57:36 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGG3kF011056;
	Thu, 10 Apr 2025 18:57:34 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45uf7yynhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 18:57:34 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53AIvXc832113306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 18:57:34 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A981758052;
	Thu, 10 Apr 2025 18:57:33 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B9E858045;
	Thu, 10 Apr 2025 18:57:30 +0000 (GMT)
Received: from [9.39.24.129] (unknown [9.39.24.129])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 10 Apr 2025 18:57:29 +0000 (GMT)
Message-ID: <d982df07-e7d1-4d4f-a2c3-857901ccc0d0@linux.ibm.com>
Date: Fri, 11 Apr 2025 00:27:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] base/node: Use
 curr_node_memblock_intersect_memory_block to Get Memory Block NID if
 CONFIG_DEFERRED_STRUCT_PAGE_INIT is Set
To: Mike Rapoport <rppt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
References: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>
 <d10d1a9f11e9f8752c7ec5ff5bb262b3f6c6bb85.1744175097.git.donettom@linux.ibm.com>
 <Z_d8T3QtnZVeH3HF@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <Z_d8T3QtnZVeH3HF@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CFVkbiLjaakrR-ewFn3Xpth46p10sYLM
X-Proofpoint-ORIG-GUID: B8pZYdbEVmn0y_4QzAG45MLOFcciV55o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100137


On 4/10/25 1:37 PM, Mike Rapoport wrote:
> On Wed, Apr 09, 2025 at 10:57:57AM +0530, Donet Tom wrote:
>> In the current implementation, when CONFIG_DEFERRED_STRUCT_PAGE_INIT is
>> set, we iterate over all PFNs in the memory block and use
>> early_pfn_to_nid to find the NID until a match is found.
>>
>> This patch we are using curr_node_memblock_intersect_memory_block() to
>> check if the current node's memblock intersects with the memory block
>> passed when CONFIG_DEFERRED_STRUCT_PAGE_INIT is set. If an intersection
>> is found, the memory block is added to the current node.
>>
>> If CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set, the existing mechanism
>> for finding the NID will continue to be used.
> I don't think we really need different mechanisms for different settings of
> CONFIG_DEFERRED_STRUCT_PAGE_INIT.
>
> node_dev_init() runs after all struct pages are already initialized and can
> always use pfn_to_nid().


In the current implementation, if CONFIG_DEFERRED_STRUCT_PAGE_INIT
is enabled, we perform a binary search in the memblock region to
determine the pfn's nid. Otherwise, we use pfn_to_nid() to obtain
the pfn's nid.

Your point is that we could unify this logic and always use
pfn_to_nid() to determine the pfn's nid, regardless of whether
CONFIG_DEFERRED_STRUCT_PAGE_INIT is set. Is that
correct?


>
> kernel_init_freeable() ->
> 	page_alloc_init_late(); /* completes initialization of deferred pages */
> 	...
> 	do_basic_setup() ->
> 		driver_init() ->
> 			node_dev_init();
>
> The next step could be refactoring register_mem_block_under_node_early() to
> loop over memblock regions rather than over pfns.
So it the current implementation

node_dev_init()
     register_one_node
         register_memory_blocks_under_node
             walk_memory_blocks()
                 register_mem_block_under_node_early
                     get_nid_for_pfn

We get each node's start and end PFN from the pg_data. Using these
values, we determine the memory block's start and end within the
current node. To identify the node to which these memory block
belongs,we iterate over each PFN in the range.

The problem I am facing is,

In my system node4 has a memory block ranging from memory30351
to memory38524, and memory128433. The memory blocks between
memory38524 and memory128433 do not belong to this node.

In  walk_memory_blocks() we iterate over all memory blocks starting
from memory38524 to memory128433.
In register_mem_block_under_node_early(), up to memory38524, the
first pfn correctly returns the corresponding nid and the function
returns from there. But after memory38524 and until memory128433,
the loop iterates through each pfn and checks the nid. Since the nid
does not match the required nid, the loop continues. This causes
the soft lockups.

This issue occurs only when CONFIG_DEFERRED_STRUCT_PAGE_INIT
is enabled, as a binary search is used to determine the PFN's nid. When
this configuration is disabled, pfn_to_nid is faster, and the issue does
not seen.( Faster because nid is getting from page)

To speed up the code when CONFIG_DEFERRED_STRUCT_PAGE_INIT
is enabled, I added this function that iterates over all memblock regions
for each memory block to determine its nid.

"Loop over memblock regions instead of iterating over PFNs" -
My question is - in register_one_node, do you mean that we should iterate
over all memblock regions, identify the regions belonging to the current
node, and then retrieve the corresponding memory blocks to register them
under that node?

Thanks
Donet

>   
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>> ---
>>   drivers/base/node.c | 37 +++++++++++++++++++++++++++++--------
>>   1 file changed, 29 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/base/node.c b/drivers/base/node.c
>> index cd13ef287011..5c5dd02b8bdd 100644
>> --- a/drivers/base/node.c
>> +++ b/drivers/base/node.c
>> @@ -20,6 +20,8 @@
>>   #include <linux/pm_runtime.h>
>>   #include <linux/swap.h>
>>   #include <linux/slab.h>
>> +#include <linux/memblock.h>
>> +
>>   
>>   static const struct bus_type node_subsys = {
>>   	.name = "node",
>> @@ -782,16 +784,19 @@ static void do_register_memory_block_under_node(int nid,
>>   				    ret);
>>   }
>>   
>> -/* register memory section under specified node if it spans that node */
>> -static int register_mem_block_under_node_early(struct memory_block *mem_blk,
>> -					       void *arg)
>> +static int register_mem_block_early_if_dfer_page_init(struct memory_block *mem_blk,
>> +				unsigned long start_pfn, unsigned long end_pfn, int nid)
>>   {
>> -	unsigned long memory_block_pfns = memory_block_size_bytes() / PAGE_SIZE;
>> -	unsigned long start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
>> -	unsigned long end_pfn = start_pfn + memory_block_pfns - 1;
>> -	int nid = *(int *)arg;
>> -	unsigned long pfn;
>>   
>> +	if (curr_node_memblock_intersect_memory_block(start_pfn, end_pfn, nid))
>> +		do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
>> +	return 0;
>> +}
>> +
>> +static int register_mem_block_early__normal(struct memory_block *mem_blk,
>> +				unsigned long start_pfn, unsigned long end_pfn, int nid)
>> +{
>> +	unsigned long pfn;
>>   	for (pfn = start_pfn; pfn <= end_pfn; pfn++) {
>>   		int page_nid;
>>   
>> @@ -821,6 +826,22 @@ static int register_mem_block_under_node_early(struct memory_block *mem_blk,
>>   	/* mem section does not span the specified node */
>>   	return 0;
>>   }
>> +/* register memory section under specified node if it spans that node */
>> +static int register_mem_block_under_node_early(struct memory_block *mem_blk,
>> +					       void *arg)
>> +{
>> +	unsigned long memory_block_pfns = memory_block_size_bytes() / PAGE_SIZE;
>> +	unsigned long start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
>> +	unsigned long end_pfn = start_pfn + memory_block_pfns - 1;
>> +	int nid = *(int *)arg;
>> +
>> +#ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
>> +	if (system_state < SYSTEM_RUNNING)
>> +		return register_mem_block_early_if_dfer_page_init(mem_blk, start_pfn, end_pfn, nid);
>> +#endif
>> +	return register_mem_block_early__normal(mem_blk, start_pfn, end_pfn, nid);
>> +
>> +}
>>   
>>   /*
>>    * During hotplug we know that all pages in the memory block belong to the same
>> -- 
>> 2.48.1
>>
