Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADD7205E3B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438888; cv=none; b=YtI6jAhyvvCAn3ll3+RwibsQbxXkaXgi9l3b8TXmxyWs321W4aH0Uaq6XrDil5qS9PLy1kcSrkvttIQ0GOVBW7jDWqmMxCLp/RaO8joXDLj6HE/TkInWI7wiadg3LSPfViYuKCO+csaDbNrntbvsL8rXBVS8Vc3+92ivGnr/VNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438888; c=relaxed/simple;
	bh=MSNCDYWhC0BoJvzHv6aZ+GAZarN9XPq20ZD8k2S4QAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VluLYz6+GTCYAO1n2wLEPfHhFvA5LT9XGY3FpMQq+AieDUsPyMcReZVO8RIWwj5cdKnEqzRHc5dxT+FKtMSKeWKr3tlomVy6jmF1Nb0KxmVYRked6VA4SmdimJ8Ay1RIs6r1rLZM0QSO5wiE+BjWJIiGdub1DNb0svpFTfrIWJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=NBuDnsMU; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="NBuDnsMU"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625UxjF014229;
	Wed, 2 Jul 2025 06:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SFZDe/
	Gde86Kbjaz3BKebqVXNaKNf1/X45PreI5c5OE=; b=NBuDnsMUg7GxC7SHtUBZcc
	MJF1L6bgMg6dm7/aqvwDd90k0FmLjdI98jgR9PukaibDnATpF/y9/+iFIzhwCoR6
	MMg2wE2q4vT+jXEtFTpt7XLiQjy6AwAzTU8lkRaj5aVduzwg8y1QuG0sIgtHsxP7
	g38Bb8IOylkPsAWgU91t4DPqKLWfhTwFQJENbOI09fnyTGSK30LFNt3OuWtdK40h
	l7We/ElNM78rQ6sxNT3JmVYo7Aw+sk1aT5tMzdnGQjEhEH6uJz9W3U49IWitN6+7
	L6GKAFSPcIapRRIrU+/8RBZc4k6S4gPrsmAgzjXPh1fw9i8yTSoFTl+OUK+PcHHQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j84dbsbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 06:47:39 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5626kfpO019564;
	Wed, 2 Jul 2025 06:47:38 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j84dbsbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 06:47:38 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5624LJAf021109;
	Wed, 2 Jul 2025 06:47:37 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jtquegav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 06:47:37 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5626la2w29557450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 06:47:36 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D86F58059;
	Wed,  2 Jul 2025 06:47:36 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5418758058;
	Wed,  2 Jul 2025 06:47:28 +0000 (GMT)
Received: from [9.43.0.55] (unknown [9.43.0.55])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Jul 2025 06:47:27 +0000 (GMT)
Message-ID: <85bff038-6bc8-4643-8a15-89ac435206fd@linux.ibm.com>
Date: Wed, 2 Jul 2025 12:17:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 05/20] sched: Add hysteresis to switch a task's
 preferred LLC
