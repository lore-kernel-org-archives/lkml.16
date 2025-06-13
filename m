Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228361E50E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820811; cv=none; b=k9lsQ1pQOZijp4Wx55SJUlwCSXT3kSB9o4Ws2BkfqrvgsfaorLye6RUBr3mg3B7FlUMnD925PzXpXFLmZlqoxmUwqXl7UV5u3VgiAohX6PTJ7znUa4AZDtBfJ9e3s4Y0Z3Lb67auKVjd+/dTJz3KQ4uCvOHxI12m/qNJiVceazs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820811; c=relaxed/simple;
	bh=t1e1lQNTWUIkcC/2AHIyOVSY3yCmomUNXLBKTCDtPuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CzDPgWBYjQV0jVGBYxQS1G4UhKuVtZHdeiiFfeySkP0q/wODo9VUB7URVSZths1FfrG+ewa/mSYpEb6mxi5pd6cZUEmSah01odiQblznwhGE+uBR86ZYiZKRNxP68Y8yL2aJTMl5TX1gRljYrg1CT1gnbf5rs43QmwT3l5/+qZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=hHCC4b68; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="hHCC4b68"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32925727810so18275401fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749820807; x=1750425607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0haQSsbw9iLmioXn5py2arPLduqNK00Gi9qiQMGCj/E=;
        b=hHCC4b68Eh/vnaDT8vm4SSW47efCxbHJ5SA1zd96ePqfJFGZTkcPgSShu+XFZahZro
         aKWczmZjK7Aws2Ui27SbO81CuLOtyg3mCNzXWB6lacvKJdhnK0HRBvYGpq+WNPYrO5mb
         w4FDF/Q5x+gPFZxAdkHWpwF98hkGDywx0Ef2ReKCWswqIWGfR6HByqUlgY4qm3rCGHnp
         35vN7ex+wik5LwQKbu9pucK05gBPZ8fKWMBtavrfjMxSF2TadrbsJuWhkknf2m6RD39O
         kOgBdP/dDkmilnfwjcSvHtbFOdPnoBU2VB+s1lLKE28ArgqHeAhW/4nxUW7chwRPTdOe
         2Uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749820807; x=1750425607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0haQSsbw9iLmioXn5py2arPLduqNK00Gi9qiQMGCj/E=;
        b=AZvvetlsq0cfMwHPCeihQDuT9hmtG3MyMn7eZAwaomANh+F49JWFsRhukZLAvkY+4A
         F2p/7wvSzQeJ/+SpD4m5Mi4q383mWnyv3kbbgopKJxcqe2eFSRr/CNSoIEjORm9c67HR
         9EL1fZM9twVXhM1xn6eWImQIAdCWuLEqDaff54DTh+PSDSwStO2gMwQE8CSlO3Fz+w1g
         oO0FGao+/e/Zl1S0CT8XzY+6BNCzon8hnE7XlmkfIhKi+jOlAefpNfoeDVZmULrW0xnw
         KGIUKR2FRtgl36TCWYj8aobORxayKb2IDMpg1s9rIU47JAhHsUJ24aT9AdhuU+7VaaXe
         ItxQ==
X-Gm-Message-State: AOJu0YyK5H9awTr0rwEWEL0pcl6ugaFtFUqanP2yhrq1i1hQnti/I5Sm
	ZulBRkST4ysyhOtAHdP5JEOlwXmC7DujFdhEnKOYSDmT1q1JItzithlitXZq/MIfNe7JTvVpxoG
	UNkfKVNIBTKueUEW7L5Ch/HC+Iv8bRZde57gelS/nRg==
X-Gm-Gg: ASbGncstpXvocV3yLGXeTiYGXtwrsj+5xex+IVRCvRt9hHtKF/p2iX276i3nGkz1lhE
	VfuUMqM7aJZdUA73BhVHY/lrB2HYVS8S10CMAhoqzyoDWv5+mVnLTkSemtHArfQsoDUsYUC+eHO
	8a/gBiyz8tSeWaUVOnoD+tlaOHRXNJS0Kx0dUi+j14oNtz+x/FOY5G3ZrKxENeciZbMwSIMqANQ
	g5+hFood2G2jxU=
X-Google-Smtp-Source: AGHT+IH4Q82FvkgjSudBeU3O9ZUMdQe6/fMd+ri86sEYqNpNQC4+BfDRaZT5nv4QCIoyHLxTZYNosexTC8wugRBv0T8=
X-Received: by 2002:a2e:be03:0:b0:30c:aae:6d4a with SMTP id
 38308e7fff4ca-32b3ebd0058mr8219561fa.26.1749820807141; Fri, 13 Jun 2025
 06:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612133335.788593-1-marco.crivellari@suse.com>
 <20250612133335.788593-2-marco.crivellari@suse.com> <aEwiJIG0TD7P7oYk@localhost.localdomain>
In-Reply-To: <aEwiJIG0TD7P7oYk@localhost.localdomain>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 13 Jun 2025 15:19:56 +0200
X-Gm-Features: AX0GCFtPkK5nFx-9pedgbLw3o3_eZpzCIUnjUALYMxRBlEuFt8nPtSmJ6zdYZGA
Message-ID: <CAAofZF7YSXCTvUJmXNBZM3eSj3z+j7TQPQBwmwYF8v_nKDFHsQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] Workqueue: add system_percpu_wq and system_dfl_wq
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frederic,

