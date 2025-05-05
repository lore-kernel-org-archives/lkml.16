Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB28227EBB
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746449505; cv=none; b=DEkOAbelKDGxAzLmEowwist7SOEltiHNMJXKFbZ9YG92tT1f6dZDrdXQ3d6IEJhfT6hK+RRuKrvxS7DnwPEczDup6hrG64+ZRsDkqyBeeugDyY4ZKFEEMDy5/lkun7wxX7AP/s5QO3bxmUqoUUGFaM1z/MyG2REdPOvt5eBB9o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746449505; c=relaxed/simple;
	bh=FoBIp4eZZUPth4U6Z8BrTi5mS/VqDvY2PiNsSfCw0IY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nagkrZRSksKg2CKzzW5QCdjmYMiWbWc8l44Di9AJr6OrErRYNBq7bt677oSOW/uJtfICK/Ao26v1humCjnXgVfTGhB8OxipaXOxWMF0eQQCq8gR+r7oNy0yxBxyH7qX/gKVqDbls9nbCJEgjpxhLlb++7KTE3R6RuNemsJ8wC2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=JCW8JfVX; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="JCW8JfVX"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545C5DNr007806;
	Mon, 5 May 2025 12:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dyhw/F
	IP+Ggm5eJ5avMrVAF3kLS/rap+JLAS6WAosgI=; b=JCW8JfVXwhmjO0Rzx6PLAh
	SbywPWhxcSwR8HLTKaxaMwDwif5X5J+OB6OkIt6T/003Ev9Q9kq/P2BI6lswX03t
	LO9cUU3s5C8SN0fnTva5PqhkbaHm7/JsWIKysl7i+o49HlePWl1NarLHXXZ76Ixp
	g5pDYN86wIp4aac1lzI94GoD3U17bfpfdo5oJPfbIVh0yu7fsZzJDQveqbPp0SII
	O71v0RDkkkK9xmT7YeTf7FenaLaX6mINiqz83bmdxYiIi6uNixCQUnX3JiqChm6n
	+dFiigDYObszjdlhu6k+R2L6tUlkHYLoGb796LIGix+2sJebYwJf3AqWD/DTs6RA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egcv2w0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 12:51:20 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 545CnHFa018659;
	Mon, 5 May 2025 12:51:19 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egcv2w0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 12:51:19 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5458gwKP032220;
	Mon, 5 May 2025 12:51:18 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxyme4tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 12:51:18 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 545CpIbw30540396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 12:51:18 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 733E958050;
	Mon,  5 May 2025 12:51:18 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F34F58054;
	Mon,  5 May 2025 12:51:13 +0000 (GMT)
Received: from [9.124.223.213] (unknown [9.124.223.213])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 12:51:13 +0000 (GMT)
Message-ID: <b539ce77-e994-422d-92fc-2c9505cc26a1@linux.ibm.com>
Date: Mon, 5 May 2025 18:21:11 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration to
 reduce boot time
To: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>
Cc: Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>,
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
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
 <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
 <aBhoqpC4Jy-c-74p@localhost.localdomain>
 <74c500dd-8d1c-4177-96c7-ddd51ca77306@redhat.com>
 <aBhva9D6H5BtkSID@localhost.localdomain>
 <0e568e33-34fa-40f6-a20d-ebf653de123d@redhat.com>
 <aBiGquz1Exx8KUqq@localhost.localdomain>
 <da921072-64a8-4ef1-b583-763406e57e8b@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <da921072-64a8-4ef1-b583-763406e57e8b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fHabdSf_RQKPP6W4SqXRBmrzMUryeuL0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEyMSBTYWx0ZWRfX20roR/65sH0s FF0KlBjk6J2d0t8pEQ3XgJo+8ufB6iWh+gClrD1PVrbsxNglzRL8/9sicdDI5aPZ0ph5XqWLRF/ hyJ/yBV70MbhYJZ2xRVJ9PpwVKeeeksL+wfWDhVNhGczROvAQSQmwAev2khPWIjkNIsM1G6+u5q
 DuR8avyB24XpiaqTTUNMT95lCm3tpW3wG1XFCZ/evcb7xkdYHwkBTdF0NX3H29NlY/ZKJJvCyaT 5WKjV6+nPHP1wTOYVI08x5DzlpH9Hu0Cjgu4zxiEQgJTSdLulb4mkW1JZ2AcyPhZ/vp3QhJFt1y DezIhe6JbVrL8C7OyjJZxUkPGphvmDvAftYoATIP0Fo9E33BixfmeN2pZAuC/o2DVrGAAs1NYiy
 5fKGgM1ChMkBKpdQ7n73/92LjHn4NtKSeCjziw1QoE1TvbeAnuJ3AOb6ttDFmzFbk7g2yTdq
