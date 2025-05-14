Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA4F202990
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747227025; cv=none; b=bQ7gjrdXVmwLrempGzbGDJVSCzjuxT+IshQIG+Qy2ABx77txuTEHUubiL9MznrR3xpaFGo6rgCY5kXOJQdDJCt7N3y4hDCafNgYeszEkpNi19KJ8RtLuPJEst+d9RrD468h71RSW3w+gXUSbV2eTgTM1TNhrTvfpzAaPoc1iVbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747227025; c=relaxed/simple;
	bh=SlrT51OPG87Wq9nkHtTFAhq4dzCLTlYPcoJ0hfRPkhU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LPyim89OXqhIQ5OEDmYMsliRXdv6eEfOWIIcEPpnu6f/LrDdeYS/ygZIOW7UM8RnEm7Kpa3bzLR5bVH2cTpjlQLGSHnnmm+nnQkkImV13NCMaly0/NVSfks17qYY01At9rvmbX+kJb0SvUA2GtGC4t+b8sV5Bss6HIIgR3AmcFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=O8Vw10cb; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="O8Vw10cb"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZyCqV1vnxz9tYZ;
	Wed, 14 May 2025 14:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1747227014; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nlKh+0ijam3nCwhu9fJcC9cBwZeP43xTZB9GHxwpAWQ=;
	b=O8Vw10cbuaUq8yNfc1gIWbc372m21pzL/iexcgtwUbrLlHkhue6ho4HqgSiZswrtxCrBuF
	Az3R86tMvk2nYJ63XzFgfNlDz/28zNaVFpl/jKvZCEQH3KDESRfXsjwd87zJr037LHkWhY
	lP8LWvK5RvbwFFIWYNBg7xonLYUwC33OC9A5df6qUfB/QX49JYu3li6r6GYR0SgoPRT/HX
	XEUjpSn8mcs7P3Gx05Y5YdzC6jj9HdyXu45y2pt+egoyDxm5ptJpl3tiqbHRLvboatSVHf
	LWPKIW+Ga73drMHXgg+NKxM5BPqppmZyysUgKbBdFbQ4p4V7lMWUaa3kTu7jGQ==
Message-ID: <1929a77847b9ee7a2f4cb652ee6326fbe417625d.camel@mailbox.org>
Subject: Re: [PATCH v9 08/10] drm: get rid of drm_sched_job::id
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>,  David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,  Danilo
 Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
	 <ckoenig.leichtzumerken@gmail.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 14 May 2025 14:50:09 +0200
In-Reply-To: <20250424083834.15518-9-pierre-eric.pelloux-prayer@amd.com>
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
	 <20250424083834.15518-9-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: cd461b57c8791af4e28
X-MBO-RS-META: rocdc9sxx4pkpjjrhzorktz33gu3ny43

On Thu, 2025-04-24 at 10:38 +0200, Pierre-Eric Pelloux-Prayer wrote:
> Its only purpose was for trace events, but jobs can already be
> uniquely identified using their fence.
>=20
> The downside of using the fence is that it's only available
> after 'drm_sched_job_arm' was called which is true for all trace
> events that used job.id so they can safely switch to using it.

nit: in the title you use double colon :: as a namespace separator. In
the kernel docu style only . (as here above) or -> are used.

Commit title should be consistent with that.

Other than that, nice clean up.

P.

