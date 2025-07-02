Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0DF16419
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461229; cv=none; b=kI6nodFYfgIIY+a6t6vJ4qlFuazQuK7ktHs+DOEoIXVnAf8+xMew4HAxKr7hHAIh1CjHi/4f4xCqiqsmpOc6cK87ObS77cGJbnvSrBBkSOUMJkKIUT9bJXOAX8CrowuApLALxWwwO5O+6L+TsvNL3gS85/9VRckwCfuoQWHCRCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461229; c=relaxed/simple;
	bh=Yk9qC/IYj4Usq6fCJCPVpqbiT9Jx2NXRdkYpUbmh0/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eoUzkXIAMXJ9/Qr9u6ubd08GA5p09lh3I0GHT9JgtovlUCg6JN9mlGaTOmdzXtOq/T8WArXvWxzgwkBY7Y4BIyP4WoeI32jql6OQEdgzwxWp6tTimPFT0ULqsYAd2RRQND/SefuHzjp0DU6uTDQoLhqE3DXIUGceIwFiQOabp+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=fb9g8+7z; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="fb9g8+7z"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562CJuXK024196;
	Wed, 2 Jul 2025 13:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bLlw0I
	hp/VdZCZ2+GtdOUnEATEqBJuEkrFclzXEetRc=; b=fb9g8+7z/kMBWRIEKq5TiI
	enlqcXvyptw0aW6wKGj0i/5Z80aQg8nmfidUY1aq2S5RZQ2lJQgnIuEQt5fqBFbv
	3eQO56WMFz7hN3i1qdqGPR60PmJhkPTrkiG5q8lP1ACir6zaBTExlOQim7njybp8
	yduomSmZsauM2FIWTFge8TOgHWbvDB8LGmhawlVRUUcCYoq5JM6h3BSIjPzfcN5C
	FV8xbUO2ES7BRfHdaZEmwUuQhOjdO8ZexFgkkANGLhdjNXBuOJMzIAj2xbWMovc0
	RQNmlG8Ry+LCDVST/SGFNMHrK76iAwxsn5zTxobpBMuNWghDLOz5nWMvLZDUHq4g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j84ddj86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 13:00:04 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 562CMYS6028163;
	Wed, 2 Jul 2025 13:00:04 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j84ddj81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 13:00:03 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 562B3OpB012027;
	Wed, 2 Jul 2025 13:00:02 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47jv7myg0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 13:00:02 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 562D01g07144110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 13:00:02 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3F3658052;
	Wed,  2 Jul 2025 13:00:01 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D80E58056;
	Wed,  2 Jul 2025 12:59:57 +0000 (GMT)
Received: from [9.109.245.113] (unknown [9.109.245.113])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Jul 2025 12:59:57 +0000 (GMT)
Message-ID: <83012fcc-36ca-41fe-8e2e-949f1ba8adf3@linux.ibm.com>
Date: Wed, 2 Jul 2025 18:29:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/base/node: Handle error properly in
 register_one_node()
To: Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
References: <20250702112856.295176-1-donettom@linux.ibm.com>
 <aGUqQbybFXd6uJu-@localhost.localdomain>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <aGUqQbybFXd6uJu-@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KsvhkdlY5mZVFFCwx_OZVlYOTrN9kZJI
X-Proofpoint-GUID: CODY8eJDmmBxGMhQC2uqcGZLUk512KwG
X-Authority-Analysis: v=2.4 cv=Ib6HWXqa c=1 sm=1 tr=0 ts=68652d54 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=rKeXGq08CVa402lCTmoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEwMCBTYWx0ZWRfX3hT/yjabbT3i w/gdG81JKjWeRY4nV949pIJZDhff9p1NgP7Ku529LOfV4LGMRRmxYAAjbJ1bamjdZe3Yod7YlVS pRBaJ8yFMuj269SNSwp5M01PXzjkfS7HTVWBxwsaQ6iKdkSGpvZ02CN/ep15xk+steqpOTeZsWV
 uflasJ8/57Ep0FVSryBCMGSa8DJDudBIoaIokFEGjjM6zZm1XfRNi26DCG/y8Mw/tgOi3ftfMud XGq4U/dlbKDUUzvC004ZRRizXBiJA8L7Z75iZyXC9j043lhaaofi8hvECe0/V8Qxjq+UOUnM33R rASaq6yySQbVvzKt46fsXc6wdW+soOa216/TKi42aCdaWshhVXfBTjMBoPeyRMBSrf1fKf7O7u2
 TDB5WnN44T2Cn+3ZowPXVPVOFE6FJJJYiYDvSi/Fie1R1TbThON/lp9f+qVULgxeyOs1ZbRM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=842 lowpriorityscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020100


On 7/2/25 6:16 PM, Oscar Salvador wrote:
> On Wed, Jul 02, 2025 at 06:28:56AM -0500, Donet Tom wrote:
>> If register_node() returns an error, it is not handled correctly.
>> The function will proceed further and try to register CPUs under the
>> node, which is not correct.
>>
>> So, in this patch, if register_node() returns an error, we return
>> immediately from the function.
>>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>> ---
>>
> ...
>> diff --git a/drivers/base/node.c b/drivers/base/node.c
>> index bef84f01712f..aec991b4c0b2 100644
>> --- a/drivers/base/node.c
>> +++ b/drivers/base/node.c
>> @@ -885,6 +885,8 @@ int register_one_node(int nid)
>>   	node_devices[nid] = node;
>>   
>>   	error = register_node(node_devices[nid], nid);
>> +	if (error)
>> +		return error;
> Ok, all current callers (based on mm-unstable) panic or BUG() if this fails,
> but powerpc, in init_phb_dynamic(), which keeps on going.
> Unless it panics somewhere down the road as well.
>
> So I think we need to:
>
>   node_devices[nid] = NULL
>   kfree(node)
>
>   ?


Yes, I will add this too.

But one question: if register_node() fails, is it okay to continue, or 
should we panic?

What is the correct way to handle this?


> Also, once Hannes fix lands, we might need that as well.
>
> Anyway, I'd suggest you hold on until Hannes fix lands, so we can later
> rebase all your mem-hotplug on top of that [1].

Sure


>
> [1] https://lore.kernel.org/linux-mm/86f89a65-f0f6-4462-9eea-ac691de2f3b6@suse.de/T/#mbf392eb390b8053f96be50da3b40dfd9b62dd389
>
>
