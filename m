Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E633AD51
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666246; cv=none; b=sn2i3EUh3HXPyybHczEpbo44oFvbuLaLmf9t4RE7wHHt9xn6wN68DA8psR+1dsfEUlAsrtD9EJwfeJc2fn7PDwbyV87bnXlatUa0Quok9P5U9yBtoF4VQdd7X1L5/aV8iKI+j0hiAclW/vU470wM1RmZsNeoWOi5WasG6IbxWaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666246; c=relaxed/simple;
	bh=mdzUxWGAlgUdlftopNXFAG+pMrWImftaux8N3D1ENlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7LWMWuAO5PTbTbKvIKnTBWn6TYZLZknaVkbMbmCFFQP4p0EFU+0JkN/DnrNy2JC0capr5vSiG1ti7lkxGwiWeyTYi9+8sP1PIEr2HjhkI961+qd3sLBOty8iES8GZm+9TXhaqvMf2+hoJG2r9WPY2r4IS1TMKhyHFxdZHm2pTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=XCsQOrTf; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="XCsQOrTf"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MKhavW002256;
	Mon, 23 Jun 2025 08:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=naltRS
	PeooFBQ+itBg+UsqkNOnzspwDycyWE0Gu1hdM=; b=XCsQOrTf/x/q93YxXcjAZN
	xGoEQrAmB+1DRAybFfSSEjXa1YVTNB7N/GwBfIb/ksO0tNpWKZ5c3huJ4lwMrBHp
	vBINapAMYTbWgvqhyZcvyDYbceiBBst6ZhkSYULlLPPfOhikK37vOOgZUxIjcnxR
	h5jfCb9lcTjDc0i2036cr6cUFfbvJTLBWkM3mRGQkZ1B3z7dU4EG9vI5dwxs4PxE
	X4gDCU2D8v+5JlymJjnEJWjxVAHTKanRW9BwoGH4ca0adBrz9rV/bmBROCEnEffI
	0W/PpvXlLNSpuoOVi73jTXB/dTxatgHnOeehdGsGrONxWchyLdCvlVGPKL8PkLhw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8j04qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:10:12 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55N89g95030633;
	Mon, 23 Jun 2025 08:10:11 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8j04qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:10:11 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55N42KGc031277;
	Mon, 23 Jun 2025 08:10:10 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e7eyn9xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:10:10 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55N8A6am37355944
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 08:10:06 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0728F20043;
	Mon, 23 Jun 2025 08:10:06 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24CEE2006E;
	Mon, 23 Jun 2025 08:10:03 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Jun 2025 08:10:02 +0000 (GMT)
Message-ID: <d916d3ae-afd4-4f07-a6e8-941a71cc039e@linux.ibm.com>
Date: Mon, 23 Jun 2025 13:40:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] cpumask: Introduce cpu parked mask
To: Yury Norov <yury.norov@gmail.com>, peterz@infradead.org
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
        tglx@linutronix.de, maddy@linux.ibm.com, vschneid@redhat.com,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, jstultz@google.com,
        kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk
References: <20250523181448.3777233-1-sshegde@linux.ibm.com>
 <20250523181448.3777233-2-sshegde@linux.ibm.com> <aDXU6LUlrmBLL3ak@yury>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <aDXU6LUlrmBLL3ak@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NSBTYWx0ZWRfX4tq3AsMQL8z6 kaDVsrK3HcyBzHjoj7mpjlMglO/WVNYhzLdTzyFGxK46fXSAiya0RUJd1u+m7eiegRD1LbCWXCg ZRSQvbRkkmAHLYncU8QaAeQmYAtUdVj/UIx8IRg97g5NkrvoF7WhnymZ9qSIwd/uy4tRz7X1fkV
 lTLIZQxlKNp16yVe540E9L0Jkg5Jz5C/w9Prp7nnI5frkgDKougSlerNi2C4sz+UZa8zJACg2Bp jH+i+7IYUfuFnDmgR5LnPCLtirjInDiDBoce1nuJQaBPL6H/xJmpb2SiQDSY4T2Eu5J27RNUndX ClyK/hQ14fIT3LkFeJgQIhhFA/uFhO6VSt1DZQvRMhGNKSEcTOVt6YAt1QzDdQMYEvJ28ozJHf8
 3ThRqt2oAn0p6R4b/qJWPYas7BmL+QV7JRSR0wMrKOB35eXKVzdAlBKcmUcXR1DrvNOKGvbE
X-Proofpoint-GUID: mLLm86scRAN6AfYW4oe3FU6yVKA9Dxw0
X-Proofpoint-ORIG-GUID: S7c8spHF4EtvPrYPzD7mV-ac27n6-PCg
X-Authority-Analysis: v=2.4 cv=combk04i c=1 sm=1 tr=0 ts=68590be4 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=W0WVT37j5QbsdxkpU7oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=772 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230045



On 5/27/25 20:36, Yury Norov wrote:
> On Fri, May 23, 2025 at 11:44:44PM +0530, Shrikanth Hegde wrote:
>> CPU is said to be parked, when underlying physical CPU is not
>> available. This happens when there is contention for CPU resource in
>> para-virtualized case. One should avoid using these CPUs.
>>
>> Build and maintain this state of parked CPUs. Scheduler will use this
>> information and push the tasks out as soon as it can.
> 
> This 'parked' term sounds pretty obscured. Maybe name it in
> a positive sense, and more explicit, like cpu_paravirt_mask.
> 

I still dont know a better name. Maybe something like cpu_avoid_mask and
cpu avoid(cpu)? I would like to retain a notion that these CPU shouldn't be used
at the moment.

> Also, shouldn't this be conditional on CONFIG_PARAVIRT?
> 

I moved the uses of it under a static key which should make it a nop for
others. That keeps code relatively simpler. Hope that's ok.

> Thanks,
> Yury
>   
