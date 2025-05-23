Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515002139C8;
	Fri, 23 May 2025 23:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748042540; cv=none; b=cTVCN30FUhQPVl2YD4kTvstWL9vEHCljQ0SlN38H/VBIsDKoaxr53xF2RrQsLlkR0xtC/klNS8UpjkBQJME7H4/WTCgiz/vUrLqDuCvtC/NPvfH0nv47P8C7BzwDu1YjMweZsNM0HZqvVdwkVt1qyaVJUjNbutRYELhRtpqqK5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748042540; c=relaxed/simple;
	bh=PT0n5oLcAYvJ/GJTS2v1zAuSNvoef4s8WKK2UhO+rdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2OOnMU9Ck4lZ5xWRgNhzPFlnF1g2OCKCmOBhC3Td7hNoTbfS0EZ4J7sy2WZ18eZObRt9VsC0b1wMejtv3lFzg+yh6t8kFcqvYqgdpetwHYJhVei5xm7btN8yBQAghoONV5l4xvzYJllfnrNCFQ3gWLpMt69Lmf9JTfDC5VaDgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UrpNWhEQ; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UrpNWhEQ"
Date: Fri, 23 May 2025 16:22:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748042533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pbohqPvTVeXsKSNiF9Zk+FfL3e0e15hYtvlbPcQaa5Q=;
	b=UrpNWhEQvglIN9mujLRlr0ou2+L+0XlJGEX5uJZXmAr4YdBorlOkOz1isGM1jbHrt0VXT2
	kKqPdtjKmEdgSB8PvWWkELaceu55sJNPUrTbSWo9gYuXJJKicPZJI7Yf/JZv1TMFTZ3ZXZ
	KTehI9aam39MJi6D8EYE/G7mBgJNOms=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Chen Yu <yu.c.chen@intel.com>
Cc: peterz@infradead.org, akpm@linux-foundation.org, mkoutny@suse.com, 
	mingo@redhat.com, tj@kernel.org, hannes@cmpxchg.org, corbet@lwn.net, 
	mgorman@suse.de, mhocko@kernel.org, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, tim.c.chen@intel.com, aubrey.li@intel.com, libo.chen@oracle.com, 
	kprateek.nayak@amd.com, vineethr@linux.ibm.com, venkat88@linux.ibm.com, ayushjai@amd.com, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, yu.chen.surf@foxmail.com, Ayush Jain <Ayush.jain3@amd.com>
Subject: Re: [PATCH v5 1/2] sched/numa: fix task swap by skipping kernel
 threads
Message-ID: <zecfzttkv2ryqbusxjyo7avvkb22dnbaggt3bth2miaujk3wjo@vwwshve724jx>
References: <cover.1748002400.git.yu.c.chen@intel.com>
 <eaacc9c9bd37bac92d43a671867d85b2fdad3b06.1748002400.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaacc9c9bd37bac92d43a671867d85b2fdad3b06.1748002400.git.yu.c.chen@intel.com>
X-Migadu-Flow: FLOW_OUT

On Fri, May 23, 2025 at 08:51:01PM +0800, Chen Yu wrote:
> From: Libo Chen <libo.chen@oracle.com>
> 
> Task swapping is triggered when there are no idle CPUs in
> task A's preferred node. In this case, the NUMA load balancer
> chooses a task B on A's preferred node and swaps B with A. This
> helps improve NUMA locality without introducing load imbalance
> between nodes. In the current implementation, B's NUMA node
> preference is not mandatory. That is to say, a kernel thread
> might be incorrectly chosen as B. However, kernel thread and
> user space thread that does not have mm are not supposed to be
> covered by NUMA balancing because NUMA balancing only considers
> user pages via VMAs.
> 
> According to Peter's suggestion for fixing this issue, we use
> PF_KTHREAD to skip the kernel thread. curr->mm is also checked
> because it is possible that user_mode_thread() might create a
> user thread without an mm. As per Prateek's analysis, after
> adding the PF_KTHREAD check, there is no need to further check
> the PF_IDLE flag:
> "
> - play_idle_precise() already ensures PF_KTHREAD is set before adding
>   PF_IDLE
> 
> - cpu_startup_entry() is only called from the startup thread which
>   should be marked with PF_KTHREAD (based on my understanding looking at
>   commit cff9b2332ab7 ("kernel/sched: Modify initial boot task idle
>   setup"))
> "
> 
> In summary, the check in task_numa_compare() now aligns with
> task_tick_numa().
> 
> Suggested-by: Michal Koutny <mkoutny@suse.com>
> Tested-by: Ayush Jain <Ayush.jain3@amd.com>
> Signed-off-by: Libo Chen <libo.chen@oracle.com>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
