Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BD5610B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747720849; cv=none; b=hzoXPcePDD9XxFJKbmokq48hg7xibYzbSeWRU3gVdlamNZW06aO1GEdXjaL0jqisBRoy0AsKcuUorMhsUcaPOi/GmuavJ/IF/MKnFHXT5+AWrJX4jw4tn4zoo7zhvCrU8tdk5i+PmKyXp0PoBhehB6lXa7UE3TNYww+PtnQEeCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747720849; c=relaxed/simple;
	bh=YNt7GVpMt3rH6IhDifdifaG1wJKxlmQglVMhDCO52Ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKUxCn/gJ8i9Xo2jHg4RhKPeLIjgnO6dRm7tBao7xiDxr8bCBTSCmsJJLWxto+nQt/RYrF1CSYoueQPffOr/f2PE9VnvWeR9VQsy5w16DRQ0r4VpwgmXNLOKlGGyCmBNtpYh7qEwvj0FVofjjZKN5HW/s8zkc0M3oIj+q2/bTzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEnf3/fP; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEnf3/fP"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476977848c4so56671921cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747720847; x=1748325647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZXsny14e42iWJBckI/0/LeNEtvKMq33ZaZVTv73eV8=;
        b=YEnf3/fP3M8ZKDtjcjSGc3N/Vv4T2ytPQW1EYgPC2gfdS6hpFZ+jDKIliLya/qgO31
         L6HHW9btV+yCSNczULMskd+1dOJsZYzQyo9wcRxJXhGbG4jKfN0IriG0ORAruUdeQYCE
         8rFBRoho/qitQ8oUrILqjmWPQEM0tPza148Yv86PUAfDF7vQ8lpvTepbMn/WUF7efH7h
         x/kVoKWhTzafwPDq2+KRNpdSuapGWzZnaZlg1teoqwdp0Qep3vh1GLZnHRyTbeAFmbpZ
         Z8cW9MIKfAt/aTssigzCDFHBJf/+SL3FFT8Yan5wkSoXTFbx4EbysXZ7yv1TQQrbuj5O
         SetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747720847; x=1748325647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZXsny14e42iWJBckI/0/LeNEtvKMq33ZaZVTv73eV8=;
        b=fSmrKVZ7/5vRVdiqY+vxsza9gNE09N7dF4z/MgIeUk17FjE1eju1SV+Ya99tNpF1D6
         QfS21fRJfIyMbpPkxd3jMtYdmKBBRRYEGhGukOxEqIrfuAouYBRVJ9Ftmf5dJUcSkh+8
         v2ABHYMewVBHb5qL2gpKeYBOme3Pxybk/mZKQ86KlJFNc2P0ELGuDxICSEQq5tlMUvwA
         vtijyrTSfVCy8pD0YOcb9YEUZg6UdRE4Kodwolzxe71fI30l+siLOji3WgCha3GImw+W
         uJrB88E2yIw08vDxJowlX3h0FS3NaUd5hlXS9tcqM4YT8r3YU6UA1LfrNlkJ+0zr3oDv
         7GQA==
X-Forwarded-Encrypted: i=1; AJvYcCVqKta3CcnPzPcNLnJEgWQPYLV/FxsHhgB3MzcBgFhYG1tT0MWAYKYEaRfGEIh95OVu0HeQqddoxdi+hdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm3GEgNVMpYcnp9UZho7KtpgbBDl95E1UTeR4CxWLf+DbWL9p3
	w9w6I8kefWONysPZvP2a7dSNtGPMEYos4z8W9rvzZJ7N81sE4uygGZVea+ildJyjMkFqygUjYg5
	NFHPUUNCbFoah3tiFCg33agxC6mSGaCA=
X-Gm-Gg: ASbGncsxCLMhJnR7RooxOfmvvMkZc6vXjaB7GYwgU/NNepWgPHNMK/87Ie56VpLulET
	TRepzINCvXeqcXUuxleUqC2M+J0Yn56mZML18ewRyxITbhCCknJz+yJofm8eU2HkX9eOrRM5IgM
	Z6+rnCA6sCckeS1Um2Fa0N8+ae+zN4LrEjSehmS/xMii7K
