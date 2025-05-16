Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B58F233712
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389272; cv=none; b=cFiJVvTh9xDsZarmC1K8F0LOibtM6/7TFHPQyJwXrRJ40gpgegHXl/O7rQuk2RkUIXDC0gOTnDWggH3RDK67wc9bsoK9AFyMgFOh2kl41/7tQPDBieRLhTw0HaddKDZnIbSe5whiDdFuODtXHNTZ5pp9JEoqV9reQr67IQ4nJvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389272; c=relaxed/simple;
	bh=j7T1unC4dsNYBs7iaVpJ7MK9tIY2KJ8J5RppPrHekMg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fq800SXQ9w9G0c238PmQcz+z/1Rij2kHf/AtubJAmjbPUdO4zU1RvSEQfvc3pliKmwRln45JLa0TmBazNhdZeeYqOj2OBeNgtKnnE7sQSjlvDvsVQT5wTwng2e9/7zw3yd6bQQmzfAZfZ/YxySc9rhKRHKHIHVRgOSKW+kNxsWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kDrdqTR8; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kDrdqTR8"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZzMqc4BFxz9t80;
	Fri, 16 May 2025 11:54:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1747389260; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1d1mz6Vg5k34l2K2pJG2qxGQsB3oKGEaL48AWo/ThlM=;
	b=kDrdqTR86IbSe8xA6d4PXE96SV25KElKLN6v7M9wOjEYzMOJz4Shtf1oBBPQs3IyHiKC4p
	sw0kZ5UMnplZtYarrYqbVsPS4rfnKQ+djxalvzRybzj2ezJqPoU2r/pR3BhTapPJk36eBS
	MgISIz2CtQHhtZ+YZV6WrxSTEjNijgQqmdYcXtBktA2464jnTnZTrX0Vyfq/t3f2NjtMSA
	FwulEdKmsidSBcSi8eGdhl/6h8tRld/EfrDLZg47xkbTcBXysNLECEWte0kQgfZI1C90kj
	b4ntilGWvgm1z2eqyFEAGjUKPbqB5FjU6GYBI+IUsmNueGQepd6P36zaTOfahQ==
Message-ID: <e627335ea7d0cbb1f8b92ad5fd936466b19c3ec7.camel@mailbox.org>
Subject: Re: [PATCH v2 2/6] drm/sched: Prevent teardown waitque from
 blocking too long
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
Date: Fri, 16 May 2025 11:54:15 +0200
In-Reply-To: <1297389f-70f6-4813-8de8-1a0c4f92250a@igalia.com>
References: <20250424095535.26119-2-phasta@kernel.org>
	 <20250424095535.26119-4-phasta@kernel.org>
	 <1297389f-70f6-4813-8de8-1a0c4f92250a@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 364dnpzhjazo4qnodtkjimt4dsmr47zf
X-MBO-RS-ID: 544fb1390a5a013cd89

