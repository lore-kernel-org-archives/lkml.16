Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922F221C160
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486588; cv=none; b=kB7okEQjeClV0aD/qt3ZSHbyGDMui2muNF1NTazvqu8XgTL7AIl+YcSmERmT/l0vGspKh3MJ/q8BTevk2MuIcdHM81F4zbBkaVKdMXwQmYS+Ov/7mopw1ZTeTqF1I2vmGsDm6zS6y4+xjOtKuhfj25bEP3RCOvsrs/BvbRqv77o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486588; c=relaxed/simple;
	bh=nwDXTlYAFXnACaZf8TI9D8NwxhtdZ9VHMrTRZE/Xx0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWt+HVztaK5q/kBnZaVU7ZjJLm9PBhPZYKHQVRHHMdFhxZh2eZp4ewG9HnBQXze3JhUdRlxRvIejdIeHbkk1heEpkZDHYCWVcaK7nwM89yszlQfYU5xS1PuzvsMjHmQ3dIlX61lSLnlt/eD7N8FPjpnlgOkw6FHseXXiAdre4gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=GzOxau9N; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="GzOxau9N"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O8F5nU010509;
	Thu, 24 Apr 2025 09:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=BZW6vvtcQ+53qAmrejl+il4DEBYlqLogEhT/dxsWl8g=; b=GzOxau9N1Sz3
	CfmyHY853xOY1g99sO1F7vP3AjXxjFy+O00So3kJ48WSu6hNgkU+V83q7/khqwsj
	d9U779W4UIormgWRVjEnVhw4/n6OCdOEgsWWIabvXlq53kE34ZtAmD4c6bc9fMfp
	Dn3B655lq5s+YE+WjfvPe+KEWoTy8m61fg3FMTTyRDd0LjlmCPrPV2KOBahoPWhK
	LJ4uQrmLW3K7F6YsRFELR8k3EYOydZovQlRPmTOuTHNnxElOY6BEzo9tFwHq4M8Y
	xx+xm7K2HRFhFF1QjyWiNexXtUa3so12zTGigPArqHEqxR8HVrwkMY920yqqZRme
	zKG3YwuIhw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4677sm2qu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:22:33 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53O9Gulr014895;
	Thu, 24 Apr 2025 09:22:33 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4677sm2qu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:22:33 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53O7KjAt004114;
	Thu, 24 Apr 2025 09:22:32 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jfyyfsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:22:32 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53O9MVU412059176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 09:22:31 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 393395805A;
	Thu, 24 Apr 2025 09:22:31 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9234258056;
	Thu, 24 Apr 2025 09:22:25 +0000 (GMT)
Received: from [9.204.206.228] (unknown [9.204.206.228])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 24 Apr 2025 09:22:25 +0000 (GMT)
Message-ID: <cd6065dc-837f-474a-a4f5-0faa607da73a@linux.ibm.com>
Date: Thu, 24 Apr 2025 14:52:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] sched: Inhibit cache aware scheduling if the
 preferred LLC is over aggregated
To: Chen Yu <yu.c.chen@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
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
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <cover.1745199017.git.yu.c.chen@intel.com>
 <2c45f6db1efef84c6c1ed514a8d24a9bc4a2ca4b.1745199017.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Reply-To: 2c45f6db1efef84c6c1ed514a8d24a9bc4a2ca4b.1745199017.git.yu.c.chen@intel.com
In-Reply-To: <2c45f6db1efef84c6c1ed514a8d24a9bc4a2ca4b.1745199017.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MCBTYWx0ZWRfX+4d29AK03Q/S 47uyw87grmSHN8XLy4w+wWv7boyaLguZZjv6hZq01jeNdj1htLRq7LD0EmuXTpSaIf7QMtE5Ps9 kMkmZ0bABXkD1Cyky/+YOpWW0Zmzi05dsLe7zU7ODRiKN9k2nLtJ5Oz3N9rL8dk0aEVWShCGN1X
 HAO/bRNxozDcU40nTYfiLZhtvlwVQW0lk1XHnfeuDTLbDEp7mZHCa5xxuP4orN8HJ7NyrcVyzab qnCa+yYciZc+SRC1EogdhISdIlRiI07sBXq7S8LBPu4PhLgIh8iah2pRf4iyGbvgRWDJFpWxU1/ caFQIWLcTyJsgYYfKanN0XsoXUvwZ9oLj/mblFxC96k+X4qg71PolHzI5jg3zI1z+CXWJ5CwHn8
 +dFAQ9BeG2PPGGib9k3YSJVIIuukF0ZaxOtBQuUF93ERW5O+vMkDSGIrUVUM0vKwkCNKC3Ev
