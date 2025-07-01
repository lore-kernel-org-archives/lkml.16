Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489881D5CDE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751366964; cv=none; b=X5eTlmKZyEDA9frOeKij7ggE5IqBRoEDpGsKrpR/7m0m5cgsoTHiZegb9T9ubJ8gU+7nBS/+EZSim/NeF3nMznTqEjkjwRLSwfXMlorXMvDG5Jv5a0EcWOi3hl1mL+zs5cEgmdc8R7sMlUacdyOwhVHCLZraWXv3W91dLfblXgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751366964; c=relaxed/simple;
	bh=128SMXN5CtEDmhSraGiHwE/vBLEnoSjifOYtYbXlHK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBJSAW6h6cvsrNxb6mOCDeGDuaISglysbTRii0AAiY0hEHnGwhqQGaZKJ14l2gUvw2IzTk/IBINaSFS9InB6W+JmsDhhpUy0pJlo6AqS53ZRdZGlGWsNgYDInsZkimW60l3W0xC5W44iPsQ2DWOMvh8W4LxIArELqyPuoJYJZTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ip+sCQQ2; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ip+sCQQ2"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a818ed5b51so14467741cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751366957; x=1751971757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMIiAPXyUxjqN3xmL81K7D4idlrLRN8OrQpg/yRJNV4=;
        b=Ip+sCQQ2yD18lHgwjqX8LJNo79T4ubZghGSJv+xNVChDiuF/FZ9p7czKQgUFAIMYr/
         9b3KHTWKDtCLOeNkgcBnqpp2nKvSBtQlw0uOd4U32z/nVi4k3OYq8WxBZVCgyKMUNWAf
         m67wMktAHZxglxcSfcRiajoc/3rxxOexOkFteX4bqBDVseznMGx2JOHAkylyr5syBjn7
         rFCQtOcf4CJDBxCMa1/5Vtfr7ZeN1C8l9bi/H3+8jg5FRgvjMoMRhb5/R6OhKXRAb2ZY
         m6cloT7/jzzJhe9ug45TPim1SmFVCspUcd1rTg/StI2BHh0qcEJd/VVTsTIdlgfhIRQJ
         QPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751366957; x=1751971757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMIiAPXyUxjqN3xmL81K7D4idlrLRN8OrQpg/yRJNV4=;
        b=GUO9qpgpv+UbA+sYmFg9vbDs+CBrFpFkzagkQU0+r2ihy4P+2YJ3dzyjukOKpb70nG
         s8J9vvMD19VqsOifW6vahF/Jn069GD4HkoeyuMaYZTyfsGOwL/AxWJY+9W1WCtdWqp7p
         0b5QP+vSrDg4s6xuP7rOAPCqV8Sn7ulFESy0GnUNg6WHu5uZIYgqCUDJb4rIUMP6YDLu
         rBIb0GTNPsUWeAtZVxE1SwLxq4M7Q4y00wv+ChoJBmIF49QpGHPCbfjK5KF0UI2GnloQ
         dewQ5+ttAuBob7zEa6FaMrKZongBRS9i6Zkfe6T+7ka5ql6//4v7s3Be/+6+MFE+MVUI
         5drA==
X-Forwarded-Encrypted: i=1; AJvYcCXvfuIrNaCmuZjoOXSTBvXwGmZQQt6o6GHw2Y0o0HFMgkGAWt4mQi9Uhn6Qwbbm+Xhz5tts7cW/gi81z3s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2CyTiy7NfBSchIDji1ZtrfZbrbrIYb+WpxbsklnE+L/NYwO/2
	8fwdJlraPxsEG6fC9Qf6rv/Hnv/DSQuZ/1euyzT6AQyUR3T1ksEeW/q8KH0ww7vadWDB56jFPcB
	NWVVQcBBWE3ecNJ/nG9lgzhv++ywELLGiVAmu
X-Gm-Gg: ASbGncujhwfRnnY5CmX77Tw/pIQtSC6+21zt+LpYFbSnISzhC0IeRR6H8VzoJWLqvlo
	UNkKlxhYS1b88Ost1jCpEzREgiLY2k7rjDVjjxlyHn8wxFb4eUPqbvAQF9r0Hyu5NJxFeJ5nvxB
	N2dA6UP+kTozRquTHqKFr0MbWKHwF4VkE0ZMY1xAtU4Gek