On Fri, 2025-05-16 at 10:33 +0100, Tvrtko Ursulin wrote:
>=20
> On 24/04/2025 10:55, Philipp Stanner wrote:
> > The waitqueue that ensures that drm_sched_fini() blocks until the
> > pending_list has become empty could theoretically cause that
> > function to
> > block for a very long time. That, ultimately, could block userspace
> > procesess and prevent them from being killable through SIGKILL.
> >=20
> > When a driver calls drm_sched_fini(), it is safe to assume that all
> > still pending jobs are not needed anymore anyways. Thus, they can
> > be
> > cancelled and thereby it can be ensured that drm_sched_fini() will
> > return relatively quickly.
> >=20
> > Implement a new helper to stop all work items / submission except
> > for
> > the drm_sched_backend_ops.run_job().
> >=20
> > Implement a driver callback, kill_fence_context(), that instructs
> > the
> > driver to kill the fence context associated with this scheduler,
> > thereby
> > causing all pending hardware fences to be signalled.
> >=20
> > Call those new routines in drm_sched_fini() and ensure backwards
> > compatibility if the new callback is not implemented.
> >=20
> > Suggested-by: Danilo Krummrich <dakr@redhat.com>
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 47 +++++++++++++++++---=
-
> > -----
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++
> > =C2=A0 2 files changed, 42 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index ea82e69a72a8..c2ad6c70bfb6 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1390,31 +1390,46 @@ drm_sched_no_jobs_pending(struct
> > drm_gpu_scheduler *sched)
> > =C2=A0=C2=A0	return empty;
> > =C2=A0 }
> > =C2=A0=20
> > +/**
> > + * drm_sched_cancel_jobs_and_wait - trigger freeing of all pending
> > jobs
> > + * @sched: scheduler instance
> > + *
> > + * Must only be called if &struct
> > drm_sched_backend_ops.kill_fence_context is
> > + * implemented.
> > + *
> > + * Instructs the driver to kill the fence context associated with
> > this scheduler,
> > + * thereby signalling all pending fences. This, in turn, will
> > trigger
> > + * &struct drm_sched_backend_ops.free_job to be called for all
> > pending jobs.
> > + * The function then blocks until all pending jobs have been
> > freed.
> > + */
> > +static inline void
> > +drm_sched_cancel_jobs_and_wait(struct drm_gpu_scheduler *sched)
> > +{
> > +	sched->ops->kill_fence_context(sched);
> > +	wait_event(sched->pending_list_waitque,
> > drm_sched_no_jobs_pending(sched));
> > +}
> > +
> > =C2=A0 /**
> > =C2=A0=C2=A0 * drm_sched_fini - Destroy a gpu scheduler
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * @sched: scheduler instance
> > =C2=A0=C2=A0 *
> > - * Tears down and cleans up the scheduler.
> > - *
> > - * Note that this function blocks until all the fences returned by
> > - * &struct drm_sched_backend_ops.run_job have been signalled.
> > + * Tears down and cleans up the scheduler. Might leak memory if
> > + * &struct drm_sched_backend_ops.kill_fence_context is not
> > implemented.
> > =C2=A0=C2=A0 */
> > =C2=A0 void drm_sched_fini(struct drm_gpu_scheduler *sched)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct drm_sched_entity *s_entity;
> > =C2=A0=C2=A0	int i;
> > =C2=A0=20
> > -	/*
> > -	 * Jobs that have neither been scheduled or which have
> > timed out are
> > -	 * gone by now, but jobs that have been submitted through
> > -	 * backend_ops.run_job() and have not yet terminated are
> > still pending.
> > -	 *
> > -	 * Wait for the pending_list to become empty to avoid
> > leaking those jobs.
> > -	 */
> > -	drm_sched_submission_and_timeout_stop(sched);
> > -	wait_event(sched->pending_list_waitque,
> > drm_sched_no_jobs_pending(sched));
> > -	drm_sched_free_stop(sched);
> > +	if (sched->ops->kill_fence_context) {
> > +		drm_sched_submission_and_timeout_stop(sched);
> > +		drm_sched_cancel_jobs_and_wait(sched);
> > +		drm_sched_free_stop(sched);
> > +	} else {
> > +		/* We're in "legacy free-mode" and ignore
> > potential mem leaks */
> > +		drm_sched_wqueue_stop(sched);
> > +	}
> > =C2=A0=20
> > =C2=A0=C2=A0	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs;
> > i++) {
> > =C2=A0=C2=A0		struct drm_sched_rq *rq =3D sched->sched_rq[i];
> > @@ -1502,7 +1517,7 @@ bool drm_sched_wqueue_ready(struct
> > drm_gpu_scheduler *sched)
> > =C2=A0 EXPORT_SYMBOL(drm_sched_wqueue_ready);
> > =C2=A0=20
> > =C2=A0 /**
> > - * drm_sched_wqueue_stop - stop scheduler submission
> > + * drm_sched_wqueue_stop - stop scheduler submission and freeing
>=20
> Looks like the kerneldoc corrections (below too) belong to the
> previous=20
> patch. Irrelevant if you decide to squash them though.
>=20
> > =C2=A0=C2=A0 * @sched: scheduler instance
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Stops the scheduler from pulling new jobs from entities.=
 It
> > also stops
> > @@ -1518,7 +1533,7 @@ void drm_sched_wqueue_stop(struct
> > drm_gpu_scheduler *sched)
> > =C2=A0 EXPORT_SYMBOL(drm_sched_wqueue_stop);
> > =C2=A0=20
> > =C2=A0 /**
> > - * drm_sched_wqueue_start - start scheduler submission
> > + * drm_sched_wqueue_start - start scheduler submission and freeing
> > =C2=A0=C2=A0 * @sched: scheduler instance
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Restarts the scheduler after drm_sched_wqueue_stop() has
> > stopped it.
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index d0b1f416b4d9..8630b4a26f10 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -509,6 +509,17 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * and it's=
 time to clean it up.
> > =C2=A0=C2=A0	 */
> > =C2=A0=C2=A0	void (*free_job)(struct drm_sched_job *sched_job);
> > +
> > +	/**
> > +	 * @kill_fence_context: kill the fence context belonging
> > to this scheduler
>=20
> Which fence context would that be? ;)
>=20
> Also, "fence context" would be a new terminology in gpu_scheduler.h
> API=20
> level. You could call it ->sched_fini() or similar to signify at
> which=20
> point in the API it gets called and then the fact it takes sched as=20
> parameter would be natural.
>=20
> We also probably want some commentary on the topic of indefinite (or=20
> very long at least) blocking a thread exit / SIGINT/TERM/KILL time.=20
> Cover letter touches upon that problem but I don't see you address
> it.=20
> Is the idea to let drivers shoot themselves in the foot or what?

You didn't seriously just write that, did you?

Yes, my intention clearly has been since September to make things
worse, more ambiguous and destroy drivers. That's why I'm probably the
only individual after Sima (who added some of the FIXMEs) who ever
bothered documenting all this mess here, and warning people about the
five hundred pitfalls, like three different start and stop functions,
implicit refcount rules and God knows which other insane hacks that
simply move driver problems into common infrastructure.

Reconsider your attitude.

P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > +	 *
> > +	 * Needed to cleanly tear the scheduler down in
> > drm_sched_fini(). This
> > +	 * callback will cause all hardware fences to be signalled
> > by the driver,
> > +	 * which, ultimately, ensures that all jobs get freed
> > before teardown.
> > +	 *
> > +	 * This callback is optional, but it is highly recommended
> > to implement it.
> > +	 */
> > +	void (*kill_fence_context)(struct drm_gpu_scheduler
> > *sched);
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 /**
>=20

