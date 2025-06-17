Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454572550D4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194151; cv=none; b=DVrlNzBoHvk6yTRv49k1QJ5euyaDkd9c8Ik7K89e/13VjQHGh/3bgHMI99GIHD3q4F+Inb1RfwS2BneIbXovosvnLjjFvHXqNy7VJbcK6L36pDYaa2kEZXEMRpsZrLXQyRd+NZL90yO8wuFfKdcQZKSQhcnolcd4gEwyRO4b6Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194151; c=relaxed/simple;
	bh=IaC7pO6+0/KdfsjCt6ai0GcL3RIEQP9Q1HiWBwCI9Js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s2wlEjVuGvjOI6vE/ROaArzU+qHutP4hb/+Q7tPPvdYzGPoCnU/AlbOwHfUGxB2OWGSY5cz65oS6XoR7QTVGb+Ukc9URVazzVLAeVK3eUx2b8jN3pUkBZTWgEE5gY+pCAIVJ0IK2kUm3IkdwfLyi4/pAUCKY+gy+bBzrgFcGMjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z2l8UHLR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z2l8UHLR"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54e7967cf67so6346096e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750194147; x=1750798947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJBYievKNfCEHacHMV9ZIC+ridMvs+KwmtxKpRY2HrU=;
        b=Z2l8UHLRl5I86wusj+eS3Of7gxA9g7xqsaAK7AbMvtEVzrSSCDDU3BcOULAsgjCrjN
         +8qPK/rPjp/nM6GZ9NFoBc8wi8KJz1Yk1NLQ7WvbSOYOHuOovlGpSkpqugqwvOw/EanT
         jIYnJfCTTpb767Z06MXcC7glybakDWKifnuLFe1dGwdM+eZ3y8UNmLH4DzY32mRG4YG3
         2c+0QwHseKWxHtDWKbMzcW25JuSyJtoYscWKte8QYeYV+DVhmndDqwqKr80SP7HrHxpl
         P5gF5dPnI/lL1HGEHOb6VCYwXMYmHe9tKs+Dy/1AlDj1JAxOHZqKJhP5ziARSZW5eccr
         PnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194147; x=1750798947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJBYievKNfCEHacHMV9ZIC+ridMvs+KwmtxKpRY2HrU=;
        b=FbVgOwNzQB+cXWiTYE0YFxLkgc11PoYq+m/wXQvkLlX8AYzvCO+yNuT7MhZvAtqYZG
         2pYv86DqwzLdj1Ff+d+n/G7/s5JwS+6IqZ5oS8M4D9jKrdScth3r26tyNHJrl71TWDh3
         rzmuuZGfvRwTwVWppSd67nj3zdpxMA9LImoAbVtukq0YDQy0eNb3C0U+0OcE3MnZzO9V
         0sHXjGUvyw4kXQfXneevq6cMgBN8JDBRBHAjJPkhDMwvSrKyrmzHMAyooZLF8ps4tUOx
         3eih8pgndzQ8QFmZMGhm0e5NdH1pHKw7w5UNPoTMlweuqecNuKDEzeqptlLMXX48fQg7
         DtuA==
X-Forwarded-Encrypted: i=1; AJvYcCXWOQ3kqEIyKNvV8C/OD3NvkVX1cuXlJuSBZ+BkpKi7jm+rlQij7fcRdlacQqyPMhmFNfMacgylpzO7h8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3b0bBrKdbduS1Sxt5YlqWs/zLYxw4cJFulJ3Wd9M4RKIQzMoT
	fw4pk9sV7p0JoC0nsWl6juKH7pJ5p7l7Y8VPcaMp1eHXfsRiivc69M4MISiaSyGdnzzASc83tPV
	LHXg8IXL86KF00btroWMnykg6sjLoiiJl08uTRsQ=
X-Gm-Gg: ASbGnct1FdPCIrXmltYA4FzrBlAcaHrItTNeeVCXm+hcCrklyIng91ZSleUi78l0qKm
	mINo78m3qI9Vw3DW5BqR1nX9AbG6XwSA24KNpc7X1nWxhrMCSjiQMRzt3mquOWcodGjxByuFy/n
	EM9jqjwwvrq/iEQEBMvEtwRDUxtvJahbUJgm76enWl8WqnCiNXW3A39wiLwaBoIQ01QyHGac0=
X-Google-Smtp-Source: AGHT+IF7sTQYGGBwCF4kAUzw/HchYbiway7musm8Os50fNb5cA76yIicDTBJe181wiAxG4715hg2/8AO/GJeuaxl92c=
X-Received: by 2002:ac2:4c41:0:b0:553:37e7:867b with SMTP id
 2adb3069b0e04-553b6ee8899mr4611437e87.31.1750194147074; Tue, 17 Jun 2025
 14:02:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 17 Jun 2025 14:02:14 -0700
X-Gm-Features: AX0GCFtWGhwas8ObpV8SSgSSLy0WEYla_bnrUoClImFq7kWv5WAqODjqVFnEkwI
Message-ID: <CANDhNCrUtLCU86hNk4qyfbqn9eXsmbzgzJCxYmXGRCko0r=VbQ@mail.gmail.com>
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

On Tue, Jun 17, 2025 at 8:54=E2=80=AFAM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
>
> From: kuyo chang <kuyo.chang@mediatek.com>
>
> [Symptom]
> The calculation formula for dl_server runtime is based on
> Frequency/capacity scale-invariance.
> This will cause excessive RT latency (expect absolute time).
>
> [Analysis]
> Consider the following case under a Big.LITTLE architecture:
>
> Assume the runtime is: 50,000,000 ns, and Frequency/capacity
> scale-invariance defined as below:
>
> Frequency scale-invariance: 100
> Capacity scale-invariance: 50
> First by Frequency scale-invariance,
> the runtime is scaled to 50,000,000 * 100 >> 10 =3D 4,882,812
> Then by capacity scale-invariance,
> it is further scaled to 4,882,812 * 50 >> 10 =3D 238,418.
>
> So it will scaled to 238,418 ns.
>
> [Solution]
> The runtime for dl_server should be fixed time
> asis RT bandwidth control.
> Fix the runtime calculation formula for the dl_server.

Thanks again for iterating on this patch! I've got a few minor nits below.

> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
>
> v1: https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediat=
ek.com/
>
> ---
>  kernel/sched/deadline.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..f68a158d01e9 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1504,7 +1504,9 @@ static void update_curr_dl_se(struct rq *rq, struct=
 sched_dl_entity *dl_se, s64
>         if (dl_entity_is_special(dl_se))
>                 return;
>
> -       scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se, delta_exec)=
;
> +       scaled_delta_exec =3D delta_exec;
> +       if (!dl_se->dl_server)
> +               scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se, del=
ta_exec);

Just a nit, but would
    if (!dl_server(dl_se))

be a little cleaner/consistent with other readers?

>         dl_se->runtime -=3D scaled_delta_exec;
>
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

I'm a little confused on the conditional here. Is
fair_server.dl_server ever not true (after the first call to
dl_server_start())?

Also, in the discussion on your first version, it seemed there might
be a need for different servers to have different requirements, but it
seemed like fair_server would always not want to be scaled.

thanks
-john