>=20
> Suggested-by: Tvrtko Ursulin <tursulin@igalia.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer
> <pierre-eric.pelloux-prayer@amd.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 18 ++++++----------
> --
> =C2=A0.../gpu/drm/scheduler/gpu_scheduler_trace.h=C2=A0=C2=A0=C2=A0 | 18 =
++++++----------
> --
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 3 ---
> =C2=A04 files changed, 12 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index 11dd2e0f7979..4fd810cb5387 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -167,7 +167,6 @@ TRACE_EVENT(amdgpu_cs_ioctl,
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_PROTO(struct amdgpu_job *job),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_ARGS(job),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> -			=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, sched_job_id)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __string(timeline,
> AMDGPU_JOB_GET_TIMELINE_NAME(job))
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(unsigned int, context)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(unsigned int, seqno)
> @@ -177,15 +176,14 @@ TRACE_EVENT(amdgpu_cs_ioctl,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> -			=C2=A0=C2=A0 __entry->sched_job_id =3D job->base.id;
> =C2=A0			=C2=A0=C2=A0 __assign_str(timeline);
> =C2=A0			=C2=A0=C2=A0 __entry->context =3D job->base.s_fence-
> >finished.context;
> =C2=A0			=C2=A0=C2=A0 __entry->seqno =3D job->base.s_fence-
> >finished.seqno;
> =C2=A0			=C2=A0=C2=A0 __assign_str(ring);
> =C2=A0			=C2=A0=C2=A0 __entry->num_ibs =3D job->num_ibs;
> =C2=A0			=C2=A0=C2=A0 ),
> -	=C2=A0=C2=A0=C2=A0 TP_printk("sched_job=3D%llu, timeline=3D%s, context=
=3D%u,
> seqno=3D%u, ring_name=3D%s, num_ibs=3D%u",
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->sched_job_id, __get_str(timeli=
ne),
> __entry->context,
> +	=C2=A0=C2=A0=C2=A0 TP_printk("timeline=3D%s, context=3D%u, seqno=3D%u,
> ring_name=3D%s, num_ibs=3D%u",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __get_str(timeline), __entry->context,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->seqno, __get_str(ring), _=
_entry-
> >num_ibs)
> =C2=A0);
> =C2=A0
> @@ -193,7 +191,6 @@ TRACE_EVENT(amdgpu_sched_run_job,
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_PROTO(struct amdgpu_job *job),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_ARGS(job),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> -			=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, sched_job_id)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __string(timeline,
> AMDGPU_JOB_GET_TIMELINE_NAME(job))
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(unsigned int, context)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(unsigned int, seqno)
> @@ -202,15 +199,14 @@ TRACE_EVENT(amdgpu_sched_run_job,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> -			=C2=A0=C2=A0 __entry->sched_job_id =3D job->base.id;
> =C2=A0			=C2=A0=C2=A0 __assign_str(timeline);
> =C2=A0			=C2=A0=C2=A0 __entry->context =3D job->base.s_fence-
> >finished.context;
> =C2=A0			=C2=A0=C2=A0 __entry->seqno =3D job->base.s_fence-
> >finished.seqno;
> =C2=A0			=C2=A0=C2=A0 __assign_str(ring);
> =C2=A0			=C2=A0=C2=A0 __entry->num_ibs =3D job->num_ibs;
> =C2=A0			=C2=A0=C2=A0 ),
> -	=C2=A0=C2=A0=C2=A0 TP_printk("sched_job=3D%llu, timeline=3D%s, context=
=3D%u,
> seqno=3D%u, ring_name=3D%s, num_ibs=3D%u",
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->sched_job_id, __get_str(timeli=
ne),
> __entry->context,
> +	=C2=A0=C2=A0=C2=A0 TP_printk("timeline=3D%s, context=3D%u, seqno=3D%u,
> ring_name=3D%s, num_ibs=3D%u",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __get_str(timeline), __entry->context,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->seqno, __get_str(ring), _=
_entry-
> >num_ibs)
> =C2=A0);
> =C2=A0
> @@ -551,7 +547,6 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_ARGS(sched_job, fence),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __string(ring, sched_job->base.sched-
> >name)
> -			=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, id)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(struct dma_fence *, fence)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, ctx)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(unsigned, seqno)
> @@ -559,13 +554,12 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
> =C2=A0
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> =C2=A0			=C2=A0=C2=A0 __assign_str(ring);
> -			=C2=A0=C2=A0 __entry->id =3D sched_job->base.id;
> =C2=A0			=C2=A0=C2=A0 __entry->fence =3D fence;
> =C2=A0			=C2=A0=C2=A0 __entry->ctx =3D fence->context;
> =C2=A0			=C2=A0=C2=A0 __entry->seqno =3D fence->seqno;
> =C2=A0			=C2=A0=C2=A0 ),
> -	=C2=A0=C2=A0=C2=A0 TP_printk("job ring=3D%s, id=3D%llu, need pipe sync =
to
> fence=3D%p, context=3D%llu, seq=3D%u",
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __get_str(ring), __entry->id,
> +	=C2=A0=C2=A0=C2=A0 TP_printk("job ring=3D%s need pipe sync to fence=3D%=
p,
> context=3D%llu, seq=3D%u",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __get_str(ring),
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence, __entry->ctx,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->seqno)
> =C2=A0);
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 4ce53e493fef..781b20349389 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -36,7 +36,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_PROTO(struct drm_sched_job *sched_job, struc=
t
> drm_sched_entity *entity),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_ARGS(sched_job, entity),
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> -			=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, id)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __string(name, sched_job->sched->name)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u32, job_count)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(int, hw_job_count)
> @@ -47,7 +46,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> -			=C2=A0=C2=A0 __entry->id =3D sched_job->id;
> =C2=A0			=C2=A0=C2=A0 __assign_str(name);
> =C2=A0			=C2=A0=C2=A0 __entry->job_count =3D
> spsc_queue_count(&entity->job_queue);
> =C2=A0			=C2=A0=C2=A0 __entry->hw_job_count =3D atomic_read(
> @@ -57,8 +55,8 @@ DECLARE_EVENT_CLASS(drm_sched_job,
> =C2=A0			=C2=A0=C2=A0 __entry->fence_seqno =3D sched_job-
> >s_fence->finished.seqno;
> =C2=A0			=C2=A0=C2=A0 __entry->client_id =3D sched_job->s_fence-
> >drm_client_id;
> =C2=A0			=C2=A0=C2=A0 ),
> -	=C2=A0=C2=A0=C2=A0 TP_printk("dev=3D%s, id=3D%llu, fence=3D%llu:%llu, r=
ing=3D%s,
> job count:%u, hw job count:%d, client_id:%llu",
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __get_str(dev), __entry->id,
> +	=C2=A0=C2=A0=C2=A0 TP_printk("dev=3D%s, fence=3D%llu:%llu, ring=3D%s, j=
ob
> count:%u, hw job count:%d, client_id:%llu",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __get_str(dev),
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence_context, __entry->f=
ence_seqno,
> __get_str(name),
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->job_count, __entry->hw_jo=
b_count,
> __entry->client_id)
> =C2=A0);
> @@ -95,7 +93,6 @@ TRACE_EVENT(drm_sched_job_add_dep,
> =C2=A0	TP_STRUCT__entry(
> =C2=A0		=C2=A0=C2=A0=C2=A0 __field(u64, fence_context)
> =C2=A0		=C2=A0=C2=A0=C2=A0 __field(u64, fence_seqno)
> -		=C2=A0=C2=A0=C2=A0 __field(u64, id)
> =C2=A0		=C2=A0=C2=A0=C2=A0 __field(u64, ctx)
> =C2=A0		=C2=A0=C2=A0=C2=A0 __field(u64, seqno)
> =C2=A0		=C2=A0=C2=A0=C2=A0 ),
> @@ -103,12 +100,11 @@ TRACE_EVENT(drm_sched_job_add_dep,
> =C2=A0	TP_fast_assign(
> =C2=A0		=C2=A0=C2=A0=C2=A0 __entry->fence_context =3D sched_job->s_fence-
> >finished.context;
> =C2=A0		=C2=A0=C2=A0=C2=A0 __entry->fence_seqno =3D sched_job->s_fence-
> >finished.seqno;
> -		=C2=A0=C2=A0=C2=A0 __entry->id =3D sched_job->id;
> =C2=A0		=C2=A0=C2=A0=C2=A0 __entry->ctx =3D fence->context;
> =C2=A0		=C2=A0=C2=A0=C2=A0 __entry->seqno =3D fence->seqno;
> =C2=A0		=C2=A0=C2=A0=C2=A0 ),
> -	TP_printk("fence=3D%llu:%llu, id=3D%llu depends on
> fence=3D%llu:%llu",
> -		=C2=A0 __entry->fence_context, __entry->fence_seqno,
> __entry->id,
> +	TP_printk("fence=3D%llu:%llu depends on fence=3D%llu:%llu",
> +		=C2=A0 __entry->fence_context, __entry->fence_seqno,
> =C2=A0		=C2=A0 __entry->ctx, __entry->seqno)
> =C2=A0);
> =C2=A0
> @@ -118,7 +114,6 @@ TRACE_EVENT(drm_sched_job_unschedulable,
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_STRUCT__entry(
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, fence_context)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, fence_seqno)
> -			=C2=A0=C2=A0=C2=A0=C2=A0 __field(uint64_t, id)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, ctx)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, seqno)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ),
> @@ -126,12 +121,11 @@ TRACE_EVENT(drm_sched_job_unschedulable,
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> =C2=A0			=C2=A0=C2=A0 __entry->fence_context =3D sched_job-
> >s_fence->finished.context;
> =C2=A0			=C2=A0=C2=A0 __entry->fence_seqno =3D sched_job-
> >s_fence->finished.seqno;
> -			=C2=A0=C2=A0 __entry->id =3D sched_job->id;
> =C2=A0			=C2=A0=C2=A0 __entry->ctx =3D fence->context;
> =C2=A0			=C2=A0=C2=A0 __entry->seqno =3D fence->seqno;
> =C2=A0			=C2=A0=C2=A0 ),
> -	=C2=A0=C2=A0=C2=A0 TP_printk("fence=3D%llu:%llu, id=3D%llu depends on
> unsignalled fence=3D%llu:%llu",
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence_context, __entry->fence_=
seqno,
> __entry->id,
> +	=C2=A0=C2=A0=C2=A0 TP_printk("fence=3D%llu:%llu depends on unsignalled
> fence=3D%llu:%llu",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence_context, __entry->fence_=
seqno,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->ctx, __entry->seqno)
> =C2=A0);
> =C2=A0
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 195b5f891068..dafda1803c7c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -852,7 +852,6 @@ void drm_sched_job_arm(struct drm_sched_job *job)
> =C2=A0
> =C2=A0	job->sched =3D sched;
> =C2=A0	job->s_priority =3D entity->priority;
> -	job->id =3D atomic64_inc_return(&sched->job_id_count);
> =C2=A0
> =C2=A0	drm_sched_fence_init(job->s_fence, job->entity);
> =C2=A0}
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index 6fe3b4c0cffb..48190fdf661a 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -326,7 +326,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct
> dma_fence *f);
> =C2=A0 * @finish_cb: the callback for the finished fence.
> =C2=A0 * @credits: the number of credits this job contributes to the
> scheduler
> =C2=A0 * @work: Helper to reschedule job kill to different context.
> - * @id: a unique id assigned to each job scheduled on the scheduler.
> =C2=A0 * @karma: increment on every hang caused by this job. If this
> exceeds the hang
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 limit of the sch=
eduler then the job is marked guilty and
> will not
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 be scheduled fur=
ther.
> @@ -339,8 +338,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct
> dma_fence *f);
> =C2=A0 * to schedule the job.
> =C2=A0 */
> =C2=A0struct drm_sched_job {
> -	u64				id;
> -
> =C2=A0	/**
> =C2=A0	 * @submit_ts:
> =C2=A0	 *

