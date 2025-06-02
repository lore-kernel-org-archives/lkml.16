Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2546204C2F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748863728; cv=none; b=YBx7P0zg/4I7hXNaDSzKmzlssGmlohdTXPHu0OCu2I5Ki4WjaSWB0gBZMek6bhUhRNUZkq41CD2YLR+fHmUyVsN5J/ito70As8gCvEWRIUtffCq7zJLeHDRmOpyMFQJ9DQt8b0RI5c4uyAoC6mI+8d1vp1bYrbSlWAJJDcojsX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748863728; c=relaxed/simple;
	bh=R9d3oJmP9BrN49ZdSlpWahejkiwe4YhzzKWtP38hmGk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KDERfEpCcjx2bphRukJA5NKfqHCY8qI8tJVtvXLTDyKXfbXTmLBIAYjgJVXdaH8NWorFcWBlTghR+YTbP8+QtIJQGM1DIHYfyLByS/BINB9Ela/YwpnLhF7IUofJ2t4zoyI82igH6NBeuxTEraKiX+heBMTAawZddhUJ8LPFE3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Nuy+wV5K; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Nuy+wV5K"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4b9s6X2GNHz9spJ;
	Mon,  2 Jun 2025 13:28:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748863716; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nr8qXtPIgbMMdXUGn/RWMazMygXo495Zeik7yKT8EyY=;
	b=Nuy+wV5KpNAobQOWCOOmNX3L+95dmYfC6nA38zzGHGSxDHWYgyOGfPp7hquMCmjbkaIvml
	602nhle+ALj4kSGO/FZfN8iLzkjz95oztiJ9igJUPuD7eIM5UprPuqXu0mTzvpf5JxFqTn
	ZoC+UItGkRuDSfBL61lU8oKKlLQG8MhmVDr2E5QvEc7QVbgKXgZpZlJHK9OIgc8J2Ckg6A
	/bW/4DBMRjQUxhXL5IN2HH+jXz1rF6Mm2Mc6pagi5aFhm4qFkpbZ/Xnd+DZhLOx2g79g9N
	cErfdlprwyxBg/15pguVaVFXygA3U/bW35gM0ak53gXMMQAqWAAxj9vOCtC8EQ==
Message-ID: <d47a1e33a0579deb13a0327cc20f43a414e90f57.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched/tests: Use one lock for fence context
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@gmail.com, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 02 Jun 2025 13:28:32 +0200
In-Reply-To: <20250527101029.56491-2-phasta@kernel.org>
References: <20250527101029.56491-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: nfifcbut9b44xbk655tqfxkkct9ccyku
X-MBO-RS-ID: 613d9d97a584c2ad33c

On Tue, 2025-05-27 at 12:10 +0200, Philipp Stanner wrote:
> There is no need for separate locks for single jobs and the entire
> scheduler. The dma_fence context can be protected by the scheduler
> lock,
> allowing for removing the jobs' locks. This simplifies things and
> reduces the likelyhood of deadlocks etc.
>=20
> Replace the jobs' locks with the mock scheduler lock.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Applied to drm-misc-next

P.

> ---
> Changes in v2:
> =C2=A0 - Make commit message more neutral by stating it's about
> simplifying
> =C2=A0=C2=A0=C2=A0 the code. (Tvrtko)
> ---
> =C2=A0drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 5 ++---
> =C2=A0drivers/gpu/drm/scheduler/tests/sched_tests.h=C2=A0=C2=A0=C2=A0 | 1=
 -
> =C2=A02 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index f999c8859cf7..17023276f4b0 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -64,7 +64,7 @@ static void drm_mock_sched_job_complete(struct
> drm_mock_sched_job *job)
> =C2=A0
> =C2=A0	job->flags |=3D DRM_MOCK_SCHED_JOB_DONE;
> =C2=A0	list_move_tail(&job->link, &sched->done_list);
> -	dma_fence_signal(&job->hw_fence);
> +	dma_fence_signal_locked(&job->hw_fence);
> =C2=A0	complete(&job->done);
> =C2=A0}
> =C2=A0
> @@ -123,7 +123,6 @@ drm_mock_sched_job_new(struct kunit *test,
> =C2=A0	job->test =3D test;
> =C2=A0
> =C2=A0	init_completion(&job->done);
> -	spin_lock_init(&job->lock);
> =C2=A0	INIT_LIST_HEAD(&job->link);
> =C2=A0	hrtimer_setup(&job->timer, drm_mock_sched_job_signal_timer,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLOCK_MONOTONIC, HRTIMER_MODE_ABS)=
;
> @@ -169,7 +168,7 @@ static struct dma_fence
> *mock_sched_run_job(struct drm_sched_job *sched_job)
> =C2=A0
> =C2=A0	dma_fence_init(&job->hw_fence,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm_mock_sched_hw_fence_ops=
,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &job->lock,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &sched->lock,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched->hw_timeline.context,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic_inc_return(&sched-
> >hw_timeline.next_seqno));
> =C2=A0
> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> index 27caf8285fb7..fbba38137f0c 100644
> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> @@ -106,7 +106,6 @@ struct drm_mock_sched_job {
> =C2=A0	unsigned int		duration_us;
> =C2=A0	ktime_t			finish_at;
> =C2=A0
> -	spinlock_t		lock;
> =C2=A0	struct dma_fence	hw_fence;
> =C2=A0
> =C2=A0	struct kunit		*test;

