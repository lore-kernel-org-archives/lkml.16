Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D17140E34
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751644027; cv=none; b=qx87BR3kkiT5YwftFxNg9d2WwlreLo8093y4PlT/bQqeIHAAQYFULN5WUHtjEN88eM7EcjMXkHdznHa74vHmnQzX8ZH7Lyl8Eml1zLgVpmBIa/i5zzAbCfQBrrh+iEkPFsYa7vq3viGe83O8ItGQzeKmmoaQTnH3af2ooDdUYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751644027; c=relaxed/simple;
	bh=7BVeWyNBRAl/DJV9x9E0MtfFi6R5ZI428sGw3mc1DRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hfo5HV4i4vALhcW2k6ATkp/RB0ngc0BH6Cv3EUKKzedSIdbEq5mAv2rzi6iWYmTU1DXMPXBT83SLEXPJ3t8fFtZuQYZhq/OgSVuoyDVxtdAkDj/pzaQNx17fwLzkVzZXYiOIKxjFkB5h+BXgx77sWZoa4v+SGbciZRu/dDho43E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FSJ7Fu3r; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FSJ7Fu3r"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae3b336e936so207308466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751644024; x=1752248824; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pT/YjID9m49oZG4c5N9r/EyaXbdjU1Li6UaI8Ky8LA8=;
        b=FSJ7Fu3rudRpNJvdWVlIAeRQ1wuSQ1i7uBdigNL1njhOgZUJDbJlqsY9xY0W7RKOCz
         4wlVKVYCxG9L5AZYbCo6QaJcvIQ63BHoBqMZpvwB77RxSyYfvaPJJtZOxdbFWanKRYWF
         R2GvyqkLwI5A8Q6sGr8GkMQVI55KPDsAIqMV70mXVuFaq3FN91znusCLRykqdcO3iLTf
         10Tq74NzNC1fzSd0P7DJDDyNT6FVTNekzr+N3z+vfvOif/MJ71fqlxzS5CrHGd28Jg7Q
         Yz9UsyMn2c4WwvK1yL3GqOYeiyDIwHhX37qf/SGtZKPB3UoUgRxw2ygn0v0RlAWS4XjD
         WcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751644024; x=1752248824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pT/YjID9m49oZG4c5N9r/EyaXbdjU1Li6UaI8Ky8LA8=;
        b=nASxpX0tO+TM9gwhTY0GM/I/jKqLkgc1URyb60FrQQuHt0tBCaHutQdQ3waGnGUVb6
         trodd5lRGCKXx3ga+ca5+cKSPwh6qnN1l5SzAl9lVJusw7uCyD/UGKPY39sdGvNojZFZ
         dxxKBzlUCZAinNbnHvlLU19dqPZTrFtAVi3eI0tpvbqDaoMqUjh4jf06nj8t/0sIeFIr
         vSqQraR0f15wdn1Tud+KFmXCTDeyJiD3CBKLK8n5jSfBmrl364Ar/QvCV9SgqU+axEew
         65iNdiUGyvVaq5fCXvDHFdlKTn2MIxfLZVIG7arccqm0tPiXLRd0dSJgv0BGqpWEBFGZ
         Ie4g==
X-Forwarded-Encrypted: i=1; AJvYcCWKbIKTDqSHpXTaL4vwCKkWc5sFiOjzpunQzkOrhBnE9TtVOm8XNlNiIxJma4JFpCfkMmDuw94wSKzIcs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWLaUp63jfJ+LbDD2VUqK9C1fjJQKGUYoa0cERBUzlwVJ5PZG3
	QLkzsYm6JdDQ/XhxXpeBSNUk+h4KJTWpc9sL+VFUOKueGvn9hCbPoOn3S1uVqW4ew6aTX45YGv/
	QBmYbnGkumoXphutihlj2Fp2F1FEIyu5fbnrVfWOygmG+Nb2p6ymEMRo=
X-Gm-Gg: ASbGncvrsK6GXrrCd6j36LAuAEiwMIdWL4UQNaXXh7/lj0ueVTcHrBbdYYmlkhUKvBz
	8yqXNCgTlK5/sCF2Mow0uwok1IIDV2dWR6wxYGVXJubgH1G2m4Gc8uI+wSOZJg8FWdIPfUgexVu
	gMBaH8FilhgNu6+nk+lxXkb5FlnpLAVXdwkbl/8CFz260Mm4I78RvR//zC4Yl31NcckEE9tL+X
X-Google-Smtp-Source: AGHT+IHGNqzOPPI6cxWWwmaeUpyNSlnEMnHCVV8WPCqeZ2Xf0gJIrDR3+ojS+aKY9n/28UHHsEJ9sSlQwoz1oaa8th8=
X-Received: by 2002:a17:907:86ab:b0:ae0:aed9:eba0 with SMTP id
 a640c23a62f3a-ae3fe790f7dmr275480366b.55.1751644024124; Fri, 04 Jul 2025
 08:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624204942.715206-1-clm@fb.com> <20250626070057.GE1613200@noisy.programming.kicks-ass.net>
 <872c057e-5e2f-4cbf-943a-072b6015fee9@meta.com> <CAKfTPtBE0_77+J-A7vWRKsHCCmuX1jWTbPYWGVPg1MYq_rv8Og@mail.gmail.com>
 <dbbff170-db0a-4955-a024-978bb8dc3016@meta.com> <CAKfTPtBinqRvLk4bvP4bbEZU1OcGV=DBnyxQ2SO9SumdwfV-aA@mail.gmail.com>
In-Reply-To: <CAKfTPtBinqRvLk4bvP4bbEZU1OcGV=DBnyxQ2SO9SumdwfV-aA@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 4 Jul 2025 17:46:52 +0200
X-Gm-Features: Ac12FXxvXhs8wpQTEJavz33i4rIQxDCxdK6w8Rk530fCg5G8SmGDnyw5Pqj5oVU
Message-ID: <CAKfTPtBU44JP0FjhT+X1D+j=iAs0n2AObd5sMYJu+si0SYMftA@mail.gmail.com>
Subject: Re: [PATCH RFC] sched/fair: bump sd->max_newidle_lb_cost when newidle
 balance fails
To: Chris Mason <clm@meta.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Chris Mason <clm@fb.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

 value to

On Fri, 27 Jun 2025 at 15:32, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Thu, 26 Jun 2025 at 16:55, Chris Mason <clm@meta.com> wrote:
> >
> > On 6/26/25 10:26 AM, Vincent Guittot wrote:
> > > On Thu, 26 Jun 2025 at 12:58, Chris Mason <clm@meta.com> wrote:
> >
> > >> Got it, I'll play with that.  Vincent, was there a benchmark I can use
> > >> to see if I've regressed the case you were focused on?
> > >
> > > It's not a public benchmark but I had some unitary tests with tasks
> > > waiting on a busy CPU while other CPUs become idle for a "long" time
> > > (but still less than 500us in average). This is even more true with
> > > frequency scaling which will minimize the idle duration by decreasing
> > > the frequency
> >
> > Ok, I don't think I'll be able to reliably recreate that on my own, can
> > I ask you to rerun against the v2 I sent out?
>
> Yes, I will run some tests

I ran some tests and I haven't seen any differences with or without
this patch so it looks good for me.
I thought that you were bumping the max_newidle_lb_cost to
sysctl_sched_migration_cost when newly idle failed to pull task but in
fact you increase the actual cost which is ok

Acked-by: Vincent Guittot <vincent.guittot@linaro.org>

>
> Vincent
>
> >
> > -chris
