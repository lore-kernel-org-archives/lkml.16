Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B028C21C173
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750275978; cv=none; b=NmfiXNwFi18etX8DRLJ6IYwvmXJDC0Und+Q8eWpiiNNzqtfV3SgFyF9cwxqNBfOVQqrJsioTHFdXfnJKgLPyrP7eVSssAXOCs6SLNwvVylvs3yDOqc9dhZk4zV5THoO/Ti23zpLkofhki9CgajBv/jJ0F9GQkYwTcUQHHIzBB3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750275978; c=relaxed/simple;
	bh=w3uLYJ3NIkqr5/RFk46ODwQrvXE+YWSkbBK6hI3irA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vui+q6Lvt2Gi2KKt6OxC6aCl6NoIhxX6FCfeSUKCT1uFds1Cv8Yj4ip0QbwgjOWfCKnCN4Mk2eMQLs23dHTTR/xQx1VCfd9Ge5ZMLPsYbe2Tcl6+pFJewTAjf9Tw73aDBUZNZu52oGqtkMfspdBF/d1iktReLoyfOkA3fQszIng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MdaUMCsn; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MdaUMCsn"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54e98f73850so6883917e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750275975; x=1750880775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWvHiMHTgOAPIc8uIv9IBhWsaldOSguvhvdROMsWe0g=;
        b=MdaUMCsnSbK7hKr6KtbP76+brYpU3PuhyIHiADb2l26iQ4uBT1k5hxx+3T4J7tgTIi
         5YkODD/yviXV03UHx7wZmC3h0VUFDxxi81yf2/vwpxyuKn7O9BBBXFZmbUC3RlOLi9eP
         B/Xoqsi3bEAjjsVyhqwrIeBpDsRa0SXWkRq7o9XzVjjkQX1GF6Sh8Is51Dp/xRXXkc2+
         zNHe9Frzg/UDAcwCK51e49NEBpeKCoXWaPk7Hke8rTvJgVI2TGSEsV3h8M81leJX6Mpc
         hqi7qaU7KLPmnCI1M+83vhEisV9+eEuXFPPSmRgmvgOSDQ3ovv0cDFtDkottVfHPn/Fd
         cLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750275975; x=1750880775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWvHiMHTgOAPIc8uIv9IBhWsaldOSguvhvdROMsWe0g=;
        b=dlWNQcqO91AXDe2s3dssZG0mbvFm/AACMiBfTi66fwgBbMT6K23GIaH9VEkfAuUqFe
         eVrrh5HEDrM/EPVNXMEsgS1atXA8MzyM3NJ2PaR24VrrhVcX8y7FoBA4PFTQzev7JCU2
         tQewPhzKlvHs/1QLGmoQNgSd5fTPL+8t/GHKwfD23W+NzeB9282XdqlqGo04iArnjgiZ
         3foqhm/uqUNbtxyqe8LJ+knV1cf1Rx2APDLcmOIcQ/bSc665Dc+FAUwAyYyav5h6bDS1
         TUR8NNprfE6ZjgtFw3tdZZJ4RXFyUoWnoAiMcmDoTh6kMeQ8J6gRH3JlBE05dNjqDdrK
         9cuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9SY5UxvzmUikcCKYpyY+1d7x/heaawJA8CoqxcVaDwPLemUiUKlsWfG1VrmQK82xdVs/ZozoMtclvnzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkQtbv2co/aH/BDgk9emXadAMPFsJC1qJqxwVB1OSg+Ge5Yvnb
	p1mo2HxXJBvjlvyy8Pu4u5TAay3fFLvi8wnmkmcuNfsUsvYPONhsFwjhHXRQiy41faOz775FITz
	dtey5mwD9QHkX6bIv0UeouPot60/s6VFj3MBQnfE=
X-Gm-Gg: ASbGnctwNCurMEJ+UL/MlnEyvjcaW3cGpa9uJWC+hHppnsAIxMXdCibZhwQt3CBij5U
	EQDzbZHYhhiO0sYj7clX6ewbgBSZhIcFCCYUfAY/qnN6KOZrp9ObrgLwW2pLfOHK25Qqg9lHule
	1PjLSRO1hCWX6xq5+2Q7wwSATu+FmGfOmiHHr208kFnttyxU4YvRCyjOWY+ADThIg832Mz7UTb
X-Google-Smtp-Source: AGHT+IHPdx+3fxpJ0DR6n/XRBFuiyzE1w1ppJxiNw05htrhFVe3cOLpbgxBnZwtM5kwSo/F27oMBBGKVd1F/n0eZfpg=
X-Received: by 2002:a05:6512:2314:b0:553:a60d:6898 with SMTP id
 2adb3069b0e04-553b6f2bc6emr4879979e87.45.1750275974437; Wed, 18 Jun 2025
 12:46:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
 <CANDhNCrUtLCU86hNk4qyfbqn9eXsmbzgzJCxYmXGRCko0r=VbQ@mail.gmail.com> <bbb9a1f3b796e8d7bd0010bf0f4862d67368516a.camel@mediatek.com>
