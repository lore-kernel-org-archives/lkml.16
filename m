Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1729F1DFDA5
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061835; cv=none; b=bISC7/vxX3BFMnBti2wOgw1BG4pK/HOXVB40/8LrqmO3tJlICtKylVTqy7UG0wp5RtLm6TSBFhwjTTFrMYlu9Rq4nLSsubm6C4cxsp63FrguAYDdAAh3e/YWlnSkpn2JuVne8aYv5KUcIsLeyd/7mDtMxd2cggbId74OF2iXLfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061835; c=relaxed/simple;
	bh=MS6Gvrp2+G8Olr0XE6RJzVl7cnXssBrg4DXgSoeVR4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tlLKNvdb9+DALs2EgPmoGlECFrt4tyFyW5RCSiQNbdy+Xr1yt0kXoE9k6Y0PJt7TelBRcdjn5JxNSEXNJnuoreAyFzGmagxo9poUfAZAuKAYC0xObz7Da0T/ujLO6NBT709bgpDXwrQsslrwiDBkKwFP/Vi6Lol7Dlv5rg8LyAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Is4al4ho; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Is4al4ho"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3da73998419so15484485ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747061833; x=1747666633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CM/pTzzheLYdPVFGIT6hfnPFRugrCCGuXn8kzkW3cc=;
        b=Is4al4hokZpT0BL+fuA4z2RQl6/4BnyXd3MQtQ52ov7ISygYDH+HFca+8Kw2k7+oo7
         J6QKFTNbgj24aN9MoqrvFXlAUhNM326smlPhDaHAX0GTSlenclwjx7gu4+jWbB8vjlvv
         lkTxXSImbAGGp0UiU7PEZ6XZlyj+vGDRiGr+AkwcammUvwIhL9GM6+/9MQuGDRtYjDZM
         V/B+LXlmNi41o0RTei9owzaE7MHVKe6SklqOPPFWYce2zjvv3moDuAQyMxcbqvSuNIhd
         mAof3OvUdcoWPZyzm+XlPcS5hP5Lv4Hw4hwJ88pmAMarlZSfiYmpBqCRfnV/CG/zsPkJ
         3ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061833; x=1747666633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CM/pTzzheLYdPVFGIT6hfnPFRugrCCGuXn8kzkW3cc=;
        b=R886K/wgtOiiNy8fgygRnWkaKZaqEfovTi/3nrUk9Q5tCgi1kYsBWlTaLCWzQTS05I
         80NfroLV7Juy6Fdiiu6Lc5HrF/9R/G0jSaT8/QPmQ0ZD7uxW+4oSxcvYW2Isu+gw6E1Y
         G7nv+ZhGIVpiTIHYYpI54ue8ylWRoHxKuvsnbSUyE5CR9AOK76klMPHKqtp4b9To4bUl
         6/UP9rlWg+sroeG9l2+k6acdDBksrZH739G7V9CUJAILGACsdiAPr93jOWduh81fB7CY
         nzNHg5BD4Srytb0kTr9PgzU784ZvdyIkBtaZr5YA4DiDQ8d9o6oB6xMVYwPGyRBXsevQ
         thkg==
X-Forwarded-Encrypted: i=1; AJvYcCXPOr3L7gOnJMWgyxr35a0snv+IjwDkj5H8oXBoHeRGxQ2hQWvkyZgq/k7oSuSOEU95QoSqkKldSrlH4gE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1F8Q+gakEBxGzExpHUBM60v7DzwRO6pre1nHnklxjyFJENJVA
	xxJ8Q+TLClYoSDftUK5h+jJb8GMflOYu5X9PYqZbhz3CO2eqm9Llcrj6CpCH37hNDM3g6WQBbtC
	zI1KqzJS5d+auyGIaW0jgATwcHKg=
X-Gm-Gg: ASbGncu8UrbgrxBiZrouFJsbPHpWLTtxXC57X7L9tLyZpt1/7wrSvwF2qsUwYq1ju+4
	vWvy8DuRRwCJPqd427t5q17OdP2PEltHYBPfA0cPM0zE8X0PaydOZ9CM+CgJ37Nx+pNA1bnDbfK
	RJPg7n2snYssU/L4yi9VCpxdsZ4AZgNYOw+epWiATnruUm3DFgyEO1RAIGpssRB+Y2ms3LcsIcp
	Q==
