Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA5514A639
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861141; cv=none; b=U8YeeOxqFK0S46L0Pq/dj5tcSuG2KAcjBT/7QmDTdBWjRIqZYTqoD9KjlGLfrgq2U37IbG6Vm91bLhJGkwJfVt6SwhibhMnFY+yrmqB4NfZQ16OIlv12jbRZlHAGYh6lvxGSKrnuA8CPrSup2kBGKmH56twmOjHZm00SLRojO0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861141; c=relaxed/simple;
	bh=YP0CEUGFXhpsc2Fz0e2EjDTwhTxWlO1jlfpXpSbPNS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qc+MJ2GORz3p2FIpuWfL9kwV+ClHwrXogT6c2sEhqjoNpknmT0D2UTm7f7ZX8x6rafUbliv9BjGMPt+8+zrpv0cps2deOCMSXqXl2P9u3xqZyZFitkd9zD1He1SMeu65lhIaixtmN7EdzGXaXVZssirbeoFHNVG63ny+gRQrsUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsRY3fpw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsRY3fpw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8AAC4CEF6;
	Wed, 25 Jun 2025 14:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861141;
	bh=YP0CEUGFXhpsc2Fz0e2EjDTwhTxWlO1jlfpXpSbPNS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsRY3fpwoesq6fR78RG03SkV0sHyiQhi6tlwlmLnxRdFc1mQm91AM5Zeb7Ad0XuJJ
	 HN6HyVmEGu5b6Pq/T4i6D/sYhhisAHl2RSi/MHSNOLQrcnpXWoomtjjUyg6xW8o7bn
	 qqL7KVFpAAF40W8cQ+2S+jPK4ae4cEmV+gdzWPIaCZzL4LawnjH7flFShLd1WgYQRs
	 uT1HYGzzMJ6iKaAGlTYae2MdW/1/I9kLBxUMf3aj+ypn9tugnK5YdJnASr5l7iPbzD
	 +j2oa/hcitbNwFzJUJP4xYZoABFZhEX1BXMlVPEtj6i5uAQDL++jdX8JIXFe54o4j8
	 yFomn8xO8B2Gw==
Date: Wed, 25 Jun 2025 16:18:58 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <llong@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 02/27] sched/isolation: Introduce housekeeping per-cpu
 rwsem
Message-ID: <aFwFUk2rWrikLbyA@localhost.localdomain>
References: <20250620152308.27492-1-frederic@kernel.org>
 <20250620152308.27492-3-frederic@kernel.org>
 <3bf95ee2-1340-41b1-9f5c-1563f953c6eb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bf95ee2-1340-41b1-9f5c-1563f953c6eb@redhat.com>

Le Mon, Jun 23, 2025 at 01:34:58PM -0400, Waiman Long a écrit :
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

It depends.

1) If the read side queues a work and wait for it
  (case of work_on_cpu()), we can protect the whole under the same
  sleeping lock and there is no persistance beyond.

2) But if the read side just queues some work or defines some cpumask
   for future queue then there is persistance and some action must be
   taken by housekeeping after the update to propagare the new cpumask
   (flush pending works, etc...)

> Can we just rely on RCU to make sure that it either get the new one or the
> old one but nothing in between without the additional overhead?

This is the case as well and it is covered by 2) above.
The sleeping parts handled in 1) would require more thoughts.

> My current thinking is to make use CPU hotplug to enable better CPU
> isolation. IOW, I would shut down the affected CPUs, change the housekeeping
> masks and then bring them back online again. That means the writer side will
> take a while to complete.

You mean that an isolated partition should only be set on offline CPUs ? That's
the plan for nohz_full but it may be too late for domain isolation.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
