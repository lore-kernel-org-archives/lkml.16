Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588AA136988
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750447554; cv=none; b=bhUx9JZN2FsS77M6IssdEN1SVt9VAk0G+UVQV4MpDs8DhVv1XlYSJUVORxQZZMiOt38MfnHRKwFx7h1UmrNhXRtCcRZDzwzi3quOPPoJ6Liy0CCfAH4jiETixQ7NRBaxbrrB4VRH2P0zp7gONbjq1lOCtxo/eOfVb3x97x70Yzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750447554; c=relaxed/simple;
	bh=trw4k6x6wf8zoNXKTzsH1Sgck6t2ntYdxhfE1fbShwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iQPs6Ht3swlpDtEL0x5T9YtyJq2p5pVRa1HG/sTydlh2BU/gGFcympyo9JrLwCNm0sLqlGjb8ZlWTd8NNhUBC/9zBDH5E0+ZuXod/qNaP3y8pE/jk5nLmU2wVt/AWe4x6uOSUSwOzCgYJxblgmnvpjOANs3mmvycd/Xs1tbas30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=XzEQQaUO; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="XzEQQaUO"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KHfQ2J029563;
	Fri, 20 Jun 2025 19:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=EzKdDN
	SogT7qa8XNSCLU+lLpVHZNT7y3NzhPg6rIr24=; b=XzEQQaUOUvuVbsGUCS3EUD
	z0reV2EW6tnUktv7KbJ8lz3fR9HL+d89QCGWjcOQA0522jul3Ng2ptsNA6GdUbNv
	hNqgnFMFw9SATVDPbJfiKvF6tw6ZcVNOTD2+vHt5rRN5UQYfdq6OFjdgddWMSGKy
	mgUg42coXK5JgrqRSJC4TThtnUQeMfmW1tlSYSw81iCnAm+2e974GiTpcTe8rUYL
	qoIiYMJ8hOZ217FQPIqtJCjpGbNyBLLcpOtWwXgbMa18XR5ZYQsEWn6bmKDzGWzo
	Afd71SWix16dAW6cMk4M0LETar6MnD0GPpXbt1GMmYBYn6R6nNdyBpdXUW5m68Ow
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790ku5q7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 19:25:22 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55KJO0j7030189;
	Fri, 20 Jun 2025 19:25:21 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790ku5q7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 19:25:21 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55KHAumI005494;
	Fri, 20 Jun 2025 19:25:20 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 479mwmmn8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 19:25:20 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55KJPJW833358396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 19:25:19 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B56858055;
	Fri, 20 Jun 2025 19:25:19 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E43CF58043;
	Fri, 20 Jun 2025 19:25:09 +0000 (GMT)
Received: from [9.43.92.183] (unknown [9.43.92.183])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jun 2025 19:25:09 +0000 (GMT)
Message-ID: <8c98fff7-fef3-494a-98a3-4b6d4cc2e6d1@linux.ibm.com>
Date: Sat, 21 Jun 2025 00:55:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 00/20] Cache aware scheduling
To: Tim Chen <tim.c.chen@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        "Gautham R . Shenoy" <gautham.shenoy@amd.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Tim Chen <tim.c.chen@intel.com>,
        Vincent Guittot
 <vincent.guittot@linaro.org>,
        Libo Chen <libo.chen@oracle.com>, Abel Wu <wuyun.abel@bytedance.com>,
        Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
        linux-kernel@vger.kernel.org, Chen Yu <yu.c.chen@intel.com>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
Content-Language: en-US
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
In-Reply-To: <cover.1750268218.git.tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7w-YSLLY9OOFG8ztZOSd61W-WsZK1FGO
X-Proofpoint-ORIG-GUID: dgXXsIFN_3OLgLjwbSxgXDsdLF4LJDTc
X-Authority-Analysis: v=2.4 cv=KaDSsRYD c=1 sm=1 tr=0 ts=6855b5a2 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=UXawlTFlhs7-HPM11owA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzNCBTYWx0ZWRfX48s00Nzo2rtY Ln0Q2jzi0okns9IABR8fTKJGCvz5D8gxtdoE1aMv6fq7VVh6T7nSj9TFfSxMb8zSQJ1PR5AkPiX LrNu3hLvTfDyDE0bB9yz83O9J+iFvvzrwGop/CCk+cjHxpRA2nPChep7ALXa1jGp/7l24AGLFKr
 YnTe+//ESIHnju55E6OsLn3Zz/n4Is8hJkfYDw6478mNbIEldV4VZZcwBYTFOP5uaFumt+ExThV Q+DwHvRdkOkgmSl5iryeCS9ZtPcNk4avN5IPOKYe1MwIgU5+gQy08tEnGg33JxDN2cyUFTwU+/e r+jkJ+aqFhA5jtt5ZB0Bc09iR2F8SBNWP02CvNSFP7sGv4fkC/UoIVbHuUS4wL3KLTeL3IP1RWq
 neT4m1qSBNyv0M2LKDaIK6yvRtR+cVwlQhAzsNghvsGCsS9s/KznrV0G3sVsLQR33jwVAeLg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200134

