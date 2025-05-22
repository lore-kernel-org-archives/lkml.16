Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2218328A702
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747927967; cv=none; b=M5g+KiiK1fX+Cv4ZUcTxGuztbkqHgshEG0SgZnqsQ/JAoE/N+DgTLRxYoO9qSZ9tUY+d580m6E/6U0AOOhe2yGd5Fzo8Pcz5Zec1TE+R6UL57pVECeHqTHwxmpdZAA/axyy/xJfq25HR8/QOLeVmQuh5YH/Udblzm2I4FyolvG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747927967; c=relaxed/simple;
	bh=19GC6tn9Z3g7ZTT7auNhspXgKcidDpzLwBrzTVsBW+A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gzgl/UWAWvtmZ73IBW3HmUYq9dGOTRuhQroUgylbIRwFfn2MC3aitA1UWBVnbfCT+jgQ6UA/FPFpFXD+pG6Bm53BS0o16AZKHtlL4Qc0nHehjwLkd7IZsWvmq/yI6YyuLtAnAtF/bJglfgCMqlrGi/wfNXNkD4lzhiKgmyOWjLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LRevD1fv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LRevD1fv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747927964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DeXBrK2bgFthQnpVSUpFiSBohma7/u74wkxma9Kyu9s=;
	b=LRevD1fvtZkJ1PEGyp+ZCKtY0VcWwjvJOH7izYZJE0q0i1DQCy/flLJFepEMoaxpOPSH1p
	4HSm84k8Liiw623LhU67PFPPQV41UXxNU0zA0c4/X61W9Ep8MZdbnRCtwdTXyPw5jAiH8H
	MsZhyj/YJr3Yuc2CazsdNglBvlAUlrM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-DFL3Np2QM-e7evEHYsg0-g-1; Thu, 22 May 2025 11:32:42 -0400
X-MC-Unique: DFL3Np2QM-e7evEHYsg0-g-1
X-Mimecast-MFC-AGG-ID: DFL3Np2QM-e7evEHYsg0-g_1747927961
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-232054aa634so49500805ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747927961; x=1748532761;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DeXBrK2bgFthQnpVSUpFiSBohma7/u74wkxma9Kyu9s=;
        b=DO1zN4Lw6nBvP+K9qMFXLdmogyFm1GVtqcDPveqoLPVcn+5sW9FigZ97LHoPKDDwlA
         +h1pv37YDhKReZrSyZj732dq5CCyK81GEiBTmzqmJOKxGErcF9zjJ3+zbuFeQCNGQZNE
         2KMKnRLIg2qtT1RPXwQiON5Xi+ZtMcaXG4ghAfi8UT+I1JD+Lwlk8TR1/+m0u42mLQGJ
         VDRKnSp8qwRlKCQ+N5qa5eKkTHvFBLVnCtdfgwHiy3IFSipN8TErIbZ4y7eTAJVTZotJ
         M07fOMQs7RF04TFCT3a8Ka/g+moZhswFdecgFewRQOG+pzbZcnXdyA3mrOliSM4TqrE/
         PGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb6MJFYWkaWgqFFCGQUkoFfQNl3JKHtQeVAtyxR+4lM5aveXKZ6EIjYXn9RQzaNplEJr2CzNFo61W8GPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl3/81DtK67VovBCgi3r2WBFGGaue6y2vj13yRgMIvf9/WMmrF
	M9q8uyUC0euUzMBTB0GM+73aMvcyFuxZ6jcEKRm2qTzm41CAQ26i7PPHYolE1vIkv7hjXzkuKqb
	frHBLuPmYNon91gjcq/IK6FMdd3H6eerJQ+Q0f+JNSit25CoTpOM0L9OeA3GOPHGdkQ==
X-Gm-Gg: ASbGncvibGYCPGXyOp1FO9K1IXlQmPadw01uvGoMeDKR3jPSzxtkY2JzRHWBcDVfjqw
	mBNJ9N54ALPA3b75xZz+sL9Yi4XRjbtI7D4l6GEqMf5llRS4hrPpEt9t3rNIeNQhxE5KKpyU3e7
	PCQzmIB0sC+rjURv4t5WhVXUKTuoWsjczbnylPdC937uVEMtLwI+COmf2qbBfoM5f4AApQCy9u3
	pATJpVoDnGTFS3al6ecVcwG1Xg9ORXqLu6Feezkr2goTcS5l/5qf8dR8d3drYZNS1VLjfnJFNU3
	kERHUwaqTR+AQa7JtiENjOBTGYdhYBwPuqapNQ==
