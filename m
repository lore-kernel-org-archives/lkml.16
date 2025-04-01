Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29991E47A9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743511584; cv=none; b=XgPB/gLgce4KdK8DfAzUNp2wXeF+J0up2Ktj5SRreH3poR8SWmBdlpDIn+fIr59HDoffXzjwT/C5GoY5qHwV5hMzP+/FWgoIejd/Ikv/2sgNu9/CvlbNFX4/ongUmfADDEBVSV9wcddZZtrWNxB6iz5VBf+UE0jPlO9UIOb1Atc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743511584; c=relaxed/simple;
	bh=6kyb5Ns8Ql3Vo5mGo267gErIo68dUqtHfs2HzhFYq30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjKR6nLzTfR3FrKNOsbHuWn7JpV5F6bISmtLfixups9+L0IwqqTfYDzbhx7ArdHnxymHz0OUiGr6s1AVUE6UF3C7JXfzVQq4hn4066gCN0ghWbuwFXdVkXmjZz8OKsES07aJnchzIPtCEQLWSadxrxAkMTll6PeQn2urhFUUh3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mmM+RY7x; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mmM+RY7x"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6f74b78df93so62552827b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 05:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743511581; x=1744116381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMDDeez6kOoe0VuKaV7cMdRjNY74xD4dUkO4O1Q2miQ=;
        b=mmM+RY7xlMNDRDKLSpwfBnlvU+LDTmbOhqHChM8RYHmriTljiO/hL344osxWqtvIsC
         M2SGwWsigk50ZSc+oOzXEo6Y8tVxv+LjBHpoUUrZ7/6ica5kDXKOUL24zPBRTrybIf6D
         VLoABaw+efeYbIUcA/vHukqd9GVslsM2LULTaQuXQE6fke3XKT/aew2ztNSz6CktU4T1
         qHy86yyHiOovR+BMWH4jL/W59ymF/+cdLWbmIuXtRwI55dAbrnhLISXY9AcVe2ZnCv0L
         4jJOUwN+6gwXBN8ucGX4Ju/0InXRXoe6uXIDPJVgN+Iu7DMUtJvRu9045Xsaw9W42D2K
         sbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743511581; x=1744116381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMDDeez6kOoe0VuKaV7cMdRjNY74xD4dUkO4O1Q2miQ=;
        b=s35BNX9BIxp2w/pjYRs+ud0+nx2B3GZlXY7qdxOVAoQ1MGkvZ5Xc4kAZ9SvdQATGKv
         iswLbQ+iayBODEG9OiAYcTD5nL04YKx9vkRZUJSfih8NEWpuZwL326PARJMfnaP815ao
         5lO1CCIbKpg59zHFnJXV+lnnqiLho1lxi0xrS26KfJIE2nJzZxMxN9y3f9XgA6Ua0G32
         SzQ1pnZegkFb36NorDjHUOfA3LG7GgPd3Y2+Bff9v8wh8iIiB2uol1UKEkhxkg+MSkV0
         Fyup16SOIy2T98o+BOcQcKcTSCYqBzKDCh+R0d5fSsngrAYTucJblWXEhaH1Rrkm9AeW
         LHqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxTXaflIjoPxZ/LZtoQ7UKRyghfmc0+IDz7ZfaH7pS5hDEPu15mOP3LvNpQTjCtUeEbo5YVsa2/p4W44Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Rlg5xneNQ7MURV9z98ARtqIJ2gmgdALRRkJzqv0ujx74yb2y
	FklTx4gVlLvFQB31VZHdsETxIUx1Rv45LScLNP5rU1zCL7kwu3sRbqC+H4/kP3O9nlEX5Mc88wS
	RLgM/l6hjUd3AR9BBV0NMPXZ/4CZThT9DXnmYbA==
X-Gm-Gg: ASbGncuIhcxdK1UKFY6/RJ7PVFGv5/AmjXbDOp23Vmujhi/K9vGV6khTl0pKUrLlLHS
	+R1n7EwIaynNFXkPZyaV3BLIf27z8PxjU618N3ge4URNdKr8SAm40fTabp/ow+D7rWCmr7oyS4J
	0myAUNDPWfmVios+le3g7rS2eazqM=
X-Google-Smtp-Source: AGHT+IGL9OSbja9iYeFzPJ+/gKIFplL+CL1DbY+6y+Uot/089lr6RvlMMypn+5FN141zeahQuPTrIh4o8rhbTIo5V3E=
X-Received: by 2002:a05:690c:20a5:b0:702:627c:94ec with SMTP id
 00721157ae682-702627c9619mr129434977b3.35.1743511581556; Tue, 01 Apr 2025
 05:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
 <Z+Nv8U/4P3taDpUq@perf> <8634f0mall.wl-maz@kernel.org> <Z+TEa8CVAYnbD/Tu@perf>
 <86v7rulw2d.wl-maz@kernel.org>
