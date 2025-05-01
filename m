Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399E72F37
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746112558; cv=none; b=nsJvunlHXgPzYAQJluzt/m2bNWPeKBnuiiWPT0B69lilnL1Jx6dX9mI902RyWYeCFQUnE1aL4UqrWh12O0exJY7U1AOs1H9jJ1itsGHj/cpHj3xkn5C+QYiU6WFxcgmdizn72rxlDmpZWrpkDAWOSZthOXZAK4WjVZb6rMn1S2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746112558; c=relaxed/simple;
	bh=4KBIm5nkYVus8R7BrxuZbayz+ft7a5XY9VfuSEmLdwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjKfG6fecOrBqajviGQFBQAL9p9Yt4MUAcacexJCkXjaKJUB4vocLPt4PhKJXbAPl6n/AWx3SK4Jf0TU0w2l7hAQwFZGupezZmS45ZN0NtsfSVouSjsndNZyAGWfHd6t6RRXtWjgkJqtzQwmNaE8Ioo12EAm7Qu2qc1RVsEIAN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mC2Bjjsd; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="mC2Bjjsd"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541BpWcU012535;
	Thu, 1 May 2025 15:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+iTVmW
	agILWyumnwhCZ4bL1Yi+HwaNcsx/q07FdFKoE=; b=mC2Bjjsd3k4fBTzCdayb40
	gKBsnmF5GMZK/U7QrHA5bdZD4PFbFph6WX4WXm/4GM14nCfxNUEvqB4koOmTTjBQ
	sx440Os55sETekua6d2QxCbbVYzpx1vt5KIg7F8FLuUfaOSVlQuDBkyz956DpSYK
	lSfguED1MS74pDZXTSSk15w/PNWrIcjAGdtxzcyTi4pOlipVsm2uXIJ5UdOFEoYK
	t3eF6c4N/9CkJ8pPcd3IMamGeCJam0ggsIcbWcrOPgMD54jdcH78+M0d8JIyZjOb
	fU9ns2LGJiEoro59U85K/cJhx4YnBx9eEJkVozDjjVGH9N2DLCitFGnQcbkDv/MQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46c7ds9c9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 15:15:37 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 541FFbS6003669;
	Thu, 1 May 2025 15:15:37 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46c7ds9c9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 15:15:37 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 541DOBuB031617;
	Thu, 1 May 2025 15:15:36 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4699tudthp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 15:15:36 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 541FFZ4Q6750898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 15:15:35 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B16A358057;
	Thu,  1 May 2025 15:15:35 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94F5D58063;
	Thu,  1 May 2025 15:15:30 +0000 (GMT)
Received: from [9.39.16.182] (unknown [9.39.16.182])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 May 2025 15:15:30 +0000 (GMT)
Message-ID: <2534e3fe-cb4d-4753-a714-6d0bc8a51040@linux.ibm.com>
Date: Thu, 1 May 2025 20:45:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] driver/base: Remove unused functions
To: Zi Yan <ziy@nvidia.com>
Cc: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
 <273649393600cb33ac3eec0e9a523c2d1853a47c.1745852397.git.donettom@linux.ibm.com>
 <0EBDDF27-E05A-43D2-834D-987D6228A516@nvidia.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <0EBDDF27-E05A-43D2-834D-987D6228A516@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=afZhnQot c=1 sm=1 tr=0 ts=68139019 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=DEEYPtLpCerEZFQj_3sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: kOzxZK8LJaDxNzy1KlKzBvNMAF7PiG2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDExNCBTYWx0ZWRfXxS2OkTofEvMv W00Ab7X+I+WFKriySoIXqmtB3JpfNkZodBC9TTiFphVl0AgP0ZNf1fM9EGqPMyBzrpa1k7DcQDF eCJvFESnJxENXoQpXWzexYX/sNv7a7ER26hUN+5ykI0BSfSxafkw4DO9LYpjE5fvQ6AuugHJDLm
 ciLq93G5fXwqqqMJVz2dJwgWEi175945m1jx5VcXh6a3vSoDF+jjK7Lhg+K/QDn3vWvSQ9ApoHh 4WXxuWXFu6f460shIScRuV83wnSMAHqYN4U7Y6+gXnMoCLrQHP7ZeCnaCrQl5JE4GzJ0gzGDIJ4 d1J5zJdOZ3Vsoy0yVwrGbPQwpaSD/xuYG4QPIim2/RlLavTA2DvFJXmJLDe0jFNUqO9DnST+pfx
 O8yRTLto5AaC0ZQiLZ3V/0mhkrrU5z7Sn2o0QKrUDl4+yZLVDQNvT+Eg8lYQTFIZVtRYHgit