X-Google-Smtp-Source: AGHT+IEbwvVyOiKhuFz5fUkFWt3wPM2fGnwiFbHfCtOK/0qgLBEh2GxgIoS4or+YKd5ZUx3BehLXGYk4x9pYLJyB9bs=
X-Received: by 2002:ac8:5fcc:0:b0:4a7:f492:d0a2 with SMTP id
 d75a77b69052e-4a7fcbe18a7mr260375891cf.45.1751366957115; Tue, 01 Jul 2025
 03:49:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701093407.211500-1-zhangzihuan@kylinos.cn>
In-Reply-To: <20250701093407.211500-1-zhangzihuan@kylinos.cn>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Tue, 1 Jul 2025 18:49:05 +0800
X-Gm-Features: Ac12FXwWno0rofMQaL5jSVcPu97UPpKDAzd2pBXCvMXO9DLkbxgu-RqotR4eazk
Message-ID: <CAB8ipk-6=jZt5LZ9q9ehCE2PhhrBz4xV7BSLiqUda7=arm2rDQ@mail.gmail.com>
Subject: Re: [PATCH v1] sched/uclamp: Skip uclamp_rq_dec() for non-final
 dequeue of delayed tasks
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: xuewen.yan@unisoc.com, vincent.guittot@linaro.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	hongyan.xia2@arm.com, linux-kernel@vger.kernel.org, ke.wang@unisoc.com, 
	di.shen@unisoc.com, kprateek.nayak@amd.com, kuyo.chang@mediatek.com, 
	juju.sung@mediatek.com, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi zihuan,

On Tue, Jul 1, 2025 at 5:34=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.cn=
> wrote:
>
> Currently, uclamp_rq_inc() skips updating the clamp aggregation for
> delayed tasks unless ENQUEUE_DELAYED is set, to ensure we only track the
> real enqueue of a task that was previously marked as sched_delayed.
>
> However, the corresponding uclamp_rq_dec() path only checks
> sched_delayed, and misses the DEQUEUE_DELAYED flag. As a result, we may
> skip dec for a delayed task that is now being truly dequeued, leading to
> uclamp aggregation mismatch.
>
> This patch makes uclamp_rq_dec() consistent with uclamp_rq_inc() by
> checking both sched_delayed and DEQUEUE_DELAYED, ensuring correct
> accounting symmetry.
>
> Fixes: 90ca9410dab2 ("sched/uclamp: Align uclamp and util_est and call be=
fore freq update")
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  kernel/sched/core.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 8988d38d46a3..99f1542cff7d 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1781,7 +1781,7 @@ static inline void uclamp_rq_inc(struct rq *rq, str=
uct task_struct *p, int flags
>                 rq->uclamp_flags &=3D ~UCLAMP_FLAG_IDLE;
>  }
>
> -static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
> +static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p, i=
nt flags)
>  {
>         enum uclamp_id clamp_id;
>
> @@ -1797,7 +1797,8 @@ static inline void uclamp_rq_dec(struct rq *rq, str=
uct task_struct *p)
>         if (unlikely(!p->sched_class->uclamp_enabled))
>                 return;
>
> -       if (p->se.sched_delayed)
> +       /* Skip dec if this is a delayed task not being truly dequeued */
> +       if (p->se.sched_delayed && !(flags & DEQUEUE_DELAYED))
>                 return;

Consider the __sched_setscheduler()=EF=BC=8Cwhen changing the delayed-task'=
s
sched-class=EF=BC=8Cyour patch would dec the uclamp twice.

BR
---
xuewen

>
>         for_each_clamp_id(clamp_id)
> @@ -2039,7 +2040,7 @@ static void __init init_uclamp(void)
>
>  #else /* !CONFIG_UCLAMP_TASK */
>  static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, i=
nt flags) { }
> -static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p) {=
 }
> +static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p, i=
nt flags) { }
>  static inline void uclamp_fork(struct task_struct *p) { }
>  static inline void uclamp_post_fork(struct task_struct *p) { }
>  static inline void init_uclamp(void) { }
> @@ -2112,7 +2113,7 @@ inline bool dequeue_task(struct rq *rq, struct task=
_struct *p, int flags)
>          * Must be before ->dequeue_task() because ->dequeue_task() can '=
fail'
>          * and mark the task ->sched_delayed.
>          */
> -       uclamp_rq_dec(rq, p);
> +       uclamp_rq_dec(rq, p, flags);
>         return p->sched_class->dequeue_task(rq, p, flags);
>  }
>
> --
> 2.25.1
>
