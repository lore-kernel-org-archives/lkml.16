Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491121DF97D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876194; cv=none; b=GrSVjvCQ0APNKkcF+SNwUqSVHfcah8Tkhl1kPBLJ47IDgia4W2uy3Tqeas2V/s1Jz9EpkX53Ezikg16zZkhoBLwCJZyM6yzCv5wVXhezjXEc/2w4gTZU7Vzw3derVmsgwHKc29u+9mJMzJ6byKmZK6fJDJluckIBNGcqwjeJlT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876194; c=relaxed/simple;
	bh=pNAofHo18uyzSYpL7PuWhUoMktj/F7DDrTepwVqct/Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aFo3lhsp1C7otd4yXcZeL29/sWiw+EIzoS3wn3E2WeK6rwKn0XjEFgdlj1Bk8tGs3x5tVw2SWe65UFxLH5HToTLvUPmefBnRQYrQW63wU+H0t1ocW0elmzRWY2JY2d5k0ztJagqDO0xLQ7zGrT6C/osQRKUFrbB6O6qrN9hupuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P8Gg0GS+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P8Gg0GS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744876191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lbQgrXz5oiICX14AE+d1lrN5WuBPYGRCPNcO8Q1nbVQ=;
	b=P8Gg0GS+tiXSnqCIUAAA5USdEhmbtLS30uYVn9fvVQ0dvLs2ed2EtvlSbfzzOsLii1nwJ6
	CkO9Wj61aEwti4f8ltvgNp1Z9ETtd1wWyGtQ7N9P0GapJw0mPoBBylylaMdHHWUS6kgjMT
	T883Hj3DnZQGYo3wvI9qntBbXimIZBk=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-ebbn-g_eMIyeCBIcLIHSFg-1; Thu, 17 Apr 2025 03:49:49 -0400
X-MC-Unique: ebbn-g_eMIyeCBIcLIHSFg-1
X-Mimecast-MFC-AGG-ID: ebbn-g_eMIyeCBIcLIHSFg_1744876188
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af59547f55bso333498a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876188; x=1745480988;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lbQgrXz5oiICX14AE+d1lrN5WuBPYGRCPNcO8Q1nbVQ=;
        b=AOrsnJm+3gJ12J1GZTMr+58iCfmd1iu6iCPLVTTcP6PF9lCLz48gzlfPf+xSS92ppe
         yXI1YtBxDZKsegdVi17PGluBxff9LjRCu33EunlrXmyYU/sBpz2b76CPrI+I8Ai+C7py
         2xYHHaTb5nwZCpvrr/gyuyD9QOXLMiShNTsb8MHslcw2lj32PBV43mQf9iiNQReht6jm
         wJS/O07HsB2qV+fYDjexY2He6DDp3okge2VCbUx5fYhRfwwJTltUNml82aN/j/kKxRah
         lNQBkh3RtOkwDMPSSYwn62FC1I+iJ6Eqhp/hBaf8xeLFngKpMUI2z8hR4XkJJSlu5RjX
         Ft/g==
X-Forwarded-Encrypted: i=1; AJvYcCWLJBZIjS0ZqxmGxhHkAUaZv6juRq+dc1maWTs3Tc8RFYLeDCOsljYP9w6qrun+LHrHLUcusvzu629Bmss=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbX4cH8WsKnKSqTBonzbs29qXfFVPNOlofAuVwsBHqPv6hRwiS
	Dhk5uJVKYQ0j9/i0gtwJDaBMx9M02gvDmKOeBoXGJ+5bhEmluHQ1N91CavzFBmTcNOqplP6OHJV
	fr60AwPVHcviXBChdJMV4P//CyCcBYXTZFxvSOVl5ddHgjNwjF8YcXhkptnyiaQ==
X-Gm-Gg: ASbGncusr35YyB8fNav31xUSTFTdbQWN9LyRi7q2wi7Ebt+dKJFZVJhQnnctnOibTnN
	e8zM1GJsbAyxXOxkVvaVEwbDeQOb7/EVdAvXcLPdOjitSD03v+ue6uG5SDFAQ4SlAt+9qbwdYG+
	FEFr9dfay0Qi3QK2mz++xy5VwplMMhR+Q7gSkKtsogHbmccVciOwgz2qoG76Wj3hMYtu9PSqzF+
	aw0fAnfilxrw0DXy3vPZUftcMRGBQZBZ10VMD4RwzbMO52j/ydegCF+lX534jlhSYG5hGBQdzHU
	lkprW6/D2bUAPhrxr5NGgPkbL1fktmuhzbAGMA==
