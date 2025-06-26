Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7927A21322B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750915520; cv=none; b=QJGI1bTFoTlta2Wqem+PpI0BvL3wIvHmGGgZYCtanpcFyObeyFcpHqnSp+7QjuP53Sbln/W8YGCUCkBP+mgHn6zHPheZI5UBRJFOq7s/XRfB/38zzyIZSVrHpMTTK4jqFa06RmMzkMKRqzFLfTbkrghF9fMwebfTue+7VrNWA6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750915520; c=relaxed/simple;
	bh=BC81Aok2UC/wqolxSLLOrq7UC9CcCqnEqdFD/yTvzj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ngIBglXw3LITcl97/pFw4uhhiVDEyvsxneCVaiHHtGE3XeV+vugTL1h27LUPwWT/ejxjdPBEyc8d/GHo4u9SP6udi/dbcisLh2u8nZdziOL+4d5LBt/XQlgvOrDEwsRA8reLdq92O0nhavHHXlEbuVUG9Ax7XUW4buh3Gw4bnxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w+ES+yPk; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w+ES+yPk"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b5931037eso4246971fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750915516; x=1751520316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ixr34CRuFwoG6PvhFrZURvWLjuli1tb6auMPGQGYXo=;
        b=w+ES+yPk1JZYuAsVUBmSlhLkzSJZw91FQPYaqaLM2AZIvFZmoWcNWpB0bSGI9gcwHm
         eCGiueZlftbgBsWjWUGVqvGF/4rCen8imQzglsUGcbkVJXiTeDZ0DPgQbaPXWNHgAsvC
         RbCq2wB5zZzIfGVw8VRxcO9sy/5dPsuXkbQcYwt5cTt2vVWTqwW3EtzX7inmtoJh7Efh
         mUuF4jPlunGrzGRKbO5aUHQoqQjcLlplQFSB25oGJQsyj4rrv/1YEMlXOlAKsJVxxQE4
         +H2PbyKX12thiGgRuapvLv+8xFMxZwrsdw2jfgYsi9uoGx1gQ9Y4hDJeLR1po0enhd6o
         59Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750915516; x=1751520316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ixr34CRuFwoG6PvhFrZURvWLjuli1tb6auMPGQGYXo=;
        b=ui643x0j90fJWs6M4l6Hv7g8B4lcNM2wwCJg7e0egukdnh0oWu3o8WRcx/lRu0hY9M
         AaKgSU+nXFzS2uNkVCsfj8EALYN+vi5oHx7gdrFEraeATQypFB4mz2hRusfj/WOdtTmQ
         jYy37krf6R9sVISZPrmfLm4JrVsIBTb2IcCMjsfvSo2pkf2buRB1uOdX8YetujLZvcSq
         cC7oAtmQByDkb/MCbMkWqU9mTciKLiG78x40RHjxXPtVLbbCCEW/yMpSqcbdyB/93IvM
         wcERhOwhemZVKxbZAHq8Mo0FwIDJTyud3L8MS8JTa8rYf4Zx/PZBaMKaVd7pz/0xDFc9
         7NNg==
X-Forwarded-Encrypted: i=1; AJvYcCXj2+/tQxbOohtmottvpJqThhqjAt7grdZ+g+Q5wzEukzziLFfZmybXdLM/vpquDRCGcynE9Q1/IVLY33w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ45qrzI1j8uGb+A0C7++rQwQIsWelagCL9z/gm9GrbaYr+wJY
	H9vLgLyGp2B7vOT1du5wUm617dOc3chkqECYDTYpKgCQMYgLZ0LvgYF5dxVvb03efxs8roNddeT
	8bC4FGi9bWsd+pu5iu3qzcynf92oqpkuIKFjXZzQ=
X-Gm-Gg: ASbGncv5lXIkFlbBrBG1H7gRJWFEkiFAy1VnoiW2bWey/iSiNJNdhxYP/vcVTVdPMQ3
	o0mWGTKBY7xIehZBqs4qb6mkh8WMwR1/mxNkNLUm5knQH0+W5ggcOaCh26hGyrqKGgNk8B5Ququ
	Caos/Sk+Aouk6MNJ/6lc3Wyl1/0Ed+GpcpYDOO0/MaYNsrZiDzPugXHoACMsD/gVWMdXM/fx/H
