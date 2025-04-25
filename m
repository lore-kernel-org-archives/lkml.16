Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8169B189F20
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597135; cv=none; b=LqxXue+jBEZMgLwYgSW70M3LhR/Qtxklj7ag4/b/cj4QuiLNIHnOJCND0arDwPR/5V7ERrjqmKZnCUMv+y8PgOc0Qjm8hxQhJj8O/CtJJUoyZ3vQo9vQieWw/OWW5uFLeIdkN1v00EnEIkXW6hVXeShk0H9F+iP1sgOsecqE+u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597135; c=relaxed/simple;
	bh=5QOikvIpFJpAn4LvksqDdxME5NqzJU/6HMKXaTAmFIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VqeBqYa4P7g3FW9xhfJp9573xxw6GEwZBy0xZYrplNO3rna0dQVIVCuPfF9zpsClYcyv6Yb3g2DXNoPM6diYF9cmWNeKZkgKWO3jvv3hfRvmeyLI4lYKiIrgoJQDwJVFpwjbu3/jtU+GR58Gs6r1UN3FHP2GxczkbVad/IKJg1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=RgbPxNwX; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="RgbPxNwX"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PAEckf001860;
	Fri, 25 Apr 2025 16:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=OVBNyZ
	RHCPpzSSHMY3VqwIMIHRvAFKA2l4bEjmWWMXM=; b=RgbPxNwXUuPGznwiP9fwp2
	D+AMO2pty/kC6gAIorfkkQyAEJCkUaFCdYqtlX7ZTJC0YfY1JbjP/OOPzWK/IoPP
	s9bpgKVXnrFM9lvQgsP3l6p/ikhwEcSi0HZzVnOl4SbrrWEJoFXASaIGjgC4wySX
	00pb5iaj1N9Teer995rHhMFrRL9s5drpq2mGNLYZcAcxaazG5464/HxfG/b5RSz2
	D3WvZ3ASJFXcEydSCg+ijb6k6e1hprUYWYJhUQ0J9etFHTlYGl46mj8iT0WndUz7
	ZTv35FLRSlcN3mt4tPZQRjlW9rt9PcFAhXPZYVzNCvfJiVscdGbDSGjWitN7ThVw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467vvkveh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 16:05:17 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53PG5HwW027221;
	Fri, 25 Apr 2025 16:05:17 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467vvkveh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 16:05:17 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53PCvo4G005884;
	Fri, 25 Apr 2025 16:05:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfxp0p5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 16:05:16 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53PG5EJg56885648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:05:14 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 184DB2004B;
	Fri, 25 Apr 2025 16:05:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E93720043;
	Fri, 25 Apr 2025 16:05:11 +0000 (GMT)
Received: from [9.124.216.146] (unknown [9.124.216.146])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Apr 2025 16:05:10 +0000 (GMT)
Message-ID: <895d688d-64aa-4321-9978-8773e726aee2@linux.ibm.com>
Date: Fri, 25 Apr 2025 21:35:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: reduce false sharing on sched_balance_running
To: Eric Dumazet <edumazet@google.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
        Eric Dumazet <eric.dumazet@gmail.com>,
        Yafang Shao <laoar.shao@gmail.com>,
        Sean Christopherson <seanjc@google.com>, Josh Don <joshdon@google.com>,
        Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
References: <20250423174634.3009657-1-edumazet@google.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250423174634.3009657-1-edumazet@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDExMSBTYWx0ZWRfX16njmbsy1kK8 p0b+MZ3Ez0sim1kt7GZLc/VIK8RUqd0zMBdRH0zizo8wdhWvB53Ro21znWOYhNkHsxPCNlQ1uul Fmq15T1bBl3eagQPnZNcAzDaaeU0m41pls0srRHTIJeF0QZnPcijKipzMcrkkq3H48koid+m/vZ
 DeCmSOf1ln6LQ3bUf+jo3wn32ZCBbhvCbqB+AXskMTe8Y9Jd1tikb5o1NygOp8x06GTYRMy0t+7 WvvT4UH4JjTII2lrBYJ44buvMpYWm8lQuNUueg5mlLHU14Ly2Rys2BjxflSQ5iGOIMXmRJRva0a +eJUgb76yxy4Sr4tBh6gRZHpIcedPXxDw2vk6GJyXV2CW1EJQKFJGFR5gae0nc8DFN/CtmteYch
 Wc3uu0VjxMNlI9Xwh7d98Iu8VloWfv5s6WRHRnmOpJykh6A05JU0AVpl4xSh7ZmLpC7rXPAJ
X-Proofpoint-ORIG-GUID: IFZmFdJrWV6Iu1uVoe2fmKOy4tx1YNYn
X-Proofpoint-GUID: kppcrlXmEiPooCRtiMmdjiuPn2uMrhlA
X-Authority-Analysis: v=2.4 cv=HoF2G1TS c=1 sm=1 tr=0 ts=680bb2bd cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8
 a=JeRp_uJUotQMxpzSFH4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=812
 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250111



On 4/23/25 23:16, Eric Dumazet wrote:
> rebalance_domains() can attempt to change sched_balance_running
> more than 350,000 times per second on our servers.
> 
> If sched_clock_irqtime and sched_balance_running share the
> same cache line, we see a very high cost on hosts with 480 threads
> dealing with many interrupts.
> 
> This patch only acquires sched_balance_running when sd->last_balance
> is old enough.
> 
> It also moves sched_balance_running into a dedicated cache line on SMP.
> 
> Signed-off-by: Eric Dumazet <edumazet@google.com>
> Cc: Yafang Shao <laoar.shao@gmail.com>
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Josh Don <joshdon@google.com>
> ---

Hi Eric.

Please check this thread which does the same thing AFAIU.
https://lore.kernel.org/all/20250416035823.1846307-1-tim.c.chen@linux.intel.com/

You could also try:
https://lore.kernel.org/all/82baaf6c-f3d9-4c3e-be69-24389eadb18c@linux.ibm.com/

Thanks