In-Reply-To: <86v7rulw2d.wl-maz@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 1 Apr 2025 14:45:43 +0200
X-Gm-Features: AQ5f1JrXJtw8P-nNnlXkQzxE9Mof1YPkOE61sbdFVclhwvmQdRUQ4pvlCvXHd8U
Message-ID: <CAPDyKFrxK3Mx055hx+a4SP3CWDpWP+CEHxz+WJfT+RficK0_Ag@mail.gmail.com>
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in GICv3
 ITS driver
To: Marc Zyngier <maz@kernel.org>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Saravana Kannan <saravanak@google.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, hajun.sung@samsung.com, d7271.choe@samsung.com, 
	joonki.min@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Mar 2025 at 09:25, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 27 Mar 2025 03:22:19 +0000,
> Youngmin Nam <youngmin.nam@samsung.com> wrote:
> >
> > [1  <text/plain; utf-8 (8bit)>]
> > On Wed, Mar 26, 2025 at 08:59:02AM +0000, Marc Zyngier wrote:
> > > On Wed, 26 Mar 2025 03:09:37 +0000,
> > > Youngmin Nam <youngmin.nam@samsung.com> wrote:
> > > >
> > > > Hi.
> > > >
> > > > On our SoC, we are using S2IDLE instead of S2R as a system suspend =
mode.
> > > > However, when I try to enable ARM GICv3 ITS driver (drivers/irqchip=
/irq-gic-v3-its.c),
> > > > I noticed that there is no proper way to invoke suspend/resume call=
back,
> > > > because it only uses syscore_ops, which is not called in an s2idle =
scenario.
> > >
> > > This is *by design*.
>
> [...]
>
> > > > How should we handle this situation ?
> > >
> > > By implementing anything related to GIC power-management in your EL3
> > > firmware. Only your firmware knows whether you are going into a state
> > > where the GIC (and the ITS) is going to lose its state (because power
> > > is going to be removed) or if the sleep period is short enough that
> > > you can come back from idle without loss of context.
> > >
> > > Furthermore, there is a lot of things that non-secure cannot do when
> > > it comes to GIC power management (most the controls are secure only),
> > > so it is pretty clear that the kernel is the wrong place for this.
> > >
> > > I'd suggest you look at what TF-A provides, because this is not
> > > exactly a new problem (it has been solved several years ago).
> > >
> > >     M.
> > >
> > > --
> > > Without deviation from the norm, progress is not possible.
> > >
> >
> > Hi Marc,
> >
> > First of all, I=E2=80=99d like to distinguish between the GICv3 driver =
(irq-gic-v3.c)
> > and the ITS driver (irq-gic-v3-its.c).
> >
> > I now understand why the GICv3 driver doesn=E2=80=99t implement suspend=
 and resume functions.
> > However, unlike the GICv3 driver, the ITS driver currently provides
> > suspend and resume functions via syscore_ops in the kernel.
>
> For *suspend*. The real suspend. Not a glorified WFI. And that's only
> for situations where we know for sure that we are going to suspend.
>
> > And AFAIK, LPIs are always treated as non-secure. (Please correct me If=
 I'm wrong).
> >
> > The problem is that syscore_ops is not invoked during the S2IDLE scenar=
io,
> > so we cannot rely on it in that context.
> > We would like to use these suspend/resume functions during S2IDLE as we=
ll.
>
> Again, this is *by design*. There is no semantic difference between
> s2idle and normal idle. They are the same thing. Do you really want to
> save/restore the whole ITS state on each and every call into idle?
> Absolutely not.

I agree that we don't want to save/restore for every call to idle,
that would simply be unnecessary and add latencies.

Instead, I think the save/restore could depend on what idlestate we
enter and whether it's a system-wide state (s2idle/s2ram) or just
regular cpuidle-state.

Today, we are pointing the callbacks for cpuidle and s2idle to the
same functions (at least for PSCI PC mode), but it's easy to change
that *if* we need some differentiation between s2idle and cpuidle.

>
> Only your firmware knows how deep you will be suspended, and how long
> you will be suspended for, and this is the right place for to perform
> save/restore of the ITS state. Not in generic code that runs on every
> arm64 platform on the planet.

Assuming we can make the code for saving/restoring generic (not in FW)
and that we are able to make sure the code is only executed for those
platforms and states that really need it. Do you think there would
there be any other drawback for doing this?

Kind regards
Uffe