X-Google-Smtp-Source: AGHT+IGodguDEXCNroFB1rkVwfUyXnwlhYIj4o/5DqnlD+lqXFzy5P/tRol06d9uCArjELEt3Fyvfk5CURCo3xl53cU=
X-Received: by 2002:a05:6512:2c85:b0:553:2edd:a7e0 with SMTP id
 2adb3069b0e04-555028b2014mr893010e87.16.1750915515243; Wed, 25 Jun 2025
 22:25:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626030746.2245365-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250626030746.2245365-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 25 Jun 2025 22:25:03 -0700
X-Gm-Features: Ac12FXyLVy8PiJFpc0O5wjSoIq1ZDfueOIQeT5UYqek1YBjnhVpxXNtpqkY_jhA
Message-ID: <CANDhNCpNZd+s9+ZXU=+4t3CyV=7weFsbWQEx2=M9yphx6szt8Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] sched/deadline: Fix dl_server runtime calculation formula
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

On Wed, Jun 25, 2025 at 8:08=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
> [Symptom]
> The calculation formula for dl_server runtime is based on
> Frequency/capacity scale-invariance.
> This will cause excessive RT latency (expect absolute time).

I appreciate your symptom/analysis/solution markers, but they are a
little unconventional for commit messages, so you might consider
dropping them.

Further, you're explaining the cause of the problem before you
describe what you were seeing.

I might suggest rewording as:
"In our testing with 6.12 based kernel on a big.LITTLE system, we were
seeing instances of RT tasks being blocked from running on the LITTLE
cpus for multiple seconds of time, apparently by the dl_server. This
far exceeds the default configured 50ms per second runtime."

Then you can get into the analysis where you can state as you had above:
"This is due to the fair dl_server runtime calculation being scaled
for frequency & capacity of the cpu"

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

This part is all good, but you might want to make it more clear why
the smaller scaled "runtime" value here results in longer delays for
RT tasks.
ie:

This smaller "accounted runtime" value is what ends up being
subtracted against the fair-server's runtime for the current period.
Thus after 50ms of real time, we've only accounted ~238us against the
fair servers runtime. This 209:1 ratio in this example means that on
the smaller cpu the fair server is allowed to continue running,
blocking RT tasks, for over 10 seconds before it exhausts its supposed
50ms of runtime.  And on other hardware configurations it can be even
worse.

> [Solution]
> The runtime for dl_server should be fixed time
> asis RT bandwidth control.
> Fix the runtime calculation formula for the dl_server.

I think this can be stated more simply as:
"For the fair deadline_server, to prevent realtime tasks from being
unexpectedly delayed, we really do want to use fixed time, and not
scaled time for smaller capacity/frequency cpus. So remove the scaling
from the fair server's accounting to fix this."

> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Suggested-by: John Stultz <jstultz@google.com>
> Tested-by: John Stultz <jstultz@google.com>
>
> v1: https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediat=
ek.com/
> v2: https://lore.kernel.org/all/20250617155355.1479777-1-kuyo.chang@media=
tek.com/

Please add a "---" line above the version data so it doesn't get added
to the commit history.

> Change-Id: Iaaa1ec78f405586c22ba56230ef1143206daa2d0

Also no Change-Ids in upstream targeted commits.
./scripts/checkpatch.pl should warn you about this, and its a good
idea in general to run that before submitting.

> ---
>  kernel/sched/deadline.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..96a21f38fcc3 100644
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
> +       if (!dl_server(dl_se))
> +               scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se, del=
ta_exec);
>
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

I still feel like these lines don't make much sense, and it seems like
they could be dropped.  When is (!rq->fair_server.dl_server) true?

>         rq->fair_server.runtime -=3D scaled_delta_exec;
>
> --

Thanks so much again for finding this issue and resubmitting this
patch! I really do want to see this land quickly as it addresses a
pretty big issue.
-john
