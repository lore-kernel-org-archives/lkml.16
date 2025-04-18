Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8297517CA1B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988445; cv=none; b=nH4FGDq0NQX+TOMcIt+tws5nFmZy5TCiJP5PLeci8MtDKp3go0LY/zfArie4F5j6K4g6G6fcssiSTE4uT84bMFiDF8kzwjZF3VpOPyDsFKU4yAuSaiMbxzObVAJxcGo08N7ucqCgPZPSVQcJ4IQf29gkPa6Dd6GXNBKKrO+DbT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988445; c=relaxed/simple;
	bh=fyu4Df7U6WeYoRFOmNpe4CKBKopD/t4Z2hoAXPoooIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MpdKekGt8aq/KkUSZLqMrnpyPprg3mJ0E+xGVh/alPxRxtaUkKdXb7ScUT1xN4C6QzlpRS/soSFJBhqg99e0CAp9N/ljVb1oCPs9cAw6S9BGmniF7ECcq7av4BXLmDhIf4UtbbmuAt0QQa8zf0aK7a+9VpY71CYlxIuNvubeBOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qSV/18WE; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qSV/18WE"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so292365666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744988442; x=1745593242; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FvIoOB4Z/z8Hs91eEQFjL5VUPSQb8uEvwcYu9EPGBxc=;
        b=qSV/18WEAJgu51L/bGh2sHfF74+xvhulVO0pTyTpeZGGN358Rt0E35Yz2hB4jkE4+h
         FjxIC/bOky1xHZJivEUd9rXE4Uen5HTQ5P5rDGuwgIAhyuFXaYVhhXQzcpNbVGI0H/z8
         pFCEP3pftqGoDLeFPrVGGwgkbo2RU2TM5S5LIv3hYyAvvvytAlNjn4AIrE+PWq0deQh9
         1edkgbV77AP0F2KiqrlBQuj7vj8Q7Ice2C6V84akauTHH17Wf/wJADowSIre5JAcd356
         cWZjqZI2SaIjz2cVMf6qmyYNrPnMXsjvodTUjvVNbi15RrlIzamKyB3I+8D0t5nc9+Ir
         lilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988442; x=1745593242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvIoOB4Z/z8Hs91eEQFjL5VUPSQb8uEvwcYu9EPGBxc=;
        b=qlUO+hd5nNpCFkAc+NS4R5fKvuN8fpgKSCoy4MxZz7lDE51Oi9ays6sulWpZXl6Qoh
         SGozluESTsGCDfimPB3mMQDoTL5Ed/I0l+huH93lv9gd13G4DGPGqPjBIyH2CZ+1uEC7
         Z+7ZNOv/Mzhx5PBEztoJsFnL2rM5Wrjcp0Od9eVy2g5q7tCsDfCH5akJyd7H3Rf+y7KT
         x9Tp4ovuwrO4hEgUnX/GTSU2fnJaoqYrHf2HDc+Gy4e0y4oQ8Y4ypnkmvKAhlfDUexqg
         jmfc3EJseYq2ESuJJKICtrkZvlzkUku8F8DTNPngbiahy2e2OU+SKDY+KlG71YqoLkRr
         ThyA==
X-Forwarded-Encrypted: i=1; AJvYcCV3YKJY7vKFSBS+NdqWHjL2jAmBoGTvnBcLwARlIRtp0EJli0Rep7DhRs0U6X3WBRvxh7fWPafWNDSBo60=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY/g9IOyHrCzUykbVCy/PbASGokqvQFbXWwmwZTYiJ6aDs9fjJ
	mNilfAKyNbqgKiAHcE3eRqGEk9Ajm6xhsCpgBoB1A4GjKrj0h9xJW8SX2l+ecpc9PfR7uKWmdl3
	ieVtyCi4cBEjBA2jzgftjnZmEcvffeOIdYxtDyA==
X-Gm-Gg: ASbGncsY/XU+M395az8Jaoy8KNxczoyaJlM+j+QFXz69Y2tl8fVa8gTEUrYlnTGx2a0
	Cx5f1q4EQQHolFW+ySJ7hIv1TvqbREjb9o+vBuE4ZNsbQRLRVrHb72a+3ndywQGq7U5mYTUWLeu
	6vQ9o+2bJQIKekN5KY2mQxWeSY3IizqHhueLZ5zKGyS1UuDQAbpRE=
