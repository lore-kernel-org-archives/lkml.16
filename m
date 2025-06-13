Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33A654654
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821032; cv=none; b=MzK13H9jN1qVOMrrOxPOKl6NqDAVsXWw5ebxYPzLtm8hKZLtyb6WSmUL6lK/WEAa4GIngrcPJW0muV1B3JnkqDaS9iirQ5+K7MUAfKdE8VfJyXPeO6P3CNj7TFbZJAZ9un8pq+WaZzuD8TDiS26lt2rKHFsPKqRfUghHiqBv2yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821032; c=relaxed/simple;
	bh=9GwavlykpM94jHW4f5zZBsDnslZ1cX7tYFhtrvS6o94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTmx5HaIkutkDEJJltzXeJqnMYwMvRSv1mMT7Rldme4Gj+b7vkqhLDs7yvZykf3D322UDx3FGwKvyOi8NCV9FuYaqeV9yWTEFx6cWpJwY6c0vx9LMpqjfNfsXLKDsoUbSjazxrcDXo7XeT4hNqdGmlA7r/cnWvG5Hi+QAF68Wd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XVU+GMz+; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XVU+GMz+"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32a6f5cb6f9so10080111fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749821026; x=1750425826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZX+vTEoJiqzvv8Nfz11XIKSmMVqjZTXwTuDnsnu36yQ=;
        b=XVU+GMz+TD5BNVcgz0OJ4BmWpOx8pSfZC8Sg63Y2oZcqkBGoXl+unpGLtcgpFpL135
         gQ7Gf4MrnmQOp5me2Trce4NecTIU2IDNZh3BP43581Hu2CH9JZQJJ53hpF+55Z9Yl+Hr
         bWoSa5q9ymfvXIZnVC1UdF7dYUkb+M3lRkePEOr3Naz9J+qmuzl1MO+icuwsGkDyDnym
         UkYfO5AfSvNjOHkTClF9/jJXpdx+OuTQ9+Nec6jnTY+Xx4Pmq15OzT1jvFDNIXCm/SIj
         jDOZ4ETrRKDVXgmRWy2R8g+jZVu+/qWlEPHmIU1DY+lnhx97of3AopD6AwXC7Ga/H8I7
         czaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749821026; x=1750425826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZX+vTEoJiqzvv8Nfz11XIKSmMVqjZTXwTuDnsnu36yQ=;
        b=Ft4NYsUokSIDwDFsPx6ch6h2NNVCvJNDKEFMqRl+XAJj1sVnAifkU6sB1ver+oY7At
         WGkMtjjyyqdVTIpngQ+fd5RIEc3716KyfAPivGCKpF0CaJ4eH6lIw6MEwqHI3/J419J/
         C7StRPHgq4ZtEzsFlS71dyhGpucbqEhgEySqPRoJYQmJuH1LAcuxU8ptDXj11RrleeCV
         7NOI9yt6uj1tXn9nJtjb5dchJsIECzX82OpuKmb+tuQm6J0YGeLcGHRIb9oIdkJVaPhg
         wML5AjdA9kd9FxZPrhdcR3Ft1XbvGZDHjkRjp6XC/5CQ1+BAFYeNImA5pVdi+TEQ6/ce
         aw7Q==
X-Gm-Message-State: AOJu0YwmIi8bc/uOqzNWUWcAKnVPYN+wWsiLWkdpxSQJGpNMWzFkUzLd
	gmiAku8xV3+QESqbE/0HPAsXVjq/NV+Hs9voGQK5oT9Pb5rA8BgT9NPdYdlSpSHrVedq5D3yMfj
	Bd+L7vdJqVLX6+9/BmoFtx0h2ma4HOxy8DrLhFeAjGQ==
X-Gm-Gg: ASbGnct+rO75iQU8SnDwMGW4EWZ1jhjJmQxFmCM7SvV9Hw2pdm/qRyEzALqmzz9gxOg
	khJ01UE4QaHJeLA385Jqn5Z2428Zp3mNqe4IWpZvmrrYeiUpgx+tJS0Rnen7emrJw9gRrXmQbf/
	zb8B/QqTAHlpfssslqdVsT4kQUwwX4oJr2mtCCuORPXMD5hISt8xN3eWXHy7nUR8W8EbnoBEzYV
	mt6