X-Received: by 2002:a17:902:ea12:b0:224:584:6eef with SMTP id d9443c01a7336-231de370161mr380770095ad.41.1747927960960;
        Thu, 22 May 2025 08:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjPJ3d2Li+gJkA5m0jUKxV/lCdF1BtyKLt3kcWVKRRohcYKbvk2gX+o2xn/FomLrZtISVaEQ==
X-Received: by 2002:a17:902:ea12:b0:224:584:6eef with SMTP id d9443c01a7336-231de370161mr380769615ad.41.1747927960459;
        Thu, 22 May 2025 08:32:40 -0700 (PDT)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-232053579d7sm90944365ad.80.2025.05.22.08.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 08:32:39 -0700 (PDT)
Message-ID: <44c318c704960c0d0732598773fd256bdfac2fc1.camel@redhat.com>
Subject: Re: [PATCH v3 1/5] drm/sched: Fix teardown leaks with waitqueue
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 22 May 2025 17:32:29 +0200
In-Reply-To: <1a15598f-da02-46a0-8c41-ef8b765dc177@igalia.com>
References: <20250522082742.148191-2-phasta@kernel.org>
	 <20250522082742.148191-3-phasta@kernel.org>
	 <1a15598f-da02-46a0-8c41-ef8b765dc177@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-05-22 at 14:37 +0100, Tvrtko Ursulin wrote:
>=20
> On 22/05/2025 09:27, Philipp Stanner wrote:
> > From: Philipp Stanner <pstanner@redhat.com>
> >=20
> > The GPU scheduler currently does not ensure that its pending_list
> > is
> > empty before performing various other teardown tasks in
> > drm_sched_fini().
> >=20
> > If there are still jobs in the pending_list, this is problematic
> > because
> > after scheduler teardown, no one will call backend_ops.free_job()
> > anymore. This would, consequently, result in memory leaks.
> >=20
> > One way to solve this is to implement a waitqueue that
> > drm_sched_fini()
> > blocks on until the pending_list has become empty. That waitqueue
> > must
> > obviously not block for a significant time. Thus, it's necessary to
> > only
> > wait if it's guaranteed that all fences will get signaled quickly.
> >=20
> > This can be ensured by having the driver implement a new backend
> > ops,
> > cancel_pending_fences(), in which the driver shall signal all
> > unsignaled, in-flight fences with an error.
> >=20
> > Add a waitqueue to struct drm_gpu_scheduler. Wake up waiters once
> > the
> > pending_list becomes empty. Wait in drm_sched_fini() for that to
> > happen
> > if cancel_pending_fences() is implemented.
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 105
> > ++++++++++++++++++++-----
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 +++++
> > =C2=A0 2 files changed, 105 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index f7118497e47a..406572f5168e 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -367,7 +367,7 @@ static void drm_sched_run_job_queue(struct
> > drm_gpu_scheduler *sched)
> > =C2=A0=C2=A0 */
> > =C2=A0 static void __drm_sched_run_free_queue(struct drm_gpu_scheduler
> > *sched)
> > =C2=A0 {
> > -	if (!READ_ONCE(sched->pause_submit))
> > +	if (!READ_ONCE(sched->pause_free))
> > =C2=A0=C2=A0		queue_work(sched->submit_wq, &sched-
> > >work_free_job);
> > =C2=A0 }
> > =C2=A0=20
> > @@ -1121,6 +1121,12 @@ drm_sched_get_finished_job(struct
> > drm_gpu_scheduler *sched)
> > =C2=A0=C2=A0		/* remove job from pending_list */
> > =C2=A0=C2=A0		list_del_init(&job->list);
> > =C2=A0=20
> > +		/*
> > +		 * Inform tasks blocking in drm_sched_fini() that
> > it's now safe to proceed.
> > +		 */
> > +		if (list_empty(&sched->pending_list))
> > +			wake_up(&sched->pending_list_waitque);
>=20
> Wait what? ;) (pun intended)
>=20
> I think I mentioned in the last round that waitque looks dodgy.
> Either a=20
> typo or a very unusual and novel shorthand? I suggest a typical wq or
> waitqueue.

Ah right, I forgot about that.

>=20
> I also mentioned that one more advantage of the ->cancel_job()
> approach=20
> is there is no need for these extra calls on the normal path (non=20
> teardown) at all.

Yes, agreed, that's a tiny performance gain. But it's running in a
workqueue, so no big deal. But see below, too

