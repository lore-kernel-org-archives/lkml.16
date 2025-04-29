Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37F92BEC2D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935683; cv=none; b=Lc6FvAxmOHoDcFPWE7/AzTALdHqFn076URLr8HRLrZxKXdeaIUWT8xGFJYGPwTIWoA86+j1eZ7vfoxEL6WbC+Tb2Eo5anhehq/0SR1Pz1rp39VL/Uy/gn9CReyGGKCyFR+lGCT9mPb6AWYwJaVDMjPl9r2MjHKPAouzgedp7/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935683; c=relaxed/simple;
	bh=vn36GFjJZ1A1NTowwe4JWwzZyw8NyQKZGayqkcTUxZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYwrHSq51/X1q5L1bKTVLtH6zooOVNIempIcchpoWayWO6ztEe0W+HhsXm32UjxB4MNeR+ckbX+vfXrcSdpt11ckqu5AQsjJVwPt130rE+9eMh2slLH8kPJfxHgrP7yjWG0Vgi4YwfDq9HO9nXIHzHDKQlyvdhVEvNLf4IHdEYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pX843usy; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pX843usy"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T4EUAc028438;
	Tue, 29 Apr 2025 14:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4ANy9/
	EczFuUjhJitpOM30hVh4s65NGc7ToL1CG3Sw4=; b=pX843usywT5bKMtteodxHY
	hGhnsGUFWMlNm+kN9KFOzAOazvLAswxTZK2RtVWZKB0dcWnbadhFca20GoVKFbH9
	GnFKPOzJ4bgrRocwdKgRa+993+/kHZKT21IrnKx9TSeObivLef59/EzrH6ADzLnF
	IvgzlHtFMlAXljpE/fFRVLpcRqL8i6R4wWvFwNfdkH0DZIl5GG3tr8mK9kLN2CwL
	NtzVRoHlLUWfYhqgfR24RnOe+nkYfSvuhchs/0BgIcLYrmnOHE9tl2hl1ioVXwcU
	3yfR8SmdaeJdF9ir958WNYxp9cWlkhJF736LA22oAOpnRenkQCHkkY860mDkPgEw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ah8mbkht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 14:07:38 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53TE2bHa022565;
	Tue, 29 Apr 2025 14:07:38 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ah8mbkhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 14:07:37 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAw0YP024643;
	Tue, 29 Apr 2025 14:07:37 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 469c1m39a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 14:07:37 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53TE7aHj30409312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 14:07:36 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 906C958059;
	Tue, 29 Apr 2025 14:07:36 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14D2958063;
	Tue, 29 Apr 2025 14:07:32 +0000 (GMT)
Received: from [9.39.31.64] (unknown [9.39.31.64])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Apr 2025 14:07:31 +0000 (GMT)
Message-ID: <bad53e57-3186-4945-8d88-10fedc0c9218@linux.ibm.com>
Date: Tue, 29 Apr 2025 19:37:30 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] driver/base: Remove unused functions
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
 <273649393600cb33ac3eec0e9a523c2d1853a47c.1745852397.git.donettom@linux.ibm.com>
 <7b63f0d4-b1d7-4f91-8a80-3a147aeab46a@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <7b63f0d4-b1d7-4f91-8a80-3a147aeab46a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZmZWjSRLsQEqRsPwtZsPTKggjhIdSUD3
X-Proofpoint-GUID: lQdQbucS_1XYMRlz5fd2pX5iH55DPw6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwNSBTYWx0ZWRfX8vxf7gyRJUg7 SBSCa/F5G7bNXthattgvbn7zUEhJpS6m94IluHCg/r8p349NfAOkytxt4hluIk4HbWVWuIIlinu jtowK/QKnqX8PvIBIjUJaLTwtUjxspOaTdZcPPiTQAeirv/d1/51ka2M7iuXaR0usxtr/2Qmf79
 yQgfheHbrb4f7gLM8HfVv3OGkOaQmg1QFqp0v0R/bu8Ac75WAfVjgZGWSjMEOZQ0ySMRpJo9EJm tWnv8HMlK6M3Z1vs8+H1UJ/xBU4AgWJZjBJ1LN7o4c3vy+P+TmKvsYEATX0hEtb2bEv1O7fBdhC tcAc+VdvUkPKiXhjtr7FfThIYPfeqDS6gBW3fR7QzwzXzo6pFTUDVxmaPaZ/5FcrBf11Knx3XHY
 Ctc8HNEY4nqEGUs6F7xki2roHuuB/VyhgrtC9BjSYpssuh62tm7HpPRvP5o1kQzVCz4JI3b/