X-Google-Smtp-Source: AGHT+IFcYrKXRaJZ0ODsRE3pns6yi3SayGrvR5yPXNbXJIajTTYC9WnKJWrvwG6tIF8zooAutxZSNN6rpze9CqKgADI=
X-Received: by 2002:a05:6e02:1845:b0:3d9:34c8:54ce with SMTP id
 e9e14a558f8ab-3da7e2103c5mr168593675ab.18.1747061832916; Mon, 12 May 2025
 07:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509212936.490048-1-robdclark@gmail.com> <aCGpLxb4WQMPXjmZ@pollux>
In-Reply-To: <aCGpLxb4WQMPXjmZ@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 12 May 2025 07:57:00 -0700
X-Gm-Features: AX0GCFvY70VyppyNcKIsqevbp767XzogcVBanUlEETQE9zisSjdkhLh5-UBxH6g
Message-ID: <CAF6AEGtSr0Y7nk2Jrk+yzoxnW8WGs5S9iOVtvxfQ1hcS9e0AtA@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Fix UAF in drm_sched_fence_get_timeline_name()
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 12:54=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Fri, May 09, 2025 at 02:29:36PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The fence can outlive the sched, so it is not safe to dereference the
> > sched in drm_sched_fence_get_timeline_name()
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/scheduler/sched_fence.c |  3 ++-
> >  include/drm/gpu_scheduler.h             | 11 +++++++++++
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/=
scheduler/sched_fence.c
> > index e971528504a5..4e529c3ba6d4 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -92,7 +92,7 @@ static const char *drm_sched_fence_get_driver_name(st=
ruct dma_fence *fence)
> >  static const char *drm_sched_fence_get_timeline_name(struct dma_fence =
*f)
> >  {
> >       struct drm_sched_fence *fence =3D to_drm_sched_fence(f);
> > -     return (const char *)fence->sched->name;
> > +     return fence->name;
> >  }
> >
> >  static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
> > @@ -226,6 +226,7 @@ void drm_sched_fence_init(struct drm_sched_fence *f=
ence,
> >       unsigned seq;
> >
> >       fence->sched =3D entity->rq->sched;
> > +     fence->name  =3D fence->sched->name;
>
> This requires sched->name to be a string in the .(ro)data section of the =
binary,
> or a string that the driver only ever frees after all fences of this sche=
duler
> have been freed.
>
> Are we sure that those rules are documented and honored by existing drive=
rs?
>
> Otherwise, we might just fix one bug and create a more subtle one instead=
. :(

Agreed, but at least it is _less_ bad, and the alternative of
refcnting the sched seemed pretty heavy handed :-(

I'll take a look at Tvrtko's series to see if that could help.

I suppose the alternative is to null out the sched ptr when the fence
is signalled, and then return some generic name (ie "signalled" or
something like that)?

BR,
-R

>
> >       seq =3D atomic_inc_return(&entity->fence_seq);
> >       dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
> >                      &fence->lock, entity->fence_context, seq);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 0ae108f6fcaf..d830ffe083f1 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -295,6 +295,9 @@ struct drm_sched_fence {
> >          /**
> >           * @sched: the scheduler instance to which the job having this=
 struct
> >           * belongs to.
> > +         *
> > +         * Some care must be taken as to where the sched is derefed, a=
s the
> > +         * fence can outlive the sched.
> >           */
> >       struct drm_gpu_scheduler        *sched;
> >          /**
> > @@ -305,6 +308,14 @@ struct drm_sched_fence {
> >           * @owner: job owner for debugging
> >           */
> >       void                            *owner;
> > +
> > +     /**
> > +      * @name: the timeline name
> > +      *
> > +      * This comes from the @sched, but since the fence can outlive th=
e
> > +      * sched, we need to keep our own copy.
>
> It's our own copy of the pointer, not our own copy of the string. I think=
 we
> should be clear about that.
>
> > +      */
> > +     const char                      *name;
> >  };
