Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519B71DFDE
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746107773; cv=none; b=ZeWpUpGUaELqIosoL1+RWfKCbcQ3VkUHH7Nq07a9/br+rZlo0tm1iwr/lDnbZiJp8vPuLVJI6NGNyEABy4vQRvXvbOSKANPTkL3tfqHE28Nbz1aw7M+695nh/RE+hGVmEFg446QaIe3ZHw85l5aEnDIDMBtA0B14H8zDkqd2Tk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746107773; c=relaxed/simple;
	bh=DhkoW9RkyZ+9a2ueSNfSUUN6wE8TS82ye9futa56RiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4Tkd6iPZCRnWcT3yKs2SsHr5cWNSvc26BRoXbzGKhjlTaVo7ykeOtsH6UCvW0qaWx02rGaOgSKqkNmOuvOuytoHRcHmXVDgAMBY/cQFb3l/TLLPUipKma1O/ODmKVOGWevOqJTaEHxCqJrTdP7Zu0u7xVFCQQGEV1to746Sk8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=isctNGub; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="isctNGub"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541Bp0Co011326;
	Thu, 1 May 2025 13:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=FdABLb
	GXU3xjbqcTCkxai/8AK3Ss9JYpvaFeHCIzyVM=; b=isctNGub2RIa4/fRulxz4X
	ZUkoeQHvKXrP9zn7wvmIX8ZLlLGs8zIDxLx0pwG33WOLw5e6wduuhcceRG37zygj
	2JszmqR5NGmsLoLLQ9g5jCfBC6KgRfEQm1qLF6jPw05mTB5GpQV9tKGubckdI9jN
	xupc5naLgXRSupi4JF56rVZVBG8HL+GZbkls8FhGGwSRZ1qMbJj+moX74LXEOCgB
	WK+YOCNCXeWJXj0Wm8ZjRlHuyGVyf8zTCg4+dAs6yMszXOrbRULtIjXLb0w0gmBD
	DgWAI1ilR+vovEvVQulT3fwM0B4i9wXmpqpsBqIwEzLpDpHb9zCeQv1xF9RvdtAg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46c7ds90aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 13:55:51 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 541Dnp4L023350;
	Thu, 1 May 2025 13:55:50 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46c7ds90as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 13:55:50 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 541DbFin031662;
	Thu, 1 May 2025 13:55:49 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4699tudgkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 13:55:49 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 541DtniD30278344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 13:55:49 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6177058057;
	Thu,  1 May 2025 13:55:49 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9C5358059;
	Thu,  1 May 2025 13:55:44 +0000 (GMT)
Received: from [9.39.16.182] (unknown [9.39.16.182])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 May 2025 13:55:44 +0000 (GMT)
Message-ID: <719c495f-d514-43f5-814d-e956e149f836@linux.ibm.com>
Date: Thu, 1 May 2025 19:25:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] driver/base: Optimize memory block registration to
 reduce boot time
To: Oscar Salvador <osalvador@suse.de>
Cc: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
 <aBHTeeAWtlrt4gN8@localhost.localdomain>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <aBHTeeAWtlrt4gN8@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=afZhnQot c=1 sm=1 tr=0 ts=68137d67 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=w-oE209dy2xqcs4eIbgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: DEm5KhvvTcQ4t8u_nclR-1t6-z4GG_AB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDEwMyBTYWx0ZWRfXzGNSYvEEJuHX RTsgRPQzK5bSc4xeV+2rl3JyqxqjMJlwPOWwS/C3FmLM4x1mupIAJ0h2jJn5x6Bv6b1jk1kSlbS aDMTgi96AhkKC663dyFRfO+yuwmhgS5ccagJ7ixin8drnDww5ZSqFBz0Dm1ebGDM+Ej3msIcXEK
 q6jcNwQIsinUT4wHk7bDBT7AwYNPnEUR/zuFaQBT/4CtC+RqGn+wvVKgUZUTCJLqS5PAXeEYRFk tPn1ec8KyFz+lYLjnmUDjGXJfaBNh2gwrTy6cpcN4mJeslj3OTFMTUf6UYu/Cpjzgg3lJ9XPE1d csbtCDw/sXjoVFR0NP6Rxg4aY7tDk5MBSzNl95rKkd0Y6cWgcJPsXrwAfbmenNTtDTMIg5PPsN5
 xN88ia+NQzF4fCiE/aCoX6NNsIv00wp3Ui1ffm7C4EY2B8g1K/NWh3m0W/7f+v7HQnFN4QAA
X-Proofpoint-GUID: EjgKDxAJQet6KACIEkPTCDye5aidXw1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 mlxlogscore=978 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505010103


On 4/30/25 1:08 PM, Oscar Salvador wrote:
> On Mon, Apr 28, 2025 at 10:33:46PM +0530, Donet Tom wrote:
>> During node device initialization, `memory blocks` are registered under
>> each NUMA node. The `memory blocks` to be registered are identified using
>> the node’s start and end PFNs, which are obtained from the node's pg_data
>>
> Hi Donet,
>
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
> That is pretty impressive.
>
>> +void register_memory_blocks_under_node_early(int nid)
>> +{
>> +	struct memblock_region *r;
>> +	unsigned long start_block_id;
>> +	unsigned long end_block_id;
>> +	struct memory_block *mem;
>> +	unsigned long block_id;
>> +
>> +	for_each_mem_region(r) {
>> +		if (r->nid == nid) {
>> +			start_block_id = phys_to_block_id(r->base);
>> +			end_block_id = phys_to_block_id(r->base + r->size - 1);
>> +
>> +			for (block_id = start_block_id; block_id <= end_block_id; block_id++) {
>> +				mem = find_memory_block_by_id(block_id);
>> +				if (!mem)
>> +					continue;
> I would just mention what David already said here, reduce identation,
> and maybe declare the variables where they are needed. It might be clearer.


Sure, I will change it.

>> +
>> +				do_register_memory_block_under_node(nid, mem, MEMINIT_EARLY);
>> +				put_device(&mem->dev);
> I will comment on the "context" on patch#2.
>
>> +void register_memory_blocks_under_node_early(int nid);
> static void ... ?

Yes, We can make it as static. I will add it in next version.


Thanks
Donet


>
>
