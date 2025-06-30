Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2CE259CAC
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.143.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295311; cv=none; b=kqurcure8owenDDf4Ydl37tlWvsGVjiEhGzxkoR0EXPL9KemlMwCax3GD//Ip0rIwB5MDJOdwsMeLBELV19/FXWqn4ojtVSbTKklZAhj80ONaQSLdFt0l/n1R8c7HWEuQQP0Ju68cvbKRAZ/rx138zKEKOzaNH5u8ny0wqE3p/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295311; c=relaxed/simple;
	bh=fEQFPd4FK5sx/tvPM1/MvIZfotYiCdHdYCsc3MdwbyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6WLGV0WR9zXgru9XS9SFm/zWC1ni7nHkLlWHbZjXIk76w6Ds/3EmldJs3rQ6ruU2ohYFVwLD1Q4OuDQ9LhG03I0GLk5GR7TBxr3pDqB8pRBYm1uEsKWC/TyaWiBg1l8I5jbkK3EQUVdHuynNlADpHXmu242lN+q1kdnFO0ckcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; spf=pass smtp.mailfrom=hpe.com; dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b=U3KbueHG; arc=none smtp.client-ip=148.163.143.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hpe.com header.i=@hpe.com header.b="U3KbueHG"
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UDIpxS013125;
	Mon, 30 Jun 2025 14:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=66GwBjAxEu1pvgNz0ZHYg7BWw2
	W7KDyqi63IZhYN8gI=; b=U3KbueHGyLjp7XF905Vl6vXVNucFUCgHRBjZPWnO8H
	KObaVWifl9qk195cnXSnpdWcpiFaXC2z89Wuyanccqb22yE3e8G7k4MJDB/tyMK5
	acKN8AyOfkJ40gPsMWNwUj6e0YhJdHmaTBvtD6yxFWeq9PgzpjJvv7UZx86tlWzp
	3ofVApdePYY3oKnD/HvkdklLv57zbNtuby4S9ZZi6eY+2Hd3YOEIGM3IoGHjSL6G
	TwdUkxIiekoUFn9tZ1LUmTx4N1e0KKVyHrk9ntBx+cp9beCLVMxsZ77Mo5/OgbSb
	wGZXGTJVXu1em/cl8OB+/+/llgJhMFWsLZiaLLkPdFYQ==
