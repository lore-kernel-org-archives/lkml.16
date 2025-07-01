Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E53D26B2AA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377089; cv=none; b=bD2h/Vx2SPNWe5eg1wYCkVXwsgWWWgA/Cem+Z2lBveWrtLJYJB7E1oC/BTGPK+3uRlaEUFi15b/8Yu6idA1SjNP/yE2bgcT8iFP/PazYCds5stofcniQVK8oqhd6BhnTRR4ZIV/1zw3ibBVSDOIt/Iz7QkWkeMMdMJ5kutOKbqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377089; c=relaxed/simple;
	bh=9NAeOVpHEVGsz5ByZGwQ4Wt24BCLMkjun6lBaE5vbSU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aflkip8oNthJpcYP7K5e2O0+8Ki3War005gMhXQhOrMqMNKdpycYip8cYB3DqbLwm/w7Tan5bisf+eYBVk76nT8TH22cfglN0iX7VLfywOvpnRad4dfCo0T8qikOx+HNQsVfJylmwdE/NOHeZNKlk80oG8bbBgiJvb8OyzA1R0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=D3AZFk3D; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="D3AZFk3D"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bWkcW3HwMz9sdP;
	Tue,  1 Jul 2025 15:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751377083; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fG49IWnqi5Qsh1rud8FkyB6EdwDzoRE72QFqV2fypms=;
	b=D3AZFk3DVTfhK+H1H2QGWIOeLwgkwC9uMyQOlY/FuZjuHgmyZ21Qfl1aaFq78zji03a0kj
	EN4R2CDw5UETHXl2O+UZhuZDHHaugwhF93+rFeMZisSmwE7MBRLeszahZ/+StspN88PfFD
	D9kIbpuGie/c807dDjyd4c+XCuj9JSV2AnKlnk3Sdsz6jjTy/551ie9HuTH7g/QTEc1GeC
	ic2zVfo7hqzsbX49rZuT+RFXj7AsYRQH5dLuYqZhc0V4bcMyQ5L1EyfkNsY/ChapOZcfwq
	YK8wpj2t/VXLaUdavwXeHANGp6xdU3h4kXnK22OaLWBZTbIfYvOK0dPkiAzYag==
Message-ID: <4d41dfaf0b48166c41a476f128d59785ddaeeb5f.camel@mailbox.org>
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
Date: Tue, 01 Jul 2025 15:37:56 +0200
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
X-MBO-RS-ID: d448f7998a01351db5f
X-MBO-RS-META: 89rnnf8ig8imhwy68phfjgr1x37xts95

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

Pushed that one to drm-misc-next

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