X-Google-Smtp-Source: AGHT+IH8oj83FtmLS9/NznXZ5RVpBsBqTC5YxiApZZpil6/YZqGBTD++yQ2KWKbtUx+/+8BA+gVf3UElzOOWLQnmMeI=
X-Received: by 2002:a17:906:5942:b0:ac7:391a:e2d3 with SMTP id
 a640c23a62f3a-acb74dde4eamr249735066b.58.1744988441677; Fri, 18 Apr 2025
 08:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417043457.10632-1-xuewen.yan@unisoc.com> <20250417043457.10632-2-xuewen.yan@unisoc.com>
In-Reply-To: <20250417043457.10632-2-xuewen.yan@unisoc.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 18 Apr 2025 17:00:29 +0200
X-Gm-Features: ATxdqUEzvj37PWRirbGD1iKupIEgKGHlJ5b1M2Hmcwz4c0iCHg_qLF1HPKr7jVU
Message-ID: <CAKfTPtByU2ROggQh6i9Vn-fTikKHNQwWsyxJfY_3zW-CkMH0UQ@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] sched/util_est: Simply the condition for util_est_dequeue/enqueue
To: Xuewen Yan <xuewen.yan@unisoc.com>
Cc: dietmar.eggemann@arm.com, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, hongyan.xia2@arm.com, 
	linux-kernel@vger.kernel.org, ke.wang@unisoc.com, di.shen@unisoc.com, 
	xuewen.yan94@gmail.com, kprateek.nayak@amd.com, kuyo.chang@mediatek.com, 
	juju.sung@mediatek.com, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 06:36, Xuewen Yan <xuewen.yan@unisoc.com> wrote:
>
> To prevent double enqueue/dequeue of the util-est for sched_delayed tasks,
> commit 729288bc6856 ("kernel/sched: Fix util_est accounting for DELAY_DEQUEUE")
> added the corresponding check. This check excludes double en/dequeue during
> task migration and priority changes.
>
> In fact, these conditions can be simplified.
>
> For util_est_dequeue, we know that sched_delayed flag is set in dequeue_entity.
> When the task is sleeping, we need to call util_est_dequeue to subtract
> util-est from the cfs_rq. At this point, sched_delayed has not yet been set.
> If we find that sched_delayed is already set, it indicates that this task
> has already called dequeue_task_fair once. In this case, there is no need to
> call util_est_dequeue again. Therefore, simply checking the sched_delayed flag
> should be sufficient to prevent unnecessary util_est updates during the dequeue.
>
> For util_est_enqueue, our goal is to add the util_est to the cfs_rq
> when task enqueue. However, we don't want to add the util_est of a
> sched_delayed task to the cfs_rq because the task is sleeping.
> Therefore, we can exclude the util_est_enqueue for sched_delayed tasks
> by checking the sched_delayed flag. However, when waking up a delayed task,
> the sched_delayed flag is cleared after util_est_enqueue. As a result,
> if we only check the sched_delayed flag, we would miss the util_est_enqueue.
> Since waking up a sched_delayed task calls enqueue_task with the ENQUEUE_DELAYED flag,
> we can determine whether to call util_est_enqueue by checking if the
> enqueue_flag contains ENQUEUE_DELAYED.
>
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>


> ---
> v3:
> - Separated from the previous patch.
> - rework the commit message.
> ---
>  kernel/sched/fair.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index e43993a4e580..18c85857bff0 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6941,7 +6941,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>          * Let's add the task's estimated utilization to the cfs_rq's
>          * estimated utilization, before we update schedutil.
>          */
> -       if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & ENQUEUE_RESTORE))))
> +       if (!p->se.sched_delayed || (flags & ENQUEUE_DELAYED))
>                 util_est_enqueue(&rq->cfs, p);
>
>         if (flags & ENQUEUE_DELAYED) {
> @@ -7183,7 +7183,7 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
>   */
>  static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>  {
> -       if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & DEQUEUE_SAVE))))
> +       if (!p->se.sched_delayed)
>                 util_est_dequeue(&rq->cfs, p);
>
>         util_est_update(&rq->cfs, p, flags & DEQUEUE_SLEEP);
> --
> 2.25.1
>
>
