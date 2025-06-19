Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1260F23B630
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336296; cv=none; b=Q0CUgCMBvddgRXDSISAnNARm3Q7DkBRLaJb7NPgcuD0vlr34dF21RXPIiOKZ6G/VVnvnRGQSMQRfBCX41/uBxUXpzxR/rcIBzj2qE8MiHpBGyGw2oLEc0Vpvd5qNug+I3iwF1YoqAYPdcOdRsNIR/ex2hZWkK34MnuE2ANmMqj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336296; c=relaxed/simple;
	bh=F1lGlDxaWlHZ0shmzzeFh2yuNJDHZDqmoq/6LjKpDbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=KeqH+EJIHHPZlTbHhUztVn+JOXNSQKPZxybbl3fyJJycmEAV4oQ0uSjUuEsVSmUC1vVe47chjOQtLqVbQI0nl6wbX7VDRFms//VLpsUNS6ZYLZX3t2GWlvk8c6kPR/0Kf01Ae4AnYnVAMkqFT1Vz4BAYoD/ffGte4VqNXl3v/e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xQAMI7Ja; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xQAMI7Ja"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso1269341a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750336292; x=1750941092; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=utDviDjjdC8ToMHniMFP1EUkiB9CyXo3pFzkkceyAtQ=;
        b=xQAMI7JanWAST4ErK9mcC0kSi0nqzdpyMwJh5NVdLTUGnrPmHIjeRT928S82imFw0e
         zf/EOpQatRz483kD0iGV9yE10nhV+Cmb8IBVR3vh6fIGaCWJr/v1lKZYVzJ4rPllhbQo
         Izw3Eu/ToS+ZdHkn5p+MSz8PZLJe4e8nIpa8Lads+LCBAXREIatFGsT5TtPCfJE40ULg
         I0ECUYMeMi+1bLd/JcKoqBulRZYEG1FIP6lc8gqDCguTtOUshclIgOoPBnosuGiUM8Wj
         iQD1Zpx1q4MpkDvMSN2ic3/8czK8BcUCLocYMrAr6zmymVF0ER69HRNBibzeqnNuXaGh
         xQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750336292; x=1750941092;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utDviDjjdC8ToMHniMFP1EUkiB9CyXo3pFzkkceyAtQ=;
        b=SM39Iu+XPwsu51pxq54ZCHrRcyQX0Xcq9nQc7gQCr8aLkil8eQZPXkAz0EkTGq2PSt
         bOjPTfX7t8/f+Ev+H05ySwF0iuhWH5OmZ1sse4atvTCkiIK7uqNK60o41xi84Y9Qj1GP
         ftGTOwDWnEDc1o+R0k+/BffBckL0xOl+zAYmGv3EcDKb/hhRe34In2fLSr63WQEH/w+k
         QAAqFpM7hELQoVlsW0QH/7npkQUcF3pb3Gdswn96l8iVkLdxa+HRz5tLMlBpIT3QvCLL
         Nu5/1HuYMTrWCIVczojtJChrfWcRKYjEq9p2vXmH4D1lCT89kUuxANZKI/kTmX3xbtBe
         869Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhEA8m+av32me1ckEZf8/6o1ZiFTMV3vJjYz8XZVXKdqxcBqcXPDkEg5KTORYlcJ841X09rml7Djn6YW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBSZtuj2T+35kBQlj8MrU5/y8jsI/kApPtEpPh99dygWzApfUH
	+h8DKSKre9IuEVJG1SuHboKLHJ7CDIM77R3YXiFsoO/ONmyaD6LH8GIkYaHO5aLUKHMzq5YMQTT
	XASyrrfXWiz/nb0AFCxC7thgz8EET2jvJ0hwXWVhALw==
X-Gm-Gg: ASbGncsROFLmZVIRv+cvcZZoaEizr98kHE6KbgajrGDITyoA+4G2TVDlVKjLgKnLCgf
	owS/qbu6ES7TxLeA8pc+RrgwYREPLZv+qFwEPqq7r0sBmoGxikxuHbya/gKpWkob0ewlE1MVnN0
	t38O7MQvAbMHJ1tw5fCjdvmIM50BmcnY9D6mj0OcTLd3vm7Iz02gWgG2u9EypWMUC+ibBZC4t4
