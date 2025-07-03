Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A363B1E5B7A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571643; cv=none; b=AVTRxWY7yvbTwCjdBnmOEidLmaO0Yo1mN8ePqqzLtEADRv5Dsos67nx07eRZ6u5pfHR3sbSZ5Bz3t6chAEOsl/hSXeYyX8+lJ6p02pAu5wCJcM+uQC9vqYEeQGm+5pokhlvDySgHY/WzpGL5ZWRJZLOZ4jvaEhzckO9f3F2eH+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571643; c=relaxed/simple;
	bh=2m8PxdRxHpElgScrKxRSTqSGHOGx+ASr5kdiYmxMxa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WplntsSq9n8SjXAi6t6GA75A8RnJFet85BSOECkUN4askwBfWUCgMjf6wDevvTyKkNZyKBBuXodE0WqrkOMdeutks09cSWbKqrfUV2ZnRo7krM5pRA+B23ZOFS5n1Hmf516seJH/fcYkIvXMJTxzET7kKlBPwG0EUrclFczNBso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SUnsNcHM; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SUnsNcHM"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HdFxr005591;
	Thu, 3 Jul 2025 19:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=W7OQFS
	/yaBfu9Cy8nFHMVGYaT/1JEdtzhobo0Wf/0pA=; b=SUnsNcHMvAZXjGeQNQKE6P
	WNR4d5SLHpDg5E45x6Ii9As5jW4Ba21NcMyuAobZlQkoEJGnVFoURQC+LY+czdqq
	SjDrsuG4z72c5yvzXSESmNSErRLCNDLBRMR1YllLol41RfNkGf4Jj57yaBdHghGV
	bSl5/LNMnakmGr+OLTLYh2mi3Lq2CWDptgoq38wD1EzHsB5poBvUEScFDkrdRJdP
	PjnYrkdBxdfUDa9NCv7o2SaOtskPPTBzFKdkMPMYv75Kjy8BEnSDKWHSiPWcq/sm
	p/NemK/NJB1R+gC5ask8NxY7+OfDE8Bq6lN3CBSbt5rHSbqi2ogrOfuYZS8jlxRQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j5ttnrtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:39:58 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 563JdKuC029412;
	Thu, 3 Jul 2025 19:39:57 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j5ttnrtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:39:57 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 563GmO0j032225;
	Thu, 3 Jul 2025 19:39:56 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47ju40xmf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 19:39:56 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 563Jdswx45285710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Jul 2025 19:39:54 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D022820040;
	Thu,  3 Jul 2025 19:39:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 066A020043;
	Thu,  3 Jul 2025 19:39:51 +0000 (GMT)
Received: from [9.39.27.83] (unknown [9.39.27.83])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  3 Jul 2025 19:39:50 +0000 (GMT)
Message-ID: <ab5f9e1f-cdec-4993-822f-d9b64144ad7c@linux.ibm.com>
Date: Fri, 4 Jul 2025 01:09:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 04/20] sched: Avoid calculating the cpumask if the
 system is overloaded
To: Tim Chen <tim.c.chen@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>
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
        linux-kernel@vger.kernel.org, Chen Yu <yu.c.chen@intel.com>,
        "Gautham R . Shenoy" <gautham.shenoy@amd.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <2901db739c1792eb9ece08a2b8d3b8de32efd0eb.1750268218.git.tim.c.chen@linux.intel.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <2901db739c1792eb9ece08a2b8d3b8de32efd0eb.1750268218.git.tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yYn0-nI3lOiJmPBAwQGwuA5dGKlQQpG6
X-Authority-Analysis: v=2.4 cv=UtNjN/wB c=1 sm=1 tr=0 ts=6866dc8e cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=zd2uoN0lAAAA:8 a=rTAms6j2cEy0gM8qKJMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: dHksqMWDRRUkJ3XX22ZqXbVgtQSsWpFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MCBTYWx0ZWRfXwJXbZxn1JG1/ JKkOYJ5a+PiJxzeEcrt1FeFVGPS8JaPD5mkUpzESrqgdWHtK5T5OSVegi8T2T66JwHzPBXLNPxi aGzpRXtSkv4EkZNSISL7mX8zUWE29Pn9FtQDMVspVT0I/jhtLKMzWzB/nUyjJZwVNgJLqTMmkET
 rrxxwer9WW4VkeaoQDkKdwSeTDguJKN2tEvrSH4Lfi6J1aTkkCqcW79yHODfo4WkgqKuIxaQBoO xobXq59ZSvvi8Laa87BBxZCbl3IC9MMSfRAxhmBdljtloZjoRVW90IrHokPTnDmuM52n0t6WdBX vk2e2PcHdZ1NN47d04ywCnssiJXywOevmcrVlid640QYIDJ7RQ73Qv2zyk67g6j+b4gnFACbaWU
 p8kMMPV3aD2ZxdDk2bsImrKcLb+isZlqkFscXw9zDt/CnTdwgqafSx/JH3/jmOvaqlAk8d/r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030160



On 6/18/25 23:57, Tim Chen wrote:
> From: K Prateek Nayak <kprateek.nayak@amd.com>
> 
> If the SIS_UTIL cuts off idle cpu search, result of the cpumask_and() is
> of no use. Since select_idle_cpu() can now be called twice per wake up
> in the select_idle_sibling() due to cache aware wake up, this overhead
> can be visible in benchmarks like hackbench.
> 
> To save some additional cycles, especially in cases where we target
> the LLC frequently and the search bails out because the LLC is busy,
> only calculate the cpumask if the system is not overloaded.
> 

This patch could be independent and should help in general.
But changelog needs to be updated.


> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>   kernel/sched/fair.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 567ad2a0cfa2..6a2678f9d44a 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -7918,8 +7918,6 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
>   	int i, cpu, idle_cpu = -1, nr = INT_MAX;
>   	struct sched_domain_shared *sd_share;
>   
> -	cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
> -
>   	if (sched_feat(SIS_UTIL)) {
>   		sd_share = rcu_dereference(per_cpu(sd_llc_shared, target));
>   		if (sd_share) {
> @@ -7931,6 +7929,8 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
>   		}
>   	}
>   
> +	cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
> +
>   	if (static_branch_unlikely(&sched_cluster_active)) {
>   		struct sched_group *sg = sd->groups;
>   

