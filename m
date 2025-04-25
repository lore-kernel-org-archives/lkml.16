Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86CB207DFF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571577; cv=none; b=ll539d+OzL7vsq2lIsKsMoQ9Q+GuOrDk36xSEca8bvjT/ccsrdprdQvWj0WVOVxJpPb0FqzoDd6NEpx7GDslwpxBafUA8ABtDixpVyrW0+MfUEmQpptkR6f2WxlbjnkprwP6CyNVzL+mQIk1+cegJ2vmgoLvjnPK4IZ+Pmg4Q1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571577; c=relaxed/simple;
	bh=qcgUgxlerHuWw6NZsYs//PPbW+ukKNhqy7kQ2GfpUSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgDNfQ4P1pVOR8bM/94m42Zg5UocmqnZNRpihGC5MmVqEDtGTAPLFh5P+ZsCvRBquDTZemWuz/igychZ+3ydlVbo/JCK2T8Z2ix/8ymWJtm1XKoFeUxgkfw8SyRdekhULjzI5Yqd36kG43LE6YL+RJ02cQMXhzBGDcCbRNztsKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=QZZQBwYx; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="QZZQBwYx"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8o2vQ006503;
	Fri, 25 Apr 2025 08:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=chfOjaRngWESBCDWJjAXMfgr3f+nFzlqnQW2vfyWUco=; b=QZZQBwYxSDVw
	01cc4sZdjEOH6Wqmlt2nN91JJUS/QyPqhDtL+w4WfhvfOz0gbKczfKj+W8S0VUHr
	r3Y4q5B8GzFs6k6pT2tdL5sO5SaWUJkJ1z1O92WLVe10qY7NhFdTwEwYVtCKf4L1
	5nkV56ltKSeGhrSV9bdmfG4KnssBz/bB9PFK6CA2Bk+hXhKZ0g5JvJ7QTGDI1sMV
	XocXkL2DZUZln2+YT4HBn9MdNuGNoXQYz1J40IPdD1O2T6V0nXuM3wUDwC27Cbtk
	NE8Isw3e2H7hILfZxpmanLfntS0giTqCQCS83mT6jky3Zelr3jHebQyLyYhrxw/Q
	4npT0u2BAw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467wd9ja7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 08:58:56 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53P8wu5k006233;
	Fri, 25 Apr 2025 08:58:56 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467wd9ja78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 08:58:56 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8biUc000925;
	Fri, 25 Apr 2025 08:58:54 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfy4ebv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 08:58:54 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53P8wsW160555750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 08:58:54 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 03BE35803F;
	Fri, 25 Apr 2025 08:58:54 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E85EA58061;
	Fri, 25 Apr 2025 08:58:47 +0000 (GMT)
Received: from [9.43.9.122] (unknown [9.43.9.122])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Apr 2025 08:58:47 +0000 (GMT)
Message-ID: <9b90a1ea-633b-4bba-af74-ebf7ea86fb22@linux.ibm.com>
Date: Fri, 25 Apr 2025 14:28:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] sched: Inhibit cache aware scheduling if the
 preferred LLC is over aggregated
To: "Chen, Yu C" <yu.c.chen@intel.com>
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
        Len Brown <len.brown@intel.com>, Chen Yu <yu.chen.surf@foxmail.com>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <cover.1745199017.git.yu.c.chen@intel.com>
 <2c45f6db1efef84c6c1ed514a8d24a9bc4a2ca4b.1745199017.git.yu.c.chen@intel.com>
 <cd6065dc-837f-474a-a4f5-0faa607da73a@linux.ibm.com>
 <d221a260-51d5-4dec-8c08-37d27dd80145@intel.com>
