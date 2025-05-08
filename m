Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918D013635C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746702226; cv=none; b=NF1WreHtnTB8THUwRF6s9wHiRaTsQP+lpClsgSN6BPi5k9rdkv+9cDIOjJ8fg2WOq0CpxD+zSqGiMCxNOum2q4ccUs/6TnQ6JsJIETuSiJPyTJBXrGZOtnYcZBkfVMLbNfmd0LeVenI1DX0QzyZByfnUAfA0GG0zRW842SmB4+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746702226; c=relaxed/simple;
	bh=TmLJKj3/Ya3VYGr2VCfab/2uNYKqoXgbWNYnuLLrQ1I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qK0Kgo+d+r7eK2EnlNllkSFlIf4PyaCCECI0PVT0ZvSwJ+iUHP9sOxu/od9QqTzitGVhV+a1SrtOgWjlIL+qcGdQ3YMDbX49fCzWH5k1o/vxyt05EBg2RGRmB8CiKyQDbJt3QzOGqzBL0jQvXH2ipDMHFXE2fExRVzPmfwazpqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KwtsKkP9; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KwtsKkP9"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZtTlC0xVKz9tCf;
	Thu,  8 May 2025 13:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1746702215; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5EXQH6BCiFQKSZOW18WF484owkA/QLDEDighoVoI5Q0=;
	b=KwtsKkP9JVrcD9N5t2Zm4i6iI26NVgoXDSIJtbDlpQNMDeTwFL7lJF+e76UXBeT2V5iZ1+
	lWRpj7iXkv1Aj7dCZSvGXLcNRJ5ISVr+Q7+AeGUfcYLT5aUYaVUQ22ebj57uZmf0e76HKm
	S1q4ORcWUZkuJ2IlJqHVQ8vqACQmMaB6jORjS2Y8X/+yx5d4SVU1RuOc4Vyhn3igKtS47f
	JJwNsbJJ0LRV/FNQFvKrWYpgubqWLYTD2Lf6tHhGRacRHarKK5yfqI744zaIVltJCFzK4J
	gDA/L4ZEvPpgCtcSvjtsH4GapNPdqQJ42O0ygzBcxB4w+BPGul5LYJhb5nFJlg==
Message-ID: <894cf4cdb7e14b2a21dcf87bfeac4776cb695395.camel@mailbox.org>
Subject: Re: [PATCH v2 6/6] drm/sched: Port unit tests to new cleanup design
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 08 May 2025 13:03:29 +0200
In-Reply-To: <20250424095535.26119-8-phasta@kernel.org>
References: <20250424095535.26119-2-phasta@kernel.org>
	 <20250424095535.26119-8-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 8pzanuw3tqj7ojt1ehyhx681kpp7xrro
X-MBO-RS-ID: 987543049f878c8909b

On Thu, 2025-04-24 at 11:55 +0200, Philipp Stanner wrote:
> The unit tests so far took care manually of avoiding memory leaks
> that
> might have occurred when calling drm_sched_fini().
>=20
> The scheduler now takes care by itself of avoiding memory leaks if
> the
> driver provides the callback
> drm_sched_backend_ops.kill_fence_context().
>=20
> Implement that callback for the unit tests. Remove the manual cleanup
> code.

@Tvrtko: On a scale from 1-10, how much do you love this patch? :)

P.

>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 34 +++++++++++=
+-----
> --
> =C2=A01 file changed, 21 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index f999c8859cf7..a72d26ca8262 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -228,10 +228,30 @@ static void mock_sched_free_job(struct
> drm_sched_job *sched_job)
> =C2=A0	/* Mock job itself is freed by the kunit framework. */
> =C2=A0}
> =C2=A0
> +static void mock_sched_fence_context_kill(struct drm_gpu_scheduler
> *gpu_sched)
> +{
> +	struct drm_mock_scheduler *sched =3D
> drm_sched_to_mock_sched(gpu_sched);
> +	struct drm_mock_sched_job *job;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&sched->lock, flags);
> +	list_for_each_entry(job, &sched->job_list, link) {
> +		spin_lock(&job->lock);
> +		if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
> +			dma_fence_set_error(&job->hw_fence, -
> ECANCELED);
> +			dma_fence_signal_locked(&job->hw_fence);
> +		}
> +		complete(&job->done);
> +		spin_unlock(&job->lock);
> +	}
> +	spin_unlock_irqrestore(&sched->lock, flags);
> +}
> +
> =C2=A0static const struct drm_sched_backend_ops drm_mock_scheduler_ops =
=3D {
> =C2=A0	.run_job =3D mock_sched_run_job,
> =C2=A0	.timedout_job =3D mock_sched_timedout_job,
> -	.free_job =3D mock_sched_free_job
> +	.free_job =3D mock_sched_free_job,
> +	.kill_fence_context =3D mock_sched_fence_context_kill,
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -300,18 +320,6 @@ void drm_mock_sched_fini(struct
> drm_mock_scheduler *sched)
> =C2=A0		drm_mock_sched_job_complete(job);
> =C2=A0	spin_unlock_irqrestore(&sched->lock, flags);
> =C2=A0
> -	/*
> -	 * Free completed jobs and jobs not yet processed by the DRM
> scheduler
> -	 * free worker.
> -	 */
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_for_each_entry_safe(job, next, &sched->done_list, link)
> -		list_move_tail(&job->link, &list);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> -
> -	list_for_each_entry_safe(job, next, &list, link)
> -		mock_sched_free_job(&job->base);
> -
> =C2=A0	drm_sched_fini(&sched->base);
> =C2=A0}
> =C2=A0

