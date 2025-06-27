Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CC326281
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750992544; cv=none; b=DG+s09RwEXUz8nK1XNhDD5BYd2CoW+tzoZHWo/EMKCURu12uf3mb/bNodZcoiI+IRmYRC5nAetcQNz8sIJnMT9xgojH8Grp9kgLj1tkroELUv1RMYuj7fIchv3EaL4OBHaDNvNa5QuUdjmzh98+x8QwljNZizNkjF0vM0xoZrmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750992544; c=relaxed/simple;
	bh=ycn4+QMNwehBVE4IOzl8I9T3C8WXF6gND67WoF4bUjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RL+A1nczP0/lK3SAVXtJQ6u9q4tAuIZd8gfIquwSKyUW708J+u1RnYPSUADszbPMZHoTAV9G+2VG1bbhEccksI/SzBcYvcJ3ed7LHEy5JfvGYDZTsrZIA5wUvQk891gG3wtOYb6yRf0UfNIZOrrJJWdbkNjoTGf8YUqt2+oE9Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=obNLqC3G; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="obNLqC3G"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b82f3767so1742559e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750992540; x=1751597340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIyz0TyYX+Z3NqBUdZDf3ZSHxoRX7/bXEgMDfSI548Y=;
        b=obNLqC3GKmu7eY4GCNo4K3kXQhOKx0ABJ1AWrFCwypWPGmL2Usm5rbKKLHO3wyb2Mo
         THdcsMxp4zeQU78t5PP/nzI8xSh1DdE1cwTcTJi6OJM82G1TtlH2imadGq6EnJEEfA32
         cFWOU/Bsah4NiaeUnBFIWF8PN0p9FJyXBPOEQrDIXtc5fwg20ieBKzIpwgdvSzLVRXDX
         I7qCGSOlqdo4zS1PMU7qzKjL//Z88AjYhKma/n7hdcUiM+/moFodwinKW9aqNXKW2yJQ
         0//tayBetYwQA60xbyZhg21xsWQ8iphDjL6dEnetM0XWbNjcM+72DtFLSpf2YNXnljCH
         5qLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750992540; x=1751597340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIyz0TyYX+Z3NqBUdZDf3ZSHxoRX7/bXEgMDfSI548Y=;
        b=u/xvwWNXjFeTFUHWI3pfg55kSks3Zx26x9gUM9Pe4RXqQP/lU+FtY8juFN7WfMw7cE
         31QCcRnvaeShEvTbuYH85JQWoF3UA8YdOJT3zYQYj3gBufG7xi28tOpUGdEeiwVr3P82
         li+jJvkz2APKUogNQiQn/5jnC4RBu351GPy+IQErl7VB0Gmy0kGTw7Tj0HwjyeoDsRbl
         SmdHult46zX1h3zfO2Gg6rMIyNLjoGI+/FqWKlY0rL+rZKGEhKpDgL0DDft2QQVsL9Rn
         /qK8Ha5T+kImiL9jhofxTvqE6oxYcs9NhYCNhePCuuRvi1osqvKqPxwHyEaePZjrRH9j
         skyA==
X-Forwarded-Encrypted: i=1; AJvYcCVaZzoP9P7HYaG3KTaapvLO84HJNb64J6ETjoYOQWcIJduVs6naf4/QGUcl4zunW6TeEw3NRvnDBfHY+p8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaUm7Joiu8MJCNaWs4c2ioKbDJCJuXe56bhrTPF6a0T30qJcbU
	gyK1CSP29DJgG2gl7yDmCi23hPZ0+PbIYxCh+9TQaQSAs+PxBcs7J8bbHm97WHdOyHnOPIIiz0Y
	NxH1B1N6apMzhgZOIB61WKPX0yjr/l7K4gCnaFsE=
X-Gm-Gg: ASbGncvcf644xfQQLNK/Un00SeFdi3hFnBpqXAVE7bF5aUgf6eXy/SZduiJVitfO8ET
	MxukyusOQSYBoW9qm2RhU0DjPhQwQc2c2uE47ZgEzHEfIj4OSmZp7MU23eh5paBo44+cRBQz4W9
	UpaVQln7l06WImXEMGLY1nDyjO7RY0oTVBlJWR2h1wV+lMkkCbjP7SSG8LJ8Fqrj2RAx5/h/Ab