Content-Language: en-US
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Reply-To: d221a260-51d5-4dec-8c08-37d27dd80145@intel.com
In-Reply-To: <d221a260-51d5-4dec-8c08-37d27dd80145@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -PwbzkJ1dVM0zwoofPqt4pYWRMFXYUKJ
X-Proofpoint-ORIG-GUID: SvjTTdp5h5lXY8tcVhILSJzLQprMu228
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2MiBTYWx0ZWRfXzHCSOHqCp/6m YIVK9HWSo3zUGIOn0FM+B8LAM5x+l+N42yGDWWp9zJyO1jp/2rZ+kOODyZUtiGLVKHYjYkaMmEG 0S8vr8QQ0i+ToR4Y8N/59t8hlu0bfW0xb8q/m9rJ09cqjrIFH1vp4hETaidVx4OAG4zn560uaIW
 FQ+YQ0hMA9omBFc2s6YrjRpdsdC2gh4oxrwWIc/4Ng14MZlRmQVmarli+E8OwcmYa/iIZzDw5/H yAoGxWhyXORdzT3N2hju8TazP7DYJgf4ty8oaI6jbaJ2sP2Ds6AR/RLhhkmQxBppfWahH7Kw7Du RGn4bKOPXl3d9ZM6pm4ViyKnhBqg9uFgadCGK6EFb4QlRN/G9rnKmDI4EgSkNoOC4SPfHZciUO2
 qfUSqZzXX9Sn75GefGFpPnlzAi++F9jQA+9I1eF3FvPW80gEpiKbiidJPJWxZE5aP2e84f4c
X-Authority-Analysis: v=2.4 cv=M5lNKzws c=1 sm=1 tr=0 ts=680b4ed0 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=4TTjBmq4DFnO0zUh-i0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 clxscore=1011 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250062