X-Google-Smtp-Source: AGHT+IHNetXgmhXQnt6IKRDaFvwc/+WfkhXwtS/6xiDC31z9cjj6znsCkn5XwEij8ckDeDVVIJ3cHVeRuWu7rNBtL1c=
X-Received: by 2002:a05:651c:b24:b0:32b:4653:2f5b with SMTP id
 38308e7fff4ca-32b465332eamr2447251fa.15.1749821025764; Fri, 13 Jun 2025
 06:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612133335.788593-1-marco.crivellari@suse.com>
 <20250612133335.788593-4-marco.crivellari@suse.com> <aEwj52Fia2Q6-O2Z@localhost.localdomain>
In-Reply-To: <aEwj52Fia2Q6-O2Z@localhost.localdomain>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 13 Jun 2025 15:23:34 +0200
X-Gm-Features: AX0GCFvw9kVKbomJsB9KNJCTn5OzOTlLVPpmQKEKXHA77FM4ulJc1p3UEcRcagM
Message-ID: <CAAofZF4TeyK=Kbmtb=GbMhYGc4XTJh1TdQ5Jr2+tgdOh-rCXhg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] [Doc] Workqueue: add WQ_PERCPU
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you!

> But since the support for this is not there yet, perhaps this note
> should be added later? Ie: if someone omits the WQ_UNBOUND flag currently=
,
> the workqueue will be percpu.

Yes, it makes sense.

I will send the v5 with all the corrections.

Thanks.

On Fri, Jun 13, 2025 at 3:13=E2=80=AFPM Frederic Weisbecker <frederic@kerne=
l.org> wrote:
>
> Le Thu, Jun 12, 2025 at 03:33:35PM +0200, Marco Crivellari a =C3=A9crit :
> > Workqueue documentation upgraded with the description
> > of the new added flag, WQ_PERCPU.
> >
> > Also the WQ_UNBOUND flag documentation has been integrated
> >
> > Suggested-by: Tejun Heo <tj@kernel.org>
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
>
> Thanks, a few spelling nits below:
>
> > ---
> >  Documentation/core-api/workqueue.rst | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-=
api/workqueue.rst
> > index e295835fc116..ae63a648a51b 100644
> > --- a/Documentation/core-api/workqueue.rst
> > +++ b/Documentation/core-api/workqueue.rst
> > @@ -183,6 +183,12 @@ resources, scheduled and executed.
> >    BH work items cannot sleep. All other features such as delayed queue=
ing,
> >    flushing and canceling are supported.
> >
> > +``WQ_PERCPU``
> > +  Work items queued to a per-cpu wq are bound to that specific CPU.
>
> s/that/a
>
> > +  This flag it's the right choice when cpu locality is important.
>
> s/it's/is
>
> > +
> > +  This flag is the complement of ``WQ_UNBOUND``.
> > +
> >  ``WQ_UNBOUND``
> >    Work items queued to an unbound wq are served by the special
> >    worker-pools which host workers which are not bound to any
> > @@ -200,6 +206,10 @@ resources, scheduled and executed.
> >    * Long running CPU intensive workloads which can be better
> >      managed by the system scheduler.
> >
> > +  **Note:** This flag will be removed in future and all the work
>
> in the future
>
> > +  items that dosen't need to be bound to a specific CPU, should not
>
> s/dosen't/don't
>
> > +  use this flags.
>
> flag.
>
> But since the support for this is not there yet, perhaps this note
> should be added later? Ie: if someone omits the WQ_UNBOUND flag currently=
,
> the workqueue will be percpu.
>
> Thanks.
>
> > +
> >  ``WQ_FREEZABLE``
> >    A freezable wq participates in the freeze phase of the system
> >    suspend operations.  Work items on the wq are drained and no
> > --
> > 2.49.0
> >
>
> --
> Frederic Weisbecker
> SUSE Labs



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
