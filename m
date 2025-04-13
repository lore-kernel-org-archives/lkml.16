Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3309D56B81
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 04:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744516832; cv=none; b=XDtI94IUtKF/uACg5xFSiYQdW2q3NUHVy9K899AmPm1zLWDY1xd5YHWF5Rr8PVF6yKppfLk7mvgGG+ep9nR8Nj4JSXcDVdhH8Jj/luRhGBo6SpF6Jg/QwNkwrB+yBFyAUgyTThs6/o2aTO97YjK3yc9++TCKWbRqn1iwSAk8tzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744516832; c=relaxed/simple;
	bh=zxcGBeuZZwKiaHEOYwqjW4HvurXPCgSXvDwNlC37rzM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=evqVG99obX5gJXW3U5hGOhNI8FV/+P5jqMbdtmmXXscsiRy2fR/9S690/qqR5dkO9KKW9JKrnsGmUAC7CIaCjS02Gj/XKhi2fqlBkLf5Bh1N13nRpG+ze8Jp0Y6GCBWDaXQRhAdcRDGyQKqTIwGdrbMaE+9Yk5EAZnh3wyy+qGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=k5aUdWeE; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="k5aUdWeE"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53CLgasx011234;
	Sun, 13 Apr 2025 04:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=jo4uzq06pFvpTmcGxO70Oz4ZpqwnWWSomNYsD795cSE=; b=k5aUdWeEajYY
	Pg6KJR2rxuCOo3Q5JoeN5Gdsn5KERC79c1HAIpiyezNb1yfBDT+KG2EeX3Tdir0X
	IkeorifClHl3PY+Cp/qhn6LXbH4/E6kU/I49rg8MmjHzHkRhEchc8oX749UKd4F8
	aCJVKdSQyiJ5RAuKDij17l3mM5XF7CW6g/eC/iH/JdkGJYmEJjWSEPWNQwBkVerc
	7kC9bDG1yEtKKNrczkpmQjBQqxDfSOguPnRIIlgTWyP2YYrApQSTRmvYzDCaJD80
	wQQGZHfSpllIfpbEb3nwr+nyzND1QYoefUJYD138PnJ9nnUD428ZIp+gzailtRiB
	miYMidcQdQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4600ashhpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Apr 2025 04:00:13 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53D3FQPE016703;
	Sun, 13 Apr 2025 04:00:12 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 460571r3f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Apr 2025 04:00:12 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53D409Un21693068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 13 Apr 2025 04:00:09 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 847B358055;
	Sun, 13 Apr 2025 04:00:11 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFF8F58063;
	Sun, 13 Apr 2025 04:00:08 +0000 (GMT)
Received: from [9.43.111.221] (unknown [9.43.111.221])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 13 Apr 2025 04:00:08 +0000 (GMT)
Message-ID: <e28db863-3547-4a20-83da-26d8f7be2b03@linux.ibm.com>
Date: Sun, 13 Apr 2025 09:30:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Subject: Re: [PATCH] sched/fair: Only increment deadline once on yield
To: Fernand Sieber <sieberf@amazon.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, nh-open-source@amazon.com,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <20250401123622.584018-1-sieberf@amazon.com>
Content-Language: en-US
Reply-To: 20250401123622.584018-1-sieberf@amazon.com
In-Reply-To: <20250401123622.584018-1-sieberf@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UY-JHJVudw5QQlwAXHXx1DnMyWS93ACt
X-Proofpoint-ORIG-GUID: UY-JHJVudw5QQlwAXHXx1DnMyWS93ACt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 adultscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504130024

Hi Fernand,

On 01/04/25 18:06, Fernand Sieber wrote:
> If a task yields, the scheduler may decide to pick it again. The task in
> turn may decide to yield immediately or shortly after, leading to a tight
> loop of yields.
> 
> If there's another runnable task as this point, the deadline will be
> increased by the slice at each loop. This can cause the deadline to runaway
> pretty quickly, and subsequent elevated run delays later on as the task
> doesn't get picked again. The reason the scheduler can pick the same task
> again and again despite its deadline increasing is because it may be the
> only eligible task at that point.
> 
> Fix this by updating the deadline only to one slice ahead.
> 
> Note, we might want to consider iterating on the implementation of yield as
> follow up:
> * the yielding task could be forfeiting its remaining slice by
>   incrementing its vruntime correspondingly
> * in case of yield_to the yielding task could be donating its remaining
>   slice to the target task
> 
> Signed-off-by: Fernand Sieber <sieberf@amazon.com>
> ---
>  kernel/sched/fair.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index e43993a4e580..c1eff68d8ffc 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9024,7 +9024,7 @@ static void yield_task_fair(struct rq *rq)
>  	 */
>  	rq_clock_skip_update(rq);
> 
> -	se->deadline += calc_delta_fair(se->slice, se);
> +	se->deadline = se->vruntime + calc_delta_fair(se->slice, se);
>  }

Makes sense. Deadline would be rapidly incremented in the scenario of
having other tasks not eligible and the current task calls yield
repeatedly for a very short run time.

Reviewed-by: Madadi Vineeth Reddy <vineethr@linux.ibm.com>

Thanks,
Madadi Vineeth Reddy

> 
>  static bool yield_to_task_fair(struct rq *rq, struct task_struct *p)
> --
> 2.47.1
> 
> 
> 
> 
> Amazon Development Centre (South Africa) (Proprietary) Limited
> 29 Gogosoa Street, Observatory, Cape Town, Western Cape, 7925, South Africa
> Registration Number: 2004 / 034463 / 07
> 

