Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B952C08BD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619308; cv=none; b=HGT4T4yH4YwRYDkDcAg+HCIHuqpOHNxxw0jHIPFmzxQDuj9s4XWFomz1V/LYiY34/qnEXqp3B7MxteGeUm26NOZKqD5QZyKXqeUd+2zd9MvRGGGDksn4J/y78dfLuMevRsoibMO0k42BxD/YJn7QQfihOv39LZOrJZXAwPqc1wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619308; c=relaxed/simple;
	bh=5e9YmOrF+yauugH979/6Fj56dvkw2eXr/TUK7GbUvhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tS6Io7gTZWNu7NY96LIN42gadLVmQWAshjDraGAJIhX0+Thx6d1qU0SmANRlOoNV/C198s4551Siii4YJ5axZ5z72VRO0xVX7AmBo1FP7dOlQz1U/STDnYgZI7qfhrW8WoGB6E4jbFbkYvBu0AtC+M+w1JtigbuHD2rBJX7EoYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FpgXQUs5; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FpgXQUs5"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563Lhph8024760;
	Fri, 4 Jul 2025 08:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=oFnlQ9
	GLR/vnaNs5Y01VloVuiZlAxCGFdO5R4ACWAWc=; b=FpgXQUs5PYvsIW1chwaOSF
	VXocs7Lch2QWtYdNeVvffjjL0nWWcPwuUw8+B7zp7wT64HLKktrg/x4IYmZYXXTL
	geYwrUZsjUgXDT52XATIBgxBSEYzNq9CWqMnERn3eywWqflf82V8cC0BMDuBdy5Z
	tliRGYQFMI4FRHKMMy9dsh5Ba+ruUNC3/lg+x+qi7fQpEPAXiMTPizqVpfqXSr6v
	SXJEgo7//1pH9dt8nhw58gH5y9rR30KNizHjCIiucQy3JeqP0W2XMOPe/ko+5MFT
	7t8h9suFwM7DwNO3+HI6WZ7Zu6DVo+LB9/sn7cuqSC6FqEt7JRsqF6ysC+3DiSbQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j5ttrha0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 08:54:48 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5648sQFp031144;
	Fri, 4 Jul 2025 08:54:48 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j5ttrh9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 08:54:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 564657gu032152;
	Fri, 4 Jul 2025 08:54:47 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47ju411825-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 08:54:47 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5648sjeJ52494688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Jul 2025 08:54:45 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34E8020043;
	Fri,  4 Jul 2025 08:54:45 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6059F20040;
	Fri,  4 Jul 2025 08:54:41 +0000 (GMT)
Received: from [9.124.214.122] (unknown [9.124.214.122])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  4 Jul 2025 08:54:41 +0000 (GMT)
Message-ID: <bef73a72-a75d-4c10-9b60-ff16990a682e@linux.ibm.com>
Date: Fri, 4 Jul 2025 14:24:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 01/20] sched: Cache aware load-balancing
To: Peter Zijlstra <peterz@infradead.org>, "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Tim Chen <tim.c.chen@intel.com>,
        Vincent Guittot
 <vincent.guittot@linaro.org>,
        Libo Chen <libo.chen@oracle.com>, Abel Wu <wuyun.abel@bytedance.com>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
        Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        "Gautham R . Shenoy" <gautham.shenoy@amd.com>,
        Tim Chen <tim.c.chen@linux.intel.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <cbe56cb89cca4c3ddcbc9956a82bda23f5b81c57.1750268218.git.tim.c.chen@linux.intel.com>
 <b4cce11c-5ed6-4366-92c6-9a6b34998295@linux.ibm.com>
 <ba7f6c16-919a-4261-8677-056072572fc9@intel.com>
 <20250704084547.GF2001818@noisy.programming.kicks-ass.net>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250704084547.GF2001818@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nMKKwJkYfEvPTbGDqM5ZOmLPE1NgzEyE
X-Authority-Analysis: v=2.4 cv=UtNjN/wB c=1 sm=1 tr=0 ts=686796d8 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VCUguZmZTeiwaa9eHzUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: plmXPuTAue74cvkpMZ5PubHFONFlQ8yH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2NyBTYWx0ZWRfX9wUzMp63QOSN qUf01cP54xdReVdOQ9z37gKe3m3YeVwcxQE1Nj9K5ziZM3swTMBmWxEfYEFIsLmIdJT0C3Svc5n ov8alTpOGrUOaax3Pz2RB4c+kNbuGGh9BbVjmPTDuHtXSLotltavC+8l4N/BuwpAWzpTdW42FIJ
 vHZgyzOoNAIJQ2Sd6iO+xA/Xcp4tWw7CzE6dfVM3APMPrTHsAOpIIs5iC7a8fLoMv3oHSO6jscR p/j8UMSvERe+kDoibdF+x/FlIIjX3zWAmB6tQH6lVRXohdi3ZYnOCWuneonYjXRavrIZYTWckAi xrXyn7hcVo6+rrLjLM9fr+sc0A1COsU970J/Sz0hnUGHGi5op5eVJSK0P1jboxn8mYV7ydKaiP+
 knMbfjWK9lEFMdk3ONKrt63hgn+pcbg4t63N4w2gsAzzo6/wM2ezTKblAnvEbMX3YNZF0aIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040067



On 7/4/25 14:15, Peter Zijlstra wrote:
> On Fri, Jul 04, 2025 at 04:40:39PM +0800, Chen, Yu C wrote:
> 
>>>> @@ -953,6 +953,10 @@ config NUMA_BALANCING
>>>> ?????????????? This system will be inactive on UMA systems.
>>>> +config SCHED_CACHE
>>>> +?????? bool "Cache aware scheduler"
>>>> +?????? default y
>>>> +
>>>
>>> Should it depend on EXPERT?
>>> IMO this could add quite a bit of overhead and maybe n by default?
>>>
>>
>> I would leave this to Peter and Tim to decide.
> 
> Runtime controls are always better than compile time. Distros will have
> no choice but to enable the config option.
> 
> But that is not the kind of thing you start a series with. First
> versions didn't even have the config option. First you make it work,
> then later you worry about silly detail.
> 

Ok Makes sense.
