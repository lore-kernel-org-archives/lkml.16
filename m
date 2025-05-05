Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA291F91C8
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746463276; cv=none; b=D61kzMXeSGdBUXGbFoPyGLmQBS71eKZ6rp665m6FE86icZqY3lSofFtIrBsXAbsQhkN4qz+8fQm4ITY+P1lvU/uqHU0Vy5QotxTTYX0FA5xxbQgy8d5RbASd/CghDA7cHsJDBqfz/gZYXl6qCUDDEg0VtF3ShllVKAPccNAYVkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746463276; c=relaxed/simple;
	bh=ArMoZRVipMIUAd3nFnVhXu70o0iQ7j374vjV9HAjVWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hvor6BAg/rrp7hPkRs4ay9Fu6ylhwfZgTkCpL6Y+dOFHDpNroEw3eiHGxhePhUrfkwoDLlLsUsIrpA1NYJy3gkvXcU01Frqwu3zSd301m6V3nD3QElRmORo4t3iABIN8mmPCG9T7XutFN9AsjPD+ojRwjdjFW+ZpkLOdDgxv4IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BRrfNcBk; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BRrfNcBk"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545DY5eC007052;
	Mon, 5 May 2025 16:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cganpC
	bDdntqnxcgcUYl7360gDJQTt8vOtXsDdCXm84=; b=BRrfNcBk1qq1pvXgG3rR+A
	31F4SA6pqFZs/dIfwI96bHfkRbap8S5JIMGRf0MoEnd5hjjZ+m57l0s/nTj77srF
	ZEUA/OHV1E/dpxhZauMJLazPPm3vwkgpmzAMVuIcr84pXP5dpISmKmCHwmYuGIVa
	XRrd8VR82AUrir30ImzkjCgiVEhhg7++MN8KoVWCMmzKiOYD6tq90TV8VA1ONxkg
	sigNIfgBhu73DPIiU4uPKwpR6cIb7/5KjYR4kwHMZa+Jeqj21y302eXiooC4dyUv
	YKFXbcLBA1NTee7eZ6iaqWVkIdbeiB+kFWq7/qHXl0xU2wrrVgZDAYtX9kklGZrA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ej6yut31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 16:40:56 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 545GcXi6017809;
	Mon, 5 May 2025 16:40:56 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ej6yut2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 16:40:56 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 545D1NDL032227;
	Mon, 5 May 2025 16:40:55 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxymf063-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 16:40:55 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 545Ges7n27263606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 16:40:54 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89ADE58052;
	Mon,  5 May 2025 16:40:54 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DF5958050;
	Mon,  5 May 2025 16:40:49 +0000 (GMT)
Received: from [9.124.223.213] (unknown [9.124.223.213])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 16:40:49 +0000 (GMT)
Message-ID: <24a9480b-f494-4e55-82b8-e5443c694c9e@linux.ibm.com>
Date: Mon, 5 May 2025 22:10:47 +0530
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
 <b539ce77-e994-422d-92fc-2c9505cc26a1@linux.ibm.com>
 <a8f66175-dd1b-427c-9980-3a376a3c2fb0@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <a8f66175-dd1b-427c-9980-3a376a3c2fb0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 98sQ5pMNPMqrOYqdCbKvgThF9mTB0e7F
X-Authority-Analysis: v=2.4 cv=GKAIEvNK c=1 sm=1 tr=0 ts=6818ea18 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=_R2tS7T5d_6P1SSXrE0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: svVsZz5VUUelt6SYY01Cg74ggQ6770Vo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE1OCBTYWx0ZWRfX1boN9EwqKh6u JIwM1jHk1L91sQnX/Uh2VazAOQ2Juc8zGtVfWIsA5bZ/I2HoeewgbRHqQ/0j2g8oafCa902A7YA RsQFg9egkAOH+mJmJ71q4qB1DveFif4keN6ADiuD2HcKVn+7GkwWRHci4pwIRHLdV0Izm2OZIvr
 1LH5QpPJU2qbk7qgbS/tNJgoD9Uplqksa9S3MGk7Wjf71YfmfKVbif3TWlgarx2q7VFcXjh/rk7 ODuBm8yY7g6Y8++80Ahn77N6xqPaClDBayV90+oBRMAaKjRCfuupT5UonJg5xPbaV/XJx+7vlfm Csi5U1NG02d7WJpp3F7wEk3ojknwJE1w/5tRBk7AWY4bri2f7ExHRq6KhKX24HBN69tqcDTg7Lg
 qNZOeH7ddDYmeO78Ym1V/MTh0cM1G5X2SDR+JWryerVTU77LMRxDrE/yz1dCcvQaPUJNIxT6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=946 adultscore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050158