X-Google-Smtp-Source: AGHT+IEzF/swD5xaOdJR7lMJjb1yXBvdw4JiGquGN0u5dPeY58LAcd6ntfOPW/1JZJGrYX4JaKsPUJ8VGHh+iWR50cE=
X-Received: by 2002:a05:6512:4007:b0:553:5283:980f with SMTP id
 2adb3069b0e04-5550ba29ed0mr628392e87.51.1750992540108; Thu, 26 Jun 2025
 19:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627022837.3331827-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250627022837.3331827-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Jun 2025 19:48:48 -0700
X-Gm-Features: Ac12FXwf59eyhe3NIP1HlmImClaDAHzqNeVDRK7bbuvKnPBO5OcLJhb39G9nTn8
Message-ID: <CANDhNCorm58L9CqHyNORgfk=++HkCttmyCkM23Pn8rXV7cF41Q@mail.gmail.com>
Subject: Re: [PATCH V4 1/1] sched/deadline: Fix dl_server runtime calculation formula
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

On Thu, Jun 26, 2025 at 7:28=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
> In our testing with 6.12 based kernel on a big.LITTLE system, we were
> seeing instances of RT tasks being blocked from running on the LITTLE
> cpus for multiple seconds of time, apparently by the dl_server. This
> far exceeds the default configured 50ms per second runtime.
>
> This is due to the fair dl_server runtime calculation being scaled
> for frequency & capacity of the cpu.
>
> Consider the following case under a Big.LITTLE architecture:
> Assume the runtime is: 50,000,000 ns, and Frequency/capacity
> scale-invariance defined as below:
> Frequency scale-invariance: 100
> Capacity scale-invariance: 50
> First by Frequency scale-invariance,
> the runtime is scaled to 50,000,000 * 100 >> 10 =3D 4,882,812
> Then by capacity scale-invariance,
> it is further scaled to 4,882,812 * 50 >> 10 =3D 238,418.
> So it will scaled to 238,418 ns.
>
> This smaller "accounted runtime" value is what ends up being
> subtracted against the fair-server's runtime for the current period.
> Thus after 50ms of real time, we've only accounted ~238us against the
> fair servers runtime. This 209:1 ratio in this example means that on
> the smaller cpu the fair server is allowed to continue running,
> blocking RT tasks, for over 10 seconds before it exhausts its supposed
> 50ms of runtime.  And on other hardware configurations it can be even
> worse.
>
> For the fair deadline_server, to prevent realtime tasks from being
> unexpectedly delayed, we really do want to use fixed time, and not
> scaled time for smaller capacity/frequency cpus. So remove the scaling
> from the fair server's accounting to fix this.
>

Thanks again for revising the commit message, this version is easier
(for me at least) to follow.


> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..96a21f38fcc3 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1624,7 +1626,9 @@ void dl_server_update_idle_time(struct rq *rq, stru=
ct task_struct *p)
>         if (delta_exec < 0)
>                 return;
>
> -       scaled_delta_exec =3D dl_scaled_delta_exec(rq, &rq->fair_server, =
delta_exec);
> +       scaled_delta_exec =3D delta_exec;
> +       if (!rq->fair_server.dl_server)
> +               scaled_delta_exec =3D dl_scaled_delta_exec(rq, &rq->fair_=
server, delta_exec);
>
>         rq->fair_server.runtime -=3D scaled_delta_exec;

As I mentioned earlier, I still don't see this conditional as making a
lot of sense, as I don't believe there is time when this function
would be called and (!rq->fair_server.dl_server) would be true.
And even if there were, I'm not sure it makes sense to scale the time
interval based on the fair_server.dl_server flag.

From a separate discussion, you highlighted that it might be useful
once we have multiple dl_server types, which may want scaled
accounting, but I think in that case we should use an explicit flag
instead of the dl_server bit to denote if the accounting should be
scaled or not.

So, since your patch is a fix for a pretty bad bug, I think it should
be focused on fixing the issue in the simplest and clearest way for
the existing code, and not be too worried about integrating with
future changes that haven't landed.

Then, as those future changes land, we can see how best to generalize
the decision to scale or not scale the accounting on a dl_server.

That said, the conditional is a bit of a moot point, since I don't
think we'll actually hit it, and I'm motivated to get the bug you are
fixing resolved, so I wouldn't object if this went in as-is, but it
seems like it would be much cleaner to just drop that conditional as
you did in the original version of this patch.

Thanks so much again for your iterating on this change here! I really
appreciate your efforts to both find this issue as well as to get it
fixed!
-john