Hi Tim,

On 18/06/25 23:57, Tim Chen wrote:
> This is the third revision of the cache aware scheduling patches,
> based on the original patch proposed by Peter[1].
>  
> The goal of the patch series is to aggregate tasks sharing data
> to the same cache domain, thereby reducing cache bouncing and
> cache misses, and improve data access efficiency. In the current
> implementation, threads within the same process are considered
> as entities that potentially share resources.
>  
> In previous versions, aggregation of tasks were done in the
> wake up path, without making load balancing paths aware of
> LLC (Last-Level-Cache) preference. This led to the following
> problems:
> 
> 1) Aggregation of tasks during wake up led to load imbalance
>    between LLCs
> 2) Load balancing tried to even out the load between LLCs
> 3) Wake up tasks aggregation happened at a faster rate and
>    load balancing moved tasks in opposite directions, leading
>    to continuous and excessive task migrations and regressions
>    in benchmarks like schbench.
> 
> In this version, load balancing is made cache-aware. The main
> idea of cache-aware load balancing consists of two parts:
> 
> 1) Identify tasks that prefer to run on their hottest LLC and
>    move them there.
> 2) Prevent generic load balancing from moving a task out of
>    its hottest LLC.
> 
> By default, LLC task aggregation during wake-up is disabled.
> Conversely, cache-aware load balancing is enabled by default.
> For easier comparison, two scheduler features are introduced:
> SCHED_CACHE_WAKE and SCHED_CACHE_LB, which control cache-aware
> wake up and cache-aware load balancing, respectively. By default,
> NO_SCHED_CACHE_WAKE and SCHED_CACHE_LB are set, so tasks aggregation
> is only done on load balancing.

Tested this patch series on a Power11 system with 28 cores and 224 CPUs.
LLC on this platform spans 4 threads.

schbench:
                        baseline (sd%)        baseline+cacheaware (sd%)      %change
Lat 50.0th-worker-1        6.33 (24.12%)           6.00 (28.87%)               5.21%
Lat 90.0th-worker-1        7.67 ( 7.53%)           7.67 (32.83%)               0.00%
Lat 99.0th-worker-1        8.67 ( 6.66%)           9.33 (37.63%)              -7.61%
Lat 99.9th-worker-1       21.33 (63.99%)          12.33 (28.47%)              42.19%

Lat 50.0th-worker-2        4.33 (13.32%)           5.67 (10.19%)             -30.95%
Lat 90.0th-worker-2        5.67 (20.38%)           7.67 ( 7.53%)             -35.27%
Lat 99.0th-worker-2        7.33 ( 7.87%)           8.33 ( 6.93%)             -13.64%
Lat 99.9th-worker-2       11.67 (24.74%)          10.33 (11.17%)              11.48%

Lat 50.0th-worker-4        5.00 ( 0.00%)           7.00 ( 0.00%)             -40.00%
Lat 90.0th-worker-4        7.00 ( 0.00%)           9.67 ( 5.97%)             -38.14%
Lat 99.0th-worker-4        8.00 ( 0.00%)          11.33 (13.48%)             -41.62%
Lat 99.9th-worker-4       10.33 ( 5.59%)          14.00 ( 7.14%)             -35.53%

Lat 50.0th-worker-8        4.33 (13.32%)           5.67 (10.19%)             -30.95%
Lat 90.0th-worker-8        6.33 (18.23%)           8.67 ( 6.66%)             -36.99%
Lat 99.0th-worker-8        7.67 ( 7.53%)          10.33 ( 5.59%)             -34.69%
Lat 99.9th-worker-8       10.00 (10.00%)          12.33 ( 4.68%)             -23.30%

Lat 50.0th-worker-16       4.00 ( 0.00%)           5.00 ( 0.00%)             -25.00%
Lat 90.0th-worker-16       6.33 ( 9.12%)           7.67 ( 7.53%)             -21.21%
Lat 99.0th-worker-16       8.00 ( 0.00%)          10.33 ( 5.59%)             -29.13%
Lat 99.9th-worker-16      12.00 ( 8.33%)          13.33 ( 4.33%)             -11.08%

Lat 50.0th-worker-32       5.00 ( 0.00%)           5.33 (10.83%)              -6.60%
Lat 90.0th-worker-32       7.00 ( 0.00%)           8.67 (17.63%)             -23.86%
Lat 99.0th-worker-32      10.67 (14.32%)          12.67 ( 4.56%)             -18.75%
Lat 99.9th-worker-32      14.67 ( 3.94%)          19.00 (13.93%)             -29.49%

