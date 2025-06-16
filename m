Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE7120E31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077466; cv=none; b=VEbia+wk70IebLTdnEJFtAOOH3xC3YMZK9tk0pE5HbqfglLA7Kwt2WIKFMvIBbv82Z72T163ljTMHJwabI3v0yBsOMufiAhgD4+TEpIflooNIdhF55U5yziyWfRaVczFSmosAFRy2jYjG8rjgR1ZtVSPWF2eCRi5pWjx0+L/EEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077466; c=relaxed/simple;
	bh=cqkDN3GUuX2FaPIrSwbqOjePFPNUERNeI8nnFqYPemU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y6SDY1dLjvZeWUJ1PJRYs68I96X00hD/ultGOFjpJpwlaEMzG9DzPQfyfUirj2YIrl7HtQ1/bQwzjDnM80c7aiB52+YY5VuoRg+xZlDpD4TPnALhPuQe36tLFHf2DjGcEKLbxePfa0enbbfFZcE3yGq1NAQX65V/ABgvkoUV7x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IWrnUnYy; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IWrnUnYy"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ade326e366dso809124166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750077462; x=1750682262; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AKXfMgFBpLTv+1KEKqm8RR6erCZ7uyeZC3q8q9iWRPM=;
        b=IWrnUnYyXjr3dq0nUfX+enVBaOrm3J8xz284pHToB+f6UFYVHFyp9pPxOcMeSAGgi0
         nnGeUa9GgvyzfHXMxwHrjnJ2HvgCii7/0wTgPUtym3l9+iiy59rAIxRFvaQLnociqWNY
         +gHTy+IybOqiaZKr6xtGqOGiTyKZWGtSRYnSkQiid6zn54KLgkjaXfHQI/Gu1X4iJx3d
         1PasqWLUKic3LWKMefec3PiqDEWV3+jeSs0BRAPcUihanJOFf9VFHxQelxsu5T1QTVCS
         JutoyOH1KAmSSxaw6O2bZshSgZ7b7Sf40goO1D+qzMzeblkC1JegD/FkM+dwhSoqJMdo
         Ec1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750077462; x=1750682262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKXfMgFBpLTv+1KEKqm8RR6erCZ7uyeZC3q8q9iWRPM=;
        b=AIsZptVSlhaKSuvTluwFKeJsB195Im/yKRgUR+h0cY5C+K43krOb4ETBq3iJtjcgNw
         5+SwpjzyYIDh2NrOx3gUt3MgQ1j+r5SljuT+1scYrMjd5hjR/92GGmtLncfx02JXf9dg
         sRSql62s7bJ31fx70xsVtI3ah4xneKiIrxbQJAVieu/OlBQlD5E1uTjSAfYSaLtMicL2
         C1NJvZRGL/aGAoyH274HzjERGRJzDnHpR7IXYXzozWzy+bfO0KdcIrfWI+niHdSN1Ecn
         qzoQxPxgvhiMQkPdB1oT5pDuvinyYO1eiI/CP3B5wdAvbqsMv2JbI3zvhh+b4d9eES5n
         F+qA==
X-Forwarded-Encrypted: i=1; AJvYcCVUbnNK8A3yKzr96X/7XsH40f3EV6gz9FcIiqtz3sl5/r8stA/mnu1PTFytIqdj3unvJYcY2j1xDQhmUR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgowVPiL4HpfTIYt2RSKqur+C7vAma7JKZFUh2lWzP5FPbG+Mq
	aBndzpkqQcBdH/hy3StHU3ekpTIhaZHM7sscFJBqK7gQX9QxhTOCRYuCi0qLonlD7CMIy82CVgV
	JfxYl8M5e4gDeRlEEV6EQnHHsEPPP8dLvnM57ShQMew==
X-Gm-Gg: ASbGncs5Sg7stXb8y3HqbyLzZ199U2YAcmyjPeibY9dN81U1iu4F8znTbARHh6QaA4y
	vXoBeIi7RsohUVWaVDL1Sg/RYxgD0zPORqcjlPK8G79XQSMvtjZ9R4xkX0k9msjQ/A0STYppap7
	8jaAujHY2klxqfKzEGNNLLPxia8yuXyO0fwRgoJnqTYQHvUhL+MrYNF15YH5a1Mg2HuJgFu9E=
X-Google-Smtp-Source: AGHT+IF4vL1eRRR+V7Fh0uYHlKCVaEmUVmIQOZqeLNTj+BqKo1UBYNYmNL45zdj/TOshi/bBZdLrN7e3F7+0+1KsZqs=
X-Received: by 2002:a17:907:da3:b0:adb:23e0:9290 with SMTP id
 a640c23a62f3a-adfad29758amr916720166b.4.1750077462526; Mon, 16 Jun 2025
 05:37:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613140514.2781138-1-vincent.guittot@linaro.org>
 <20250613140514.2781138-4-vincent.guittot@linaro.org> <aDL3YCahMtyzYFS7MCqCyLoUruq24dC-oYxqdVFYuTN6yOd-qDT-x84Qab63lblcfdAjzof0PY68xNw3s19PXrh9plszZxiavmEjnyBuPGg=@gianis.ca>
