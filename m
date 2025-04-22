Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FD82AEE9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322083; cv=none; b=U7iICOOMnEAgnURXTCqW+8FiYHQ5Ad9j4zT/Ev6ruAD8rQ9moSuyx0lTta6k1S+Vk+ecEJMb/QfXBT9d+tdETpIOKZuOgGl7SMR6OsR2keAOW5faLfD1FSe7esgUGCApYI5HZ5vop3qlvyzM5Deks1tmJht35uNAHugITnJJj5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322083; c=relaxed/simple;
	bh=Z0xoBCce+obPuklML8DLSrfIsk7iPcapdXWIqrL45pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dw0RGdM5gFX+SVXGTqfoG4oDFRgOnP44Pa9/64I6BFYMXRTcanzIKtKoKo+2xPketNksTJ0DR2EilJ760wGf8py0lS2Jyebc9LYLp2iYjlShVVGsKkA/xuHjETJPOsUHE9oR1RpYHtTBXFl9qfK54SHgrwq23hsadWZX2f7ekBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OrJ4b/Ry; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OrJ4b/Ry"
Date: Tue, 22 Apr 2025 04:41:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745322078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aGjfUa0VdFNE7pAhfj1k3sXWx23PmVKsC+WEqb2v1XU=;
	b=OrJ4b/RydEPGLVaiWvtAx95vFvpu/zp46RuMAmWS9/Cr+90MRK1LqVWwpdv/Hz+Mt82UTo
	trAATCdjYc4rBJ3UmmsIKTRGqbBcib7sjLJG2PWf19npjz+4cbk+5UFlL72k1dEN3aJHDt
	ggPkHh9W7H6TCuUS83qhIBmwtwMDZmI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Waiman Long <llong@redhat.com>,
	linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH v2] memcg: optimize memcg_rstat_updated
Message-ID: <aAeAWVeLJT9bygA3@Asmaa.>
References: <20250410025752.92159-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410025752.92159-1-shakeel.butt@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 09, 2025 at 07:57:52PM -0700, Shakeel Butt wrote:
> Currently the kernel maintains the stats updates per-memcg which is
> needed to implement stats flushing threshold. On the update side, the
> update is added to the per-cpu per-memcg update of the given memcg and
> all of its ancestors. However when the given memcg has passed the
> flushing threshold, all of its ancestors should have passed the
> threshold as well. There is no need to traverse up the memcg tree to
> maintain the stats updates.

Nice. We also skip updating the per-CPU stats updates counter, which is
unnecessary in this case as well.

> 
> Perf profile collected from our fleet shows that memcg_rstat_updated is
> one of the most expensive memcg function i.e. a lot of cumulative CPU
> is being spent on it. So, even small micro optimizations matter a lot.
> This patch is microbenchmarked with multiple instances of netperf on a
> single machine with locally running netserver and we see couple of
> percentage of improvement.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Reviewed-by: Yosry Ahmed <yosry.ahmed@linux.dev>