X-Authority-Analysis: v=2.4 cv=O7k5vA9W c=1 sm=1 tr=0 ts=6818b448 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=ndBISzoNWe6kelugQUgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: QKkbnFU8QpeYtmkXTH4Jskx9DvAdOo9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050121


On 5/5/25 4:06 PM, David Hildenbrand wrote:
> On 05.05.25 11:36, Oscar Salvador wrote:
>> On Mon, May 05, 2025 at 10:12:48AM +0200, David Hildenbrand wrote:
>>> Assume you hotplug the second CPU. The node is already 
>>> registered/online, so
>>> who does the register_cpu_under_node() call?
>>>
>>> It's register_cpu() I guess? But no idea in which order that is 
>>> called with
>>> node onlining.
>>>
>>> The code has to be cleaned up such that onlining a node does not 
>>> traverse
>>> any cpus / memory.
>>>
>>> Whoever adds a CPU / memory *after onlining the node* must register the
>>> device manually under the *now online* node.
>>
>> So, I think this is the sequence of events:
>>
>> - hotplug cpu:
>>    acpi_processor_hotadd_init
>>     register_cpu
>>      register_cpu_under_node
>>
>>    online_store
>>     device_online()->dev_bus_online()
>>      cpu_subsys->online()
>>       cpu_subsys_online
>>        cpu_device_up
>>         cpu_up
>>          try_online_node  <- brings node online
>>           ...
>>           register_one_node <- registers cpu under node
>>          _cpu_up
>
> My thinking was, whether we can simply move the 
> register_cpu_under_node() after the try_online_node(). See below 
> regarding early.
>
> And then, remove the !node_online check from register_cpu_under_node().
>
> But it's all complicated, because for memory, we link a memory block 
> to the node (+set the node online) when it gets added, not when it 
> gets onlined.
>
> For CPUs, we seem to be creating the link + set the node online when 
> the CPU gets onlined.
>
>>
>> The first time we hotplug a cpu to the node, note that
>> register_cpu()->register_cpu_under_node() will bail out as node is still
>> offline, so only cpu's sysfs will be created but they will not be linked
>> to the node.
> > Later, online_store()->...->cpu_subsys_online()->..->cpu_up() will 
> take> care of 1) onlining the node and 2) register the cpu to the node 
> (so,
>> link the sysfs).
>
>
> And only if it actually gets onlined I assume.
>
>>
>> The second time we hotplug a cpu,
>> register_cpu()->register_cpu_under_node() will do its job as the node is
>> already onlined.
>> And we will not be calling register_one_node() from __try_online_node()
>> because of the same reason.
>>
>> The thing that bothers me is having register_cpu_under_node() spread
>> around.
>
> Right.
>
>> I think that ideally, we should only be calling 
>> register_cpu_under_node()
>> from register_cpu(), but we have this kinda of (sort of weird?) relation
>> that even if we hotplug the cpu, but we do not online it, the numa node
>> will remain online, and so we cannot do the linking part (cpu <-> node),
>> so we could not really only have register_cpu_under_node() in
>> register_cpu(), which is the hot-add part, but we also need it in the
>> cpu_up()->try_online_node() which is the online part.
>
> Maybe one could handle CPUs similar to how we handle it with memory: 
> node gets onlined + link created as soon as we add the CPU, not when 
> we online it.
>
> But likely there is a reason why we do it like that today ...
>
>>
>> And we cannot also remove the register_cpu_under_node() from
>> register_cpu() because it is used in other paths (e.g: at boot time ).
>
> Ah, so in that case we don't call cpu_up ... hm.
>
> Of course, we can always detect the context (early vs. hotplug). 
> Maybe, we should split the early vs. hotplug case up much earlier.
>
> register_cpu_early() / register_cpu_hotplug() ... maybe

Hi David and Oscar,

I was thinking that __try_online_node(nid, true) being called from
try_online_node() might cause issues with this patch. From the
discussion above, what I understand is:

When try_online_node() is called, there are no memory resources
available for the node, so register_memory_blocks_under_node()
has no effect. Therefore, our patch should work in all cases.

Do you think we need to make any changes to this patch?

Thanks
Donet