X-Google-Smtp-Source: AGHT+IGCa05LbeR70eqTtMtimJ6ArW9/xpgA5aUTRVTU/C3P71ZbtgHeyJGf38a8+ADASAkcSyrUnEsDICDaMPQmy0U=
X-Received: by 2002:a05:622a:98e:b0:494:7bfe:b68d with SMTP id
 d75a77b69052e-494ae3668e0mr249269091cf.2.1747720846907; Mon, 19 May 2025
 23:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303105241.17251-1-xuewen.yan@unisoc.com> <20250303105241.17251-2-xuewen.yan@unisoc.com>
 <CAKfTPtC=QYe4uZuK87G3GG6zi+f3r214hUnK9=K1mNv59FsYFA@mail.gmail.com>
In-Reply-To: <CAKfTPtC=QYe4uZuK87G3GG6zi+f3r214hUnK9=K1mNv59FsYFA@mail.gmail.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Tue, 20 May 2025 14:00:35 +0800
X-Gm-Features: AX0GCFudeKqKImbCHgQE-Tt4n-S6MKnt-iONIyBFvqcpGqdP4gESU8lG0UT6G-w
Message-ID: <CAB8ipk94m_aD8-Pd2hTrkqhDJkq-scnO3zq4wsY4LSnnL-YD0A@mail.gmail.com>
Subject: Re: [RFC PATCH V2 1/3] sched/fair: Fixup-wake_up_sync-vs-DELAYED_DEQUEUE
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Xuewen Yan <xuewen.yan@unisoc.com>, peterz@infradead.org, mingo@redhat.com, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org, ke.wang@unisoc.com, di.shen@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincent,

Sorry to ask, but may I know if this patch can be merged into the mainline?

Thanks!

On Wed, Mar 19, 2025 at 5:35=E2=80=AFPM Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Mon, 3 Mar 2025 at 11:56, Xuewen Yan <xuewen.yan@unisoc.com> wrote:
> >
> > Delayed dequeued feature keeps a sleeping task enqueued until its
> > lag has elapsed. As a result, it stays also visible in rq->nr_running.
> > So when in wake_affine_idle(), we should use the real running-tasks
> > in rq to check whether we should place the wake-up task to
> > current cpu.
> > On the other hand, add a helper function to return the nr-delayed.
> >
> > Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
> > Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
>
> Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
>
> > ---
> > V2:
> > - add helper function (Vincent)
> > ---
> >  kernel/sched/fair.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 1c0ef435a7aa..a354f29c4f6f 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -7181,6 +7181,11 @@ static bool dequeue_task_fair(struct rq *rq, str=
uct task_struct *p, int flags)
> >         return true;
> >  }
> >
> > +static inline unsigned int cfs_h_nr_delayed(struct rq *rq)
> > +{
> > +       return (rq->cfs.h_nr_queued - rq->cfs.h_nr_runnable);
> > +}
> > +
> >  #ifdef CONFIG_SMP
> >
> >  /* Working cpumask for: sched_balance_rq(), sched_balance_newidle(). *=
/
> > @@ -7342,8 +7347,12 @@ wake_affine_idle(int this_cpu, int prev_cpu, int=
 sync)
> >         if (available_idle_cpu(this_cpu) && cpus_share_cache(this_cpu, =
prev_cpu))
> >                 return available_idle_cpu(prev_cpu) ? prev_cpu : this_c=
pu;
> >
> > -       if (sync && cpu_rq(this_cpu)->nr_running =3D=3D 1)
> > -               return this_cpu;
> > +       if (sync) {
> > +               struct rq *rq =3D cpu_rq(this_cpu);
> > +
> > +               if ((rq->nr_running - cfs_h_nr_delayed(rq)) =3D=3D 1)
> > +                       return this_cpu;
> > +       }
> >
> >         if (available_idle_cpu(prev_cpu))
> >                 return prev_cpu;
> > --
> > 2.25.1
> >
