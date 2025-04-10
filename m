Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FA820D4FC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273197; cv=none; b=BYSt1VcTVG83UjxqQZ9Y5/7OdIWLXtXtEIrD/x3wxxweC4H2OZZNpgAJtpkYhKEr4opLznDUFQ+4+KlPak7ST1FP2kBlvBCE4PZQapgeaKSX8fBtxGwJ/sPWRL5uj+skT56pxv0JQOeeERi+HbuALkyucw/Y2gN40PK1eC9tjaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273197; c=relaxed/simple;
	bh=pAJkRZdMA/FCkuYp/2E6AdjV+mt5sEOj5gDfZkLUsUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLk0u6L7ViQ2WEK973iGOf+ASIGv6kBO+NfsvKTroHcBG/KFugMj/NA471eiY4sNRS5IkF4t8Ed2sBftXz2yhHuSDyCdT7y0XLwj/QuUEvRXqwJt/HAd/ZGxSALzNk82JoZUv7f8eYTBPEdwynfhv0QB9lB8h7hQxdBAzQhdxn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sA2/08Dt; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sA2/08Dt"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5rTa6026298;
	Thu, 10 Apr 2025 08:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=fV5UEDk3IGYex2LdeGUID4wmD0r49ugxKcp9fkYrRFY=; b=sA2/08DtWcOm
	V/fRtWWh8dOaFLViL48dUZ6sMXJi+gqz8l65JhsjWB2hHAlhGAhCepVDt/xjipAV
	1BPyn/4hTI+Viggo2RJ2sucR8XQaqnj2jz0tR3VLLnImEwZEaa23E14GViJ/IRjH
	MK6C6tPcFrboXf0lJzXcs+1BHDJoh73aylalPpaOKB1beg15lWGUH+SaXpgQnEvL
	x5l+IOHxYN0wLnSHimqqEkWGZqhv15Yqme0ib/G7BXRhg4WTIvFnt2YOs8zhcvOn
	63G7VRXAsLQka6vrIiMtS30HyGZ4uSbBzkAT5V2hDUxruNHaF5WO4qRnpvMwZ4D5
	kuvzMFXcoQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45wtaq5px2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 08:19:40 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53A8JdqU030016;
	Thu, 10 Apr 2025 08:19:39 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45wtaq5pwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 08:19:39 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53A6Hb6L018432;
	Thu, 10 Apr 2025 08:19:38 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45uh2kvx0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 08:19:38 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53A8Jc9p25231956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 08:19:38 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E17258064;
	Thu, 10 Apr 2025 08:19:38 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7418F58052;
	Thu, 10 Apr 2025 08:19:33 +0000 (GMT)
Received: from [9.204.206.228] (unknown [9.204.206.228])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 10 Apr 2025 08:19:33 +0000 (GMT)
Message-ID: <dad0822a-5e0b-4518-a246-a3820787ed87@linux.ibm.com>
Date: Thu, 10 Apr 2025 13:49:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] sched/fair: Reorder scheduling related structs to
 reduce cache misses
To: Zecheng Li <zecheng@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Xu Liu <xliuprof@google.com>, Blake Jones <blakejones@google.com>,
        Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <20250402212904.8866-1-zecheng@google.com>
Content-Language: en-US
Reply-To: 20250402212904.8866-1-zecheng@google.com
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
In-Reply-To: <20250402212904.8866-1-zecheng@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JDpUSsaYJC8NSnyftrxwP7mbjslGF2bA
X-Proofpoint-ORIG-GUID: JRk0d3JDTx1kLuAEx57VfsOPeq8wPgdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=379 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504100058

Hi Zecheng Li,

