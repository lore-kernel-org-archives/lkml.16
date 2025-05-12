Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8CB179BF
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747036354; cv=none; b=rQCTZg//kN3uBLdVn8GQINRT82ZGtesSas0fFt131755ybxOvV8dXLmFmhqQnlR1J645pTkE5HGXjDTIzpEUTqiJ5RdGSN4K7nZNPVV1MXUKTfRJaax7YT+JgxKqZBE5tPPmIslsK/QqRhK1oPO4v/6AcHMni34cCd7qhzOOf+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747036354; c=relaxed/simple;
	bh=z1uS3IgkRK+fsWfnV12oLxVL8sX9WYzCdRTjVJEdXvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLhyxXoy6tT6bWu4ejdvyce0LfIB3fmknunJVQkd7j4MqXojA3eEje9IAEnQAsuU9Ryn8YP4gHMvBUeW2cgvFBDKWy8hKTQcwaQfxoYn3q7bdER4LUIq0c96C8pPdI9KgGMkz+3VsZ6RixnETX+Q+aIcRDAIybLfPjbOuQ5Fd0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=De9rjKWX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="De9rjKWX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so47065385e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 00:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747036350; x=1747641150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y6dV607UHZMlya+8fS0IcgPOSDSCXxkhRJBLWphOTew=;
        b=De9rjKWXkrmWyHTG2q8r2qRL+bNfcVFXP/Z7WhGXV76bIPKiCVuvOBuOsefSJef1h0
         1awGQax390V7fgiFQSh86fM+2k9Qgqfodnqalx16MSImeKyE1qHjo8emTaOtNNUkBE9+
         Np/zYel/ZnEae52T9rtx3aYxiEl9YbgwINzW3lSclHQZyd6KVEgjAhsmKz1OWbnqzS62
         c6UU58d5R5xxhaHKv5B+x6rqOcOYB6Sa1YYDCyd8JwY6WA8wTMx2d5ub+J+Y39YzdNEt
         aYTQ4D9xMpyLLys3VyC5RZsizsavBdlx2KECBkRjxIi2bL2dXv8qaAJtDnLf/d0ROygq
         HI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747036350; x=1747641150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6dV607UHZMlya+8fS0IcgPOSDSCXxkhRJBLWphOTew=;
        b=D1tDQJ7vW2b26aJz7dBZaQwSkPNJ6qW0Azrn/1vOi9Oxp9kltS5TJV1nlHjt5pgAW7
         9LCIkGo7mtSNanoqAVt78NbA/2XTJ6oEPkd0QpYyD+41SGJznPeGMcbqMxu8tC3HND1N
         y8k9ItdDX6R64kAXG1tGWzd4EPYOltRmLkp8xPeav05/NRNPaKR8QxOe4pJD1JECEolU
         Wr3tu7DP/oT9gMEHrgQTVEIhlnzvaFYs2dCNFSnpJxjhPjfpbBpsnM/Z2v+ScoQXtWLa
         6Nzv87/xHesmOeEb1Xd2j5QzwK0uqKghm1uHRFEl1U8vU+ab2rDq6d64X1gTwDbrKFJK
         3vbg==
X-Forwarded-Encrypted: i=1; AJvYcCVAIo02COMMpYUsRdBvCgq4DQz+sDyu961+9ifAPtDFV3N+7XLbMr1KjecKGGrWq292VQ2aifOY2mpcXbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyxTF9X4eXg1cD0eEEav+tETvJKh34R8j0a5WAq2MVm4ysuN6T
	R5Xx4iRivXkwmO7KvUarvP5JqSf1aino+ZCLpf38cF+dW1NYKpgl4Qyd72zAl70=
X-Gm-Gg: ASbGnctQuhhZNPpklwxKELTYGOpdRzDQ9E+eBxVys2HPk/lsWSy3NikwZLqn6eXEqSp
	217qRuzz5XIlwpk2gOcfadKnAZ14lbKsZmYEV7Sxtnbgp2F4fVln8pCN/uOkMJ+MjjfEx9+7gqP
	K/tZjccqWvFjPXw6t9dzmj95VpKIORF8v+4/0De98ecWCvSpYIKq3QuUy4p8I140PaRFcPr3ssz
	dx+mS4hNsLC8tGkQjo224e9gZLRNjN2Tw/54pi7drM0/8xj94URHp+QjOj7gm+lmSFqPJIm5zY/
	JhajaQ5M4XBtvzGJMyxCuMK4mwtL2fd7NWOSbdJ+qg/bkkwCEl3yi1Jb7lIXAHyQag==
X-Google-Smtp-Source: AGHT+IEcQ2vTdjkVJJfeqWwpeF5uH1q35HnkAVFXZV3V/18SxGeFROcAXX7AmB5sQ2NYa+ldDl7y7Q==
X-Received: by 2002:a05:600c:b93:b0:442:e109:3032 with SMTP id 5b1f17b1804b1-442e10930dbmr53828855e9.24.1747036350182;
        Mon, 12 May 2025 00:52:30 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67ed1c9sm116203075e9.21.2025.05.12.00.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 00:52:29 -0700 (PDT)
Message-ID: <a3b3e8d2-ada8-4b34-91d4-e9dc22b83b46@ursulin.net>
Date: Mon, 12 May 2025 08:52:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix UAF in drm_sched_fence_get_timeline_name()
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250509212936.490048-1-robdclark@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250509212936.490048-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 09/05/2025 22:29, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The fence can outlive the sched, so it is not safe to dereference the
> sched in drm_sched_fence_get_timeline_name()

Funny I've been working in the same problem space:

See 
https://lore.kernel.org/dri-devel/20250509153352.7187-1-tvrtko.ursulin@igalia.com/

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/scheduler/sched_fence.c |  3 ++-
>   include/drm/gpu_scheduler.h             | 11 +++++++++++
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index e971528504a5..4e529c3ba6d4 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -92,7 +92,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>   static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>   {
>   	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> -	return (const char *)fence->sched->name;
> +	return fence->name;
>   }
>   
>   static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
> @@ -226,6 +226,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>   	unsigned seq;
>   
>   	fence->sched = entity->rq->sched;
> +	fence->name  = fence->sched->name;
>   	seq = atomic_inc_return(&entity->fence_seq);
>   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>   		       &fence->lock, entity->fence_context, seq);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 0ae108f6fcaf..d830ffe083f1 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -295,6 +295,9 @@ struct drm_sched_fence {
>           /**
>            * @sched: the scheduler instance to which the job having this struct
>            * belongs to.
> +         *
> +         * Some care must be taken as to where the sched is derefed, as the
> +         * fence can outlive the sched.
>            */
>   	struct drm_gpu_scheduler	*sched;
>           /**
> @@ -305,6 +308,14 @@ struct drm_sched_fence {
>            * @owner: job owner for debugging
>            */
>   	void				*owner;
> +
> +	/**
> +	 * @name: the timeline name
> +	 *
> +	 * This comes from the @sched, but since the fence can outlive the
> +	 * sched, we need to keep our own copy.
> +	 */
> +	const char			*name;

With drivers such as xe, fence->sched can indeed be freed, but so can 
sched->name, so it is not safe to store a copy of it. AFAICT only safe 
way is to simply give up on the real names for signalled fences.

Could you see if my series fixes the issue in your use case? I *think* 
by using the driver/timeline name wrappers I did catch all external 
access points and made them safe.

Regards,

Tvrtko

>   };
>   
>   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);