X-Proofpoint-GUID: hOPN4cco1Qb4gvjWgpEUDJ1ROq6li-F1
X-Proofpoint-ORIG-GUID: NWYCqlrGHQ5K5onPjaxvA6BcJ_jQ4JJj
X-Authority-Analysis: v=2.4 cv=CcMI5Krl c=1 sm=1 tr=0 ts=680a02d9 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=M5QYeZxBUUfcO5AXeUYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240060

Hi Chen Yu,

On 21/04/25 08:55, Chen Yu wrote:
> It is found that when the process's preferred LLC gets saturated by too many
> threads, task contention is very frequent and causes performance regression.
> 
> Save the per LLC statistics calculated by periodic load balance. The statistics
> include the average utilization and the average number of runnable tasks.
> The task wakeup path for cache aware scheduling manipulates these statistics
> to inhibit cache aware scheduling to avoid performance regression. When either
> the average utilization of the preferred LLC has reached 25%, or the average
> number of runnable tasks has exceeded 1/3 of the LLC weight, the cache aware
> wakeup is disabled. Only when the process has more threads than the LLC weight
> will this restriction be enabled.
> 
> Running schbench via mmtests on a Xeon platform, which has 2 sockets, each socket
> has 60 Cores/120 CPUs. The DRAM interleave is enabled across NUMA nodes via BIOS,
> so there are 2 "LLCs" in 1 NUMA node.
> 
> compare-mmtests.pl --directory work/log --benchmark schbench --names baseline,sched_cache
>                                     baselin             sched_cach
>                                    baseline            sched_cache
> Lat 50.0th-qrtle-1          6.00 (   0.00%)        6.00 (   0.00%)
> Lat 90.0th-qrtle-1         10.00 (   0.00%)        9.00 (  10.00%)
> Lat 99.0th-qrtle-1         29.00 (   0.00%)       13.00 (  55.17%)
> Lat 99.9th-qrtle-1         35.00 (   0.00%)       21.00 (  40.00%)
> Lat 20.0th-qrtle-1        266.00 (   0.00%)      266.00 (   0.00%)
> Lat 50.0th-qrtle-2          8.00 (   0.00%)        6.00 (  25.00%)
> Lat 90.0th-qrtle-2         10.00 (   0.00%)       10.00 (   0.00%)
> Lat 99.0th-qrtle-2         19.00 (   0.00%)       18.00 (   5.26%)
> Lat 99.9th-qrtle-2         27.00 (   0.00%)       29.00 (  -7.41%)
> Lat 20.0th-qrtle-2        533.00 (   0.00%)      507.00 (   4.88%)
> Lat 50.0th-qrtle-4          6.00 (   0.00%)        5.00 (  16.67%)
> Lat 90.0th-qrtle-4          8.00 (   0.00%)        5.00 (  37.50%)
> Lat 99.0th-qrtle-4         14.00 (   0.00%)        9.00 (  35.71%)
> Lat 99.9th-qrtle-4         22.00 (   0.00%)       14.00 (  36.36%)
> Lat 20.0th-qrtle-4       1070.00 (   0.00%)      995.00 (   7.01%)
> Lat 50.0th-qrtle-8          5.00 (   0.00%)        5.00 (   0.00%)
> Lat 90.0th-qrtle-8          7.00 (   0.00%)        5.00 (  28.57%)
> Lat 99.0th-qrtle-8         12.00 (   0.00%)       11.00 (   8.33%)
> Lat 99.9th-qrtle-8         19.00 (   0.00%)       16.00 (  15.79%)
> Lat 20.0th-qrtle-8       2140.00 (   0.00%)     2140.00 (   0.00%)
> Lat 50.0th-qrtle-16         6.00 (   0.00%)        5.00 (  16.67%)
> Lat 90.0th-qrtle-16         7.00 (   0.00%)        5.00 (  28.57%)
> Lat 99.0th-qrtle-16        12.00 (   0.00%)       10.00 (  16.67%)
> Lat 99.9th-qrtle-16        17.00 (   0.00%)       14.00 (  17.65%)
> Lat 20.0th-qrtle-16      4296.00 (   0.00%)     4200.00 (   2.23%)
> Lat 50.0th-qrtle-32         6.00 (   0.00%)        5.00 (  16.67%)
> Lat 90.0th-qrtle-32         8.00 (   0.00%)        6.00 (  25.00%)
> Lat 99.0th-qrtle-32        12.00 (   0.00%)       10.00 (  16.67%)
> Lat 99.9th-qrtle-32        17.00 (   0.00%)       14.00 (  17.65%)
> Lat 20.0th-qrtle-32      8496.00 (   0.00%)     8528.00 (  -0.38%)
> Lat 50.0th-qrtle-64         6.00 (   0.00%)        5.00 (  16.67%)
> Lat 90.0th-qrtle-64         8.00 (   0.00%)        8.00 (   0.00%)
> Lat 99.0th-qrtle-64        12.00 (   0.00%)       12.00 (   0.00%)
> Lat 99.9th-qrtle-64        17.00 (   0.00%)       17.00 (   0.00%)
> Lat 20.0th-qrtle-64     17120.00 (   0.00%)    17120.00 (   0.00%)
> Lat 50.0th-qrtle-128        7.00 (   0.00%)        7.00 (   0.00%)
> Lat 90.0th-qrtle-128        9.00 (   0.00%)        9.00 (   0.00%)
> Lat 99.0th-qrtle-128       13.00 (   0.00%)       14.00 (  -7.69%)
> Lat 99.9th-qrtle-128       20.00 (   0.00%)       20.00 (   0.00%)
> Lat 20.0th-qrtle-128    31776.00 (   0.00%)    30496.00 (   4.03%)
> Lat 50.0th-qrtle-239        9.00 (   0.00%)        9.00 (   0.00%)
> Lat 90.0th-qrtle-239       14.00 (   0.00%)       18.00 ( -28.57%)
> Lat 99.0th-qrtle-239       43.00 (   0.00%)       56.00 ( -30.23%)
> Lat 99.9th-qrtle-239      106.00 (   0.00%)      483.00 (-355.66%)
> Lat 20.0th-qrtle-239    30176.00 (   0.00%)    29984.00 (   0.64%)
> 
> We can see overall latency improvement and some throughput degradation
> when the system gets saturated.
> 
> Also, we run schbench (old version) on an EPYC 7543 system, which has
> 4 NUMA nodes, and each node has 4 LLCs. Monitor the 99.0th latency:
> 
> case                    load            baseline(std%)  compare%( std%)
> normal                  4-mthreads-1-workers     1.00 (  6.47)   +9.02 (  4.68)
> normal                  4-mthreads-2-workers     1.00 (  3.25)  +28.03 (  8.76)
> normal                  4-mthreads-4-workers     1.00 (  6.67)   -4.32 (  2.58)
> normal                  4-mthreads-8-workers     1.00 (  2.38)   +1.27 (  2.41)
> normal                  4-mthreads-16-workers    1.00 (  5.61)   -8.48 (  4.39)
> normal                  4-mthreads-31-workers    1.00 (  9.31)   -0.22 (  9.77)
> 
> When the LLC is underloaded, the latency improvement is observed. When the LLC
> gets saturated, we observe some degradation.
> 