On 5/5/25 6:32 PM, David Hildenbrand wrote:
> On 05.05.25 14:51, Donet Tom wrote:
>>
>> On 5/5/25 4:06 PM, David Hildenbrand wrote:
>>> On 05.05.25 11:36, Oscar Salvador wrote:
>>>> On Mon, May 05, 2025 at 10:12:48AM +0200, David Hildenbrand wrote:
>>>>> Assume you hotplug the second CPU. The node is already
>>>>> registered/online, so
>>>>> who does the register_cpu_under_node() call?
>>>>>
>>>>> It's register_cpu() I guess? But no idea in which order that is
>>>>> called with
>>>>> node onlining.
>>>>>
>>>>> The code has to be cleaned up such that onlining a node does not
>>>>> traverse
>>>>> any cpus / memory.
>>>>>
>>>>> Whoever adds a CPU / memory *after onlining the node* must 
>>>>> register the
>>>>> device manually under the *now online* node.
>>>>
>>>> So, I think this is the sequence of events:
>>>>
>>>> - hotplug cpu:
>>>>     acpi_processor_hotadd_init
>>>>      register_cpu
>>>>       register_cpu_under_node
>>>>
>>>>     online_store
>>>>      device_online()->dev_bus_online()
>>>>       cpu_subsys->online()
>>>>        cpu_subsys_online
>>>>         cpu_device_up
>>>>          cpu_up
>>>>           try_online_node  <- brings node online
>>>>            ...
>>>>            register_one_node <- registers cpu under node
>>>>           _cpu_up
>>>
>>> My thinking was, whether we can simply move the
>>> register_cpu_under_node() after the try_online_node(). See below
>>> regarding early.
>>>
>>> And then, remove the !node_online check from register_cpu_under_node().
>>>
>>> But it's all complicated, because for memory, we link a memory block
>>> to the node (+set the node online) when it gets added, not when it
>>> gets onlined.
>>>
>>> For CPUs, we seem to be creating the link + set the node online when
>>> the CPU gets onlined.
>>>
>>>>
>>>> The first time we hotplug a cpu to the node, note that
>>>> register_cpu()->register_cpu_under_node() will bail out as node is 
>>>> still
>>>> offline, so only cpu's sysfs will be created but they will not be 
>>>> linked
>>>> to the node.
>>>> Later, online_store()->...->cpu_subsys_online()->..->cpu_up() will
>>> take> care of 1) onlining the node and 2) register the cpu to the node
>>> (so,
>>>> link the sysfs).
>>>
>>>
>>> And only if it actually gets onlined I assume.
>>>
>>>>
>>>> The second time we hotplug a cpu,
>>>> register_cpu()->register_cpu_under_node() will do its job as the 
>>>> node is
>>>> already onlined.
>>>> And we will not be calling register_one_node() from 
>>>> __try_online_node()
>>>> because of the same reason.
>>>>
>>>> The thing that bothers me is having register_cpu_under_node() spread
>>>> around.
>>>
>>> Right.
>>>
>>>> I think that ideally, we should only be calling
>>>> register_cpu_under_node()
>>>> from register_cpu(), but we have this kinda of (sort of weird?) 
>>>> relation
>>>> that even if we hotplug the cpu, but we do not online it, the numa 
>>>> node
>>>> will remain online, and so we cannot do the linking part (cpu <-> 
>>>> node),
>>>> so we could not really only have register_cpu_under_node() in
>>>> register_cpu(), which is the hot-add part, but we also need it in the
>>>> cpu_up()->try_online_node() which is the online part.
>>>
>>> Maybe one could handle CPUs similar to how we handle it with memory:
>>> node gets onlined + link created as soon as we add the CPU, not when
>>> we online it.
>>>
>>> But likely there is a reason why we do it like that today ...
>>>
>>>>
>>>> And we cannot also remove the register_cpu_under_node() from
>>>> register_cpu() because it is used in other paths (e.g: at boot time ).
>>>
>>> Ah, so in that case we don't call cpu_up ... hm.
>>>
>>> Of course, we can always detect the context (early vs. hotplug).
>>> Maybe, we should split the early vs. hotplug case up much earlier.
>>>
>>> register_cpu_early() / register_cpu_hotplug() ... maybe
>>
>> Hi David and Oscar,
>>
>> I was thinking that __try_online_node(nid, true) being called from
>> try_online_node() might cause issues with this patch. From the
>> discussion above, what I understand is:
>>
>> When try_online_node() is called, there are no memory resources
>> available for the node, so register_memory_blocks_under_node()
>> has no effect. Therefore, our patch should work in all cases.
>
> Right, it's simply unnecessary to perform the lookup ... and confusing.
>
>>
>> Do you think we need to make any changes to this patch?
>
> Probably not to this patch (if it's all working as expected), but we 
> should certainly look into cleaning that all up.


Thanks. I'll also check the cleanup part.