In-Reply-To: <aDL3YCahMtyzYFS7MCqCyLoUruq24dC-oYxqdVFYuTN6yOd-qDT-x84Qab63lblcfdAjzof0PY68xNw3s19PXrh9plszZxiavmEjnyBuPGg=@gianis.ca>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 16 Jun 2025 14:37:30 +0200
X-Gm-Features: AX0GCFvVhg_116liKgqU63fMc36ZKNXpZYAkdtkAxQIS1bg3xgVwNd6VhVjPh-M
Message-ID: <CAKfTPtC-EuQ65OzmTp1HeUf8YsdMGLVbf94GRG+aa6B1BD4F5A@mail.gmail.com>
Subject: Re: [PATCH 3/4] sched/fair: Limit run to parity to the min slice of
 enqueued entities
To: dhaval@gianis.ca
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Jun 2025 at 00:53, <dhaval@gianis.ca> wrote:
>
>
>
>
>
>
> On Friday, June 13th, 2025 at 7:16 AM, Vincent Guittot <vincent.guittot@linaro.org> wrote:
>
> >
> >
> > Run to parity ensures that current will get a chance to run its full
> > slice in one go but this can create large latency for entity with shorter
> > slice that has alreasy exausted its slice and wait to run the next one.
>
> "already exhausted"
>
> >
> > Clamp the run to parity duration to the shortest slice of all enqueued
> > entities.
> >
> > Signed-off-by: Vincent Guittot vincent.guittot@linaro.org
> >
> > ---
> > kernel/sched/fair.c | 19 ++++++++++++++-----
> > 1 file changed, 14 insertions(+), 5 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 479b38dc307a..d8345219dfd4 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -917,23 +917,32 @@ struct sched_entity *__pick_first_entity(struct cfs_rq cfs_rq)
> > }
> >
> > /
> > - * HACK, stash a copy of deadline at the point of pick in vlag,
> > - * which isn't used until dequeue.
> > + * HACK, Set the vruntime, up to which the entity can run before picking
> > + * another one, in vlag, which isn't used until dequeue.
> > + * In case of run to parity, we use the shortest slice of the enqueued
> > + * entities.
> > */
>
> I am going to admit - I don't have a good intuitive sense on how this will affect the functionality. Maybe you can help me think of a test case to explicitly write out this assumption in behavior?

Run to parity minimizes the number of context switches to improve
throughput by letting an entity run its full slice before picking
another entity. When all entities have the same and default
sysctl_sched_base_slice, the latter can be assumed to also be the
quantum q (although this is not really true as the entity can be
preempted during its quantum in our case). In such case, we still
comply with the theorem:
        -rmax < lagk (d) < max(rmax ; q); rmax being the max slice
request of the task k

When entities have different slices duration, we will break this rule
which becomes
       -rmax < lagk (d) < max(max of r ; q); 'max of r' being the
maximum slice of all entities

In order to come back to the 1st version, we can't wait for the end of
the slice of the current task but align with shorter slice

When run to parity is disabled, we can face a similar problem because
we don't enforce a resched periodically. In this case (patch 5), we
use the 0.7ms value as the quantum q.

So I would say that checking -rmax < lagk (d) < max(rmax ; q); when a
task is dequeued should be a good test. We might need to use -(rmax +
tick period) < lagk (d) < max(rmax ; q) + tick period; because of the
way we trigger  resched


>
> Dhaval
>
> > static inline void set_protect_slice(struct sched_entity *se)
> > {
> > - se->vlag = se->deadline;
> >
> > + u64 min_slice;
> > +
> > + min_slice = cfs_rq_min_slice(cfs_rq_of(se));
> > +
> > + if (min_slice != se->slice)
> >
> > + se->vlag = min(se->deadline, se->vruntime + calc_delta_fair(min_slice, se));
> >
> > + else
> > + se->vlag = se->deadline;
> >
> > }
> >
> > static inline bool protect_slice(struct sched_entity *se)
> > {
> > - return se->vlag == se->deadline;
> >
> > + return ((s64)(se->vlag - se->vruntime) > 0);
> >
> > }
> >
> > static inline void cancel_protect_slice(struct sched_entity *se)
> > {
> > if (protect_slice(se))
> > - se->vlag = se->deadline + 1;
> >
> > + se->vlag = se->vruntime;
> >
> > }
> >
> > /*
> > --
> > 2.43.0
>
>