>=20
> > +
> > =C2=A0=C2=A0		/* cancel this job's TO timer */
> > =C2=A0=C2=A0		cancel_delayed_work(&sched->work_tdr);
> > =C2=A0=C2=A0		/* make the scheduled timestamp more accurate */
> > @@ -1326,6 +1332,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched, const struct drm_sched_init_
> > =C2=A0=C2=A0	init_waitqueue_head(&sched->job_scheduled);
> > =C2=A0=C2=A0	INIT_LIST_HEAD(&sched->pending_list);
> > =C2=A0=C2=A0	spin_lock_init(&sched->job_list_lock);
> > +	init_waitqueue_head(&sched->pending_list_waitque);
> > =C2=A0=C2=A0	atomic_set(&sched->credit_count, 0);
> > =C2=A0=C2=A0	INIT_DELAYED_WORK(&sched->work_tdr,
> > drm_sched_job_timedout);
> > =C2=A0=C2=A0	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > @@ -1333,6 +1340,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched, const struct drm_sched_init_
> > =C2=A0=C2=A0	atomic_set(&sched->_score, 0);
> > =C2=A0=C2=A0	atomic64_set(&sched->job_id_count, 0);
> > =C2=A0=C2=A0	sched->pause_submit =3D false;
> > +	sched->pause_free =3D false;
> > =C2=A0=20
> > =C2=A0=C2=A0	sched->ready =3D true;
> > =C2=A0=C2=A0	return 0;
> > @@ -1350,33 +1358,90 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched, const struct drm_sched_init_
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL(drm_sched_init);
> > =C2=A0=20
> > +/**
> > + * drm_sched_submission_and_timeout_stop - stop everything except
> > for free_job
> > + * @sched: scheduler instance
> > + *
> > + * Helper for tearing down the scheduler in drm_sched_fini().
> > + */
> > +static void
> > +drm_sched_submission_and_timeout_stop(struct drm_gpu_scheduler
> > *sched)
> > +{
> > +	WRITE_ONCE(sched->pause_submit, true);
> > +	cancel_work_sync(&sched->work_run_job);
> > +	cancel_delayed_work_sync(&sched->work_tdr);
> > +}
> > +
> > +/**
> > + * drm_sched_free_stop - stop free_job
> > + * @sched: scheduler instance
> > + *
> > + * Helper for tearing down the scheduler in drm_sched_fini().
> > + */
> > +static void drm_sched_free_stop(struct drm_gpu_scheduler *sched)
> > +{
> > +	WRITE_ONCE(sched->pause_free, true);
> > +	cancel_work_sync(&sched->work_free_job);
> > +}
> > +
> > +/**
> > + * drm_sched_no_jobs_pending - check whether jobs are pending
> > + * @sched: scheduler instance
> > + *
> > + * Checks if jobs are pending for @sched.
> > + *
> > + * Return: true if jobs are pending, false otherwise.
> > + */
> > +static bool drm_sched_no_jobs_pending(struct drm_gpu_scheduler
> > *sched)
> > +{
> > +	bool empty;
> > +
> > +	spin_lock(&sched->job_list_lock);
> > +	empty =3D list_empty(&sched->pending_list);
> > +	spin_unlock(&sched->job_list_lock);
> > +
> > +	return empty;
> > +}
> > +
> > +/**
> > + * drm_sched_cancel_jobs_and_wait - trigger freeing of all pending
> > jobs
> > + * @sched: scheduler instance
> > + *
> > + * Must only be called if &struct
> > drm_sched_backend_ops.cancel_pending_fences is
> > + * implemented.
> > + *
> > + * Instructs the driver to kill the fence context associated with
> > this scheduler,
> > + * thereby signaling all pending fences. This, in turn, will
> > trigger
> > + * &struct drm_sched_backend_ops.free_job to be called for all
> > pending jobs.
> > + * The function then blocks until all pending jobs have been
> > freed.
> > + */
> > +static void drm_sched_cancel_jobs_and_wait(struct
> > drm_gpu_scheduler *sched)
> > +{
> > +	sched->ops->cancel_pending_fences(sched);
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
> > - * This stops submission of new jobs to the hardware through
> > - * drm_sched_backend_ops.run_job(). Consequently,
> > drm_sched_backend_ops.free_job()
> > - * will not be called for all jobs still in
> > drm_gpu_scheduler.pending_list.
> > - * There is no solution for this currently. Thus, it is up to the
> > driver to make
> > - * sure that:
> > - *
> > - *=C2=A0 a) drm_sched_fini() is only called after for all submitted
> > jobs
> > - *=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job() has been c=
alled or that
> > - *=C2=A0 b) the jobs for which drm_sched_backend_ops.free_job() has no=
t
> > been called
> > - *=C2=A0=C2=A0=C2=A0=C2=A0 after drm_sched_fini() ran are freed manual=
ly.
> > - *
> > - * FIXME: Take care of the above problem and prevent this function
> > from leaking
> > - * the jobs in drm_gpu_scheduler.pending_list under any
> > circumstances.
> > + * Tears down and cleans up the scheduler. Might leak memory if
> > + * &struct drm_sched_backend_ops.cancel_pending_fences is not
> > implemented.
> > =C2=A0=C2=A0 */
> > =C2=A0 void drm_sched_fini(struct drm_gpu_scheduler *sched)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct drm_sched_entity *s_entity;
> > =C2=A0=C2=A0	int i;
> > =C2=A0=20
> > -	drm_sched_wqueue_stop(sched);
> > +	if (sched->ops->cancel_pending_fences) {
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
> > @@ -1464,7 +1529,7 @@ bool drm_sched_wqueue_ready(struct
> > drm_gpu_scheduler *sched)
> > =C2=A0 EXPORT_SYMBOL(drm_sched_wqueue_ready);
> > =C2=A0=20
> > =C2=A0 /**
> > - * drm_sched_wqueue_stop - stop scheduler submission
> > + * drm_sched_wqueue_stop - stop scheduler submission and freeing
> > =C2=A0=C2=A0 * @sched: scheduler instance
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Stops the scheduler from pulling new jobs from entities.=
 It
> > also stops
> > @@ -1473,13 +1538,14 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
> > =C2=A0 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
> > =C2=A0 {
> > =C2=A0=C2=A0	WRITE_ONCE(sched->pause_submit, true);
> > +	WRITE_ONCE(sched->pause_free, true);
> > =C2=A0=C2=A0	cancel_work_sync(&sched->work_run_job);
> > =C2=A0=C2=A0	cancel_work_sync(&sched->work_free_job);
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL(drm_sched_wqueue_stop);
> > =C2=A0=20
> > =C2=A0 /**
> > - * drm_sched_wqueue_start - start scheduler submission
> > + * drm_sched_wqueue_start - start scheduler submission and freeing
> > =C2=A0=C2=A0 * @sched: scheduler instance
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Restarts the scheduler after drm_sched_wqueue_stop() has
> > stopped it.
> > @@ -1490,6 +1556,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
> > =C2=A0 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
> > =C2=A0 {
> > =C2=A0=C2=A0	WRITE_ONCE(sched->pause_submit, false);
> > +	WRITE_ONCE(sched->pause_free, false);
> > =C2=A0=C2=A0	queue_work(sched->submit_wq, &sched->work_run_job);
> > =C2=A0=C2=A0	queue_work(sched->submit_wq, &sched->work_free_job);
> > =C2=A0 }
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index d860db087ea5..d8bd5b605336 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -29,6 +29,7 @@
> > =C2=A0 #include <linux/completion.h>
> > =C2=A0 #include <linux/xarray.h>
> > =C2=A0 #include <linux/workqueue.h>
> > +#include <linux/wait.h>
> > =C2=A0=20
> > =C2=A0 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
> > =C2=A0=20
> > @@ -508,6 +509,19 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * and it's=
 time to clean it up.
> > =C2=A0=C2=A0	 */
> > =C2=A0=C2=A0	void (*free_job)(struct drm_sched_job *sched_job);
> > +
> > +	/**
> > +	 * @cancel_pending_fences: cancel all unsignaled hardware
> > fences
> > +	 *
> > +	 * This callback must signal all unsignaled hardware
> > fences associated
> > +	 * with @sched with an appropriate error code (e.g., -
> > ECANCELED). This
> > +	 * ensures that all jobs will get freed by the scheduler
> > before
> > +	 * teardown.
> > +	 *
> > +	 * This callback is optional, but it is highly recommended
> > to implement
> > +	 * it to avoid memory leaks.
> > +	 */
> > +	void (*cancel_pending_fences)(struct drm_gpu_scheduler
> > *sched);
>=20
> I still don't understand why insist to use a new term in the backend=20
> ops, and even the whole scheduler API. Nothing in the API so far has=20
> fences in the name. Something like cancel(_all|pending)_jobs or=20
> sched_fini would read more aligned with the rest to me.

Nothing has fences in the name, but they are the central concept of the
API: run_job() returns them, and they are the main mechanism through
which scheduler and driver communicate.

As mentioned in the other mail, the idea behind the callback is to get
all hardware fences signaled. Just that. That's a simple, well
established concept, easy to understand by drivers. In contrast, it
would be far less clear what "cancel" even means. That's evident from
the other patch where we're suddenly wondering whether the driver
should also cancel timers etc. in the callback.

It should not. The contract is simple: "signal everything".

It's also more difficult to abuse, since signaling is always valid. But
when is canceling valid?

Considering how internal APIs have been abused in the past, I can very
well see some party using a cancel_job() callback in the future to
"cancel" single jobs, for example in our (still unsolved)
resubmit_jobs() problem.

>=20
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 /**
> > @@ -533,6 +547,8 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 timeout interval is over.
> > =C2=A0=C2=A0 * @pending_list: the list of jobs which are currently in t=
he job
> > queue.
> > =C2=A0=C2=A0 * @job_list_lock: lock to protect the pending_list.
> > + * @pending_list_waitque: a waitqueue for drm_sched_fini() to
> > block on until all
> > + *		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pending job=
s have been finished.
> > =C2=A0=C2=A0 * @hang_limit: once the hangs by a job crosses this limit =
then
> > it is marked
> > =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 guilty and it will no longer be considered for
> > scheduling.
> > =C2=A0=C2=A0 * @score: score to help loadbalancer pick a idle sched
> > @@ -540,6 +556,7 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0 * @ready: marks if the underlying HW is ready to work
> > =C2=A0=C2=A0 * @free_guilty: A hit to time out handler to free the guil=
ty
> > job.
> > =C2=A0=C2=A0 * @pause_submit: pause queuing of @work_run_job on @submit=
_wq
> > + * @pause_free: pause queueing of @work_free_job on @submit_wq
> > =C2=A0=C2=A0 * @own_submit_wq: scheduler owns allocation of @submit_wq
> > =C2=A0=C2=A0 * @dev: system &struct device
> > =C2=A0=C2=A0 *
> > @@ -562,12 +579,14 @@ struct drm_gpu_scheduler {
> > =C2=A0=C2=A0	struct delayed_work		work_tdr;
> > =C2=A0=C2=A0	struct list_head		pending_list;
> > =C2=A0=C2=A0	spinlock_t			job_list_lock;
> > +	wait_queue_head_t		pending_list_waitque;
> > =C2=A0=C2=A0	int				hang_limit;
> > =C2=A0=C2=A0	atomic_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *score;
> > =C2=A0=C2=A0	atomic_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 _score;
> > =C2=A0=C2=A0	bool				ready;
> > =C2=A0=C2=A0	bool				free_guilty;
> > =C2=A0=C2=A0	bool				pause_submit;
> > +	bool				pause_free;
> > =C2=A0=C2=A0	bool				own_submit_wq;
> > =C2=A0=C2=A0	struct device			*dev;
> > =C2=A0 };
>=20
> And, as you know, another thing I don't understand is why would we=20
> choose to add more of the state machine when I have shown how it can
> be=20
> done more elegantly. You don't have to reply, this is more a for the=20
> record against v3.

I do like your approach to a degree, and I reimplemented and tested it
during the last days! Don't think I just easily toss aside a good idea;
in fact, weighing between both approaches did cause me some headache :)

The thing is that while implementing it for the unit tests (not even to
begin with Nouveau, where the implementation is a bit more difficult
because some helpers need to be moved), I ran into a ton of faults
because of how the tests are constructed. When do I have to cancel
which timer for which job, all before calling drm_sched_fini(), or each
one separately in cancel_job()? What about timedout jobs?

This [1] for exmaple is an implementation attempt I made which differs
only slightly from yours but does not work and causes all sorts of
issues with timer interrupts.

Now, that could obviously be fixed, and maybe I fail =E2=80=93 but the thin=
g
is, if I can fail, others can, too. And porting the unit tests is a
good beta-test.

When you look at the waitqueue solution, it is easy to implement for
both Nouveau and sched/tests, with minimal adjustments. My approach
works for both and is already well tested in Nouveau.

The ease with which it can be used and the simplicity of the contract
("signal all fences!") gives me confidence that this is, despite the
larger state machine, more maintainable and that it's easier to port
other drivers to the new cleanup method. I've had some success with
similar approaches when cleaning up 16 year old broken PCI code [2].

Moreover, our long term goal should anyways be to, ideally, port all
drivers to the new cleanup design and then make the callback mandatory.
Then some places in drm_sched_fini() can be cleaned up, too.

Besides, the above reasons like the resistence against abuse of a
cancel_job() also apply.


Does that sound convincing? :)
P.


[1] https://paste.debian.net/1376021/
[2] https://lore.kernel.org/linux-pci/20250520085938.GB261485@rocinante/T/#=
m6e28eabdb22286238545c1fa6026445a4001d8e2



>=20
> Regards,
>=20
> Tvrtko
>=20

