Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B3D1798F;
	Thu, 12 Jun 2025 05:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749706776; cv=none; b=oDELRM4xqAdirHZvGnUSZ40fiPsHYmHaEs3m6kHU/bvyZ+dbn66VqkW50dT8oqr+eusZ4+nvXOjOsh3OxUAiwy8BdwihVlGk+kzipw0i8TRNr0hPlBR3McNWCgqFLufB0IPVx6aoYAtPmDoVSylBNF54dD4NctHYwwsvyMhsAKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749706776; c=relaxed/simple;
	bh=D5zs25k5ilJdAfvmjAwbyIJsXuPFkV9J3ttBcMMcEyo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I4Q8iM/V955IPI5hR81/dYlBppSOzSc0XmuqQnDrAflpU5JWV9r/w989vs70refyZEO8bvBg0NLVso5vDjX7iXtd9/i9kElMwCipDLlKnLCrrmptHoERGqslO1omw3jiWxJVt0/FlxdJDPgsje/d8Zj4qFqf6wnfv0fFUvB7DGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aN8ZsyEl; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aN8ZsyEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8u
	xIV25rvzc500OQYm7n7CRS3Jb65U/qpwbuXBGHpLw=; b=aN8ZsyElLBwfE4rdkV
	oDYF7HowdLbtdoIRzS2zsKZHoDRaIveTc01SoZPzLiIEI1Y/eKIDG9lL4psJx5Hk
	phhjiNe770/zQMOkMcQjWaecrW/Y0BDQOfiJuM2EFkGidOPFWF68C89FcuVpwy57
	crAOEsgzxLWkiui9twZtZ4MRA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgB3lmVFZ0poG_P_CA--.31050S4;
	Thu, 12 Jun 2025 13:36:21 +0800 (CST)
From: David Wang <00107082@163.com>
To: cachen@purestorage.com
Cc: akpm@linux-foundation.org,
	cl@gentwo.org,
	corbet@lwn.net,
	dennis@kernel.org,
	hannes@cmpxchg.org,
	harry.yoo@oracle.com,
	jackmanb@google.com,
	kent.overstreet@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mhocko@suse.com,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	surenb@google.com,
	tj@kernel.org,
	vbabka@suse.cz,
	yzhong@purestorage.com,
	ziy@nvidia.com
Subject: Re: [PATCH] alloc_tag: add per-NUMA node stats
Date: Thu, 12 Jun 2025 13:36:05 +0800
Message-Id: <20250612053605.5911-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250610233053.973796-1-cachen@purestorage.com>
References: <20250610233053.973796-1-cachen@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgB3lmVFZ0poG_P_CA--.31050S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw1UKrW8Gry3WFy8GFWfZrb_yoW8tF18pF
	4UKw1rWF4qqr1xCrn7J3WIga4ft3Z8CFWUJ3yaq34SvF1akryfZrZrKw45uF47CF40yF1U
	ZFWq9w17Z3W5ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UxCzNUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqAhqqmhKX67XLgAAsK

Hi, 

On Tue, 10 Jun 2025 17:30:53 -0600 Casey Chen <cachen@purestorage.com> wrote:
> Add support for tracking per-NUMA node statistics in /proc/allocinfo.
> Previously, each alloc_tag had a single set of counters (bytes and
> calls), aggregated across all CPUs. With this change, each CPU can
> maintain separate counters for each NUMA node, allowing finer-grained
> memory allocation profiling.
> 
> This feature is controlled by the new
> CONFIG_MEM_ALLOC_PROFILING_PER_NUMA_STATS option:
> 
> * When enabled (=y), the output includes per-node statistics following
>   the total bytes/calls:
> 
> <size> <calls> <tag info>
> ...
> 315456       9858     mm/dmapool.c:338 func:pool_alloc_page
>         nid0     94912        2966
>         nid1     220544       6892
> 7680         60       mm/dmapool.c:254 func:dma_pool_create
>         nid0     4224         33
>         nid1     3456         27
> 
> * When disabled (=n), the output remains unchanged:
> <size> <calls> <tag info>
> ...
> 315456       9858     mm/dmapool.c:338 func:pool_alloc_page
> 7680         60       mm/dmapool.c:254 func:dma_pool_create
> 
> To minimize memory overhead, per-NUMA stats counters are dynamically
> allocated using the percpu allocator. PERCPU_DYNAMIC_RESERVE has been
> increased to ensure sufficient space for in-kernel alloc_tag counters.
> 
> For in-kernel alloc_tag instances, pcpu_alloc_noprof() is used to
> allocate counters. These allocations are excluded from the profiling
> statistics themselves.

Considering NUMA balance, I have two questions:
1. Do we need the granularity of calling sites?
We need that granularity to identify a possible memory leak, or somewhere
we can optimize its memory usage.
But for NUMA unbalance, the calling site would mostly be *innocent*, the
clue normally lies in the cpu making memory allocation, memory interface, etc...
The point is, when NUMA unbalance happened, can it be fixed by adjusting the calling sites?
Isn't <cpu, memory interface/slab name, numa id> enough to be used as key for numa
stats analysis?
Any example explaining why you need the information of calling sites and how the
information of calling site help?

2. There are other factors affecting NUMA balance, cgroup usage, e.g...
Could we collect those information at calling sites as well.



Thanks
David

