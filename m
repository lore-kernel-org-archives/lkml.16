Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142715223
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805268; cv=none; b=b9URIoC5KJH0yMGayOEotLVEaScTccpuTzyXEJia4j8LeCv6XNEUlI7EOirwAOiNyPyG6RI9C+V/+K+rTIBsifKTmWFR1p4lYBCuVA+ecZ1NdIosQSa7qAGfgw/coGmAGnUTXns0pcS6mOJKz3UhPHgXNIg5B5CvR9/dn3Z8AeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805268; c=relaxed/simple;
	bh=8LVQA1kGsDH4xPMp3EaHebk+RPKOZ0f711LW4mB3xSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7VF4zI6jtlVpKf/5Be/AI95Hn5LrQFZ8z2ETsE7Iqr8CQpB+yWmhX4GrnlJSF5NCoo+TRiMUH++GoX1Uf8gXUwyJH4DJi3CEigDRKuXmb3n3GNKDEYBhOxLK3j+0A7u1W37jwiy87FnaW/Bf5v1/2p53OxWxZP1ky/IYzKCJ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hB5hJo6F; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hB5hJo6F"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549DUACr029559;
	Fri, 9 May 2025 15:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pmSKL4
	D4kH+Gt6bFEcGGXb0xIWjN2YDtb8WLtaVT54o=; b=hB5hJo6F5cVfibmDNrlQI6
	TQ7WDbnoenMOKEEyxn/Q+QR4whVr7zkfPKYN7Wk5UYKfyk8SNROE9hrUiJDINcXW
	a0kow/XgfLkl0GFUpNt2s8Yj0fRdJ6gg2A8q8mycT8afMSdj/mL9hJ4uOGsD0TKX
	LvqySclbIPYmRi3iinBOcgwB6a16Id+5trrMExNF1umjjNxOd586OFr2wE7Y45Gg
	LZAcL0eseuQ7V0SpWgZr7lA9qBhxyhK3u2MFw7LXTmBTogobQ9QcS9pm4PtSKDN/
	qtS93tkUU2vpjWgrlS30iVrbnT4QLHI0f4Aj/vZ351o5kGpRVZUdVkaq1scpBxUw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46h6k0mak9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 15:40:43 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 549FYoIJ009045;
	Fri, 9 May 2025 15:40:43 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46h6k0mak4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 15:40:43 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 549E1SUt014583;
	Fri, 9 May 2025 15:40:42 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dypm3wkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 15:40:42 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 549FefQS15598152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 15:40:41 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99EBB58043;
	Fri,  9 May 2025 15:40:41 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAB9258053;
	Fri,  9 May 2025 15:40:36 +0000 (GMT)
Received: from [9.124.209.250] (unknown [9.124.209.250])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 May 2025 15:40:36 +0000 (GMT)
Message-ID: <d19ad41c-069d-436d-8fea-a05188adcb0e@linux.ibm.com>
Date: Fri, 9 May 2025 21:10:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration to
 reduce boot time
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <aBdK2EIMYYRmmEwA@kernel.org>
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
 <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
 <aBhoqpC4Jy-c-74p@localhost.localdomain>
 <74c500dd-8d1c-4177-96c7-ddd51ca77306@redhat.com>
 <aBhuZWpZ7ltMuOe0@kernel.org>
 <8180a50d-eebe-4f9b-9ce8-d886654a992d@redhat.com>
 <aBi8Iqp27jXLUWfs@kernel.org>
 <78bc6a1b-164e-4925-a624-a271a4499364@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <78bc6a1b-164e-4925-a624-a271a4499364@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uZaB9WtL4eQ4mY4iz0NpmkauIXeMA1hl
X-Proofpoint-ORIG-GUID: JBUuPV6qFmy1fGheTknIVlXLho2ryNpA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1NCBTYWx0ZWRfX9xQDvNYZD6SJ v7hiPtAHyzz301hFpLNdoQ1AXXZAvniOtN8bpFbXhWZsbMuu7EVhTBuHKnbBoGEnh5vIydBD/Z/ kJttl7zjbil7T1IT47kktq3J48jyu+U5iBWf8V06wMoORphcen00URkz1B2cGWJTn6Ng1BEvYsS
 NFUloD8jbQzDV+F1i6q0q80mfCYO/LyAwBvux6M18wyTZ6IqwxXiVeoB8wgtwcf034N4mGgW16R 33zL13yTDg6dN2BTcXnAviXNQm+YZokSucIJy4/FRVaJoqDnvOywCVeaNBkXRcYdHSzDV6m4ryh zzU74xeszmaYCwqPCEbghiQQdfsGEfbqBqYZh9FDjSYmL2e7dd4XP+q2GnZNFxKqCSO+GE9wF06
 yTBCxvA0DMaC7PwsO74O6/D2tD3+HvRGulfL+IrK0p5iRwU7oQ13ssOqmEQSIWHldZWLz9GF
