Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5AB2F94AA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751572359; cv=none; b=rikxYOppZjoUbKcOcez4kMx6AY11Oh5Zn3Daj/Py9gB8QUOD+nIMJPQogjTUHg75qcj0jLq7r0xz+eSk/zsFOvHj+vS13zaWxsArfuIQxb5Grsu/OHfMRa0y4eQBqp0bR8fOeQWL063Iwl0zj09XxcmjemBmg3Av5+2Oj4DRZGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751572359; c=relaxed/simple;
	bh=f9EYCv9pwfVdqGPYWyhy0DBvwMZo36WOLXXeVDZ5WSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4RDIdmXx+oZpMATz+jpou1YKk8vIRLOCdR5uGqZ157Q655tTRbrylbaa7Pr1rLiyqs4gt0P7pA8vx8wHgnVwrb7aMnLRT2J5F80oNVAZXlE75GgiKJjSigRpDMYS7Lhf02bTOnXvhRdZwrJS/kcRSMQoTKQxN8f0ZhXsLcMeLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=skQx8QV6; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="skQx8QV6"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563FXC0d024196;
	Thu, 3 Jul 2025 19:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7LA5uF
	PhwzJudkMZ0Nm+E9Pn5/9k1XG0CEIgQYNd8io=; b=skQx8QV6MhympHX4bC61Nf
	pWeCB2Nn+8oCPTb/sR0s9vUdY6j5m4zUkv7bdR+npprCkdy+2YnuBLKDcCpAEFPr
	PfILIoF8GYsOwQ98PhCgD0LcUt3NOgmgj8qNNF0DS2me448+UkxpE82Ipbiwbju4
	e6vJE4sTKbHPnwbKYnLDddJC7t/iS6xnuT/gYdrakMBXMmUsHk4o4VHwkuP6CRks
	W3LSOm9QM84v2UZGrw/DdHUdSE/fl6aEcBs9il1nSaHn/cOxNvO0r3/KZvtdCrG/
	luQF4OulbauuX8dyAm82ETDeg3wr8YPvvXI6bp4jzApmBBc/zi/N0w8bu0vh5GGA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j84dp05e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:52:17 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 563Jnp1T002396;
	Thu, 3 Jul 2025 19:52:17 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j84dp05b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:52:17 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 563JA7wT021361;
	Thu, 3 Jul 2025 19:52:16 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jwe3p7x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:52:16 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 563JqE1m33161732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Jul 2025 19:52:14 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E21920043;
	Thu,  3 Jul 2025 19:52:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8607520040;
	Thu,  3 Jul 2025 19:52:10 +0000 (GMT)
Received: from [9.39.27.83] (unknown [9.39.27.83])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  3 Jul 2025 19:52:10 +0000 (GMT)
Message-ID: <736d41f0-1eb4-4420-ab67-e88fc7e31bda@linux.ibm.com>
Date: Fri, 4 Jul 2025 01:22:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 14/20] sched: Introduce update_llc_busiest() to
 deal with groups having preferred LLC tasks
To: Tim Chen <tim.c.chen@linux.intel.com>, Chen Yu <yu.c.chen@intel.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Tim Chen <tim.c.chen@intel.com>,
        Vincent Guittot
 <vincent.guittot@linaro.org>,
        Libo Chen <libo.chen@oracle.com>, Abel Wu <wuyun.abel@bytedance.com>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
        Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
        linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        "Gautham R . Shenoy" <gautham.shenoy@amd.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <e5b77a2e33a6a98de0468c999e8c94d226b8e6d3.1750268218.git.tim.c.chen@linux.intel.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <e5b77a2e33a6a98de0468c999e8c94d226b8e6d3.1750268218.git.tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YLeHM5kfhGntX-YQTve8EA_YuLX_hizF
