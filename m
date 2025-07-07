Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D0821D5B2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879207; cv=none; b=SFUAwcxN10WbWJJr3uiC1KBx36lfQda2/j1fldxD9tFU+ItY08cVtdCu61hDwqpfjf1PmeBdvX28La5gZWCbFObj2HBU12GYEg6tJVcci7RHrvYlpn5NX6guIb1gAhuBjvUPPV/2YVKFDESWofovz3BTHllWmXLTFBZwEv27OI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879207; c=relaxed/simple;
	bh=Mn82wIBx5bHzV9lHH1hLPKU4X+2jhaQ8JgIgfr5H6VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G/eVlhI+hLu+Gmko5PzyYeT7Fh7h2mWFCz41uc6My30ha4T12yV85DYfvnTHw9LtsyCRz1UddfPMuzDZaiL9BOfArAxeT3EZ6fgT/pL9fC8Wl+3WlURugApTQ3P4VxXYAaf3ZVuBtlHTv2xFI6FAluKbNTrE6SYLTJkgol5mP7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qa2hWaD3; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qa2hWaD3"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5677dTXl000853;
	Mon, 7 Jul 2025 09:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JZAVqz
	z+/AYNM7plaVwJE/hKu2L5xVYkSAq/22T+dRw=; b=qa2hWaD3ZicKqqRO+BzHmO
	sK5lcFFhK40+tsqgqR3bQb+Ow0rSqVVxLn9uTLW+V3G4QXQ/v6RtkzWv0cgGmqI5
	7/SqNTHTS2JZVZC0tGnovv92Dw7dIuKWtC5znYHo5HNQr14wTBA1nQbZMn0aoTbd
	2qUtPWW+WSUC+d3UMuOTZ+n8tZbL1jJHKaxn7zup9BURp5c9cVCiVipkN820BlhA
	Gr2hM2NmBugLFHxn7c+qGNEhtcdoBLTOc1g4mf9l9FE9uuAEn/7hS1DGYEMt7CjG
	ErT6ShZJpTWw33+VWWTlwv3LbZ4fBy9zkPz7KJ+uRU7NLcvtFbMEF1z1Dht6BBQw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47puqn03x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 09:05:44 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5678vftv009106;
	Mon, 7 Jul 2025 09:05:43 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47puqn03x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 09:05:43 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5674vWJi002860;
	Mon, 7 Jul 2025 09:05:42 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47qfvm57mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 09:05:42 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56795eUb44171738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Jul 2025 09:05:40 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C97D32004E;
	Mon,  7 Jul 2025 09:05:40 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E05102004B;
	Mon,  7 Jul 2025 09:05:38 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Jul 2025 09:05:38 +0000 (GMT)
Message-ID: <132949bc-f901-40e6-a34c-d1d67d03d8b6@linux.ibm.com>
Date: Mon, 7 Jul 2025 14:35:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] sched: Address schbench regression
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, clm@meta.com
References: <20250702114924.091581796@infradead.org>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250702114924.091581796@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=FZ43xI+6 c=1 sm=1 tr=0 ts=686b8de8 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=UHm0IdFZaVUJiL6fVWQA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: ougA__xWWPS4DCTZ6TDn_5ps-SMUei_1
X-Proofpoint-ORIG-GUID: tl33qC09_1RfxV1n0ziFoxiIh_bNd3ur
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MCBTYWx0ZWRfXxf4a9Mg+/4O8 vqbcaKoDnln48vflMaPwRT6gP1EhaT3449S+8tI0VydklK7Vc1kwmZIqqcQi2i1S5KzQpvBfJQQ 9ZYu/tgHfXOVHMRyyENyG8Cb5IZwSEmG6xqWiUiWT0STmxA+Yu2N1tTG8h5mZUeEaTIbCMgIw3d
 4kdNWTlm6xGaL9lHIzNn/fcv4wQ/Tu/PrCp2A+/6pOcDPi/LWlaofAiLAYhqqK6DAmBMMF571wP eVWkZ4Axbo2hJsn/9sgh+OmkE3UQVtakm3ovrVONUBIPzYkQ25wCYHY1PT7JAzju1vF5dq9gcN/ 5KCFKlW3YhCDFETEuMh7MPNENf+uR1P60eDv/ewfLTObywn5/n7MHdz7ojrLPz0s1JanqTIMcoS
 48sPjKm2A9c97PAH4Tkp3iECxLKcZisDwAyfUTuJHhuaC4F/05PCqFeo9TvCxkzaxT+rMajD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=628 clxscore=1011
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070050