X-Proofpoint-GUID: yZtKorS_n4ezgUzMQYsy4Kz7-C6nxbvB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505010114


On 5/1/25 8:38 PM, Zi Yan wrote:
> On 28 Apr 2025, at 13:03, Donet Tom wrote:
>
>> The functions register_mem_block_under_node_early and get_nid_for_pfn
>> are not used, as register_memory_blocks_under_node_early is now used
>> to register memory blocks during early boot. Therefore, these unused
>> functions have been removed.
>>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>> ---
>>   drivers/base/node.c | 54 +--------------------------------------------
>>   1 file changed, 1 insertion(+), 53 deletions(-)
>>
>> diff --git a/drivers/base/node.c b/drivers/base/node.c
>> index 4869333d366d..59ec507fc97d 100644
>> --- a/drivers/base/node.c
>> +++ b/drivers/base/node.c
>> @@ -748,15 +748,6 @@ int unregister_cpu_under_node(unsigned int cpu, unsigned int nid)
>>   }
>>
>>   #ifdef CONFIG_MEMORY_HOTPLUG
>> -static int __ref get_nid_for_pfn(unsigned long pfn)
>> -{
>> -#ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
>> -	if (system_state < SYSTEM_RUNNING)
>> -		return early_pfn_to_nid(pfn);
>> -#endif
>> -	return pfn_to_nid(pfn);
>> -}
>> -
>>   static void do_register_memory_block_under_node(int nid,
>>   						struct memory_block *mem_blk,
>>   						enum meminit_context context)
>> @@ -783,46 +774,6 @@ static void do_register_memory_block_under_node(int nid,
>>   				    ret);
>>   }
>>
>> -/* register memory section under specified node if it spans that node */
>> -static int register_mem_block_under_node_early(struct memory_block *mem_blk,
>> -					       void *arg)
>> -{
>> -	unsigned long memory_block_pfns = memory_block_size_bytes() / PAGE_SIZE;
>> -	unsigned long start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
>> -	unsigned long end_pfn = start_pfn + memory_block_pfns - 1;
>> -	int nid = *(int *)arg;
>> -	unsigned long pfn;
>> -
>> -	for (pfn = start_pfn; pfn <= end_pfn; pfn++) {
>> -		int page_nid;
>> -
>> -		/*
>> -		 * memory block could have several absent sections from start.
>> -		 * skip pfn range from absent section
>> -		 */
>> -		if (!pfn_in_present_section(pfn)) {
>> -			pfn = round_down(pfn + PAGES_PER_SECTION,
>> -					 PAGES_PER_SECTION) - 1;
>> -			continue;
>> -		}
>> -
>> -		/*
>> -		 * We need to check if page belongs to nid only at the boot
>> -		 * case because node's ranges can be interleaved.
>> -		 */
>> -		page_nid = get_nid_for_pfn(pfn);
>> -		if (page_nid < 0)
>> -			continue;
>> -		if (page_nid != nid)
>> -			continue;
>> -
>> -		do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
>> -		return 0;
>> -	}
>> -	/* mem section does not span the specified node */
>> -	return 0;
>> -}
>> -
>>   /*
>>    * During hotplug we know that all pages in the memory block belong to the same
>>    * node.
>> @@ -895,10 +846,7 @@ void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>>   {
> Should this function be renamed to register_memory_blocks_under_node_hotplug
> to reflect its current implementation?

Yes, we can rename it since it will only be called during hotplug. I will add it in next version.

Thanks
Donet


>
>>   	walk_memory_blocks_func_t func;
>>
>> -	if (context == MEMINIT_HOTPLUG)
>> -		func = register_mem_block_under_node_hotplug;
>> -	else
>> -		func = register_mem_block_under_node_early;
>> +	func = register_mem_block_under_node_hotplug;
>>
>>   	walk_memory_blocks(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn - start_pfn),
>>   			   (void *)&nid, func);
>> -- 
>> 2.48.1
>
> --
> Best Regards,
> Yan, Zi
>
