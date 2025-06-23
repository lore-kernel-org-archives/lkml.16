Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BEA23278D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669224; cv=none; b=bhWbGQCL77Giv3B5M4Gc57QRSF9+lGAbyWWeOxBp+cY6bylIpKVryIT0pnHbzI53p2aQTWA4yfyCjzQruPT2e7+ED67iIV2JTMUpuxai4PgtVnwsu+Bhy8PwuBKXyFu5vmVJP7ZTQw5sLh2NcXRlcrGRT7YfxMn7GWQ+g10L/+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669224; c=relaxed/simple;
	bh=7Co64V9r6PMRUvirB7RVpke81XvzYVPNFR//Uv1Gj2w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GTx5I2vBxeUOp7pTfLaj2CD4+/p1yit6iUCYxy9+8WN+D7gPi3GCKeC//1SC+/JjS0X+kTdV6Qp6I3AZRnqq32xOq873pAechpBtXCs4NtA7CqKjGeioYW3aC9WJq+dgHJEZYpb8JHRP8Hx/2NMCy5FJB3gz3acMT+6cRViGuM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mLdfDnLL; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mLdfDnLL"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bQhqj5n5kz9t7s;
	Mon, 23 Jun 2025 11:00:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750669217; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2pdTGf4aOzFco3CbqX1+pZ1sCp9cJ0yHF3Wx+oJKZXQ=;
	b=mLdfDnLL73cvJaE6Um9HnlMA3YXVvAxj2M0tX3Pd1OjYnjwmKQtgyD7VURwFGS4nFXTlzI
	LYQatyOEjNxGvNGhohvO9cuSpMNKadpUQbBWBwdymY1CtMpkPdGCR8YGuGvzNdUZh41hdX
	yP6GbsruwBLgCMioRUKlJmEMPNhz7hmZdffOKDLUn+b5cd+R5puU0ReDb309cvmDfxcwCK
	wGyMe2kWc7lxmXuti3jFDdJF5EdxUHKK+lrC70d48j7JEkOcSMV70m0Pw4kIjGrRKOu+ID
	hwfdIG+I0ku52jB0QH/3kIfti5vF54QBDjIiIskg6p/LUMaUuX6Z880etOX8Sg==
Message-ID: <79ba97ca2c04b7707b9641fbb89715873c11c979.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched/tests: Make timedout_job callback a better
 role model
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Jun 2025 11:00:11 +0200
In-Reply-To: <20250605134154.191764-2-phasta@kernel.org>
References: <20250605134154.191764-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: kqcq4mi3woc19r9dpy6d75jr4cgnzcfh
X-MBO-RS-ID: 5688e913798ba5321d3

On Thu, 2025-06-05 at 15:41 +0200, Philipp Stanner wrote:
> Since the drm_mock_scheduler does not have real users in userspace,
> nor
> does it have real hardware or firmware rings, it's not necessary to
> signal timedout fences nor free jobs - from a functional standpoint.
>=20
> The unit tests, however, serve as a reference implementation and a
> first
> example for new scheduler users. Therefore, they should approximate
> the
> canonical usage as much as possible.
>=20
> Make sure timed out hardware fences get signaled with the appropriate
> error code.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Any further objections with me merging this?

P.


> ---
> =C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 26
> ++++++++++++++++++-
> =C2=A01 file changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index 7f947ab9d322..49d067fecd67 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -200,12 +200,36 @@ static struct dma_fence
> *mock_sched_run_job(struct drm_sched_job *sched_job)
> =C2=A0	return &job->hw_fence;
> =C2=A0}
> =C2=A0
> +/*
> + * Normally, drivers would take appropriate measures in this
> callback, such as
> + * killing the entity the faulty job is associated with, resetting
> the hardware
> + * and / or resubmitting non-faulty jobs.
> + *
> + * For the mock scheduler, there are no hardware rings to be
> resetted nor jobs
> + * to be resubmitted. Thus, this function merely ensures that
> + *=C2=A0=C2=A0 a) timedout fences get signaled properly and removed from=
 the
> pending list
> + *=C2=A0=C2=A0 b) the mock scheduler framework gets informed about the t=
imeout
> via a flag
> + *=C2=A0=C2=A0 c) The drm_sched_job, not longer needed, gets freed
> + */
> =C2=A0static enum drm_gpu_sched_stat
> =C2=A0mock_sched_timedout_job(struct drm_sched_job *sched_job)
> =C2=A0{
> +	struct drm_mock_scheduler *sched =3D
> drm_sched_to_mock_sched(sched_job->sched);
> =C2=A0	struct drm_mock_sched_job *job =3D
> drm_sched_job_to_mock_job(sched_job);
> +	unsigned long flags;
> =C2=A0
> -	job->flags |=3D DRM_MOCK_SCHED_JOB_TIMEDOUT;
> +	spin_lock_irqsave(&sched->lock, flags);
> +	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
> +		list_del(&job->link);
> +		job->flags |=3D DRM_MOCK_SCHED_JOB_TIMEDOUT;
> +		dma_fence_set_error(&job->hw_fence, -ETIMEDOUT);
> +		dma_fence_signal_locked(&job->hw_fence);
> +	}
> +	spin_unlock_irqrestore(&sched->lock, flags);
> +
> +	dma_fence_put(&job->hw_fence);
> +	drm_sched_job_cleanup(sched_job);
> +	/* Mock job itself is freed by the kunit framework. */
> =C2=A0
> =C2=A0	return DRM_GPU_SCHED_STAT_NOMINAL;
> =C2=A0}