X-Google-Smtp-Source: AGHT+IE5OF9ha8mrdVpigjmcUPD86QG+KEnzoqBp92xxwtGgNq3yKCnDRe+Ty39NG6O1jDXd7JWvCFk8IjdAF/1ABJs=
X-Received: by 2002:a17:906:f5a9:b0:ad8:89c7:2735 with SMTP id
 a640c23a62f3a-adfad5db9f8mr2206212266b.58.1750336292132; Thu, 19 Jun 2025
 05:31:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613140514.2781138-1-vincent.guittot@linaro.org> <20250613140514.2781138-5-vincent.guittot@linaro.org>
In-Reply-To: <20250613140514.2781138-5-vincent.guittot@linaro.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 19 Jun 2025 14:31:20 +0200
X-Gm-Features: AX0GCFsD3n5eXjNmryN0nXZutfYrV9ZKt9yIfeYJAwGr-WAZKhM9UvRHFNMcaWI
Message-ID: <CAKfTPtDyS=vNXvPncZutnydXFvV9WDm1N1y1xibPP-tibjiDrg@mail.gmail.com>
Subject: Re: [PATCH 4/4] sched/fair: Improve NO_RUN_TO_PARITY
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 16:05, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> The slice protection of RUN_TO_PARITY should also be applied with a
> minimal quantum of time for NO_RUN_TO_PARITY in order to ensure a minimum
> runtime for each task with same slice duration but also to ensure
> periodic switch between threads.
>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  kernel/sched/fair.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index d8345219dfd4..73bde511c53b 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -921,15 +921,20 @@ struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
>   * one in vlag, which isn't used until dequeue.
>   * In case of run to parity, we use the shortest slice of the enqueued
>   * entities.
> + * When run to parity is disable we give a minimum quantum to the
> + * running entity to ensure progress.
>   */
>  static inline void set_protect_slice(struct sched_entity *se)
>  {
> -       u64 min_slice;
> +       u64 quantum;
>
> -       min_slice = cfs_rq_min_slice(cfs_rq_of(se));
> +       if (sched_feat(RUN_TO_PARITY))
> +               quantum = cfs_rq_min_slice(cfs_rq_of(se));
> +       else
> +               quantum = min(se->slice, normalized_sysctl_sched_base_slice);
The above is not correct and needs the fix below on top

-               quantum = min(se->slice, normalized_sysctl_sched_base_slice);
+       quantum = normalized_sysctl_sched_base_slice;

+       quantum = min(se->slice, quantum);

>
> -       if (min_slice != se->slice)
> -               se->vlag = min(se->deadline, se->vruntime + calc_delta_fair(min_slice, se));
> +       if (quantum != se->slice)
> +               se->vlag = min(se->deadline, se->vruntime + calc_delta_fair(quantum, se));
>         else
>                 se->vlag = se->deadline;
>  }
> @@ -981,7 +986,7 @@ static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq)
>         if (curr && (!curr->on_rq || !entity_eligible(cfs_rq, curr)))
>                 curr = NULL;
>
> -       if (sched_feat(RUN_TO_PARITY) && curr && protect_slice(curr))
> +       if (curr && protect_slice(curr))
>                 return curr;
>
>         /* Pick the leftmost entity if it's eligible */
> @@ -1215,11 +1220,8 @@ static inline void update_curr_task(struct task_struct *p, s64 delta_exec)
>         cgroup_account_cputime(p, delta_exec);
>  }
>
> -static inline bool did_preempt_short(struct cfs_rq *cfs_rq, struct sched_entity *curr)
> +static inline bool resched_next_quantum(struct cfs_rq *cfs_rq, struct sched_entity *curr)
>  {
> -       if (!sched_feat(PREEMPT_SHORT))
> -               return false;
> -
>         if (protect_slice(curr))
>                 return false;
>
> @@ -1307,7 +1309,7 @@ static void update_curr(struct cfs_rq *cfs_rq)
>         if (cfs_rq->nr_queued == 1)
>                 return;
>
> -       if (resched || did_preempt_short(cfs_rq, curr)) {
> +       if (resched || resched_next_quantum(cfs_rq, curr)) {
>                 resched_curr_lazy(rq);
>                 clear_buddies(cfs_rq, curr);
>         }
> --
> 2.43.0
>
