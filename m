Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5338488
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086209; cv=none; b=BC2i9I9+D7XuHoBE3ND3PDmIU+lvA683tx8AwGdR0QigV5KvuddAMzvDamW/k8y812vDov9FGNZrsFu2PzmXV95+KYlTiUqzFJ/f1mH7HcWfQ3qQLudzE2NJtnCDEK6nJOlANzw4BSJkeh9xO17v1JLQnaqJ7XHgJfan8WwhTT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086209; c=relaxed/simple;
	bh=e5F1aOa3RrSK6iAyhspfEJImDBt+2gR+i4w8AqNF7bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOvko8XJ+A9UADmxn9vhOsK9elNHT6tA5DYy0QiwXBv7gokR2ZMugP0qmaZgBbzEYBwenwSCBi+7RCatEkmdr4Np6ThfuvSIbni45DXW4vyZaPvgpga++HCsYUUzn51Twhek9DU0ETu9CJqAXrlX2Nhy4vAb5TZCEeRN59QYAzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iVWlI9gH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iVWlI9gH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750086206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EcC4byrcEUPIdKwUEd3oRWjU7qMWY/kqFoLn+sap6V0=;
	b=iVWlI9gHv2QeXgkY92CizPX7/MEKb/RKJffqGT7wr16KSExUWYx0+sca2jqJ7Ihw4TBZ6q
	KnQ2Lrcw0l879SM7YqL8N3DcTVuVNWyhN82pkoPgYSMkRK/O+tJuEm3lLdE3sz/BDHbhKP
	x4wR/7qAl6jRcRUq2vxBGIRTwSmLgZs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-IuOGSxFWMIaC31kbjJQv1Q-1; Mon, 16 Jun 2025 11:03:25 -0400
X-MC-Unique: IuOGSxFWMIaC31kbjJQv1Q-1
X-Mimecast-MFC-AGG-ID: IuOGSxFWMIaC31kbjJQv1Q_1750086204
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450cb8f8b1bso9534685e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086204; x=1750691004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcC4byrcEUPIdKwUEd3oRWjU7qMWY/kqFoLn+sap6V0=;
        b=Cw55eXEnkz1uQtN6eUCE87J8iZywbb7rKeSguv0weNEdfvvXI545PIJrmxEtrLN4Wi
         dASEJsD3GIoZl2jhVfjRmSrsDY6fiwzkqcEG58RRq72jVppLg6BbRxzUFKgd2jHPUVyp
         N+oOvwkSJxz+WHPfryl7HwOc5FKG5noAIAwoBC5AqOt6UkTliC9C8Z9i9ctjvD91eOmi
         g10WZ1FgigagN2+Aro+Wtuy1SdX4H6NieOgpZkvMbgGnVZBF/O8aOBbumHtxgHsoZ+At
         HV2C+sSsHCzuz4ZVzEC/oXYXk0GzoRfRn7rhEjPbr1Qcpb+70cI/CbZnUzp9tZNrvROx
         k7ag==
X-Forwarded-Encrypted: i=1; AJvYcCV5x0uT+sNet9QCn/41XBI2dTZLTfZSaCLB5IOeEsJlMfBTkXXNWqQcf51ZATpTm9p8AthBAkW8LgySrvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLaSQuqlus4h8eslE3wI7Nb7mWnEKrc5ssGXttOh8bYi9OOO3A
	lJLaWm2Nb1oa6A3s6Q/ZYVpp28V16MCmGASZ7J3+qVtKoOVKmyD4yso0KQpY9h61cKZcdsZlUe+
	XtsW3yiVXxxBWszRe+Yz7S7jBx5CGg+Ovtz/rF0fVxZm/TBcAQbVe6h+0Rjp+n4lFjg==
X-Gm-Gg: ASbGncuY3gkWEwX3yIPNYg89d3JQ0YiuOPL4IydzV72RhiSQQUYKLzSFIfAPpvN2Vxx
	COjrl4xUNz6iPiNABiMLmKuR0F4GIVmtG0iYvlPFCHtJgh6cKdw/z4a52rgwoJFe4TohdHsEEVg
	3p0rMbbMAIEmkft1ErQfm0FwJF5Vw6Oni9cZu5KeGadbREnwZxo4zZq36PsSFg67Ob1XwLOBzTq
	vTflz/VDtWPp4pyDng1DEdQ+pjmiaC+Qc1lvftWCvilgYDo7jGvO9q0kKunOKJlw8M9GgVTciYq
	f6iM5pDINLPuJ63vShtWr7190BKdyz+CRfptC+c7WbPb+iMMaYiYig==
