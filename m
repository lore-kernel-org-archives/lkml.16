Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88D142A87
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749045359; cv=none; b=PNhi3CvWEPZ6ozJvbo025oi415l9DO63ETXMSESgIfs7n/FzoE+sLplPJ/cXLT8akAXn+E+TaVIBnM+wTgJaEUgHHYzoPvB4XsykCDWx5wJukV4BEU4m2CSqYVo9XwpEkB1Z8EXV7fTrAtPRHRCsXUzNvDblo/WE3Ol9rP6SOtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749045359; c=relaxed/simple;
	bh=KyiPMuosabdU3oCmvSRf372wEEqxqO3Vn4L93cRFGZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6TeMHEPFXUt2s1tsciL/C9aSoTjWlkQHe8W+iPTAoHafZK8jedTbywAtztuf8qqOukyCt6VaXGy6UJ2A3Vw1opduQY074a3XQIUoHSoMk9HNbNf6YV1R3zObUbPsRd03YaV0HGNn1dLYujBT3lYDtHijEozKiUnT0b13zHdL0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=NQFmVrS2; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="NQFmVrS2"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5545LKEP017615;
	Wed, 4 Jun 2025 13:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Sm20ok
	PBPxXIFoUn+cXS10G2Ahu6SboCq2VjfA4YNnM=; b=NQFmVrS2UU4Crl0bQXJfAW
	KvY2B1ZibXY+4L44r7YTc57lEV5k49xFMTosdvqqk11exVFyA2kKLKr4cXH4cOrh
	HWMMkM5V6lzfzeL14ZzUZko64gFWJAzGVtXJ+UZvaxThKyeUtQTmiL6OFx+2d7uJ
	mLq2PHAsB6dqdXQRzfNG6xybLMXwedsO8b6ych14aFHI5PRF6eiU3z1b9/P+4+uU
	8nXZ04mANvMH7MQ9myhHAMd4u8b4HnmE9M8JSu320pCAJiay+8ybMiEzvMg2oC84
	PJ0IMr7cjrb3xZJPaXOMt/WFFHfmJMVeXI/11pAzxroGhvlesAZI5MbDrYesADqQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 472fwuje0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 13:55:50 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 554BjlcZ028472;
	Wed, 4 Jun 2025 13:55:50 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 470eakfrg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 13:55:49 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 554DtmRM37880316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Jun 2025 13:55:48 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C75F2004E;
	Wed,  4 Jun 2025 13:55:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A319820040;
	Wed,  4 Jun 2025 13:55:44 +0000 (GMT)
Received: from [9.43.126.91] (unknown [9.43.126.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Jun 2025 13:55:44 +0000 (GMT)
Message-ID: <0d3428c2-6a3c-4d71-bc4d-057ba926852b@linux.ibm.com>
Date: Wed, 4 Jun 2025 19:25:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] kernel/rcu/tree_stall: add
 /sys/kernel/rcu_stall_count
To: Andrew Morton <akpm@linux-foundation.org>,
        Max Kellermann <max.kellermann@ionos.com>
Cc: song@kernel.org, joel.granados@kernel.org, dianders@chromium.org,
        cminyard@mvista.com, linux-kernel@vger.kernel.org
References: <20250504180831.4190860-1-max.kellermann@ionos.com>
 <20250504180831.4190860-3-max.kellermann@ionos.com>
 <47196e67-6533-4015-95db-63a76c1c0c5c@linux.ibm.com>
 <20250603171628.695542215c05af8727dc57a0@linux-foundation.org>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20250603171628.695542215c05af8727dc57a0@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwMyBTYWx0ZWRfXwVRY+XMEo8pn upygPg0w9cqeAs4KBXaHEheaFqX0Gjqum2HsscR8le6NaTWYdToKVN3HF7q7l82zFi7GBV+/am/ PuLqy511JPj7fE6VC4ZtMyOGqmsyd0SImklRcPOMAFeW+ikzEgFImBM+0CnInWhf7JF4ZDVCLBq
 JlN0vhcMTYt2oPhTOV4Sa0ooKkoW806a6qndZ9nJgprWaa8mPpzO4vcfmu5ES6MsHypla8rtg+c Rc1dRGWY7Y0wwGb/WboiN/sCBiNsGH5lCWN+HYxDq0k19uUo6vhnAc1UJiZMomINSsCQWMsuCti LqLgOcTVSAOH3NETix0uOYuLgQJZ81Mbp0jleIZpEcf0Uviz7jfaymSTNB9qGc0DI4RCNSTK6+4
 SQ5htfn1oaaQRrG4ENr9g7ElYxOo4BztB5cheM8pEOfC91B2GpJjqU5TpS/YJsGIYSSDkvRj
X-Proofpoint-GUID: yPZ93pmj0JKHI3hYf75zXuJjL25iIBcu
X-Proofpoint-ORIG-GUID: yPZ93pmj0JKHI3hYf75zXuJjL25iIBcu
X-Authority-Analysis: v=2.4 cv=QtVe3Uyd c=1 sm=1 tr=0 ts=68405066 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=UgJECxHJAAAA:8 a=ehPtwOebbPU7iTpy3vsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-El7cUbtino8hM1DCn8D:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040103



On 04/06/25 05:46, Andrew Morton wrote:
> On Tue, 3 Jun 2025 22:09:30 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> wrote:
>
>> Hello Andrew,
>>
>>> +#endif
>>> +
>>>    		rcu_stall_notifier_call_chain(RCU_STALL_NOTIFY_NORM, (void *)j - gps);
>>>    		if (READ_ONCE(csd_lock_suppress_rcu_stall) && csd_lock_is_stuck()) {
>>>    			pr_err("INFO: %s detected stall, but suppressed full report due to a stuck CSD-lock.\n", rcu_state.name);
>> It seems like this patch was not applied properly to the upstream tree.
>>
>> Out of the three hunks in this patch, only the first one is applied; the
>> second
>> and third hunks are missing.
>>
>> commit 2536c5c7d6ae5e1d844aa21f28b326b5e7f815ef
>> Author: Max Kellermann <max.kellermann@ionos.com>
>> Date:   Sun May 4 20:08:31 2025 +0200
>>
>>       kernel/rcu/tree_stall: add /sys/kernel/rcu_stall_count
>>
>>       Expose a simple counter to userspace for monitoring tools.
> OK.  iirc there was quite a lot of churn and conflicts here :)
>
> Please send a fixup against latest -linus?

Sure, I will wait for a day or two to see if Max is interested in 
sending the fix-up patch. Otherwise, I will send it.

Thanks,
Sourabh Jain