On 03/04/25 02:59, Zecheng Li wrote:
> Reorder the fields within the `struct cfs_rq` and `struct sched_entity`
> to improve cache locality. This can reduce cache misses to improve
> performance in CFS scheduling-related operations, particularly for
> servers with hundreds of cores and ~1000 cgroups.
> 
> The reordering is based on the kernel data-type profiling
> (https://lwn.net/Articles/955709/) indicating hot fields and fields
> that frequently accessed together.

This patch is based on optimizations by reordering for 64 byte systems.
In case of 128 byte L1 D-cache systems like Power10, this might or might
not be beneficial. Moreover lot of space(almost half) would be wasted
on the cache line due to APIs like `__cacheline_group_begin_aligned`
and `__cacheline_group_end_aligned` that may restrict size to 64 bytes.

Since this is in generic code, any ideas on how to make sure that
other architectures with different cache size don't suffer?

[..snip..]

> 
> 
> | Kernel LLC Misses | d3 w10            | d5 w4             |
> +-------------------+-------------------+-------------------+
> | AMD-orig          | [3025.5, 3344.1]M | [3382.4, 3607.8]M |
> | AMD-opt           | [2410.7, 2556.9]M | [2565.4, 2931.2]M |
> | Change            | -22.01%           | -21.37%           |
> | Intel-orig        | [1157.2, 1249.0]M | [1343.7, 1630.7]M |
> | Intel-opt         | [960.2, 1023.0]M  | [1092.7, 1350.7]M |
> | Change            | -17.59%           | -17.86%           |
> 
> Since the benchmark limits CPU quota, the RPS results reported by
> `schbench` did not show statistically significant improvement as it
> does not reflect the kernel overhead reduction.
> 
> Perf data shows the reduction of LLC misses percentage within the kernel
> for the depth 5, width 4 workload. The symbols are taken from the union
> of top 10 symbols in both original and optimized profiles.
> 
> | Symbol                                | Intel-orig | Intel-opt |
> +---------------------------------------+------------+-----------+
> | worker_thread                         | 75.41%     | 78.95%    |
> | tg_unthrottle_up                      | 3.21%      | 1.61%     |
> | tg_throttle_down                      | 2.42%      | 1.77%     |
> | __update_load_avg_cfs_rq              | 1.95%      | 1.60%     |
> | walk_tg_tree_from                     | 1.23%      | 0.91%     |
> | sched_balance_update_blocked_averages | 1.09%      | 1.13%     |
> | sched_balance_rq                      | 1.03%      | 1.08%     |
> | _raw_spin_lock                        | 1.01%      | 1.23%     |
> | task_mm_cid_work                      | 0.87%      | 1.09%     |
> | __update_load_avg_se                  | 0.78%      | 0.48%     |
> 
> | Symbol                                | AMD-orig | AMD-opt |
> +---------------------------------------+----------+---------+
> | worker_thread                         | 53.97%   | 61.49%  |
> | sched_balance_update_blocked_averages | 3.94%    | 2.48%   |
> | __update_load_avg_cfs_rq              | 3.52%    | 2.62%   |
> | update_load_avg                       | 2.66%    | 2.19%   |
> | tg_throttle_down                      | 1.99%    | 1.57%   |
> | tg_unthrottle_up                      | 1.98%    | 1.34%   |
> | __update_load_avg_se                  | 1.89%    | 1.32%   |
> | walk_tg_tree_from                     | 1.79%    | 1.37%   |
> | sched_clock_noinstr                   | 1.59%    | 1.01%   |
> | sched_balance_rq                      | 1.53%    | 1.26%   |
> | _raw_spin_lock                        | 1.47%    | 1.41%   |
> | task_mm_cid_work                      | 1.34%    | 1.42%   |
> 
> The percentage of the LLC misses in the system is reduced.

Due to the reordering of the fields, there might be some workloads
that could take a hit. May be try running workloads of different
kinds(latency and throughput oriented) and make sure that regression
is not high.

Thanks,
Madadi Vineeth Reddy

> 
> Zecheng Li (2):
>   sched/fair: Reorder struct cfs_rq
>   sched/fair: Reorder struct sched_entity
> 
>  include/linux/sched.h | 37 +++++++++++---------
>  kernel/sched/core.c   | 81 ++++++++++++++++++++++++++++++++++++++++++-
>  kernel/sched/sched.h  | 70 +++++++++++++++++++++++--------------
>  3 files changed, 144 insertions(+), 44 deletions(-)
> 
> 
> base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557

