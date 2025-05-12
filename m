Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F832EB10
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747036829; cv=none; b=N0lxMFHvnEJzQuKaPkNU8BlFfGpGoEwe6/XntCBiji9zCrsFmMFHvsboNiYjvYuuczHoF3VsUiceRPSow9WNNwcK23nWI5TOX8E9usJKJ/vtn5JehEfQs8o+giuAICedHvM/pVSea+pPrlQ1reHmLzoAGdx1jOU2wzl4GjtXsEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747036829; c=relaxed/simple;
	bh=87tvJFZAOxM6+s5jtb+Hk3etth39x1oYbilEhKXFxAM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i2KdRRskmi76dLe5gCG0vQUvsDx9qK9HSR19YPWz5EHQaUtWmNSN0BJM5MqDbnTEpvA81DoEuDqfnxIp+rDjEXW6FGlHfQSq7Oc7romTuvZZGlPpuC4FxR7oLVgscv7JMCxZWcvUyZE04X3N+07UPKpDY21vYU4lNI3RNqrFoME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ORyeND/s; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ORyeND/s"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZwsTt6D79z9sR1;
	Mon, 12 May 2025 10:00:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1747036818; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yoxVZD67ZL713EhSMiYu8DjqgY5ikFo/sSJtdUsWemY=;
	b=ORyeND/sFmkQfq3E4V1GMt84dROApZtwU/lnbQzkz5YtsLF3zh+ufk9XNGeMaNSUGoPSPf
	Amxy/ERnAjOvi0KaUwpg7jZAAGYGU+Em7O5QtxfBEtNnThr1z1ICxubNCb6b5TFTViW8M1
	xT39KgatrqjDrNrSdw+E5BmDnV+pSJD3Lcl5nDfsIFBxWGF05ojn9i/dBnIvR303b0W2rb
	8uJYs5HGAZTluUZ9oW/VyxQpLbs1z++4OB5UslTSGvijqthpoJ9QRexKn8LRPy7c69ZXUn
	PaCdvTMI/oKLs99WNVUKDaBirXyMyFo77qSubwANwHNRxQeHd6Cf5FeLaRI8IQ==
Message-ID: <84021a2461db55617018050b7c0e07a15dceb634.camel@mailbox.org>
Subject: Re: [PATCH v2 6/6] drm/sched: Port unit tests to new cleanup design
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew Brost
 <matthew.brost@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 12 May 2025 10:00:13 +0200
In-Reply-To: <a1c9c680-2927-428c-95e9-2e79d14cec58@igalia.com>
References: <20250424095535.26119-2-phasta@kernel.org>
	 <20250424095535.26119-8-phasta@kernel.org>
	 <894cf4cdb7e14b2a21dcf87bfeac4776cb695395.camel@mailbox.org>
	 <a1c9c680-2927-428c-95e9-2e79d14cec58@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: f6a8b5451b8e6db5dc4
X-MBO-RS-META: hpeah8qooega33wgw1uuanskddwwhq95

On Thu, 2025-05-08 at 13:51 +0100, Tvrtko Ursulin wrote:
>=20
> Hi Philipp,
>=20
> On 08/05/2025 12:03, Philipp Stanner wrote:
> > On Thu, 2025-04-24 at 11:55 +0200, Philipp Stanner wrote:
> > > The unit tests so far took care manually of avoiding memory leaks
> > > that
> > > might have occurred when calling drm_sched_fini().
> > >=20
> > > The scheduler now takes care by itself of avoiding memory leaks
> > > if
> > > the
> > > driver provides the callback
> > > drm_sched_backend_ops.kill_fence_context().
> > >=20
> > > Implement that callback for the unit tests. Remove the manual
> > > cleanup
> > > code.
> >=20
> > @Tvrtko: On a scale from 1-10, how much do you love this patch? :)
>=20
> Specific patch aside, it is the series as a whole I would like to be=20
> sure there isn't a more elegant way to achieve the same end result.

I count this as a 9/10 \o/

But jokes aside:

>=20
> Like that sketch of a counter proposal I sent for the reasons listed=20
> with it. Which were, AFAIR, to avoid needing to add more state
> machine,=20

Well the state machine added is basically just the waitqueue. The
WRITE_ONCE booleans are currently just for correctness and clarity.
I've looked at them and want to remove them all in an other patch,
because I think they're not needed (workqueue handles that)

