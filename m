Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B51238D24
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939856; cv=none; b=o/FIbEpADkecrB+FrOrykbQIn9ChQocTqzLHbsOeFbUi8JjXG9tUtcfc3TEQ2rIYIU+NStrozHS1E4naX3u2JryE4VSl1RvA/PBdFanSpq3YoNdMpS+PQk8gt1/VrmIDMjP2tyRTJnM0suoPYy/Sbuh9wh0/d355WiyXt2OA9Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939856; c=relaxed/simple;
	bh=EkoV6XO2IdvsJ5r6Q1RwGKklJsOq8qkQI8FxHVdj8BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dmgoMVbtsZriF6PD2MLywYTS394ro4UiaIWLmMt61ReT40NL6pF27HURceeanua3NtSLZHlTLqEciHJZpxJeRLGXXASKKn+FWV0YWCE7hooPnQRnv6riDy7PX0FBzVbPvCddr+QP/4ybXLCZA4SwvPd6hCBQRvxSwAQLTR39BE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NiCCcssX; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NiCCcssX"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dce3c28889so4680281a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738939852; x=1739544652; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DvijzunCYsTzspebXg0A+XtvUg5654eflXvQZ34ncgs=;
        b=NiCCcssXB6qi0xGrSqPB+YJN9mvc573z8g4egOnAEN5EHgDBJQsxoySp1EHT+vuuvx
         uWseLMF6bNkcpQ0m7Z0Xl8rFe5LFDizbyoLFqEH+D8t8ToD3ceOQxqQWPH3BGjVCYdC2
         tKgXXgU7kLl+nKZA8A5G7fa6+9syySNi+dtBeT7jYK3ASMzhvUY5bWMZpkZVymM+1IgM
         Tt5J8gHmo2Sr/w2tUggOp4zTN2ww8RBWF7D9gdqt8Ka344inV0j7bPBLcJmQzfj57ell
         YGMTqyv5Obrwr0L/yDsnc9CpDRpKcAnX6mmJahcutwWalHJiFzUJEfKR53Yev18xBNFu
         LYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738939852; x=1739544652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvijzunCYsTzspebXg0A+XtvUg5654eflXvQZ34ncgs=;
        b=gGA4yRiFW79dU252BU60hbyCIkYDxwK7CIiEDWufx6OXxIqjZv9t+sIgwwbBIPHaF6
         DFtt8P7IF8G6H2OIHGvzjphZuai2C2LQ7pyPO8YZeMio8SYLVfj0ZurIoyX8yf+ajnr+
         X/5p/hhr6oqe5/OnazqKme8kUSs6EanYD/YliNOsZT14GpxUPvmT0YW19s1Ge+ZBrFoE
         MciMZsfe44TigGZIf+X6DKEjmjxnK0jTZtOHiIJa82L1X4vE8JpWAIIsuiP4NvFY+zjW
         lCQ19KiA/Y+egmjM9S3XWv/3KHVIscYFjkgnbEWhCHb+xD71N2wRuUGv8q+ygCVxqLO1
         GSSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbsAjnIhTNY0uGHOP7B3EauHvM5AHYNKt7g/O2h0IsD2fi9cPHtsjUjeM8Nq+e8zq+6FXs8pbTfJ+jA2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfqU+KqFMWpB2e2Zjy/yAqREHIBC0VLYX3CkIKqPhnhGlxEXIZ
	nItkc7eUJVq5QyvBhOh63dnc/y9/QFqQhp1hQUUyfCf0e8proWC4R99RzTzDA+XG2tX4Xgvyd8Q
	8e0IgShWDL6TW/qyKIjY3sBjoXHXopcxku4oEag==
X-Gm-Gg: ASbGncsxmMxKOn53XH8LGgQ7Uf2jVFKoRRGNkniLfDqTzz3xr//Q3QYLukU2H/xzvC9
	HqE6kqZlH2R9nLAxihAwyfMEU+nAgaFr+L8AS8AX3qvg/1PyTrd1/CqfRVid8962GrVFaQzXNTR
	9UlIJtOHDD1/pUe0RxiNR2OeRp
X-Google-Smtp-Source: AGHT+IEKtK4jukB7pZR1vr0IrSA/aM19OAdKTzD/pr7UxYPNIzgDAPQULcMmbOB0w0xmqHdUOnRS72SuJYC/PLJ+qsk=
X-Received: by 2002:a05:6402:4588:b0:5db:731d:4456 with SMTP id
 4fb4d7f45d1cf-5de45085cc7mr4091276a12.28.1738939851829; Fri, 07 Feb 2025
 06:50:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121030628.113497-1-15645113830zzh@gmail.com>
In-Reply-To: <20250121030628.113497-1-15645113830zzh@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 7 Feb 2025 15:50:40 +0100
X-Gm-Features: AWEUYZkhjGPPkBAbJkpGD4Q0JB3ARoVuUQD_k1bNgxJA56sK71BYflLkdKH0KUw
Message-ID: <CAKfTPtBAxgBkH4f-c7sHQr1=E4oaFRnyY7+dh41_ONqi9MEKEQ@mail.gmail.com>
Subject: Re: [PATCH V1] sched: Cancel the slice protection of the idle entity
To: zihan zhou <15645113830zzh@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jan 2025 at 04:07, zihan zhou <15645113830zzh@gmail.com> wrote:
>
> A wakeup non-idle entity should preempt idle entity at any time,
> but because of the slice protection of the idle entity, the non-idle
> entity has to wait, so just cancel it.

Probably worth to add:
Fixes: 63304558ba5d ("sched/eevdf: Curb wakeup-preemption")

>
> Signed-off-by: zihan zhou <15645113830zzh@gmail.com>

I have been able to reproduce the problem with rt-app.

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Tested-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  kernel/sched/fair.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 3e9ca38512de..7777d110d053 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8851,8 +8851,19 @@ static void check_preempt_wakeup_fair(struct rq *rq, struct task_struct *p, int
>          * Preempt an idle entity in favor of a non-idle entity (and don't preempt
>          * in the inverse case).
>          */
> -       if (cse_is_idle && !pse_is_idle)
> +       if (cse_is_idle && !pse_is_idle) {
> +

remove blank line above

> +               /*
> +                * When non-idle entity preempt an idle entity,
> +                * don't give idle entity slice protection.
> +                */
> +               if (se->vlag == se->deadline)
> +                       se->vlag = se->deadline + 1;
> +
>                 goto preempt;
> +

remove blank line above

> +       }
> +
>         if (cse_is_idle != pse_is_idle)
>                 return;
>
> --
> 2.33.0
>