X-Authority-Analysis: v=2.4 cv=OcCYDgTY c=1 sm=1 tr=0 ts=681e21fb cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=erVvInnpyg78pcfNAL4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=792 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090154


On 5/8/25 2:48 PM, David Hildenbrand wrote:
> On 05.05.25 15:24, Mike Rapoport wrote:
>> On Mon, May 05, 2025 at 10:18:43AM +0200, David Hildenbrand wrote:
>>> On 05.05.25 09:53, Mike Rapoport wrote:
>>>> On Mon, May 05, 2025 at 09:38:43AM +0200, David Hildenbrand wrote:
>>>>> On 05.05.25 09:28, Oscar Salvador wrote:
>>>>>> On Mon, May 05, 2025 at 09:16:48AM +0200, David Hildenbrand wrote:
>>>>>>> memory hotplug code never calls register_one_node(), unless I am 
>>>>>>> missing
>>>>>>> something.
>>>>>>>
>>>>>>> During add_memory_resource(), we call __try_online_node(nid, 
>>>>>>> false), meaning
>>>>>>> we skip register_one_node().
>>>>>>>
>>>>>>> The only caller of __try_online_node(nid, true) is 
>>>>>>> try_online_node(), called
>>>>>>> from CPU hotplug code, and I *guess* that is not required.
>>>>>>
>>>>>> Well, I guess this is because we need to link the cpus to the node.
>>>>>> register_one_node() has two jobs: 1) register cpus belonging to 
>>>>>> the node
>>>>>> and 2) register memory-blocks belonging to the node (if any).
>>>>>
>>>>> Ah, via __register_one_node() ...
>>>>>
>>>>> I would assume that an offline node
>>>>>
>>>>> (1) has no memory
>>>>> (2) has no CPUs
>>>>>
>>>>> When we *hotplug* either memory or CPUs, and we first online the 
>>>>> node, there
>>>>> is nothing to register. Because if there would be something, the 
>>>>> node would
>>>>> already be online.
>>>>>
>>>>> In particular, try_offline_node() will only offline a node if
>>>>>
>>>>> (A) No present pages: No pages are spanned anymore. This includes
>>>>>       offline memory blocks.
>>>>> (B) No present CPUs.
>>>>>
>>>>> But maybe there is some case that I am missing ...
>>>>
>>>> I actually hoped you and Oscar know how that stuff works :)
>>>
>>> Well, I know how the memory side works, but the CPU side is giving 
>>> me a hard
>>> time :)
>>>
>>>>
>>>> I tried to figure what is going on there and it all looks really 
>>>> convoluted.
>>>
>>> Jap ...
>>>
>>>>
>>>> So, on boot we have
>>>>     cpu_up() ->
>>>>         try_online_node() ->
>>>>                bails out because all nodes are online (at least on
>>>>             x86 AFAIU, see 1ca75fa7f19d ("arch/x86/mm/numa: Do
>>>>                           not initialize nodes twice"))
>>>>     node_dev_init()i ->
>>>>         register_one_node() ->
>>>>             this one can use __register_one_node() and loop
>>>>             over memblock regions.
>>>>
>>>> And for the hotplug/unplug path, it seems that
>>>> register_memory_blocks_under_node(MEMINIT_EARLY) is superfluous, 
>>>> because if
>>>> a node had memory it wouldn't get offlined, and if we are 
>>>> hotplugging an
>>>> node with memory and cpus, memory hotplug anyway calls
>>>> register_memory_blocks_under_node_hotplug().
>>>>
>>>> So, IMHO, register_one_node() should not call
>>>> register_memory_blocks_under_node() at all, but again, I might have 
>>>> missed
>>>> something :)
>>>
>>> Hm, but someone has to create these links for the memory blocks.
>>
>> My understanding that the links for the memory blocks during hotplug 
>> are created in
>>
>> add_memory_resource()
>>    register_memory_blocks_under_node()
>
> Yes, during hotplug it's exactly that, after registering the node + 
> setting it online.
>
>>
>> So register_one_node() only calls register_memory_blocks_under_node() 
>> when
>> there are no actual memory resources under that node, isn't it?
>
> Except in early boot. That's why register_one_node() has:
>
>     register_memory_blocks_under_node(nid, start_pfn, end_pfn,
>                       MEMINIT_EARLY);
>
>                         ^ early :)
> And that is triggered by
>
>     node_dev_init()->register_one_node()
>
>
>>
>> Then we can drop the call to register_memory_blocks_under_node() from
>> register_one_node() and add creation of memory blocks to 
>> node_dev_init(),
>> i.e.
>>
>> node_dev_init()
>>    for_each_node(nid)
>>      __register_one_node(nid)
>>        for_each_mem_region()
>>          /* create memory block if node matches */
>
> Yes exactly, that makes sense.

Hi Andrew and Mike

Based on the discussion so far, it is clear that the patch will work in all cases,
including when CONFIG_ARCH_KEEP_MEMBLOCK  is disabled. Just checking —
would you prefer to take this version, or should I send a v4?

Thanks
Donet

