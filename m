Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5417278E46
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371441; cv=none; b=hQxmIKe1EVmkfv6fqXwpGlFJbY75O/Qc51zNQ5co5UgFDMHGvJIktsWB/RKdH+9TLLhV7u9vmkAE310MtIi2waOfDSwiMd+vNKp4wG+PTYO0Us/fVOhwureXh7aGFh36bYjgXWChZTcNN6VPAlJVLT8NOSUoVvZTvds/B1wNojE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371441; c=relaxed/simple;
	bh=CailYlHgBC8txkaTlq+l0C7SNO9DzamN0KAJFhduUus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JCm8o6SxCaYuRcpruCamt2T0xQkvY62txcLQ2FYIgqrWuozpvc+RsA5je3nAku8QD+91q+fl7OjX7JY95JhKkcRcpvQgEykq/bfnBG0xBdWBJJxrzFCJOK5GEc+i7nVDQnbqIuohyj3tp4GslM+gI6ybOr6YLE6lCSJ5tcEcS68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=VoTcC6/5; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="VoTcC6/5"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B933rc015662;
	Fri, 11 Apr 2025 11:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BmZPnt
	gvfl27mWIyxMQDncIr25/8cD9rmiYzjWrEz5w=; b=VoTcC6/5xlyo7W/OP6VCcl
	mOCg3ff2RnkcFE7WBxGIhqlThMizaWMPvFy5qWaUQaiPBHKVOLZ2LuQzQEpS47uR
	guKM+U0WoGg6Tm/qPHlyrChUcxnQCc58sNeEWlm3Ew71/1M62IiBU7JEjiPHuNNU
	vQN3M1c9iTifqPHUul5LBDV96BrOhsCwyeX6WBy//pNm+OpNIXpNkJVe/ULdQkms
	Zxt5MGrSjhXZ6Mr3m1xUAFfPLPCu/uBQZxSOnWhzKcBplws4ZQLEtIdBQ4u0MmuB
	pDAYyOSB2lfNnzzAGsgaLJk67MFpEMYsA3/iaCFOPdOStTIhXLbU3TRk0jQpnNqQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45xn5qk6hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 11:37:04 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53BBULrp013208;
	Fri, 11 Apr 2025 11:37:03 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45xn5qk6hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 11:37:03 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53B9IQGE011326;
	Fri, 11 Apr 2025 11:37:03 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45uf802wet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 11:37:03 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53BBb2u526345940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 11:37:02 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5067958059;
	Fri, 11 Apr 2025 11:37:02 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6371858055;
	Fri, 11 Apr 2025 11:36:57 +0000 (GMT)
Received: from [9.39.23.113] (unknown [9.39.23.113])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Apr 2025 11:36:56 +0000 (GMT)
Message-ID: <736ca451-8adc-4c5c-b721-6b78eaeb4699@linux.ibm.com>
Date: Fri, 11 Apr 2025 17:06:55 +0530
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
 <d982df07-e7d1-4d4f-a2c3-857901ccc0d0@linux.ibm.com>
 <Z_j2Gv9n4DOj6LSs@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <Z_j2Gv9n4DOj6LSs@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mtakEuySGcSKWr_NqyBXWFLuGDbjXQx8
X-Proofpoint-GUID: prRr8UbKd-vsewIenwE0iua1WZ0Hxt90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110073