But yes, the added state is > 0

> to avoid mandating drivers have to keep an internal list,

That's not mandated by the scheduler, but by logic itself. All drivers
need to have a list of on-flight fences. Otherwise the drivers would
have no chance of signaling those fences once their GPU tells them to
do so.

I have now provided two users of the new API, nouveau and the unit
tests. Can you think of a party for which the suggested approach
wouldn't work?


Don't get me wrong, your approach does work and it definitely has its
charm. However, I think what I propose here is syntactically a bit
cleaner because the classical order of a fence first being signaled in
the driver and then the associated job being freed as usual by the
scheduler is guaranteed. IOW, we primarily rely on the signaling path.

Either way, neither your nor my approach would have worked out of the
box in Nouveau without that driver exploding.

>  and to align=20
> better with the existing prototypes in the sched ops table (where=20
> everything operates on jobs).

That's not a hard criteria IMO. Those are sched_backend_ops, not
sched_job_backend_ops, and prepare_job() already takes a parameter
other than a job.


Cheers,
P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > ---
> > > =C2=A0=C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 34
> > > ++++++++++++-----
> > > --
> > > =C2=A0=C2=A01 file changed, 21 insertions(+), 13 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > index f999c8859cf7..a72d26ca8262 100644
> > > --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> > > @@ -228,10 +228,30 @@ static void mock_sched_free_job(struct
> > > drm_sched_job *sched_job)
> > > =C2=A0=C2=A0	/* Mock job itself is freed by the kunit framework. */
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > +static void mock_sched_fence_context_kill(struct
> > > drm_gpu_scheduler
> > > *gpu_sched)
> > > +{
> > > +	struct drm_mock_scheduler *sched =3D
> > > drm_sched_to_mock_sched(gpu_sched);
> > > +	struct drm_mock_sched_job *job;
> > > +	unsigned long flags;
> > > +
> > > +	spin_lock_irqsave(&sched->lock, flags);
> > > +	list_for_each_entry(job, &sched->job_list, link) {
> > > +		spin_lock(&job->lock);
> > > +		if (!dma_fence_is_signaled_locked(&job-
> > > >hw_fence)) {
> > > +			dma_fence_set_error(&job->hw_fence, -
> > > ECANCELED);
> > > +			dma_fence_signal_locked(&job->hw_fence);
> > > +		}
> > > +		complete(&job->done);
> > > +		spin_unlock(&job->lock);
> > > +	}
> > > +	spin_unlock_irqrestore(&sched->lock, flags);
> > > +}
> > > +
> > > =C2=A0=C2=A0static const struct drm_sched_backend_ops
> > > drm_mock_scheduler_ops =3D {
> > > =C2=A0=C2=A0	.run_job =3D mock_sched_run_job,
> > > =C2=A0=C2=A0	.timedout_job =3D mock_sched_timedout_job,
> > > -	.free_job =3D mock_sched_free_job
> > > +	.free_job =3D mock_sched_free_job,
> > > +	.kill_fence_context =3D mock_sched_fence_context_kill,
> > > =C2=A0=C2=A0};
> > > =C2=A0=20
> > > =C2=A0=C2=A0/**
> > > @@ -300,18 +320,6 @@ void drm_mock_sched_fini(struct
> > > drm_mock_scheduler *sched)
> > > =C2=A0=C2=A0		drm_mock_sched_job_complete(job);
> > > =C2=A0=C2=A0	spin_unlock_irqrestore(&sched->lock, flags);
> > > =C2=A0=20
> > > -	/*
> > > -	 * Free completed jobs and jobs not yet processed by the
> > > DRM
> > > scheduler
> > > -	 * free worker.
> > > -	 */
> > > -	spin_lock_irqsave(&sched->lock, flags);
> > > -	list_for_each_entry_safe(job, next, &sched->done_list,
> > > link)
> > > -		list_move_tail(&job->link, &list);
> > > -	spin_unlock_irqrestore(&sched->lock, flags);
> > > -
> > > -	list_for_each_entry_safe(job, next, &list, link)
> > > -		mock_sched_free_job(&job->base);
> > > -
> > > =C2=A0=C2=A0	drm_sched_fini(&sched->base);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> >=20
>=20