On 7/2/25 17:19, Peter Zijlstra wrote:
> Hi!
> 
> Previous version:
> 
>    https://lkml.kernel.org/r/20250520094538.086709102@infradead.org
> 
> 
> Changes:
>   - keep dl_server_stop(), just remove the 'normal' usage of it (juril)
>   - have the sched_delayed wake list IPIs do select_task_rq() (vingu)
>   - fixed lockdep splat (dietmar)
>   - added a few preperatory patches
> 
> 
> Patches apply on top of tip/master (which includes the disabling of private futex)
> and clm's newidle balance patch (which I'm awaiting vingu's ack on).
> 
> Performance is similar to the last version; as tested on my SPR on v6.15 base:
>


Hi Peter,
Gave this a spin on a machine with 5 cores (SMT8) PowerPC system.

I see significant regression in schbench. let me know if i have to test different
number of threads based on the system size.
Will go through the series and will try a bisect meanwhile.


schbench command used and varied 16,32,64,128 as thread groups.
./schbench -L -m 4 -M auto -n 0 -r 60 -t <thread_groups>


base: commit 8784fb5fa2e0042fe3b1632d4876e1037b695f56 (origin/master, origin/HEAD)
Merge: 11119b0b378a 94b59d5f567a
Author: Borislav Petkov (AMD) <bp@alien8.de>
Date:   Sat Jul 5 19:24:35 2025 +0200

     Merge irq/drivers into tip/master


====================================
16 threads   base       base+series
====================================
                              
Wakeup Latencies percentiles (usec) runtime 30 (s)
50.0th:       7.20,      12.40(-72.22)
90.0th:      14.00,      32.60(-132.86)
99.0th:      23.80,      56.00(-135.29)
99.9th:      33.80,      74.80(-121.30)

RPS percentiles (requests) runtime 30 (s)
20.0th:  381235.20,  350720.00(-8.00)
50.0th:  382054.40,  353996.80(-7.34)
90.0th:  382464.00,  356044.80(-6.91)

====================================
32 threads   base       base+series
====================================
Wakeup Latencies percentiles (usec) runtime 30 (s)
50.0th:       9.00,      47.60(-428.89)
90.0th:      19.00,     104.00(-447.37)
99.0th:      32.00,     144.20(-350.62)
99.9th:      46.00,     178.20(-287.39)

RPS percentiles (requests) runtime 30 (s)
20.0th:  763699.20,  515379.20(-32.52)
50.0th:  764928.00,  519168.00(-32.13)
90.0th:  766156.80,  530227.20(-30.79)


====================================
64 threads   base       base+series
====================================
Wakeup Latencies percentiles (usec) runtime 30 (s)
50.0th:      13.40,     112.80(-741.79)
90.0th:      25.00,     216.00(-764.00)
99.0th:      38.40,     282.00(-634.38)
99.9th:      60.00,     331.40(-452.33)

RPS percentiles (requests) runtime 30 (s)
20.0th: 1500364.80,  689152.00(-54.07)
50.0th: 1501184.00,  693248.00(-53.82)
90.0th: 1502822.40,  695296.00(-53.73)


====================================
128 threads   base       base+series
====================================
Wakeup Latencies percentiles (usec) runtime 30 (s)
50.0th:      22.00,     168.80(-667.27)
90.0th:      43.60,     320.60(-635.32)
99.0th:      71.40,     395.60(-454.06)
99.9th:     100.00,     445.40(-345.40)

RPS percentiles (requests) runtime 30 (s)
20.0th: 2686156.80, 1034854.40(-61.47)
50.0th: 2730393.60, 1057587.20(-61.27)
90.0th: 2763161.60, 1084006.40(-60.77)