Received: from p1lg14880.it.hpe.com ([16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 47kubgrur5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 14:39:22 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 9E7688003B9;
	Mon, 30 Jun 2025 14:39:21 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.231.227.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTPS id D57D58041D4;
	Mon, 30 Jun 2025 14:39:18 +0000 (UTC)
Date: Mon, 30 Jun 2025 09:39:17 -0500
From: Steve Wahl <steve.wahl@hpe.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Valentin Schneider <vschneid@redhat.com>,
        Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
        Steve Wahl <steve.wahl@hpe.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Subject: Re: [PATCH v2] sched/fair: Use sched_domain_span() for
 topology_span_sane()
Message-ID: <aGKhlYO_SJaNm1mJ@swahl-home.5wahls.com>
References: <20250630061059.1547-1-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630061059.1547-1-kprateek.nayak@amd.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEyMCBTYWx0ZWRfXyJ92YMHiLRex geH5DztTo5ds2xkg0qLZGQKb5yvB8tEOjw7PCLlR7efXJ9t9L8dsJdMEjFiGbq02LLzApFCNE9f 2qJV+Vxo70BoAjNWBlhFu260H5PXe4gM7/7ufRwDNtSUkiLfb2vCFxS9qJDfgBPoV1DSAsGPFHM
 3QFKhytgUJgM3PHklVKuRkZ03H1HP0lpzxoWGEJ+eFNz/cfubFhWfqgFa/JeNFeWbxtZb97N1RD yIeku7E2LP8UuGN0wKBO65Nu2hrrZCWcLivm0pHSHvhU2BFUfuAl/dECD+oVQELelZ9R+nPi/kI jzkO+x+OGBZtqxo7JIrpLEHAzbGCJGy+hJApYiQPHRcmXeHg0sT1gAc5PPOkUdV6mlZl7E8d0Wu
 /LJH9phW1Rn8ZG2tK8QQOIbmZ0h18x43y+0MxXyvrJnE6lzNWtP5dL1x5fysbD5DgEBRrdqC
X-Proofpoint-ORIG-GUID: 8X5QfIk2KkYm5ZCh2ebeMGivlJuIwgXk
X-Authority-Analysis: v=2.4 cv=fN853Yae c=1 sm=1 tr=0 ts=6862a19a cx=c_pps a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=MvuuwTCpAAAA:8 a=20KFwNOVAAAA:8
 a=w75tlOWRVCw27MFiDcoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 8X5QfIk2KkYm5ZCh2ebeMGivlJuIwgXk
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 adultscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300120

Prateek,

This looks good to me.

Reviewed-by: Steve Wahl <steve.wahl@hpe.com>


On Mon, Jun 30, 2025 at 06:10:59AM +0000, K Prateek Nayak wrote:
> Leon noted a topology_span_sane() warning in their guest deployment
> starting from v6.16-rc1 [1]. Debug that followed pointed to the
> tl->mask() for the NODE domain being incorrectly resolved to that of the
> highest NUMA domain.
> 
> tl->mask() for NODE is set to the sd_numa_mask() which depends on the
> global "sched_domains_curr_level" hack. "sched_domains_curr_level" is
> set to the "tl->numa_level" during tl traversal in build_sched_domains()
> calling sd_init() but was not reset before topology_span_sane().
> 
> Since "tl->numa_level" still reflected the old value from
> build_sched_domains(), topology_span_sane() for the NODE domain trips
> when the span of the last NUMA domain overlaps.
> 
> Instead of replicating the "sched_domains_curr_level" hack, Valentin
> suggested using the spans from the sched_domain objects constructed
> during build_sched_domains() which can also catch overlaps when the
> domain spans are fixed up by build_sched_domain().
> 
> The original warning was reproducble on the follwoing NUMA topology
> reported by Leon:
> 
>     $ sudo numactl -H
>     available: 5 nodes (0-4)
>     node 0 cpus: 0 1
>     node 0 size: 2927 MB
>     node 0 free: 1603 MB
>     node 1 cpus: 2 3
>     node 1 size: 3023 MB
>     node 1 free: 3008 MB
>     node 2 cpus: 4 5
>     node 2 size: 3023 MB
>     node 2 free: 3007 MB
>     node 3 cpus: 6 7
>     node 3 size: 3023 MB
>     node 3 free: 3002 MB
>     node 4 cpus: 8 9
>     node 4 size: 3022 MB
>     node 4 free: 2718 MB
>     node distances:
>     node   0   1   2   3   4
>       0:  10  39  38  37  36
>       1:  39  10  38  37  36
>       2:  38  38  10  37  36
>       3:  37  37  37  10  36
>       4:  36  36  36  36  10
> 
> The above topology can be mimicked using the following QEMU cmd that was
> used to reproduce the warning and test the fix:
> 
>      sudo qemu-system-x86_64 -enable-kvm -cpu host \
>      -m 20G -smp cpus=10,sockets=10 -machine q35 \
>      -object memory-backend-ram,size=4G,id=m0 \
>      -object memory-backend-ram,size=4G,id=m1 \
>      -object memory-backend-ram,size=4G,id=m2 \
>      -object memory-backend-ram,size=4G,id=m3 \
>      -object memory-backend-ram,size=4G,id=m4 \
>      -numa node,cpus=0-1,memdev=m0,nodeid=0 \
>      -numa node,cpus=2-3,memdev=m1,nodeid=1 \
>      -numa node,cpus=4-5,memdev=m2,nodeid=2 \
>      -numa node,cpus=6-7,memdev=m3,nodeid=3 \
>      -numa node,cpus=8-9,memdev=m4,nodeid=4 \
>      -numa dist,src=0,dst=1,val=39 \
>      -numa dist,src=0,dst=2,val=38 \
>      -numa dist,src=0,dst=3,val=37 \
>      -numa dist,src=0,dst=4,val=36 \
>      -numa dist,src=1,dst=0,val=39 \
>      -numa dist,src=1,dst=2,val=38 \
>      -numa dist,src=1,dst=3,val=37 \
>      -numa dist,src=1,dst=4,val=36 \
>      -numa dist,src=2,dst=0,val=38 \
>      -numa dist,src=2,dst=1,val=38 \
>      -numa dist,src=2,dst=3,val=37 \
>      -numa dist,src=2,dst=4,val=36 \
>      -numa dist,src=3,dst=0,val=37 \
>      -numa dist,src=3,dst=1,val=37 \
>      -numa dist,src=3,dst=2,val=37 \
>      -numa dist,src=3,dst=4,val=36 \
>      -numa dist,src=4,dst=0,val=36 \
>      -numa dist,src=4,dst=1,val=36 \
>      -numa dist,src=4,dst=2,val=36 \
>      -numa dist,src=4,dst=3,val=36 \
>      ...
> 
> Cc: Steve Wahl <steve.wahl@hpe.com>
> Suggested-by: Valentin Schneider <vschneid@redhat.com>
> Reported-by: Leon Romanovsky <leon@kernel.org>
> Closes: https://lore.kernel.org/lkml/20250610110701.GA256154@unreal/  [1]
> Fixes: ccf74128d66c ("sched/topology: Assert non-NUMA topology masks don't (partially) overlap") # ce29a7da84cd, f55dac1dafb3
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
> v1..v2:
> 
> o Use sched_domain_span() instead of replicating the
>   "sched_domains_curr_level" hack (Valentin)
> 
> o Included the QEMU cmd in the commit message for the record (Valentin)
> 
> v1: https://lore.kernel.org/lkml/20250624041235.1589-1-kprateek.nayak@amd.com/ 
> 
> Changes are based on tip:sched/urgent at commit 914873bc7df9 ("Merge tag
> 'x86-build-2025-05-25' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")
> ---
>  kernel/sched/topology.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index a2a38e1b6f18..734fee573992 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -2418,6 +2418,7 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
>  	id_seen = sched_domains_tmpmask2;
>  
>  	for_each_sd_topology(tl) {
> +		struct sd_data *sdd = &tl->data;
>  
>  		/* NUMA levels are allowed to overlap */
>  		if (tl->flags & SDTL_OVERLAP)
> @@ -2433,22 +2434,24 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
>  		 * breaks the linking done for an earlier span.
>  		 */
>  		for_each_cpu(cpu, cpu_map) {
> -			const struct cpumask *tl_cpu_mask = tl->mask(cpu);
> +			struct sched_domain *sd = *per_cpu_ptr(sdd->sd, cpu);
> +			struct cpumask *sd_span = sched_domain_span(sd);
>  			int id;
>  
>  			/* lowest bit set in this mask is used as a unique id */
> -			id = cpumask_first(tl_cpu_mask);
> +			id = cpumask_first(sd_span);
>  
>  			if (cpumask_test_cpu(id, id_seen)) {
> -				/* First CPU has already been seen, ensure identical spans */
> -				if (!cpumask_equal(tl->mask(id), tl_cpu_mask))
> +				/* First CPU has already been seen, ensure identical sd spans */
> +				sd = *per_cpu_ptr(sdd->sd, id);
> +				if (!cpumask_equal(sched_domain_span(sd), sd_span))
>  					return false;
>  			} else {
>  				/* First CPU hasn't been seen before, ensure it's a completely new span */
> -				if (cpumask_intersects(tl_cpu_mask, covered))
> +				if (cpumask_intersects(sd_span, covered))
>  					return false;
>  
> -				cpumask_or(covered, covered, tl_cpu_mask);
> +				cpumask_or(covered, covered, sd_span);
>  				cpumask_set_cpu(id, id_seen);
>  			}
>  		}
> 
> base-commit: 914873bc7df913db988284876c16257e6ab772c6
> -- 
> 2.34.1
> 

-- 
Steve Wahl, Hewlett Packard Enterprise