On 24/04/25 19:41, Chen, Yu C wrote:
> Hi Madadi,
> 
> On 4/24/2025 5:22 PM, Madadi Vineeth Reddy wrote:
>> Hi Chen Yu,
>>
>> On 21/04/25 08:55, Chen Yu wrote:
>>> It is found that when the process's preferred LLC gets saturated by too many
>>> threads, task contention is very frequent and causes performance regression.
>>>
>>> Save the per LLC statistics calculated by periodic load balance. The statistics
>>> include the average utilization and the average number of runnable tasks.
>>> The task wakeup path for cache aware scheduling manipulates these statistics
>>> to inhibit cache aware scheduling to avoid performance regression. When either
>>> the average utilization of the preferred LLC has reached 25%, or the average
>>> number of runnable tasks has exceeded 1/3 of the LLC weight, the cache aware
>>> wakeup is disabled. Only when the process has more threads than the LLC weight
>>> will this restriction be enabled.
>>>
>>> Running schbench via mmtests on a Xeon platform, which has 2 sockets, each socket
>>> has 60 Cores/120 CPUs. The DRAM interleave is enabled across NUMA nodes via BIOS,
>>> so there are 2 "LLCs" in 1 NUMA node.
>>>
>>> compare-mmtests.pl --directory work/log --benchmark schbench --names baseline,sched_cache
>>>                                      baselin             sched_cach
>>>                                     baseline            sched_cache
>>> Lat 50.0th-qrtle-1          6.00 (   0.00%)        6.00 (   0.00%)
>>> Lat 90.0th-qrtle-1         10.00 (   0.00%)        9.00 (  10.00%)
>>> Lat 99.0th-qrtle-1         29.00 (   0.00%)       13.00 (  55.17%)
>>> Lat 99.9th-qrtle-1         35.00 (   0.00%)       21.00 (  40.00%)
>>> Lat 20.0th-qrtle-1        266.00 (   0.00%)      266.00 (   0.00%)
>>> Lat 50.0th-qrtle-2          8.00 (   0.00%)        6.00 (  25.00%)
>>> Lat 90.0th-qrtle-2         10.00 (   0.00%)       10.00 (   0.00%)
>>> Lat 99.0th-qrtle-2         19.00 (   0.00%)       18.00 (   5.26%)
>>> Lat 99.9th-qrtle-2         27.00 (   0.00%)       29.00 (  -7.41%)
>>> Lat 20.0th-qrtle-2        533.00 (   0.00%)      507.00 (   4.88%)
>>> Lat 50.0th-qrtle-4          6.00 (   0.00%)        5.00 (  16.67%)
>>> Lat 90.0th-qrtle-4          8.00 (   0.00%)        5.00 (  37.50%)
>>> Lat 99.0th-qrtle-4         14.00 (   0.00%)        9.00 (  35.71%)
>>> Lat 99.9th-qrtle-4         22.00 (   0.00%)       14.00 (  36.36%)
>>> Lat 20.0th-qrtle-4       1070.00 (   0.00%)      995.00 (   7.01%)
>>> Lat 50.0th-qrtle-8          5.00 (   0.00%)        5.00 (   0.00%)
>>> Lat 90.0th-qrtle-8          7.00 (   0.00%)        5.00 (  28.57%)
>>> Lat 99.0th-qrtle-8         12.00 (   0.00%)       11.00 (   8.33%)
>>> Lat 99.9th-qrtle-8         19.00 (   0.00%)       16.00 (  15.79%)
>>> Lat 20.0th-qrtle-8       2140.00 (   0.00%)     2140.00 (   0.00%)
>>> Lat 50.0th-qrtle-16         6.00 (   0.00%)        5.00 (  16.67%)
>>> Lat 90.0th-qrtle-16         7.00 (   0.00%)        5.00 (  28.57%)
>>> Lat 99.0th-qrtle-16        12.00 (   0.00%)       10.00 (  16.67%)
>>> Lat 99.9th-qrtle-16        17.00 (   0.00%)       14.00 (  17.65%)
>>> Lat 20.0th-qrtle-16      4296.00 (   0.00%)     4200.00 (   2.23%)
>>> Lat 50.0th-qrtle-32         6.00 (   0.00%)        5.00 (  16.67%)
>>> Lat 90.0th-qrtle-32         8.00 (   0.00%)        6.00 (  25.00%)
>>> Lat 99.0th-qrtle-32        12.00 (   0.00%)       10.00 (  16.67%)
>>> Lat 99.9th-qrtle-32        17.00 (   0.00%)       14.00 (  17.65%)
>>> Lat 20.0th-qrtle-32      8496.00 (   0.00%)     8528.00 (  -0.38%)
>>> Lat 50.0th-qrtle-64         6.00 (   0.00%)        5.00 (  16.67%)
>>> Lat 90.0th-qrtle-64         8.00 (   0.00%)        8.00 (   0.00%)
>>> Lat 99.0th-qrtle-64        12.00 (   0.00%)       12.00 (   0.00%)
>>> Lat 99.9th-qrtle-64        17.00 (   0.00%)       17.00 (   0.00%)
>>> Lat 20.0th-qrtle-64     17120.00 (   0.00%)    17120.00 (   0.00%)
>>> Lat 50.0th-qrtle-128        7.00 (   0.00%)        7.00 (   0.00%)
>>> Lat 90.0th-qrtle-128        9.00 (   0.00%)        9.00 (   0.00%)
>>> Lat 99.0th-qrtle-128       13.00 (   0.00%)       14.00 (  -7.69%)
>>> Lat 99.9th-qrtle-128       20.00 (   0.00%)       20.00 (   0.00%)
>>> Lat 20.0th-qrtle-128    31776.00 (   0.00%)    30496.00 (   4.03%)
>>> Lat 50.0th-qrtle-239        9.00 (   0.00%)        9.00 (   0.00%)
>>> Lat 90.0th-qrtle-239       14.00 (   0.00%)       18.00 ( -28.57%)
>>> Lat 99.0th-qrtle-239       43.00 (   0.00%)       56.00 ( -30.23%)
>>> Lat 99.9th-qrtle-239      106.00 (   0.00%)      483.00 (-355.66%)
>>> Lat 20.0th-qrtle-239    30176.00 (   0.00%)    29984.00 (   0.64%)
>>>
>>> We can see overall latency improvement and some throughput degradation
>>> when the system gets saturated.
>>>
>>> Also, we run schbench (old version) on an EPYC 7543 system, which has
>>> 4 NUMA nodes, and each node has 4 LLCs. Monitor the 99.0th latency:
>>>
>>> case                    load            baseline(std%)  compare%( std%)
>>> normal                  4-mthreads-1-workers     1.00 (  6.47)   +9.02 (  4.68)
>>> normal                  4-mthreads-2-workers     1.00 (  3.25)  +28.03 (  8.76)
>>> normal                  4-mthreads-4-workers     1.00 (  6.67)   -4.32 (  2.58)
>>> normal                  4-mthreads-8-workers     1.00 (  2.38)   +1.27 (  2.41)
>>> normal                  4-mthreads-16-workers    1.00 (  5.61)   -8.48 (  4.39)
>>> normal                  4-mthreads-31-workers    1.00 (  9.31)   -0.22 (  9.77)
>>>
>>> When the LLC is underloaded, the latency improvement is observed. When the LLC
>>> gets saturated, we observe some degradation.
>>>
>>
>> [..snip..]
>>
>>> +static bool valid_target_cpu(int cpu, struct task_struct *p)
>>> +{
>>> +    int nr_running, llc_weight;
>>> +    unsigned long util, llc_cap;
>>> +
>>> +    if (!get_llc_stats(cpu, &nr_running, &llc_weight,
>>> +               &util))
>>> +        return false;
>>> +
>>> +    llc_cap = llc_weight * SCHED_CAPACITY_SCALE;
>>> +
>>> +    /*
>>> +     * If this process has many threads, be careful to avoid
>>> +     * task stacking on the preferred LLC, by checking the system's
>>> +     * utilization and runnable tasks. Otherwise, if this
>>> +     * process does not have many threads, honor the cache
>>> +     * aware wakeup.
>>> +     */
>>> +    if (get_nr_threads(p) < llc_weight)
>>> +        return true;
>>
>> IIUC, there might be scenarios were llc might be already overloaded with
>> threads of other process. In that case, we will be returning true for p in
>> above condition and don't check the below conditions. Shouldn't we check
>> the below two conditions either way?
> 
> The reason why get_nr_threads() was used is that we don't know if the following threshold is suitable for different workloads. We chose 25% and 33% because we found that it worked well for workload A, but was too low for workload B. Workload B requires the cache-aware scheduling to be enabled in any case, and the number of threads in B is smaller than the llc_weight. Therefore, we use the above check to meet the requirements of B. What you said is correct. We can remove the above checks on nr_thread and make the combination of utilization and nr_running a mandatory check, and then conduct further tuning.>

Thanks Chen. It's always tricky to make all workloads happy. As long as
we're not regressing too much on the others, it should be fine I guess given
the overall impact is positive.

JFYI, In Power10, LLC is at a small core level containing 4 threads. So,
nr_running on LLC can't be more than 1 for cache aware scheduling to work.

>> Tested this patch with real life workload Daytrader, didn't see any regression.
> 
> Good to know the regression is gone.
> 
>> It spawns lot of threads and is CPU intensive. So, I think it's not impacted
>> due to the below conditions.
>>
>> Also, in schbench numbers provided by you, there is a degradation in saturated
>> case. Is it due to the overhead in computing the preferred llc which is not
>> being used due to below conditions?
> 
> Yes, the overhead of preferred LLC calculation could be one part, and we also suspect that the degradation might be tied to the task migrations. We still observed more task migrations than the baseline, even when the system was saturated (in theory, after 25% is exceeded, we should fallback to the generic task wakeup path). We haven't dug into that yet, and we can conduct an investigation in the following days.

Interesting. I will also try to look into these extra migrations.

Thanks,
Madadi Vineeth Reddy

> 
> thanks,
> Chenyu>
>> Thanks,
>> Madadi Vineeth Reddy
>>
>>> +
>>> +    /*
>>> +     * Check if it exceeded 25% of average utiliazation,
>>> +     * or if it exceeded 33% of CPUs. This is a magic number
>>> +     * that did not cause heavy cache contention on Xeon or
>>> +     * Zen.
>>> +     */
>>> +    if (util * 4 >= llc_cap)
>>> +        return false;
>>> +
>>> +    if (nr_running * 3 >= llc_weight)
>>> +        return false;
>>> +
>>> +    return true;
>>> +}
>>> +
>>
>> [..snip..]
>>

