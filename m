Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7632BD010
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750700355; cv=none; b=ovmv0OrayaYlo3Q/nldALNvCtUNh3pVF1Q96iBRygLjoUjRxrj9eigQJnbmT1zeUYnQgd7X8klwfe8m8kKsj6eYU6hFLh+XgRagnla4CiZepP74/CyVta3W34Ts4P0mHRthI/Br112OKbQvTj1KrodJTRV049712rOYXQ5bVeNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750700355; c=relaxed/simple;
	bh=L72s/UX6NmmXgLtNIT/BbsHV/TknVK5T0Q1W2uVpaO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDXo4O+SMq78Wms9HpE1cM6IL7LT3ZH/Tu8rVThQrHA1FiLRsgWWuaJh2R60crlR7B5hwGzTOvHCKm8IgZ3BNBNMjn8EST79HJH5VbBLqF2QiCR+QM9zo4Ulpk+DJKynnJUUDxVMYe7o+gPVHJtrHCXLz7fqDJ9YnxrIEeXL+Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qAk6fezc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qAk6fezc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08A5C4CEEA;
	Mon, 23 Jun 2025 17:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750700354;
	bh=L72s/UX6NmmXgLtNIT/BbsHV/TknVK5T0Q1W2uVpaO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qAk6fezcIbpY5XtQ5Fa9vePm8ZcxhWYQwp09Fjm7wHzTKPrjeI2fcqq4nwjbx9z7f
	 jLWBBwiGu4Ff5tPNfE7j6/8RoVyI+0RITpNHG4uyWzcw0H0tCDTWukYnV4msR1uYqZ
	 tz7/54B2a9pWkHvbOoOBZrhuxpYyo26GthA6+vVe1meBPtYrsvEx9HhMc15fDMrJdE
	 G6duTnBRVkyuLYicEJe81UuITob5606BZnfMV/XksHka/1cnUUv+k+K7vGkrS5NZv2
	 +0eMfzhyLZtmF2JW1VSiTVKoHu93/ITHzmW2yUpcowDLuvBvHu7H7IS3OCS5LwUNO4
	 9Kt6FNN9TI71A==
Date: Mon, 23 Jun 2025 07:39:12 -1000
From: Tejun Heo <tj@kernel.org>
To: Waiman Long <llong@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 02/27] sched/isolation: Introduce housekeeping per-cpu
 rwsem
Message-ID: <aFmRQLv2RWbqX01b@slm.duckdns.org>
References: <20250620152308.27492-1-frederic@kernel.org>
 <20250620152308.27492-3-frederic@kernel.org>
 <3bf95ee2-1340-41b1-9f5c-1563f953c6eb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bf95ee2-1340-41b1-9f5c-1563f953c6eb@redhat.com>

Hello,

On Mon, Jun 23, 2025 at 01:34:58PM -0400, Waiman Long wrote:
> On 6/20/25 11:22 AM, Frederic Weisbecker wrote:
> > The HK_TYPE_DOMAIN isolation cpumask, and further the
> > HK_TYPE_KERNEL_NOISE cpumask will be made modifiable at runtime in the
> > future.
> > 
> > The affected subsystems will need to synchronize against those cpumask
> > changes so that:
> > 
> > * The reader get a coherent snapshot
> > * The housekeeping subsystem can safely propagate a cpumask update to
> >    the susbsytems after it has been published.
> > 
> > Protect against readsides that can sleep with per-cpu rwsem. Updates are
> > expected to be very rare given that CPU isolation is a niche usecase and
> > related cpuset setup happen only in preparation work. On the other hand
> > read sides can occur in more frequent paths.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> 
> Thanks for the patch series and it certainly has some good ideas. However I
> am a bit concern about the overhead of using percpu-rwsem for
> synchronization especially when the readers have to wait for the completion
> on the writer side. From my point of view, during the transition period when
> new isolated CPUs are being added or old ones being removed, the reader will
> either get the old CPU data or the new one depending on the exact timing.
> The effect the CPU selection may persist for a while after the end of the
> critical section.
> 
> Can we just rely on RCU to make sure that it either get the new one or the
> old one but nothing in between without the additional overhead?

So, I had a similar thought - ie. does this need full interlocking so that
when the modification operation can wait for existing users to drain? It'd
be nice to explain that part a bit more. That said, percpu_rwsem read path
is pretty cheap, so if that is a requirement, I doubt the overhead
difference between RCU access and percpu read locking would make meaningful
difference.

Thanks.

-- 
tejun
