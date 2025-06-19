Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9043242D6B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336079; cv=none; b=hL/9F0vFqUMDAcg7kNLwaR54HTEnIOtG78Qd4nXBZ65DCIAqeVPEAZkN5taQAfDrX0f8rsc4Fdr4EdKK5/lmSeMytu7ZPtd3JqgZ0MCeckojWKI9kKqswOQLets2xuI8xhDLa7Q1Lw7xBwYML6vn2C31kh4rgX1nXIP8jMsQHFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336079; c=relaxed/simple;
	bh=cbzMsUsPFjH/2rMGqKgP6XO19JAdYjUSM9v2SbRrwWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hxQZJuas9uw+AkzUj61jFh+Z+5WVp5Gxtfe9a41urPd0HnHnolx/MlMEefUz0+NrnGbuZ78ccpcfo43AMUzpEfSU9QbpMfpfG5esw4Cr6c8jmJSo9Lvua27r8glB+RD54a7JJA7wuf+vDTt5SGidN41AJOE/qjRTQxnD9bxhL08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HwPBn7fP; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HwPBn7fP"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-addda47ebeaso146126166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750336075; x=1750940875; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j+UEKtwiWU0wE/iIQJV3CPan/FwOAD8YESQu8bhnYbM=;
        b=HwPBn7fP94CsRG+4WRfAl4lPfOzyZXHrPzSYPEO6PM1AZz08iKDJVkhyJv0reDvlrl
         3/5PR+EOx4uG26Xz2qVDaHWG31EyGLNxVkxEW0ytaVefNxrRoxpciwufDH+YO93a1nO6
         O/gcNHqkOiVtz1RhlyBjmXapKd/tiA0l5iQTNKEoIxZyBzhNX6ijopwaUwgULQlzNBdy
         6iAe5Y0X1sgEUA1bz5jF7dX42I3wUqbEvZg5M8EiEVUE5S+ErOQBtnLqWWGCKSHOlMES
         AsMz0bJmeLzLlr3R0i0K2JTM/pG90NGB53bNmXAMmnaq+jHzUpKFTJN4+KDzIPvpKp6H
         Fq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750336075; x=1750940875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+UEKtwiWU0wE/iIQJV3CPan/FwOAD8YESQu8bhnYbM=;
        b=CscokRvxER/s4nmHlCud8wZ0gd5CLWghADLXeBLGu1Y4kGuGDgmDnagi1lJAamnOSx
         hfbozT+hequ7pG43cUetc9LWk37ZVB2mCWAtR6SY3gpXeVZ9cpAwSe831CAzNkMCQI+H
         MKXGFnVy6DFiJf1Uv+ngDakEc6BSlQPtagYUlYSZRHWRkoYAEbO66lx2eiehuhDzwKPN
         gZfjnLblAwR5ovz4wKvQctEnuwj374yvB/TJp3G0qrFax+xrDKDZccrjuiYFPrKPUEne
         iay7mL3rXeIcciYdjcDTl/CAoLnU/iLtZM2JGYPbVpOCned+gpJNWsDWe8dAQf6LTqSv
         kn4g==
X-Forwarded-Encrypted: i=1; AJvYcCW9jbpYbG18oj3+6agI3eABMPjgwD/7tQpM68Q+N7R6xA9l8dcEfnMVt2tKjHo4Def3iPXgNyk8vr8xfx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrkbvUXdVnNUUv91mm9w4WH8+R0Vgg5Rc8PpPj8UR87/vM6qJh
	J3Nb4iIC4eU/g5o9FCoYPqeatOSCQVtYyvh+VLW2ugH2cgYeQq8nq7H+Ka9fCy9Kn1uiFaMIt12
	q7Fu8Wd0jGuiBv6dyzeunE0nBvY4lAcbcj4iqUfAI+A==
X-Gm-Gg: ASbGnctb0uXnPfhRN4rKknNi4U4guwvb33fs95UWWf6lDZKqNdBbL/fOpFOJewT91xf
	Tk31e4tzEcB9QiIzA7+UcgibjpqtL+QJLjEubFuPr51oSbJvW+zFOdPxBUkvLK/qPxzTqBHbazS
	kpiRpxtPEMximuqy9bV/52h14rtj84aL9FF2XJZgjcOtZNeqz5unQPF2ABUjPTxGRPnnSKbTbf
X-Google-Smtp-Source: AGHT+IFX34/Kwk5yduxJPNyWVorPRiJ7/biEZ6yJE3vlnHjBZXcHGtAnWeiGum/vgh3RHhi1P0nCa8mVUh0YocQh7b4=
X-Received: by 2002:a17:907:7ea8:b0:ad8:9257:5717 with SMTP id
 a640c23a62f3a-adfad35602fmr2061559366b.13.1750336074804; Thu, 19 Jun 2025
 05:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613140514.2781138-1-vincent.guittot@linaro.org>
 <20250617092208.GQ1613376@noisy.programming.kicks-ass.net> <CAKfTPtA-2YjQ-9jgrAZPT6v0R5X04Q5PoZ6Pa0TzAZji3=jiyg@mail.gmail.com>
In-Reply-To: <CAKfTPtA-2YjQ-9jgrAZPT6v0R5X04Q5PoZ6Pa0TzAZji3=jiyg@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 19 Jun 2025 14:27:43 +0200
X-Gm-Features: AX0GCFtAPcH56Hof2PKQCiWc6onS2PCkIPD9lnQxLSv43vfSvmJv3KOKo8AJLOw
Message-ID: <CAKfTPtCRBMYue3smo-iXEXSzeFGYSJs5mp50zwQZLRvfL-szVg@mail.gmail.com>
Subject: Re: [PATCH 0/4] sched/fair: Manage lag and run to parity with
 different slices
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Jun 2025 at 09:03, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Tue, 17 Jun 2025 at 11:22, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Fri, Jun 13, 2025 at 04:05:10PM +0200, Vincent Guittot wrote:
> > > Vincent Guittot (3):
> > >   sched/fair: Use protect_slice() instead of direct comparison
> > >   sched/fair: Limit run to parity to the min slice of enqueued entities
> > >   sched/fair: Improve NO_RUN_TO_PARITY
> >
> > Ah. I wrote these here patches and then totally forgot about them :/.
> > They take a different approach.
> >
> > The approach I took was to move decision to stick with curr after pick,
> > instead of before it. That way we can evaluate the tree at the time of
> > preemption.
>
> Let me have a look at your patches

I have looked and tested your patches but they don't solve the lag and
run to parity issues not sur what he's going wrong. Also, my patchset
take into account the NO_RUN_TO_PARITY case by adding a notion of
quantum execution time which was missing until now
Regarding the "fix delayed requeue", I already get an update of
current before requeueing a delayed task. Do you have a use case in
mind ?

>
> >
> >