In-Reply-To: <bbb9a1f3b796e8d7bd0010bf0f4862d67368516a.camel@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 18 Jun 2025 12:46:03 -0700
X-Gm-Features: AX0GCFuASm5Kk-lAqXK-5L46ROAuwfALSQP_c8yuQf0EFiqFxlNrc_DV2E-CP5M
Message-ID: <CANDhNCoT0WDZ4A-OAN5=qu1wuvOdM5F=1skQsS0gnGTZsntinA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] sched/deadline: Fix dl_server runtime calculation formula
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 8:41=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
> Thanks for cleaner code suggestion, how about this?
>
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index f68a158d01e9..3ccffdf4dec6 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1505,7 +1505,7 @@ static void update_curr_dl_se(struct rq *rq,
> struct sched_dl_entity *dl_se, s64
>                 return;
>
>         scaled_delta_exec =3D delta_exec;
> -       if (!dl_se->dl_server)
> +       if (!dl_server(dl_se))
>                 scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se,
> delta_exec);
>
>         dl_se->runtime -=3D scaled_delta_exec;

This bit above looks good to me.

> @@ -1614,12 +1614,13 @@ static void update_curr_dl_se(struct rq *rq,
> struct sched_dl_entity *dl_se, s64
>  void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
>  {
>         s64 delta_exec, scaled_delta_exec;
> +       struct sched_dl_entity *dl_se =3D &rq->fair_server;
>
> -       if (!rq->fair_server.dl_defer)
> +       if (!dl_se->dl_defer)
>                 return;
>
>         /* no need to discount more */
> -       if (rq->fair_server.runtime < 0)
> +       if (dl_se->runtime < 0)
>                 return;
>
>         delta_exec =3D rq_clock_task(rq) - p->se.exec_start;
> @@ -1627,14 +1628,14 @@ void dl_server_update_idle_time(struct rq *rq,
> struct task_struct *p)
>                 return;
>
>         scaled_delta_exec =3D delta_exec;
> -       if (!rq->fair_server.dl_server)
> -               scaled_delta_exec =3D dl_scaled_delta_exec(rq, &rq-
> >fair_server, delta_exec);
> +       if (!dl_server(dl_se))
> +               scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se,
> delta_exec);
>
> -       rq->fair_server.runtime -=3D scaled_delta_exec;
> +       dl_se->runtime -=3D scaled_delta_exec;
>
> -       if (rq->fair_server.runtime < 0) {
> -               rq->fair_server.dl_defer_running =3D 0;
> -               rq->fair_server.runtime =3D 0;
> +       if (dl_se->runtime < 0) {
> +               dl_se->dl_defer_running =3D 0;
> +               dl_se->runtime =3D 0;
>         }

Apologies if I'm confused, or my feedback added confusion, but I'm not
sure I see this chunk as a readability improvement, right off.

The indirection of rq->fair_server to a stack local dl_se makes it
less obvious what is being acted upon (might be confused for the dl_se
of the task ptr passed in).
Further, the dl_server() check is confusing as I think we're only
considering dl_servers here (the existing fair_server and potentially
future servers added), right?

I think your original logic for this function of just dropping the
scaled_delta_exec for the rq->fair_server.runtime addition makes the
most sense.

When we have additional dl_servers to handle here, I think we can
refactor/abstract out this logic as makes most sense when they arrive.


>         p->se.exec_start =3D rq_clock_task(rq);
>
> If it's ok, should I split it into two separate patches
> 1.Fix dl_server runtime calculation formula
> 2.cleaner code patch
>
> or just submit it as a single patch?

Others can correct me, but I think just a single fix makes sense.


> > I'm a little confused on the conditional here. Is
> > fair_server.dl_server ever not true (after the first call to
> > dl_server_start())?
> >
> For now, it's true.
>
> But based on our previous discussion,
> use the dl_server flag to identify and handle a 'fixed time' type of
> isolation.
> This approach makes it easier to extend and allows multiple servers to
> configure it as needed.

So from my read of the previous thread, it sounded like the
dl_server() check in update_curr_dl_se() is good for now, as there's
only the fair_server, but when other servers arrive we may need to
have a configurable bit on the server to determine if we scale or not.
For dl_server_update_idle_time(), I think each future dl_server will
need to be handled individually (and the code likely refactored to do
that cleanly), but I think its premature to try to handle that now, so
I'd just keep the original simpliciation for that patch.

thanks!
-john