X-Received: by 2002:a05:6a21:3a44:b0:1f5:8d3b:e294 with SMTP id adf61e73a8af0-203b3e9847emr7096082637.16.1744876188015;
        Thu, 17 Apr 2025 00:49:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVjB/C/+4oGat9oE5aw8eMd7Xk6k37G4WKUy4clN0zc5tP1oOBnDeVNJos16vE6SjOc2bC2w==
X-Received: by 2002:a05:6a21:3a44:b0:1f5:8d3b:e294 with SMTP id adf61e73a8af0-203b3e9847emr7096046637.16.1744876187559;
        Thu, 17 Apr 2025 00:49:47 -0700 (PDT)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198a89sm11723812b3a.5.2025.04.17.00.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:49:47 -0700 (PDT)
Message-ID: <bce0a735c334fc3a26f7795c77323b7684085015.camel@redhat.com>
Subject: Re: [PATCH 1/5] drm/sched: Fix teardown leaks with waitqueue
From: Philipp Stanner <pstanner@redhat.com>
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 17 Apr 2025 09:49:34 +0200
In-Reply-To: <20250407152239.34429-3-phasta@kernel.org>
References: <20250407152239.34429-2-phasta@kernel.org>
	 <20250407152239.34429-3-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-04-07 at 17:22 +0200, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
>=20
> The GPU scheduler currently does not ensure that its pending_list is
> empty before performing various other teardown tasks in
> drm_sched_fini().
>=20
> If there are still jobs in the pending_list, this is problematic
> because
> after scheduler teardown, no one will call backend_ops.free_job()
> anymore. This would, consequently, result in memory leaks.
>=20
> One way to solve this is to implement a waitqueue that
> drm_sched_fini()
> blocks on until the pending_list has become empty.
>=20
> Add a waitqueue to struct drm_gpu_scheduler. Wake up waiters once the
> pending_list becomes empty. Wait in drm_sched_fini() for that to
> happen.
>=20
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 84 ++++++++++++++++++++---=
-
> --
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++
> =C2=A02 files changed, 75 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 829579c41c6b..a6a4deeda72b 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -367,7 +367,7 @@ static void drm_sched_run_job_queue(struct
> drm_gpu_scheduler *sched)
> =C2=A0 */
> =C2=A0static void __drm_sched_run_free_queue(struct drm_gpu_scheduler
> *sched)
> =C2=A0{
> -	if (!READ_ONCE(sched->pause_submit))
> +	if (!READ_ONCE(sched->pause_free))
> =C2=A0		queue_work(sched->submit_wq, &sched->work_free_job);
> =C2=A0}
> =C2=A0
> @@ -556,6 +556,7 @@ static void drm_sched_job_timedout(struct
> work_struct *work)
> =C2=A0		 * is parked at which point it's safe.
> =C2=A0		 */
> =C2=A0		list_del_init(&job->list);
> +
> =C2=A0		spin_unlock(&sched->job_list_lock);
> =C2=A0
> =C2=A0		status =3D job->sched->ops->timedout_job(job);
> @@ -572,8 +573,10 @@ static void drm_sched_job_timedout(struct
> work_struct *work)
> =C2=A0		spin_unlock(&sched->job_list_lock);
> =C2=A0	}
> =C2=A0
> -	if (status !=3D DRM_GPU_SCHED_STAT_ENODEV)
> -		drm_sched_start_timeout_unlocked(sched);
> +	if (status !=3D DRM_GPU_SCHED_STAT_ENODEV) {
> +		if (!READ_ONCE(sched->cancel_timeout))

Another thing I want to investigate is whether all those booleans we
read with READ_ONCE are actually necessary?

Because I suspect they are not. The cancel_work_sync() functions should
do the trick, and if they're too late we'd just wait one cycle longer.

@Christian, Tvrtko, could be helpful if you can take a look.

> +			drm_sched_start_timeout_unlocked(sched);
> +	}
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -1119,12 +1122,22 @@ drm_sched_get_finished_job(struct
> drm_gpu_scheduler *sched)
> =C2=A0		/* remove job from pending_list */
> =C2=A0		list_del_init(&job->list);
> =C2=A0
> +		/*
> +		 * Inform tasks blocking in drm_sched_fini() that
> it's now safe to proceed.
> +		 */
> +		if (list_empty(&sched->pending_list))
> +			wake_up(&sched->pending_list_waitque);
> +
> =C2=A0		/* cancel this job's TO timer */
> =C2=A0		cancel_delayed_work(&sched->work_tdr);
> =C2=A0		/* make the scheduled timestamp more accurate */
> =C2=A0		next =3D list_first_entry_or_null(&sched-
> >pending_list,
> =C2=A0						typeof(*next),
> list);
> =C2=A0
> +		// TODO RFC: above we wake up the waitque which
> relies on the fact
> +		// that timeouts have been deactivated. The below
> should never
> +		// reactivate them since the list was empty above.
> Still, should
> +		// we document that?