X-Proofpoint-GUID: VjFv3efrMqMqD5s9nmsRrA8lYdOO1i3d
X-Authority-Analysis: v=2.4 cv=Ib6HWXqa c=1 sm=1 tr=0 ts=6866df71 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=Mh2Rky1iVa79jD0_eDEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MyBTYWx0ZWRfX2grjFfmOCrgq E1PcG2smoh0W138VcbGnYcpHgDnSWTxPpRlTKZcq83W4i1nx522QyuUpTjOaZOEBk2VHqwi/bh4 v0oIjpAV8e7yMwNaClrFgEI61JItzD8rAM3ya6NoxtlNqZYLbwGWn8ZNOqiPrFD4ZMBglNleiy+
 yQQH/5BrMHiyrEAhW2Y1xuMP1Wta6JPk+03RkfWFBsS8qT85WHdISJ7VZ9YbX7SWQdaaj/EfE6a hvFRJyEkIcc4Zsp1XI2yvH0RUEglS1WfnDD5w5EdZkQAF5cyBgi6tvUx+ocDmH+mv3vkrqdzS2U J5fv3+4Rn1p0vDrcg4GvD63CYg/OlRyQ9ox9SRe2F1M4lb29WTan0yJnrwFJePEFeIvaalcz04n
 O1E4phovx/vtFkXSRgdxeLuuw1RB53hIFwaJVS9QKBWGSwbKhx2FQgdSKHxp3Db4ZCg32vt8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030163



On 6/18/25 23:58, Tim Chen wrote:
> The load balancer attempts to identify the busiest sched_group with
> the highest load and migrates some tasks to a less busy sched_group
> to distribute the load across different CPUs.
> 
> When cache-aware scheduling is enabled, the busiest sched_group is
> defined as the one with the highest number of tasks preferring to run
> on the destination LLC. If the busiest group has llc_balance tag,
> the cache aware load balance will be launched.
> 
> Introduce the helper function update_llc_busiest() to identify
> such sched group with most tasks preferring the destination LLC.
> 
> Co-developed-by: Chen Yu <yu.c.chen@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> ---
>   kernel/sched/fair.c | 36 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 48a090c6e885..ab3d1239d6e4 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -10848,12 +10848,36 @@ static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
>   
>   	return false;
>   }
> +
> +static bool update_llc_busiest(struct lb_env *env,
> +			       struct sg_lb_stats *busiest,
> +			       struct sg_lb_stats *sgs)
> +{
> +	int idx;
> +
> +	/* Only the candidate with llc_balance need to be taken care of */
> +	if (!sgs->group_llc_balance)
> +		return false;
> +
> +	/*
> +	 * There are more tasks that want to run on dst_cpu's LLC.
> +	 */
> +	idx = llc_idx(env->dst_cpu);
> +	return sgs->nr_pref_llc[idx] > busiest->nr_pref_llc[idx];
> +}
>   #else
>   static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
>   			       struct sched_group *group)
>   {
>   	return false;
>   }
> +
> +static bool update_llc_busiest(struct lb_env *env,
> +			       struct sg_lb_stats *busiest,
> +			       struct sg_lb_stats *sgs)
> +{
> +	return false;
> +}
>   #endif
>   
>   static inline long sibling_imbalance(struct lb_env *env,
> @@ -11085,6 +11109,14 @@ static bool update_sd_pick_busiest(struct lb_env *env,
>   	     sds->local_stat.group_type != group_has_spare))
>   		return false;
>   
> +	/* deal with prefer LLC load balance, if failed, fall into normal load balance */
> +	if (update_llc_busiest(env, busiest, sgs))
> +		return true;
> +
> +	/* if there is already a busy group, skip the normal load balance */
> +	if (busiest->group_llc_balance)
> +		return false;
> +

If you had a group which was group_overloaded but it could have group_llc_balance right?
In this case the priorities based on group_type is not followed no?

>   	if (sgs->group_type > busiest->group_type)
>   		return true;
>   
> @@ -11991,9 +12023,11 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
>   	/*
>   	 * Try to move all excess tasks to a sibling domain of the busiest
>   	 * group's child domain.
> +	 * Also do so if we can move some tasks that prefer the local LLC.
>   	 */
>   	if (sds.prefer_sibling && local->group_type == group_has_spare &&
> -	    sibling_imbalance(env, &sds, busiest, local) > 1)
> +	    (busiest->group_llc_balance ||
> +	    sibling_imbalance(env, &sds, busiest, local) > 1))
>   		goto force_balance;
>   
>   	if (busiest->group_type != group_overloaded) {

Also, This load balancing happening due to llc could be very tricky to debug.
Any stats added to schedstat or sched/debug?
