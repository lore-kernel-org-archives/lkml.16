Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A56B2356D2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185407; cv=none; b=KR2ozO0P2WwpT48rC21ZqWmeh3GrIMiZh88uShR3HJmC/flzuV+T3g4jg11lD4JiceNIAzRd4GCBiEwWAWIPhSG4FE5kasz7OoTJ95GHA9wjKWzCMKhufdb9bJuxkt0uKxql9tO16qASoiBPXRC6z5Uv1bGyAxnTVjQrMNDN0R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185407; c=relaxed/simple;
	bh=mXMHY+fJnoLEikIun/k7D5iGAUFPH6cHPuR6PDB7keU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ws8LpB0e/MlkbA8KlHqqVjchYZ5sHRdXxKeEIMMNc6IhqJ7/x6LcLrP8u32LXzshz9ukr2VPYO+G/mmsVcX/JsWpWrngVKkw+gfHxhJyTSthd3vRMgHLWpN0D5dMxLgGzo40hcYMo3b3lSTJB7lS9kDIxNfQDp5UGrzONfAnJNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oapt9Cf9; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oapt9Cf9"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZXZyr3PWGz9tf4;
	Wed,  9 Apr 2025 09:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1744185396; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VrljKVwSZ3MDHWdjjqcf++qCVK+JgGOxLMFKjWgB/zo=;
	b=oapt9Cf9L6EnX8weOTARB+NMcj0KVOxfRVOviWznCXtjDGcqCy4U5SXnprJr768lMpxE7v
	ZZhUfi1b797DWqfb6I5ZggGPpIXF+KC3jGYcJz8MqZV1OirsjjQPukp6dU5py+q7ORYRAs
	bmy0ZFYg/v5q8mMZtQKwVkUe/xjFUPmQybijeooiReYkJUzIdi/81CbBbZo2B0+12QYaW5
	esIEkcnwlTIVC6b2dTn9QTl8zJ6kUkKizxTjM7gVJwJ7DFwACkPn7gWjjWUbGBL2VFXLbN
	nCu/a4+PUvyY5O7suS8w2HWnm1RTiSb6+WB9orD4d+1ijW+KXD0dfVnvqoaTFw==
Message-ID: <7103bc5d3212aa5068fbc6a39a53fae04b36e467.camel@mailbox.org>
Subject: Re: [PATCH v8 06/10] drm/sched: add the drm_client_id to the
 drm_sched_run/exec_job events
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,  Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 09 Apr 2025 09:56:30 +0200
In-Reply-To: <20250320095818.40622-7-pierre-eric.pelloux-prayer@amd.com>
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
	 <20250320095818.40622-7-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: d1eek3cyjytudogmii34r667zdqck51i
X-MBO-RS-ID: f8f0491b7b8e6f89c84

On Thu, 2025-03-20 at 10:58 +0100, Pierre-Eric Pelloux-Prayer wrote:
> For processes with multiple drm_file instances, the drm_client_id is
> the only way to map jobs back to their unique owner.
>=20
> It's even more useful if drm client_name is set, because now a tool
> can map jobs to the client name instead of only having access to
> the process name.
>=20
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer

Acked-by: Philipp Stanner <phasta@kernel.org>

> <pierre-eric.pelloux-prayer@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 5d9992ad47d3..38cdd659a286 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -43,6 +43,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __string(dev, dev_name(sched_job-
> >sched->dev))
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, fence_context)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, fence_seqno)
> +			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, client_id)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> @@ -54,11 +55,12 @@ DECLARE_EVENT_CLASS(drm_sched_job,
> =C2=A0			=C2=A0=C2=A0 __assign_str(dev);
> =C2=A0			=C2=A0=C2=A0 __entry->fence_context =3D sched_job-
> >s_fence->finished.context;
> =C2=A0			=C2=A0=C2=A0 __entry->fence_seqno =3D sched_job-
> >s_fence->finished.seqno;
> +			=C2=A0=C2=A0 __entry->client_id =3D sched_job->s_fence-
> >drm_client_id;
> =C2=A0			=C2=A0=C2=A0 ),
> -	=C2=A0=C2=A0=C2=A0 TP_printk("dev=3D%s, id=3D%llu, fence=3D%llu:%llu, r=
ing=3D%s,
> job count:%u, hw job count:%d",
> +	=C2=A0=C2=A0=C2=A0 TP_printk("dev=3D%s, id=3D%llu, fence=3D%llu:%llu, r=
ing=3D%s,
> job count:%u, hw job count:%d, client_id:%llu",
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __get_str(dev), __entry->id,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence_context, __entry->f=
ence_seqno,
> __get_str(name),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->job_count, __entry->hw_job_cou=
nt)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->job_count, __entry->hw_job_cou=
nt,
> __entry->client_id)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(drm_sched_job, drm_sched_job,

