Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D145A2EB5D5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750447814; cv=none; b=u/lxyK3dAYALnhINeocKYiytsnunHrY2Ij0hvr3oYjGUEihvYivfoDKeysJBLQDpJ0AJTN9KbXSfwhOcFi3ANl1JrLh+RuS/E6NMf5Kt1ZtJC05+FWmoeyYPIQGuzrERwDsIedy5k62/0XS7zlYYijtivXYhpsaEjkbOnoVPyO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750447814; c=relaxed/simple;
	bh=QP5FKXkOvXJVgnLo7dy4hr0VyXj3zHtRrrMGGJwoX2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtOIqioyOUFMsV1sGbuHbhR1TLLxmWgfnPPeRCIVKx/KdNI6mYT2x+zehskmqAIVTk8vIUWgrScFs8EcHU3qU9fK5OZYxaSmJbbj1/1kKY5p5wXXpv1B0Rs3HGlA4gLYYebV5PSQWtcf4rDdYehheTt2YwQ0TmPbTw92aHc0F8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ifMtgACB; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ifMtgACB"
Date: Fri, 20 Jun 2025 12:30:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750447810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+AJ4MmUMawQsQJ+yWlhSORCWDOitW49EDv6tCdjnvxs=;
	b=ifMtgACBjxoEMcXauHo4b23Gv5jsjQGterQCy2KA4Sfgqlvde2QOw/2B+PW7evPpfEyRSa
	ZqrVUH6ZlpzLtTe0rvef+HYnKRQXA2vNtdxlEWx1U8o+g+h0hWkV9uW+aOTEuGk5l8LorR
	uuzP9jfZvTl1MrrXGB/NKoQ2zOm5GWU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Marco Crivellari <marco.crivellari@suse.com>, 
	Michal Hocko <mhocko@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH 16/27] sched/isolation: Flush memcg workqueues on cpuset
 isolated partition change
Message-ID: <ezplssjtvj5kfp7zutj5ufmmxvvyd2bioxdsfqaauzi5i6b3yv@2hbbax4kfct6>
References: <20250620152308.27492-1-frederic@kernel.org>
 <20250620152308.27492-17-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620152308.27492-17-frederic@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Fri, Jun 20, 2025 at 05:22:57PM +0200, Frederic Weisbecker wrote:
> The HK_TYPE_DOMAIN housekeeping cpumask is now modifyable at runtime. In
> order to synchronize against memcg workqueue to make sure that no
> asynchronous draining is still pending or executing on a newly made
> isolated CPU, the housekeeping susbsystem must flush the memcg
> workqueues.
> 
> However the memcg workqueues can't be flushed easily since they are
> queued to the main per-CPU workqueue pool.
> 
> Solve this with creating a memcg specific pool and provide and use the
> appropriate flushing API.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
