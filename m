Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F82324291A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891880; cv=none; b=hezg7VsXoykl9LwJ92lg8bonr4zsbHm1wTUqh/Fazjvr7regSpGnDFmsFaFoTwoZCnBe8LlRPvBr4nikx95pKGEZxNpLA/XAud9BZLNLxFW957mwMird1UNkLyVsX+ldnjdHc/hXz+KRe7dbHIAg121E8tsL71Y4dfPzFOikeCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891880; c=relaxed/simple;
	bh=lqW4ZV78PUpIZxRhUo4K3BhUomPvUbJnWCbvg/1/2mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kltRsvVL8ilCmWzNHdaBgvOkqx5zxwy/kea706IwHg+6pJEJRSD+q0AH04DPEMXfgtzbB8XytNEljtehcRB4eaJd4ikuSedQBoDyB/M226S47EJM6lDPBOnu77fWcC2Xn2cLXOhwyZFcjsE4EPvwzJehHkBeS9MPrOVplHjjhv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ToO2INEx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ToO2INEx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B37C4CEEB;
	Thu, 17 Apr 2025 12:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744891879;
	bh=lqW4ZV78PUpIZxRhUo4K3BhUomPvUbJnWCbvg/1/2mM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ToO2INExwNl4kqty7krMMoCPBGRlj/hMpq8XYSGBqp39URfrfTNAm7q7c4n3ExSkT
	 kHUS0TEDN6T7ZEFGZ/ZyotiENfGtZq9N4R2UpdDMSBS0QIQUZV1FyMV1/ZltUizB0/
	 mvIo7DFwCuaiCe+0nC9YdiAJqb6RTFcUSG6gUUOkBq7E+Y1iyFu7CCL0K+uVvu+KVf
	 F0KRXW7z3aRlk5N4oEkoPRi8VlDm2MVNCvN6eZYcPkk6eK+0cwSclcFlxOQHS6fAQH
	 htA0sJd+km5QULpJQvyCf30aBnZr73lfuts/WxQfv1Rxco5QFqpADv1c24hYWwzljW
	 llfSIOSsi/ICA==
Date: Thu, 17 Apr 2025 14:11:14 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
Message-ID: <aADv4ivXZoJpEA7k@pollux>
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
 <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
 <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com>

On Thu, Apr 17, 2025 at 12:27:29PM +0100, Tvrtko Ursulin wrote:
> 
> On 17/04/2025 08:45, Philipp Stanner wrote:
> > On Mon, 2025-04-07 at 17:22 +0200, Philipp Stanner wrote:
> 
> Problem exactly is that jobs can outlive the entities and the scheduler,
> while some userspace may have a dma fence reference to the job via sync
> file. This new callback would not solve it for xe, but if everything
> required was reference counted it would.

I think you're mixing up the job and the dma_fence here, if a job outlives the
scheduler, it clearly is a bug, always has been.

AFAIK, Xe reference counts it's driver specific job structures *and* the driver
specific scheduler structure, such that drm_sched_fini() won't be called before
all jobs have finished.

The reference counting solution, however, potentially creates subsequent
lifetime problems, which I think have been discussed already in a different
thread already. Philipp can probably link in the corresponding discussion.

> On the design level it feels like it adds too much state machine and makes
> things hard to follow/maintain. It would be nice to find a solutiuon where
> we end up with less state machine and not more.

Multiple solutions have been discussed already, e.g. just wait for the pending
list to be empty, reference count the scheduler for every pending job. Those all
had significant downsides, which I don't see with this proposal.

I'm all for better ideas though -- what do you propose?

> 
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 6b72278c4b72..ae3152beca14 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1465,6 +1465,10 @@ void drm_sched_fini(struct drm_gpu_scheduler
> > > *sched)
> > >   	sched->ready = false;
> > >   	kfree(sched->sched_rq);
> > >   	sched->sched_rq = NULL;
> > > +
> > > +	if (!list_empty(&sched->pending_list))
> > > +		dev_err(sched->dev, "%s: Tearing down scheduler
> > > while jobs are pending!\n",
> > > +			__func__);
> 
> It isn't fair to add this error since it would out of the blue start firing
> for everyone expect nouveau, no? Regardless if there is a leak or not.

I think it is pretty fair to warn when detecting a guaranteed bug, no?

If drm_sched_fini() is call while jobs are still on the pending_list, they won't
ever be freed, because all workqueues are stopped.