X-Received: by 2002:a05:600c:1c0b:b0:453:1058:f8aa with SMTP id 5b1f17b1804b1-453418d1130mr80887075e9.15.1750086202702;
        Mon, 16 Jun 2025 08:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwbopF1lAROE8wS+9Rv9HcGYsH05oxJyFYV2hv8O12MmuXoDowsfWwuiEaJ3XXZOmwYHksiA==
X-Received: by 2002:a05:600c:1c0b:b0:453:1058:f8aa with SMTP id 5b1f17b1804b1-453418d1130mr80885955e9.15.1750086201916;
        Mon, 16 Jun 2025 08:03:21 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.151.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8f2e0sm145748335e9.8.2025.06.16.08.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:03:21 -0700 (PDT)
Date: Mon, 16 Jun 2025 17:03:19 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	jstultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH 1/1] sched/deadline: Fix RT task potential starvation
 when expiry time passed
Message-ID: <aFAyN4rfssKmbUE5@jlelli-thinkpadt14gen4.remote.csb>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615131129.954975-1-kuyo.chang@mediatek.com>

Hello,

On 15/06/25 21:10, Kuyo Chang wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
> 
> [Symptom]
> The fair server mechanism, which is intended to prevent fair starvation
> when higher-priority tasks monopolize the CPU.
> Specifically, RT tasks on the runqueue may not be scheduled as expected.
> 
> [Analysis]
> ---------
> The log "sched: DL replenish lagged too much" triggered.
> 
> By memory dump of dl_server:
> --------------
>     curr = 0xFFFFFF80D6A0AC00 (
>       dl_server = 0xFFFFFF83CD5B1470(
>         dl_runtime = 0x02FAF080,
>         dl_deadline = 0x3B9ACA00,
>         dl_period = 0x3B9ACA00,
>         dl_bw = 0xCCCC,
>         dl_density = 0xCCCC,
>         runtime = 0x02FAF080,
>         deadline = 0x0000082031EB0E80,
>         flags = 0x0,
>         dl_throttled = 0x0,
>         dl_yielded = 0x0,
>         dl_non_contending = 0x0,
>         dl_overrun = 0x0,
>         dl_server = 0x1,
>         dl_server_active = 0x1,
>         dl_defer = 0x1,
>         dl_defer_armed = 0x0,
>         dl_defer_running = 0x1,
>         dl_timer = (
>           node = (
>             expires = 0x000008199756E700),
>           _softexpires = 0x000008199756E700,
>           function = 0xFFFFFFDB9AF44D30 = dl_task_timer,
>           base = 0xFFFFFF83CD5A12C0,
>           state = 0x0,
>           is_rel = 0x0,
>           is_soft = 0x0,
>     clock_update_flags = 0x4,
>     clock = 0x000008204A496900,
> 
> - The timer expiration time (rq->curr->dl_server->dl_timer->expires)
>   is already in the past, indicating the timer has expired.
> - The timer state (rq->curr->dl_server->dl_timer->state) is 0.
> 
> [Suspected Root Cause]
> --------------------
> The relevant code flow in the throttle path of
> update_curr_dl_se() as follows:
> 
> dequeue_dl_entity(dl_se, 0);                // the DL entity is dequeued
> 
> if (unlikely(is_dl_boosted(dl_se) || !start_dl_timer(dl_se))) {
>     if (dl_server(dl_se))                   // timer registration fails
>         enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);//enqueue immediately
>     ...
> }
> 
> The failure of `start_dl_timer` is caused by attempting to register a
> timer with an expiration time that is already in the past. When this
> situation persists, the code repeatedly re-enqueues the DL entity
> without properly replenishing or restarting the timer, resulting in RT
> task may not be scheduled as expected.
> 
> [Proposed Solution]:
> ------------------
> Instead of immediately re-enqueuing the DL entity on timer registration
> failure, this change ensures the DL entity is properly replenished and
> the timer is restarted, preventing RT potential starvation.
> 
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> ---
>  kernel/sched/deadline.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..e50cb76c961b 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1556,10 +1556,12 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
>  		}
>  
>  		if (unlikely(is_dl_boosted(dl_se) || !start_dl_timer(dl_se))) {
> -			if (dl_server(dl_se))
> -				enqueue_dl_entity(dl_se, ENQUEUE_REPLENISH);
> -			else
> +			if (dl_server(dl_se)) {
> +				replenish_dl_new_period(dl_se, rq);
> +				start_dl_timer(dl_se);

But, even today, enqueue_dl_entity() is called with ENQUEUE_REPLENISH
flag, so I don't get why you say 're-enqueues the DL entity without
properly replenishing'.

Also, why restarting the replenishing timer right after having
replenished the entity?

Thanks,
Juri

