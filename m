Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EC324CEE7
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739283289; cv=none; b=PCHMKRSwGuZa1bWPEe2NFi0AMXTB9cIt+bauj3n11RJvEtw1bZKizLn2BcjSnqJwip6UxcUOaBNmZC+9hmus/NDszWr/LotpK0rp4wHaeOCPf/g3tJL1HSZ8NgOex2hy6KX7VH6J6cFHaNfJ+AgRDpQ1VFHzmU1dBUE1ltMRPxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739283289; c=relaxed/simple;
	bh=4CVdvOldhfydbr6XKr0LsIeiOe+5c3WoavOE6Bs2Lms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWR6Gk63f390GhsDUX86JzNqVWarp2gmz+OTBUoQu/uA2NS5b32Eb7usVz/KdBXMOoCxJ6z4yQxba6juUqjCf4ejLK6R9fY4vtpJOz2OGM8j27NkOsCi/N8ExArYFP9cQVvzRMOj3vc0NKWSUx1HgbIDl8AnVxueZzPT0AR2dwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eo0iWBY4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eo0iWBY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739283286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CjgS7RmEbhQybrUkJqJ00BMkViVSCB7WiBicD2p7Lyk=;
	b=Eo0iWBY4DOQfX7AlXLuqpA1q7LiLb5nXODfLoqnQApI9e9Y0dBKAN08NN8tOXa4ryVVGYy
	/GFKPoRB6W7BMQAm1PBqedlKRuYjU5aCE1dEEqcTTHiM9+q0kDVLkwicGXGvkAJv3PIKnD
	wHij7NaDMX5oAPGG7FW9w7rnc12c/sw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-339-1adu70kHMzS5NjeUYlOhVA-1; Tue,
 11 Feb 2025 09:14:43 -0500
X-MC-Unique: 1adu70kHMzS5NjeUYlOhVA-1
X-Mimecast-MFC-AGG-ID: 1adu70kHMzS5NjeUYlOhVA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 581BD1801BE7;
	Tue, 11 Feb 2025 14:14:42 +0000 (UTC)
Received: from pauld.westford.csb (unknown [10.22.65.9])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 35A4F1801756;
	Tue, 11 Feb 2025 14:14:39 +0000 (UTC)
Date: Tue, 11 Feb 2025 09:14:37 -0500
From: Phil Auld <pauld@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] sched/isolation: Make use of more than one housekeeping
 cpu
Message-ID: <20250211141437.GA349314@pauld.westford.csb>
References: <20250211140104.420739-1-pauld@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211140104.420739-1-pauld@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93


Oops, sorry... meant "[PATCH]"

On Tue, Feb 11, 2025 at 02:01:04PM +0000 Phil Auld wrote:
> The exising code uses housekeeping_any_cpu() to select a cpu for
> a given housekeeping task. However, this often ends up calling
> cpumask_any_and() which is defined as cpumask_first_and() which has
> the effect of alyways using the first cpu among those available.
> 
> The same applies when multiple NUMA nodes are involved. In that
> case the first cpu in the local node is chosen which does provide
> a bit of spreading but with multiple HK cpus per node the same
> issues arise.
> 
> Spread the HK work out by having housekeeping_any_cpu() and
> sched_numa_find_closest() use cpumask_any_and_distribute()
> instead of cpumask_any_and().
> 
> Signed-off-by: Phil Auld <pauld@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Cc: Waiman Long <longman@redhat.com>
> Cc: linux-kernel@vger.kernel.org
> ---
>  kernel/sched/isolation.c | 2 +-
>  kernel/sched/topology.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index 81bc8b329ef1..93b038d48900 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -40,7 +40,7 @@ int housekeeping_any_cpu(enum hk_type type)
>  			if (cpu < nr_cpu_ids)
>  				return cpu;
>  
> -			cpu = cpumask_any_and(housekeeping.cpumasks[type], cpu_online_mask);
> +			cpu = cpumask_any_and_distribute(housekeeping.cpumasks[type], cpu_online_mask);
>  			if (likely(cpu < nr_cpu_ids))
>  				return cpu;
>  			/*
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index c49aea8c1025..94133f843485 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -2101,7 +2101,7 @@ int sched_numa_find_closest(const struct cpumask *cpus, int cpu)
>  	for (i = 0; i < sched_domains_numa_levels; i++) {
>  		if (!masks[i][j])
>  			break;
> -		cpu = cpumask_any_and(cpus, masks[i][j]);
> +		cpu = cpumask_any_and_distribute(cpus, masks[i][j]);
>  		if (cpu < nr_cpu_ids) {
>  			found = cpu;
>  			break;
> -- 
> 2.47.1
> 
> 

-- 