I let the wq allocation together with the wq logic changes.
But if it's better to allocate directly here when we add the wq(s), I
will do so.

Thank you.



On Fri, Jun 13, 2025 at 3:05=E2=80=AFPM Frederic Weisbecker <frederic@kerne=
l.org> wrote:
>
> Le Thu, Jun 12, 2025 at 03:33:33PM +0200, Marco Crivellari a =C3=A9crit :
> > Currently if a user enqueue a work item using schedule_delayed_work() t=
he
> > used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> > WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies t=
o
> > schedule_work() that is using system_wq and queue_work(), that makes us=
e
> > again of WORK_CPU_UNBOUND.
> >
> > This lack of consistentcy cannot be addressed without refactoring the A=
PI.
> >
> > system_wq is a per-CPU worqueue, yet nothing in its name tells about th=
at
> > CPU affinity constraint, which is very often not required by users. Mak=
e
> > it clear by adding a system_percpu_wq.
> >
> > system_unbound_wq should be the default workqueue so as not to enforce
> > locality constraints for random work whenever it's not required.
> >
> > Adding system_dfl_wq to encourage its use when unbound work should be u=
sed.
> >
> > Suggested-by: Tejun Heo <tj@kernel.org>
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> > ---
> >  include/linux/workqueue.h | 8 +++++---
> >  kernel/workqueue.c        | 4 ++++
> >  2 files changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> > index 6e30f275da77..502ec4a5e32c 100644
> > --- a/include/linux/workqueue.h
> > +++ b/include/linux/workqueue.h
> > @@ -427,7 +427,7 @@ enum wq_consts {
> >  /*
> >   * System-wide workqueues which are always present.
> >   *
> > - * system_wq is the one used by schedule[_delayed]_work[_on]().
> > + * system_percpu_wq is the one used by schedule[_delayed]_work[_on]().
> >   * Multi-CPU multi-threaded.  There are users which expect relatively
> >   * short queue flush time.  Don't queue works which can run for too
> >   * long.
> > @@ -438,7 +438,7 @@ enum wq_consts {
> >   * system_long_wq is similar to system_wq but may host long running
> >   * works.  Queue flushing might take relatively long.
> >   *
> > - * system_unbound_wq is unbound workqueue.  Workers are not bound to
> > + * system_dfl_wq is unbound workqueue.  Workers are not bound to
> >   * any specific CPU, not concurrency managed, and all queued works are
> >   * executed immediately as long as max_active limit is not reached and
> >   * resources are available.
> > @@ -455,10 +455,12 @@ enum wq_consts {
> >   * system_bh[_highpri]_wq are convenience interface to softirq. BH wor=
k items
> >   * are executed in the queueing CPU's BH context in the queueing order=
.
> >   */
> > -extern struct workqueue_struct *system_wq;
> > +extern struct workqueue_struct *system_wq; /* use system_percpu_wq, th=
is will be removed */
> > +extern struct workqueue_struct *system_percpu_wq;
> >  extern struct workqueue_struct *system_highpri_wq;
> >  extern struct workqueue_struct *system_long_wq;
> >  extern struct workqueue_struct *system_unbound_wq;
> > +extern struct workqueue_struct *system_dfl_wq;
> >  extern struct workqueue_struct *system_freezable_wq;
> >  extern struct workqueue_struct *system_power_efficient_wq;
> >  extern struct workqueue_struct *system_freezable_power_efficient_wq;
> > diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> > index 97f37b5bae66..7a3f53a9841e 100644
> > --- a/kernel/workqueue.c
> > +++ b/kernel/workqueue.c
> > @@ -505,12 +505,16 @@ static struct kthread_worker *pwq_release_worker =
__ro_after_init;
> >
> >  struct workqueue_struct *system_wq __ro_after_init;
> >  EXPORT_SYMBOL(system_wq);
> > +struct workqueue_struct *system_percpu_wq __ro_after_init;
> > +EXPORT_SYMBOL(system_percpu_wq);
> >  struct workqueue_struct *system_highpri_wq __ro_after_init;
> >  EXPORT_SYMBOL_GPL(system_highpri_wq);
> >  struct workqueue_struct *system_long_wq __ro_after_init;
> >  EXPORT_SYMBOL_GPL(system_long_wq);
> >  struct workqueue_struct *system_unbound_wq __ro_after_init;
> >  EXPORT_SYMBOL_GPL(system_unbound_wq);
> > +struct workqueue_struct *system_dfl_wq __ro_after_init;
> > +EXPORT_SYMBOL_GPL(system_dfl_wq);
> >  struct workqueue_struct *system_freezable_wq __ro_after_init;
> >  EXPORT_SYMBOL_GPL(system_freezable_wq);
> >  struct workqueue_struct *system_power_efficient_wq __ro_after_init;
>
> Shouldn't you allocate system_percpu_wq and system_dfl_wq in
> workqueue_init_early() ?
>
> And yes I think we should allocate them and not make them a pointer to
> system_wq and system_unbound_wq, this way you can more easily
> warn deprecated uses of system_wq and system_unbound_wq in the future
> after upcoming merge windows.
>
> Thanks.
>
> > --
> > 2.49.0
> >
>
> --
> Frederic Weisbecker
> SUSE Labs



--

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
