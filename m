Received: from mail15.out.titan.email (mail15.out.titan.email [3.64.226.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA621204F63
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.64.226.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518466; cv=none; b=XzMDZmwnLz5Ft2nMoVTdo0Lw3AHxp06BlzD/5FFuus54rQ7iX2L9COLTEuuBBTU6eXOaDkdofGCzU6GCKNU3G2MerZhVwtA4nUBe8vt0F3bYIxSd2Ak6cqC4WZEmZLLy9z94KesKjDaljnaEfz4DmDZdAoEFmi6MV61N9rKdnPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518466; c=relaxed/simple;
	bh=GTGLh/qvy/iDcZKAA30fukLxK7T9pjrQQsNvTrDx6LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8vKGPpaTj7NF6FpFMSekz+q8oPEHckxMP1R6dtG2LjxdWGDpL/1Neb8Ac63liTBMXSJAykGpg17sadAVXGJ5neyL75cZKf1XrMoUkviVNsATG+GnZBwnZjVV5H05G6G/12vwvdohg2h+q4QjAPZ8njvBDDigY407zzcF6C8WAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net; spf=pass smtp.mailfrom=techsingularity.net; dkim=pass (1024-bit key) header.d=techsingularity.net header.i=@techsingularity.net header.b=FOiG4QEZ; arc=none smtp.client-ip=3.64.226.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=techsingularity.net header.i=@techsingularity.net header.b="FOiG4QEZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out0101.titan.email (Postfix) with ESMTP id 8295BA0037;
	Tue,  1 Apr 2025 13:23:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=XC3zqCP/m5xWM7BLhUPv3DjSI5dmtW9oDx2JOKuCH8E=;
	c=relaxed/relaxed; d=techsingularity.net;
	h=cc:subject:date:from:references:mime-version:to:message-id:in-reply-to:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1743513838; v=1;
	b=FOiG4QEZILENoHds7TBaj3HdYeoe4ldZOHiFBw2F7WlmhKDikk0KmUan3eplbQWI2KUX2uf3
	Mz/s9E26cNPaM9rxiPRRI/oZ8MqC36aVuc9cUqZg6o+ZNhLTrUe/jVLflSIE3XE9tZ8/w7jMCbL
	ekcMUDZemhA+Dsupvu8bTtGU=
Received: from mail.blacknight.com (ip-84-203-198-132.broadband.digiweb.ie [84.203.198.132])
	by smtp-out0101.titan.email (Postfix) with ESMTPA id E8F54A0003;
	Tue,  1 Apr 2025 13:23:57 +0000 (UTC)
Date: Tue, 1 Apr 2025 14:23:53 +0100
Feedback-ID: :mgorman@techsingularity.net:techsingularity.net:flockmailId
From: Mel Gorman <mgorman@techsingularity.net>
To: Libo Chen <libo.chen@oracle.com>
Cc: peterz@infradead.org, longman@redhat.com, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, tj@kernel.org
Subject: Re: [PATCH v2 1/2] sched/numa: skip VMA scanning on memory pinned to
 one NUMA node via cpuset.mems
Message-ID: <lx5ydw2yymartewho67aapj53sjfpnjlc6l7uplhefpnnettqk@x4hcxewigix2>
References: <20250327002352.203332-1-libo.chen@oracle.com>
 <20250327002352.203332-2-libo.chen@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20250327002352.203332-2-libo.chen@oracle.com>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1743513838370976745.9138.2279671669179809732@prod-euc1-smtp-out1002.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=fpomZE4f c=1 sm=1 tr=0 ts=67ebe8ee
	a=uEl80ZmhafqVrAMTjuFo2w==:117 a=uEl80ZmhafqVrAMTjuFo2w==:17
	a=Q9fys5e9bTEA:10 a=CEWIc4RMnpUA:10 a=yPCof4ZbAAAA:8
	a=mpzrRfd7V9-sn5E2lfoA:9 a=PUjeQqilurYA:10

On Wed, Mar 26, 2025 at 05:23:51PM -0700, Libo Chen wrote:
> When the memory of the current task is pinned to one NUMA node by cgroup,
> there is no point in continuing the rest of VMA scanning and hinting page
> faults as they will just be overhead. With this change, there will be no
> more unnecessary PTE updates or page faults in this scenario.
> 
> We have seen up to a 6x improvement on a typical java workload running on
> VMs with memory and CPU pinned to one NUMA node via cpuset in a two-socket
> AARCH64 system. With the same pinning, on a 18-cores-per-socket Intel
> platform, we have seen 20% improvment in a microbench that creates a
> 30-vCPU selftest KVM guest with 4GB memory, where each vCPU reads 4KB
> pages in a fixed number of loops.
> 
> Signed-off-by: Libo Chen <libo.chen@oracle.com>
> ---
>  kernel/sched/fair.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index e43993a4e5807..6f405e00c9c7e 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3329,6 +3329,13 @@ static void task_numa_work(struct callback_head *work)
>  	if (p->flags & PF_EXITING)
>  		return;
>  
> +	/*
> +	 * Memory is pinned to only one NUMA node via cpuset.mems, naturally
> +	 * no page can be migrated.
> +	 */
> +	if (nodes_weight(cpuset_current_mems_allowed) == 1)
> +		return;
> +

Check cpusets_enabled() first?

-- 
Mel Gorman
SUSE Labs
