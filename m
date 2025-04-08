Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9B522173D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150352; cv=none; b=fZc7UWbfhJX/1mIw+5ta6djnCXXApUX3oBYLBMs+CgGIy4R+/wuz3nm3zNLT7K1JCyTWYdPD/pEMzsVXh9ZpZ687jWseU3IBpFaSsrdwlbjsTv6xKMzrc8TYHBnM5w4e1Hk8KIua/LxHTVo6tfEn103B5VyPOYNKBUu9oC6ZQMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150352; c=relaxed/simple;
	bh=qhFLT1sxb4YcqbiDWhSlGBfJywzZ4IUAVuk32gSvyRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgP5Nc7NDebirh+TtTwsrQwfT3sy4PuCAC7W0T+eAGk33QwTBw8RSO7mYvzakzNveLIwBeA2b40jtgX/bU3IVzY0QTpkqCyAJ/yBXNdfGgKoeoUcznIr8saLKrGe5looawSX8vT7KuMopzqmX1b+IimBTS5aA3kte7wCstk7UE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cErtYA/O; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cErtYA/O"
Date: Tue, 8 Apr 2025 22:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744150346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s2wPsDuusYDf71v3DeNeWAxNbKxR+CVPefFzBRS96uE=;
	b=cErtYA/O/BdV+KS0Mrqub2uMCUCXuY9uyQM2TrHpIEYBIISYN274V/rYMsjirEsFGl8XMD
	Ne8VwR4KwyOP14rQhu99BvvuyPOjMJ2dBYPMkXwZ5YdChxBgfyPcH80cs8pnScWKllFP+c
	ftBGvZgweM/tg3OaNzi06a5Ih90lVC8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Sweet Tea Dorminy <sweettea@google.com>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>, Martin Liu <liumartin@google.com>,
	David Rientjes <rientjes@google.com>, christian.koenig@amd.com,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Christian Brauner <brauner@kernel.org>,
	Wei Yang <richard.weiyang@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, Yu Zhao <yuzhao@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH v2] Introduce Hierarchical Per-CPU Counters
Message-ID: <Z_WfQbPIBHqRXGz9@google.com>
References: <20250408160508.991738-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408160508.991738-1-mathieu.desnoyers@efficios.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Apr 08, 2025 at 12:05:08PM -0400, Mathieu Desnoyers wrote:
> * Motivation
> 
> The purpose of this hierarchical split-counter scheme is to:
> 
> - Minimize contention when incrementing and decrementing counters,
> - Provide fast access to a sum approximation,
> - Provide a sum approximation with an acceptable accuracy level when
>   scaling to many-core systems.
> - Provide approximate and precise comparison of two counters, and
>   between a counter and a value.
> 
> It aims at fixing the per-mm RSS tracking which has become too
> inaccurate for OOM killer purposes on large many-core systems [1].

It might be an overkill for the task from the memory overhead perspective.
Sure, for a very large process on a large machine it makes total sense,
but for smaller process it will waste a ton of memory.

Also, for relatively small number of CPUs (e.g. 8) it's also an overkill
from the complexity standpoint.

But as an idea it makes total sense to me, maybe just applicable to some
other tasks, e.g. global memory stats.

For the RSS tracking I wonder if what we really need is to go back to the
per-thread caching, but with some time-based propagation. E.g. a thread
should dump their cached value on going to sleep or being rescheduled.
This will bound the error to (64 * number of currently running threads),
which should be acceptable. We can also think of making the central counter
be an upper bound by increasing it first and moving the "pre-charged" value
to per-thread counters.

Thanks!