To: Tim Chen <tim.c.chen@linux.intel.com>
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
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        "Gautham R . Shenoy" <gautham.shenoy@amd.com>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <7371f30196b317c0c5a0ae3fa463ec76a4dc69ef.1750268218.git.tim.c.chen@linux.intel.com>
Content-Language: en-US
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
In-Reply-To: <7371f30196b317c0c5a0ae3fa463ec76a4dc69ef.1750268218.git.tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6DmLWmk7hBSCDR5zfQGC9iqHYfdeBr7c
X-Proofpoint-GUID: Ljqh5qdsVQd0OSVYqiz9iHARcCrKJLnu
X-Authority-Analysis: v=2.4 cv=Ib6HWXqa c=1 sm=1 tr=0 ts=6864d60b cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=SekPmXZEEjEHJW-B8U4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA1MyBTYWx0ZWRfXxI6lkJwOw1Uq b+fsKmNDv3mrAryock56pxegiAngsvG+ZjccNFt48dsQVEola2Le+YByeU5slUK60HWa869Wvnj 4Eurg01Ome0sDXDmyfdqrCVCvVSecRbECPmISyZfm1PET9whxRnMjV84RVKpKk0kBsio0YMTpDS
 MFTT2H1HnsOqwtlnyfy8mRZPdEgOO9bVtO/qcHvRLZBX/9OsElBJNSh33g1Okyv4UACXYnJTkKe gJYiVCpii23X4pk2vDJm99GRQscZY+U5z9qWtutGpmrJbT+upxgZEspJsK2p5HBhMT48l6DSl9C nsvI/eEfyaJj7RLoFb0vxC7WAzRYXvL9td4xqZ0CN/7hgZAsMr5IeseWNy51kQD6+rw6WLXlyJD
 txl2kN70kzqSkLt0ikvjGTfN458ZX9ZwJrbySVERB82ed261ze6Psr7WkEsC0CsqooYjE5//
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020053

Hi Tim,

On 18/06/25 23:57, Tim Chen wrote:
> Switching a process's preferred LLC generates lots of task
> migrations across LLCs. To avoid frequent switches
> of home LLC, implement the following policy:
> 
> 1. Require a 2x occ change threshold to switch preferred LLC
> 2. Don't discard preferred LLC for a task
> 
> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> ---
>  kernel/sched/fair.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 6a2678f9d44a..7fb2322c5d9e 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1175,6 +1175,14 @@ static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
>  #define EPOCH_PERIOD	(HZ/100)	/* 10 ms */
>  #define EPOCH_OLD	5		/* 50 ms */
>  
> +static int llc_id(int cpu)
> +{
> +	if (cpu < 0)
> +		return -1;
> +
> +	return per_cpu(sd_llc_id, cpu);
> +}
> +
>  void mm_init_sched(struct mm_struct *mm, struct mm_sched __percpu *_pcpu_sched)
>  {
>  	unsigned long epoch;
> @@ -1299,6 +1307,7 @@ static void task_cache_work(struct callback_head *work)
>  	struct task_struct *p = current;
>  	struct mm_struct *mm = p->mm;
>  	unsigned long m_a_occ = 0;
> +	unsigned long last_m_a_occ = 0;
>  	int cpu, m_a_cpu = -1;
>  	cpumask_var_t cpus;
>  
> @@ -1337,11 +1346,13 @@ static void task_cache_work(struct callback_head *work)
>  					     per_cpu(sd_llc_id, i), occ, m_occ, m_cpu, nr);
>  			}
>  
> -			a_occ /= nr;
> +			// a_occ /= nr;

Is the above by mistake?
I think we need to have average only and not the total value as that favors LLCs with
larger size.

Thanks,
Madadi Vineeth Reddy

>  			if (a_occ > m_a_occ) {
>  				m_a_occ = a_occ;
>  				m_a_cpu = m_cpu;
>  			}
> +			if (llc_id(cpu) == llc_id(mm->mm_sched_cpu))
> +				last_m_a_occ = a_occ;
>  
>  			trace_printk("(%d) a_occ: %ld m_a_occ: %ld\n",
>  				     per_cpu(sd_llc_id, cpu), a_occ, m_a_occ);
> @@ -1355,13 +1366,10 @@ static void task_cache_work(struct callback_head *work)
>  		}
>  	}
>  
> -	/*
> -	 * If the max average cache occupancy is 'small' we don't care.
> -	 */
> -	if (m_a_occ < (NICE_0_LOAD >> EPOCH_OLD))
> -		m_a_cpu = -1;
> -
> -	mm->mm_sched_cpu = m_a_cpu;
> +	if (m_a_occ > (2 * last_m_a_occ)) {
> +		/* avoid the bouncing of mm_sched_cpu */
> +		mm->mm_sched_cpu = m_a_cpu;
> +	}
>  
>  	free_cpumask_var(cpus);
>  }

