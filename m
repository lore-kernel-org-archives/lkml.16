Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5B242A96
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572441; cv=none; b=fNrPkGY4NNIwdp0H+eX3g4dAKbPhZW8XXwJt9m5cZtSQAnSpCRfeDDU/qAe5A/F/LoxYlg8MuYJfjTmOUdrveLTw070UUuOlfAvdf0EuOrq8yMk66L1VHUUmcERFmT0u04RHWbjMBWu2is2Gzg1D6esmTWs+I2mBp2zG9nUxzGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572441; c=relaxed/simple;
	bh=+d5xi9g6vW5km+N3rMkR1JMirfPLvZmpAundHvmz3iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISPBYPjbmqbiEPFlYvbDVfhzaY03rtjJuphBl3EzqOfOAA0wlAjVvHoSHFhzhObBS2hcjdqYxJyxQA5q/JlyRbmriVm6EzHLPSS4qlHzbrMXb43o+2BqLnsOlnLHj4ZMKYG7vg+E3s0fJ0GYfEsX/fF9V64FxJl0GIonhPo1gG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=XMDUGTsI; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="XMDUGTsI"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ONkUMG025716;
	Fri, 25 Apr 2025 09:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=40PrTU9Pl6DG0oznrHmQPME36hN6eFppb2K1WSBFMa4=; b=XMDUGTsIZsDt
	Jrw2G/gPBxCn/xFqdTccdL6wuhiAow13C8DKXrUjNKRDyZNaac+xdwkL6HhYi2zS
	wppz6SnkSOltCRkNAvgQa8HDdOPV668fOfFHBHE9rUpPIlibLIe02m5jds5St15r
	gEk7Kug5LoT/dh0RgPRWPffL38JnKjDna3SxkRBCtrnLi0WvIlNHOYRPJ1hw3Bet
	/Cs306aBuA2zATYxIrRXuA4vSNVF+DEnrRL236ZjvaOM2CIsfnLlKDUvYidNmR2p
	qF3/bdzoVXf1KYxZlJxfI11xRuUfErE4ZBgYlNssnlW85BkZ+Q03YM4L4tUk3cDP
	4eazdM/p2A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467y90sxkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:13:29 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53P9CKph014843;
	Fri, 25 Apr 2025 09:13:29 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467y90sxkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:13:29 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8WDxv008557;
	Fri, 25 Apr 2025 09:13:28 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jfxvh2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:13:28 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53P9DR5r18744056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 09:13:27 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2286D58060;
	Fri, 25 Apr 2025 09:13:27 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A654F5803F;
	Fri, 25 Apr 2025 09:13:19 +0000 (GMT)
Received: from [9.43.9.122] (unknown [9.43.9.122])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Apr 2025 09:13:19 +0000 (GMT)
Message-ID: <f02e2c1a-e65f-4078-a138-ccf734f84643@linux.ibm.com>
Date: Fri, 25 Apr 2025 14:43:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] sched: Inhibit cache aware scheduling if the
 preferred LLC is over aggregated
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, Peter Zijlstra
 <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        "Gautham R . Shenoy" <gautham.shenoy@amd.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Tim Chen <tim.c.chen@intel.com>,
        Vincent Guittot
 <vincent.guittot@linaro.org>,
        Libo Chen <libo.chen@oracle.com>, Abel Wu <wuyun.abel@bytedance.com>,
        Hillf Danton <hdanton@sina.com>, linux-kernel@vger.kernel.org,
        Len Brown <len.brown@intel.com>, Chen Yu <yu.chen.surf@foxmail.com>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <cover.1745199017.git.yu.c.chen@intel.com>
 <2c45f6db1efef84c6c1ed514a8d24a9bc4a2ca4b.1745199017.git.yu.c.chen@intel.com>
 <cd6065dc-837f-474a-a4f5-0faa607da73a@linux.ibm.com>
 <d221a260-51d5-4dec-8c08-37d27dd80145@intel.com>
 <e45141a1a64d7dcfca2683f56735ba4da60ba19e.camel@linux.intel.com>
Content-Language: en-US
Reply-To: e45141a1a64d7dcfca2683f56735ba4da60ba19e.camel@linux.intel.com
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
In-Reply-To: <e45141a1a64d7dcfca2683f56735ba4da60ba19e.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=aZRhnQot c=1 sm=1 tr=0 ts=680b5239 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pcUInrTLMDQ4R4IrCpkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: fRezSggGYyjgGpAv2xEIpbOWQ21f76lZ
X-Proofpoint-ORIG-GUID: Hs114uIbUKacBXLLh0pIE6463OJHjqcn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NiBTYWx0ZWRfX/eriBh2zjgyJ Mmxeg7WW1AuBqqhzq2AOiEVyI9OgBN/0k5iAIQURHXLfM73nkjPAl/VTfCaNJCXvz7ymfl7lLgw VC3jefc406Xz4E9ySV1o0NobMkGhs2f2rXMZpDo2bdJv1K8MlapvECGsEUy6+Tl7diWquP1IN82
 I4LhKsYCKA4MJgJdwtZqBivDTbff7tv+02WDZ3WgQZBztzvstTf83vKJouPiMZAqkPJIer0obsD o66IKwyVpXZuEUsMrTILpJpLEuQ5cttBMd667eynYxFL2hz4SZOSw7EtjCss0cgBXHC+DHx8VQK zwjGLNPj/g2W96zLFBM5vo6H7yTL57IVB0YgR8U+dXlxa6v1OVkjco738fGAfXMXewtPuRo40Vd
 Qz0AP6IWK0+8QIiFyw7fxO34fl7WkwP7m/u9BP50w4tGo18LfBs4x0ItCcs4N5KwZzXGB1Lv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=673 impostorscore=0 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250066

Hi Tim,

On 24/04/25 21:21, Tim Chen wrote:
> On Thu, 2025-04-24 at 22:11 +0800, Chen, Yu C wrote:
>>
>>> It spawns lot of threads and is CPU intensive. So, I think it's not impacted
>>> due to the below conditions.
>>>
>>> Also, in schbench numbers provided by you, there is a degradation in saturated
>>> case. Is it due to the overhead in computing the preferred llc which is not
>>> being used due to below conditions?
>>
>> Yes, the overhead of preferred LLC calculation could be one part, and we 
>> also suspect that the degradation might be tied to the task migrations. 
>> We still observed more task migrations than the baseline, even when the 
>> system was saturated (in theory, after 25% is exceeded, we should 
>> fallback to the generic task wakeup path). We haven't dug into that yet, 
>> and we can conduct an investigation in the following days.
> 
> In the saturation case it is mostly the tail latency that has regression.
> The preferred LLC has a tendency to have higher load than the
> other LLCs. Load balancer will try to move tasks out and wake balance will
> try to move it back to the preferred LLC. This increases the task migrations
> and affect tail latency.

Why would the task be moved back to the preferred LLC in wakeup path for the
saturated case? The checks shouldn't allow it right?

Thanks,
Madadi Vineeth Reddy

> 
> Tim