[..snip..]

> +static bool valid_target_cpu(int cpu, struct task_struct *p)
> +{
> +	int nr_running, llc_weight;
> +	unsigned long util, llc_cap;
> +
> +	if (!get_llc_stats(cpu, &nr_running, &llc_weight,
> +			   &util))
> +		return false;
> +
> +	llc_cap = llc_weight * SCHED_CAPACITY_SCALE;
> +
> +	/*
> +	 * If this process has many threads, be careful to avoid
> +	 * task stacking on the preferred LLC, by checking the system's
> +	 * utilization and runnable tasks. Otherwise, if this
> +	 * process does not have many threads, honor the cache
> +	 * aware wakeup.
> +	 */
> +	if (get_nr_threads(p) < llc_weight)
> +		return true;

IIUC, there might be scenarios were llc might be already overloaded with
threads of other process. In that case, we will be returning true for p in
above condition and don't check the below conditions. Shouldn't we check
the below two conditions either way?

Tested this patch with real life workload Daytrader, didn't see any regression.
It spawns lot of threads and is CPU intensive. So, I think it's not impacted
due to the below conditions.

Also, in schbench numbers provided by you, there is a degradation in saturated
case. Is it due to the overhead in computing the preferred llc which is not
being used due to below conditions?

Thanks,
Madadi Vineeth Reddy

> +
> +	/*
> +	 * Check if it exceeded 25% of average utiliazation,
> +	 * or if it exceeded 33% of CPUs. This is a magic number
> +	 * that did not cause heavy cache contention on Xeon or
> +	 * Zen.
> +	 */
> +	if (util * 4 >= llc_cap)
> +		return false;
> +
> +	if (nr_running * 3 >= llc_weight)
> +		return false;
> +
> +	return true;
> +}
> +

[..snip..]