On 4/11/25 4:29 PM, Mike Rapoport wrote:
> On Fri, Apr 11, 2025 at 12:27:28AM +0530, Donet Tom wrote:
>> On 4/10/25 1:37 PM, Mike Rapoport wrote:
>>> On Wed, Apr 09, 2025 at 10:57:57AM +0530, Donet Tom wrote:
>>>> In the current implementation, when CONFIG_DEFERRED_STRUCT_PAGE_INIT is
>>>> set, we iterate over all PFNs in the memory block and use
>>>> early_pfn_to_nid to find the NID until a match is found.
>>>>
>>>> This patch we are using curr_node_memblock_intersect_memory_block() to
>>>> check if the current node's memblock intersects with the memory block
>>>> passed when CONFIG_DEFERRED_STRUCT_PAGE_INIT is set. If an intersection
>>>> is found, the memory block is added to the current node.
>>>>
>>>> If CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set, the existing mechanism
>>>> for finding the NID will continue to be used.
>>> I don't think we really need different mechanisms for different settings of
>>> CONFIG_DEFERRED_STRUCT_PAGE_INIT.
>>>
>>> node_dev_init() runs after all struct pages are already initialized and can
>>> always use pfn_to_nid().
>>
>> In the current implementation, if CONFIG_DEFERRED_STRUCT_PAGE_INIT
>> is enabled, we perform a binary search in the memblock region to
>> determine the pfn's nid. Otherwise, we use pfn_to_nid() to obtain
>> the pfn's nid.
>>
>> Your point is that we could unify this logic and always use
>> pfn_to_nid() to determine the pfn's nid, regardless of whether
>> CONFIG_DEFERRED_STRUCT_PAGE_INIT is set. Is that
>> correct?
> Yes, struct pages should be ready by the time node_dev_init() is called
> even when CONFIG_DEFERRED_STRUCT_PAGE_INIT is set.

ok.

Thanks Mike.

>   
>>> kernel_init_freeable() ->
>>> 	page_alloc_init_late(); /* completes initialization of deferred pages */
>>> 	...
>>> 	do_basic_setup() ->
>>> 		driver_init() ->
>>> 			node_dev_init();
>>>
>>> The next step could be refactoring register_mem_block_under_node_early() to
>>> loop over memblock regions rather than over pfns.
>> So it the current implementation
>>
>> node_dev_init()
>>      register_one_node
>>          register_memory_blocks_under_node
>>              walk_memory_blocks()
>>                  register_mem_block_under_node_early
>>                      get_nid_for_pfn
>>
>> We get each node's start and end PFN from the pg_data. Using these
>> values, we determine the memory block's start and end within the
>> current node. To identify the node to which these memory block
>> belongs,we iterate over each PFN in the range.
>>
>> The problem I am facing is,
>>
>> In my system node4 has a memory block ranging from memory30351
>> to memory38524, and memory128433. The memory blocks between
>> memory38524 and memory128433 do not belong to this node.
>>
>> In  walk_memory_blocks() we iterate over all memory blocks starting
>> from memory38524 to memory128433.
>> In register_mem_block_under_node_early(), up to memory38524, the
>> first pfn correctly returns the corresponding nid and the function
>> returns from there. But after memory38524 and until memory128433,
>> the loop iterates through each pfn and checks the nid. Since the nid
>> does not match the required nid, the loop continues. This causes
>> the soft lockups.
>>
>> This issue occurs only when CONFIG_DEFERRED_STRUCT_PAGE_INIT
>> is enabled, as a binary search is used to determine the PFN's nid. When
>> this configuration is disabled, pfn_to_nid is faster, and the issue does
>> not seen.( Faster because nid is getting from page)
>>
>> To speed up the code when CONFIG_DEFERRED_STRUCT_PAGE_INIT
>> is enabled, I added this function that iterates over all memblock regions
>> for each memory block to determine its nid.
>>
>> "Loop over memblock regions instead of iterating over PFNs" -
>> My question is - in register_one_node, do you mean that we should iterate
>> over all memblock regions, identify the regions belonging to the current
>> node, and then retrieve the corresponding memory blocks to register them
>> under that node?
> I looked more closely at register_mem_block_under_node_early() and
> iteration over memblock regions won't make sense there.
>
> It might make sense to use for_each_mem_range() as top level loop in
> node_dev_init(), but that's a separate topic.

Yes, this makes sense to me as well. So in your opinion, instead of adding
a new memblock search function like I added , it's better to use
|for_each_mem_range()| in|node_dev_init()|, which would work for all
cases—regardless of whether|CONFIG_DEFERRED_STRUCT_PAGE_INIT| is set or
not. Right?


>   
>> Thanks
>> Donet
>>
