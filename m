Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FA21A3178
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 03:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744861215; cv=none; b=Ds85N2Fmy12RLMvbnbvlcrZBMFq6ERWv58l7s78j3e9z7O8kTN/BEdI/9gT9IsKbXTmU5TyxGY0y9zh3jJ7Vq5ejg3VQvzebFwPsG50Nles7kHblOW4Q/AoXQCYICPrKS/Svma2yow9BHj1rbVl7s9Bf8LkMh9rBC8hcOyC2ghI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744861215; c=relaxed/simple;
	bh=1M4SOT/4H0Bok87PRjL91DtCm9xWMNTBMhX9RDNz3Us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpFH59W5Limf2xXmqNhyqCrYb92Q1833QzKul8UdJfReL0piu+6CY1vW6/+LTmp5pKsbiw/WDMx4uA5NyxzWuXvWLQuUNcxBLvAaxu7s3kikfP1KaVx8Vda8Yx0ggfAfFapoStKYuK2EK4QCLrVSYZHtcvJcus+buSOo6Q4xKKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qWmxmloB; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qWmxmloB"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GL1f1v022092;
	Thu, 17 Apr 2025 03:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TbjA8s
	qvu359E9B340NYZYoEtx4dQkAa4vKonMhawYM=; b=qWmxmloBo/XVbCTN0BfEes
	KkyZdxRS61s06Dmh/EAL7ShU4I3mZJEDRejnBBFf6yP1reqQgcBrmm/aRlSWPa60
	M9g9ABJuLqW1qEbEyMOvGPq4eYWzDuHbkH5Sc85wWyZMaKT20eDCSD1Pg/5GJp86
	RYnidkkdghDNKn8mCMSsf8tsSGdH+lbH8wZBn577Y8HDTJZIT/vwwD3EvWLmxsD3
	WPYOvZw+hvvKu6yHWZiuNJMGYeJrUV4lZxPKrI8Z/gAddyP5XvKQRDdqoN6wvppO
	MeR1gccDitwdHzZQLTF1W2h2Ul1zQ2VYPlTfOxeTSK6dYchSX7BMKdJ+x+9LjwGg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462m3t1ajr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 03:40:03 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53H1iEnE030888;
	Thu, 17 Apr 2025 03:40:03 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4603gnuurj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 03:40:03 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53H3e2SX6619740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 03:40:02 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 828FB58059;
	Thu, 17 Apr 2025 03:40:02 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 806ED58061;
	Thu, 17 Apr 2025 03:40:00 +0000 (GMT)
Received: from [9.43.101.188] (unknown [9.43.101.188])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 17 Apr 2025 03:40:00 +0000 (GMT)
Message-ID: <46291879-83d4-4e03-9c3a-74872e44b0d6@linux.ibm.com>
Date: Thu, 17 Apr 2025 09:09:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sched/numa: Add ability to override task's
 numa_preferred_nid.
To: Chris Hyser <chris.hyser@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@techsingularity.net>,
        "longman@redhat.com" <longman@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <20250415013625.3922497-1-chris.hyser@oracle.com>
 <37d018ac-ddb2-46c8-908e-9924f0f74e0c@linux.ibm.com>
 <SA2PR10MB47145047CBF0AE1B6E099E299BBD2@SA2PR10MB4714.namprd10.prod.outlook.com>
Content-Language: en-US
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
In-Reply-To: <SA2PR10MB47145047CBF0AE1B6E099E299BBD2@SA2PR10MB4714.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RiHptBmYF4tnAob42k8SkZUZCRNswi45
X-Proofpoint-GUID: RiHptBmYF4tnAob42k8SkZUZCRNswi45
X-Authority-Analysis: v=2.4 cv=W6g4VQWk c=1 sm=1 tr=0 ts=68007813 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=xthQermQjH29dx7nFH0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 adultscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504170025

On 17/04/25 02:43, Chris Hyser wrote:
>> From: Madadi Vineeth Reddy
>> Sent: Wednesday, April 16, 2025 3:00 AM
>> To: Chris Hyser
>> Cc: Peter Zijlstra; Mel Gorman; longman@redhat.com; linux-kernel@vger.kernel.org; Madadi Vineeth Reddy
>> Subject: Re: [PATCH 1/2] sched/numa: Add ability to override task's numa_preferred_nid.
>>
>>
>> Hi Chris,
>>
>> On 15/04/25 07:05, Chris Hyser wrote:
>>> From: chris hyser <chris.hyser@oracle.com>
>>>
>>
>> [..snip..]
>>
>>> The following results were from TPCC runs on an Oracle Database. The system
>>> was a 2-node Intel machine with a database running on each node with local
>>> memory allocations. No tasks or memory were pinned.
>>>
>>> There are four scenarios of interest:
>>>
>>> - Auto NUMA Balancing OFF.
>>>      base value
>>>
>>> - Auto NUMA Balancing ON.
>>>      1.2% - ANB ON better than ANB OFF.
>>>
>>> - Use the prctl(), ANB ON, parameters set to prevent faulting.
>>>      2.4% - prctl() better then ANB OFF.
>>>      1.2% - prctl() better than ANB ON.
>>>
>>> - Use the prctl(), ANB parameters normal.
>>>      3.1% - prctl() and ANB ON better than ANB OFF.
>>>      1.9% - prctl() and ANB ON better than just ANB ON.
>>>      0.7% - prctl() and ANB ON better than prctl() and ANB ON/faulting off
>>>
>>
>> Are you using prctl() to set the preferred node id for all the tasks of your run?
>> If yes, then how `prctl() and ANB ON better than prctl() and ANB ON/faulting off`
>> case happens?
> 
> Not every task in the system (including some DB tasks) has a prctl() set preferred node as the expected preference is not always known. So that is part of it, however the bigger influence even with a prctl() set preferred node, is that faulting drives physical page migration.  You only want to migrate pages that the task is accessing. The fault tells you it was accessed and what node it is currently in allowing a migration decision to be made.
> 

Yes, understood.

>> IIUC, when setting preferred node in numa_preferred_nid_force, the original
>> numa_preferred_nid which is derived from page faults will be a nop which should
>> be an overhead.
> 
> As mentioned above faulting drives physical page migration with the usual trade-off between faulting overhead and the benefits of consolidating pages on the same node. 
> 
> One issue I've seen repeatably is that if you monitor a task (numa fields in /proc/<pid>/sched) some tasks keep changing their preferred node. This makes sense since spatial access locality can change over time, but you also see the migrated page count going up independent of which node is currently preferred. So on a two node system, there are pages being migrated back and forth (not necessarily the same ones). One possible effect of forcing the preferred node is that it isn't changing and migrated pages should be going the same way. 
> 
>> Let me know if my understanding is correct. Also, can you tell how to set the
>> parameters of ANB to prevent faulting.
> 
> Basically, I set the sampling periods to a large number of seconds. Sampling frequency then is 1/large is ~0. Monitoring the task again, it should show no NUMA faults and no pages migrated. 
> 
> kernel.numa_balancing : 1
> scan_period_max_ms: 4294967295
> scan_period_min_ms: 4294967295
> scan_delay_ms: 4294967295
>

Got it. Thanks for the explanation.

Thanks,
Madadi Vineeth Reddy
 
> -chrish

