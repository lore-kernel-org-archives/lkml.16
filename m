Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ECB2E7181
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945404; cv=none; b=tyn8MsJPlq2+43RU+DbhkjvTfgTanB0VhmlgmTbTaEoI0NgDHvtwR+0U5F5RSmq6LPSaJzX7DYE2jQKxPZgMk10ZbcB6SpJm8dv3r2yzs88Oqz8I7s8QhdLMVHMemaFrCn12ffzgGOv+fscqrh/xU7OPGyUUs9mFIMP66WbE450=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945404; c=relaxed/simple;
	bh=XwBKRvYS3IAVXwUuZxT9APFsi9ceUKnDWJNZC1mhZWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O9S2MWSI+EPmIJufD8lAuZDkVGZjfU4uD1WFG1sC9Dj9t3YnKizbH3MwL76yrufLC6QXIkQLXq032CZDP7zLYjDFMHjWrXMhzgdY/mS/XYUXg5jNjwd7Gh7TigBC/sITyN/p4zcMaWFrYexTPHn0cbZr1hK3+b8cysYQfRPegok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oQZGIwxf; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oQZGIwxf"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QDRAEj023930;
	Thu, 26 Jun 2025 13:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2CmfP7
	iQdNY449xhDbsziXvq86A7bNBqlGhaIzPhG/o=; b=oQZGIwxf7qsItiCIBK45i8
	v+PZcyhtTR0WbY5iDpSuCtj14wb+1J9KMaaAx7JJ1LqwdKfRl5TVAf3Me+wWEW5M
	uhuKjcN2xPbfHTX7OJ0pVxe/Sd776x4MSSttZlj9oWUF6H6ddYEUa0f9tSjRfmDX
	oCEVphxCGBvuds7yS8l08G6ozz9T1CD+vnSv+LikKncQ3AhSiP2+kqADSPFyUe4n
	AVbT3Ep+cdxOjz+ReCGii2MfvWCbTM2AcpJLdZkqPpgmRwinS3oR2Q9upnNdlBxG
	5awlZLFQozE9BRx9QD+llBg3uX0SnO2JX4liWKPJgEYny1qeuLbbFk46E/wxhUCw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47h73k02jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 13:43:03 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55QDa0Ra011126;
	Thu, 26 Jun 2025 13:43:03 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47h73k02jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 13:43:02 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55QA89uC003983;
	Thu, 26 Jun 2025 13:43:01 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e99kxw56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 13:43:01 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55QDgw2850069910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 13:42:58 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25C5520040;
	Thu, 26 Jun 2025 13:42:58 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80AC820043;
	Thu, 26 Jun 2025 13:42:54 +0000 (GMT)
Received: from [9.39.23.153] (unknown [9.39.23.153])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Jun 2025 13:42:54 +0000 (GMT)
Message-ID: <6a5c2a91-dd0e-4916-b5b4-ed78841752a3@linux.ibm.com>
Date: Thu, 26 Jun 2025 19:12:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 4/9] sched/fair: Don't use CPU marked as avoid for wakeup
 and load balance
To: Yury Norov <yury.norov@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
        vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
        kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
        linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
 <20250625191108.1646208-5-sshegde@linux.ibm.com> <aFyOITguo83GdxKv@yury>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <aFyOITguo83GdxKv@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VmSND-QULzwBkRQfmOQUw-mhqFcCV_d5
X-Proofpoint-GUID: Fd-mT-CCn5EASNuYbSBE8dgu2Np2jMaO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExMiBTYWx0ZWRfXwFqMb6QCK6xz L5KbFjBI/q5CuHPDSWTiNzNAdDVONY+QPVa7H5UxJhwmH0Dn72iP7qlQ5sVHWR+GODonrUJ2rLV lhGlZZhdVXDRtmAZAwEzNWag4Iz+r77gA4ID1PUQ9KrqkQErtO0jInu05lcYqNnCCLK3Jq0265W
 UNvkht7N8YKHpSUDlaqbyf7TGlN2kG3bIIBHn7yXoetDccPDK3MjdaMNh/BOcks4+KRBSRjxDYb 6aW4J/GqGwj9WXk0aFoD0bh69nCZP1rxoxyOwVjBPcGMfPvx6gtJmZXmZg43R8I1wELPsia2BqZ RT1ZVgUgycW4xrsztmOprBTOUYxmSV/7/Brwn24W3ZOyvSa0MI7VfyDsVrzeGQjAv8tumqfPwde
 NybCkPOjur18MSg3wQSYGVLH+4RfVPqI3tbVnzMrNUsPreGS4lY1UFp5sW+G2/Lmgy5SAggy
X-Authority-Analysis: v=2.4 cv=Aovu3P9P c=1 sm=1 tr=0 ts=685d4e67 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=R63sIUGh8Hs7vTQp:21 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=0rtDuKH0ekNgS3kZeTkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 mlxlogscore=985 bulkscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260112



On 6/26/25 05:32, Yury Norov wrote:
> On Thu, Jun 26, 2025 at 12:41:03AM +0530, Shrikanth Hegde wrote:
>> Load balancer shouldn't spread CFS tasks into a CPU marked as Avoid.
>> Remove those CPUs from load balancing decisions.
>>
>> At wakeup, don't select a CPU marked as avoid.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> while tesing didn't see cpu being marked as avoid while new_cpu is.
>> May need some more probing to see if even cpu can be. if so it could
>> lead to crash.
>>
>>   kernel/sched/fair.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 7e2963efe800..406288aef535 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -8546,7 +8546,12 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>>   	}
>>   	rcu_read_unlock();
>>   
>> -	return new_cpu;
>> +	/* Don't select a CPU marked as avoid for wakeup */
>> +	if (cpu_avoid(new_cpu))
>> +		return cpu;
>> +	else
>> +		return new_cpu;
>> +
>>   }
> 
> There are more 'return's in this function, but you patch only one... 

I had seen it but forgot to add. (since eas wasn't enabled in the system 
so i forgot)

> 
>>   
>>   /*
>> @@ -11662,6 +11667,9 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>>   
>>   	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
>>   
>> +	/* Don't spread load into CPUs marked as avoid */
>> +	cpumask_andnot(cpus, cpus, cpu_avoid_mask);
>> +
>>   	schedstat_inc(sd->lb_count[idle]);
>>   
>>   redo:
>> -- 
>> 2.43.0