Regarding this, I re-read the code a few times and conclude that this
is not a problem.


P.

> =C2=A0		if (next) {
> =C2=A0			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 &next->s_fence-
> >scheduled.flags))
> @@ -1324,6 +1337,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched, const struct drm_sched_init_
> =C2=A0	init_waitqueue_head(&sched->job_scheduled);
> =C2=A0	INIT_LIST_HEAD(&sched->pending_list);
> =C2=A0	spin_lock_init(&sched->job_list_lock);
> +	init_waitqueue_head(&sched->pending_list_waitque);
> =C2=A0	atomic_set(&sched->credit_count, 0);
> =C2=A0	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> =C2=A0	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> @@ -1331,6 +1345,8 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched, const struct drm_sched_init_
> =C2=A0	atomic_set(&sched->_score, 0);
> =C2=A0	atomic64_set(&sched->job_id_count, 0);
> =C2=A0	sched->pause_submit =3D false;
> +	sched->pause_free =3D false;
> +	sched->cancel_timeout =3D false;
> =C2=A0
> =C2=A0	sched->ready =3D true;
> =C2=A0	return 0;
> @@ -1348,6 +1364,40 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched, const struct drm_sched_init_
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_init);
> =C2=A0
> +/**
> + * drm_sched_submission_and_timeout_stop - stop everything except
> for free_job()
> + * @sched: scheduler instance
> + *
> + * Only needed to cleanly tear down the scheduler in
> drm_sched_fini().
> + */
> +static inline void
> +drm_sched_submission_and_timeout_stop(struct drm_gpu_scheduler
> *sched)
> +{
> +	WRITE_ONCE(sched->pause_submit, true);
> +	WRITE_ONCE(sched->cancel_timeout, true);
> +	cancel_work_sync(&sched->work_run_job);
> +	cancel_delayed_work_sync(&sched->work_tdr);
> +}
> +
> +static inline void
> +drm_sched_free_stop(struct drm_gpu_scheduler *sched)
> +{
> +	WRITE_ONCE(sched->pause_free, true);
> +	cancel_work_sync(&sched->work_free_job);
> +}
> +
> +static inline bool
> +drm_sched_no_jobs_pending(struct drm_gpu_scheduler *sched)
> +{
> +	bool empty;
> +
> +	spin_lock(&sched->job_list_lock);
> +	empty =3D list_empty(&sched->pending_list);
> +	spin_unlock(&sched->job_list_lock);
> +
> +	return empty;
> +}
> +
> =C2=A0/**
> =C2=A0 * drm_sched_fini - Destroy a gpu scheduler
> =C2=A0 *
> @@ -1355,26 +1405,24 @@ EXPORT_SYMBOL(drm_sched_init);
> =C2=A0 *
> =C2=A0 * Tears down and cleans up the scheduler.
> =C2=A0 *
> - * This stops submission of new jobs to the hardware through
> - * drm_sched_backend_ops.run_job(). Consequently,
> drm_sched_backend_ops.free_job()
> - * will not be called for all jobs still in
> drm_gpu_scheduler.pending_list.
> - * There is no solution for this currently. Thus, it is up to the
> driver to make
> - * sure that:
> - *
> - *=C2=A0 a) drm_sched_fini() is only called after for all submitted jobs
> - *=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job() has been cal=
led or that
> - *=C2=A0 b) the jobs for which drm_sched_backend_ops.free_job() has not
> been called
> - *=C2=A0=C2=A0=C2=A0=C2=A0 after drm_sched_fini() ran are freed manually=
.
> - *
> - * FIXME: Take care of the above problem and prevent this function
> from leaking
> - * the jobs in drm_gpu_scheduler.pending_list under any
> circumstances.
> + * Note that this function blocks until all the fences returned by
> + * &struct drm_sched_backend_ops.run_job have been signalled.
> =C2=A0 */
> =C2=A0void drm_sched_fini(struct drm_gpu_scheduler *sched)
> =C2=A0{
> =C2=A0	struct drm_sched_entity *s_entity;
> =C2=A0	int i;
> =C2=A0
> -	drm_sched_wqueue_stop(sched);
> +	/*
> +	 * Jobs that have neither been scheduled or which have timed
> out are
> +	 * gone by now, but jobs that have been submitted through
> +	 * backend_ops.run_job() and have not yet terminated are
> still pending.
> +	 *
> +	 * Wait for the pending_list to become empty to avoid
> leaking those jobs.
> +	 */
> +	drm_sched_submission_and_timeout_stop(sched);
> +	wait_event(sched->pending_list_waitque,
> drm_sched_no_jobs_pending(sched));
> +	drm_sched_free_stop(sched);
> =C2=A0
> =C2=A0	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
> {
> =C2=A0		struct drm_sched_rq *rq =3D sched->sched_rq[i];
> @@ -1471,6 +1519,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
> =C2=A0void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
> =C2=A0{
> =C2=A0	WRITE_ONCE(sched->pause_submit, true);
> +	WRITE_ONCE(sched->pause_free, true);
> =C2=A0	cancel_work_sync(&sched->work_run_job);
> =C2=A0	cancel_work_sync(&sched->work_free_job);
> =C2=A0}
> @@ -1488,6 +1537,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
> =C2=A0void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
> =C2=A0{
> =C2=A0	WRITE_ONCE(sched->pause_submit, false);
> +	WRITE_ONCE(sched->pause_free, false);
> =C2=A0	queue_work(sched->submit_wq, &sched->work_run_job);
> =C2=A0	queue_work(sched->submit_wq, &sched->work_free_job);
> =C2=A0}
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index 1a7e377d4cbb..badcf9ea4501 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -29,6 +29,7 @@
> =C2=A0#include <linux/completion.h>
> =C2=A0#include <linux/xarray.h>
> =C2=A0#include <linux/workqueue.h>
> +#include <linux/wait.h>
> =C2=A0
> =C2=A0#define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
> =C2=A0
> @@ -533,6 +534,8 @@ struct drm_sched_backend_ops {
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 timeout interval is over.
> =C2=A0 * @pending_list: the list of jobs which are currently in the job
> queue.
> =C2=A0 * @job_list_lock: lock to protect the pending_list.
> + * @pending_list_waitque: a waitqueue for drm_sched_fini() to block
> on until all
> + *		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pending jobs =
have been finished.
> =C2=A0 * @hang_limit: once the hangs by a job crosses this limit then it
> is marked
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 guilty and it will no longer be considered for
> scheduling.
> =C2=A0 * @score: score to help loadbalancer pick a idle sched
> @@ -540,6 +543,8 @@ struct drm_sched_backend_ops {
> =C2=A0 * @ready: marks if the underlying HW is ready to work
> =C2=A0 * @free_guilty: A hit to time out handler to free the guilty job.
> =C2=A0 * @pause_submit: pause queuing of @work_run_job on @submit_wq
> + * @pause_free: pause queuing of @work_free_job on @submit_wq
> + * @cancel_timeout: pause queuing of @work_tdr on @submit_wq
> =C2=A0 * @own_submit_wq: scheduler owns allocation of @submit_wq
> =C2=A0 * @dev: system &struct device
> =C2=A0 *
> @@ -562,12 +567,15 @@ struct drm_gpu_scheduler {
> =C2=A0	struct delayed_work		work_tdr;
> =C2=A0	struct list_head		pending_list;
> =C2=A0	spinlock_t			job_list_lock;
> +	wait_queue_head_t		pending_list_waitque;
> =C2=A0	int				hang_limit;
> =C2=A0	atomic_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 *score;
> =C2=A0	atomic_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 _score;
> =C2=A0	bool				ready;
> =C2=A0	bool				free_guilty;
> =C2=A0	bool				pause_submit;
> +	bool				pause_free;
> +	bool				cancel_timeout;
> =C2=A0	bool				own_submit_wq;
> =C2=A0	struct device			*dev;
> =C2=A0};