Lat 50.0th-worker-64       5.33 (10.83%)           6.67 ( 8.66%)             -25.14%
Lat 90.0th-worker-64      10.00 (17.32%)          14.33 ( 4.03%)             -43.30%
Lat 99.0th-worker-64      14.00 ( 7.14%)          16.67 ( 3.46%)             -19.07%
Lat 99.9th-worker-64      55.00 (56.69%)          47.00 (61.92%)              14.55%

Lat 50.0th-worker-128      8.00 ( 0.00%)           8.67 (13.32%)              -8.38%
Lat 90.0th-worker-128     13.33 ( 4.33%)          14.33 ( 8.06%)              -7.50%
Lat 99.0th-worker-128     16.00 ( 0.00%)          20.00 ( 8.66%)             -25.00%
Lat 99.9th-worker-128   2258.33 (83.80%)        2974.67 (21.82%)             -31.72%

Lat 50.0th-worker-256     47.67 ( 2.42%)          45.33 ( 3.37%)               4.91%
Lat 90.0th-worker-256   3470.67 ( 1.88%)        3558.67 ( 0.47%)              -2.54%
Lat 99.0th-worker-256   9040.00 ( 2.76%)        9050.67 ( 0.41%)              -0.12%
Lat 99.9th-worker-256  13824.00 (20.07%)       13104.00 ( 6.84%)               5.21%

The above data shows mostly regression both in the lesser and
higher load cases.


Hackbench pipe:

Pairs   Baseline Avg (s) (Std%)     Patched Avg (s) (Std%)      % Change
2       2.987 (1.19%)               2.414 (17.99%)              24.06%
4       7.702 (12.53%)              7.228 (18.37%)               6.16%
8       14.141 (1.32%)              13.109 (1.46%)               7.29%
15      27.571 (6.53%)              29.460 (8.71%)              -6.84%
30      65.118 (4.49%)              61.352 (4.00%)               5.78%
45      105.086 (9.75%)             97.970 (4.26%)               6.77%
60      149.221 (6.91%)             154.176 (4.17%)             -3.32%
75      199.278 (1.21%)             198.680 (1.37%)              0.30%

A lot of run to run variation is seen in hackbench runs. So hard to tell
on the performance but looks better than schbench.

In Power 10 and Power 11, The LLC size is relatively smaller (4 CPUs)
when compared to platforms like sapphire rapids and Milan. Didn't go
through this series yet. Will go through and try to understand why
schbench is not happy on Power systems.

Meanwhile, Wanted to know your thoughts on how does smaller LLC
size get impacted with this patch?

Thanks,
Madadi Vineeth Reddy


> 
> With above default settings, task migrations occur less frequently
> and no longer happen in the latency-sensitive wake-up path.
> 

[..snip..]

> 
> Chen Yu (3):
>   sched: Several fixes for cache aware scheduling
>   sched: Avoid task migration within its preferred LLC
>   sched: Save the per LLC utilization for better cache aware scheduling
> 
> K Prateek Nayak (1):
>   sched: Avoid calculating the cpumask if the system is overloaded
> 
> Peter Zijlstra (1):
>   sched: Cache aware load-balancing
> 
> Tim Chen (15):
>   sched: Add hysteresis to switch a task's preferred LLC
>   sched: Add helper function to decide whether to allow cache aware
>     scheduling
>   sched: Set up LLC indexing
>   sched: Introduce task preferred LLC field
>   sched: Calculate the number of tasks that have LLC preference on a
>     runqueue
>   sched: Introduce per runqueue task LLC preference counter
>   sched: Calculate the total number of preferred LLC tasks during load
>     balance
>   sched: Tag the sched group as llc_balance if it has tasks prefer other
>     LLC
>   sched: Introduce update_llc_busiest() to deal with groups having
>     preferred LLC tasks
>   sched: Introduce a new migration_type to track the preferred LLC load
>     balance
>   sched: Consider LLC locality for active balance
>   sched: Consider LLC preference when picking tasks from busiest queue
>   sched: Do not migrate task if it is moving out of its preferred LLC
>   sched: Introduce SCHED_CACHE_LB to control cache aware load balance
>   sched: Introduce SCHED_CACHE_WAKE to control LLC aggregation on wake
>     up
> 
>  include/linux/mm_types.h       |  44 ++
>  include/linux/sched.h          |   8 +
>  include/linux/sched/topology.h |   3 +
>  init/Kconfig                   |   4 +
>  init/init_task.c               |   3 +
>  kernel/fork.c                  |   5 +
>  kernel/sched/core.c            |  25 +-
>  kernel/sched/debug.c           |   4 +
>  kernel/sched/fair.c            | 859 ++++++++++++++++++++++++++++++++-
>  kernel/sched/features.h        |   3 +
>  kernel/sched/sched.h           |  23 +
>  kernel/sched/topology.c        |  29 ++
>  12 files changed, 982 insertions(+), 28 deletions(-)
> 