X-Authority-Analysis: v=2.4 cv=QNRoRhLL c=1 sm=1 tr=0 ts=6810dd2a cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=9b70nzvd1x3ZB6tWZBUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290105


On 4/29/25 2:51 AM, David Hildenbrand wrote:
> On 28.04.25 19:03, Donet Tom wrote:
>
> Nit: I'd call this patch
>
>     "driver/base: remove register_mem_block_under_node_early()"
>
> And then just naturally remove get_nid_for_pfn() with it, as it is the 
> last user and it resides in the same file.

Sure, I will change it.


>
>> The functions register_mem_block_under_node_early and get_nid_for_pfn
>> are not used, as register_memory_blocks_under_node_early is now used
>> to register memory blocks during early boot. Therefore, these unused
>> functions have been removed.
>>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>> ---
>>   drivers/base/node.c | 54 +--------------------------------------------
>>   1 file changed, 1 insertion(+), 53 deletions(-)
>>
>> diff --git a/drivers/base/node.c b/drivers/base/node.c
>> index 4869333d366d..59ec507fc97d 100644
>> --- a/drivers/base/node.c
>> +++ b/drivers/base/node.c
>> @@ -748,15 +748,6 @@ int unregister_cpu_under_node(unsigned int cpu, 
>> unsigned int nid)
>>   }
>>     #ifdef CONFIG_MEMORY_HOTPLUG
>> -static int __ref get_nid_for_pfn(unsigned long pfn)
>> -{
>> -#ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
>> -    if (system_state < SYSTEM_RUNNING)
>> -        return early_pfn_to_nid(pfn);
>> -#endif
>> -    return pfn_to_nid(pfn);
>> -}
>> -
>>   static void do_register_memory_block_under_node(int nid,
>>                           struct memory_block *mem_blk,
>>                           enum meminit_context context)
>> @@ -783,46 +774,6 @@ static void 
>> do_register_memory_block_under_node(int nid,
>>                       ret);
>>   }
>>   -/* register memory section under specified node if it spans that 
>> node */
>> -static int register_mem_block_under_node_early(struct memory_block 
>> *mem_blk,
>> -                           void *arg)
>> -{
>> -    unsigned long memory_block_pfns = memory_block_size_bytes() / 
>> PAGE_SIZE;
>> -    unsigned long start_pfn = 
>> section_nr_to_pfn(mem_blk->start_section_nr);
>> -    unsigned long end_pfn = start_pfn + memory_block_pfns - 1;
>> -    int nid = *(int *)arg;
>> -    unsigned long pfn;
>> -
>> -    for (pfn = start_pfn; pfn <= end_pfn; pfn++) {
>> -        int page_nid;
>> -
>> -        /*
>> -         * memory block could have several absent sections from start.
>> -         * skip pfn range from absent section
>> -         */
>> -        if (!pfn_in_present_section(pfn)) {
>> -            pfn = round_down(pfn + PAGES_PER_SECTION,
>> -                     PAGES_PER_SECTION) - 1;
>> -            continue;
>> -        }
>> -
>> -        /*
>> -         * We need to check if page belongs to nid only at the boot
>> -         * case because node's ranges can be interleaved.
>> -         */
>> -        page_nid = get_nid_for_pfn(pfn);
>> -        if (page_nid < 0)
>> -            continue;
>> -        if (page_nid != nid)
>> -            continue;
>> -
>> -        do_register_memory_block_under_node(nid, mem_blk, 
>> MEMINIT_EARLY);
>> -        return 0;
>> -    }
>> -    /* mem section does not span the specified node */
>> -    return 0;
>> -}
>> -
>>   /*
>>    * During hotplug we know that all pages in the memory block belong 
>> to the same
>>    * node.
>> @@ -895,10 +846,7 @@ void register_memory_blocks_under_node(int nid, 
>> unsigned long start_pfn,
>>   {
>>       walk_memory_blocks_func_t func;
>>   -    if (context == MEMINIT_HOTPLUG)
>> -        func = register_mem_block_under_node_hotplug;
>> -    else
>> -        func = register_mem_block_under_node_early;
>> +    func = register_mem_block_under_node_hotplug;
>>         walk_memory_blocks(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn - 
>> start_pfn),
>>                  (void *)&nid, func);
>
> You can pass func directly here and avoid the temporary variable.

ok. I will change it.

>
> Very nice!
>
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks David

I will address the review comments and submit the next version.

