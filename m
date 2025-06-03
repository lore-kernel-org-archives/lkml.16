Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CA472605
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 16:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748966601; cv=none; b=q0M79Z+koeWFoOXIE2fAcuMEWE44zLZbjTeIvHwAzd42yVsl2kH4129kfgfo5NHPPWdBiFquxqOQvPxj/vHCCdubJ5PMdhWOLdAZl6lKmZmjYmg4j8EcVpglMb5LSL7FKtYvHuY94p/RBMt4tROsLyIdQK1rKVLDJ7apDywKrvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748966601; c=relaxed/simple;
	bh=knSj3NbeikygZGbd1cxvNAGNbb8vKFa4XVGYwGg+RS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggBsZArkX9kWQYVEP8WVy9tHttvrVpDPhx3wDek7AOp+RQi7Y+AsqOrYdUYKYHOhdUYR9OJHDzKXh5dAsuhR1+R70yehExz4O9HGh8QTk7NfDvz6q+neULn2jdavaZJMiRJjr4UZCtkLwhrnEKW8LxQ1uSlRKsIottyioxWM08s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YGcCGo0Z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YGcCGo0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748966598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J0EWdXU0K1X/uAa5HQxhn+h9TH5/I1rQD+rgdNV3d/w=;
	b=YGcCGo0Z1BT/slMpHJflLdXsBMfkABW6CeHJdLqkqKH+d7NZuGPM+ytJzGFznudJUD2Tct
	F8FPEX5zFE4aK0m7qexEL5envSwEaNNiz/sipfX3RSYoWQQ0AUAxpVVfMSh8dFZ/Xr6qx2
	AgS//j3zikID26hMMKTKZjWQH0LJaYQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-HFpyyGL4Oh2cBx8J5QTpEQ-1; Tue, 03 Jun 2025 12:03:17 -0400
X-MC-Unique: HFpyyGL4Oh2cBx8J5QTpEQ-1
X-Mimecast-MFC-AGG-ID: HFpyyGL4Oh2cBx8J5QTpEQ_1748966596
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d30992bcso23459805e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 09:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748966595; x=1749571395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0EWdXU0K1X/uAa5HQxhn+h9TH5/I1rQD+rgdNV3d/w=;
        b=Sj1+fiJAbkubgbxXRMLvKIIRwfdM7tSc0chWBhZFXI7dvWB6WVhNLz9I9KlKY9gkl5
         AeEjVpTnc4eFJoXFevLKKsowz6piM7Vjb3VltGb8pSSLUdHgjuo1hwU+roxm99bGkRke
         0NgC1gYgRuE7dxwA1oJz9cxEElL8TxHdWXXeb3qvs3FtmcYF5NGbPcs6a3P7iWOVYbT2
         I+nQ7KSQnh68776pC3O8b6h22GT05WZEwZewU/G/HDP48OuuI/DbMdc/tHyk4PDS4cy2
         UYKbTIGecZgQRUda4wuT5jTZPCtV6080Y2YzOzcMi6l1M5O6b7RIA3Z5+mT+kCSxDV0a
         M8YA==
X-Forwarded-Encrypted: i=1; AJvYcCXZnO9HtA88cOfJLT+LoDIAxrUnNQkdD4atLVr2+UPmjpn20WTcttwGM1LlqrKQfzGPlAVXxcbI6ICTVWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQKxO8dHiq14mAnOmi29OarAlmVki8TIdAaxZOIB6bJMzc4UTc
	qkyk/OIsif/9UPNvLUIpP3e88j2bOHmq6Aeqzc/DNGFsY2yxobyXS9GGN48lez5AgnMJZbTxuSj
	COxjOtCh/bL5c27pwZdO/FFFflQB3/xHYPk39p2yMldsSNRjLu5OmwlhnRayOnURWG3xw5plM1g
	==
X-Gm-Gg: ASbGncvetxsm6bWoyISqdbnUBfi+B1zfIwL8OB2Qhi4nHQ47ZsiNFYixMsm2vX8J3lE
	SZRRb6P8YoF2Sm8F2eOrh/iSncyzrOuXSYFf+4oj1l0rLGoGZjbIOpnPRIGhF4RnjajKFhhXupH
	J1VnUpAGZcGqVd5+HDqp4lauS12IE3gqqNRYP1TDC95TkT4aG4Hb1xqQ5CYjEzA4Zm1UHOqW8se
	ZWwJ8I/OBez4hjMut1zshyuw0b1jIze5V766Qzb1M8mNYNO94H20tY2/rtg5mZPLjCuT5+DE7AP
	fAMS5GBwlQCk3AWi/GR9KJ4r9ZTwr8PMddP6GL8IMeq7UBc0L8Ki
X-Received: by 2002:a05:600c:4f05:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-4511ee13fb8mr133196105e9.18.1748966595179;
        Tue, 03 Jun 2025 09:03:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjFzpnoJ0+xZRxLHCD+pKtkr4O7XSeUbHv7tyS5eTBOTl3pz4pPtkQK7Zu3+n7pTAjl3Iing==
X-Received: by 2002:a05:600c:4f05:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-4511ee13fb8mr133195255e9.18.1748966594607;
        Tue, 03 Jun 2025 09:03:14 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.57.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c94dsm18914104f8f.37.2025.06.03.09.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 09:03:14 -0700 (PDT)
Date: Tue, 3 Jun 2025 18:03:12 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, clm@meta.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 1/5] sched/deadline: Less agressive dl_server
 handling
Message-ID: <aD8cwJGQz6iCjhwz@jlelli-thinkpadt14gen4.remote.csb>
References: <20250520094538.086709102@infradead.org>
 <20250520101727.507378961@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520101727.507378961@infradead.org>

Hi,

On 20/05/25 11:45, Peter Zijlstra wrote:
> Chris reported that commit 5f6bd380c7bd ("sched/rt: Remove default
> bandwidth control") caused a significant dip in his favourite
> benchmark of the day. Simply disabling dl_server cured things.
> 
> His workload hammers the 0->1, 1->0 transitions, and the
> dl_server_{start,stop}() overhead kills it -- fairly obviously a bad
> idea in hind sight and all that.
> 
> Change things around to only disable the dl_server when there has not
> been a fair task around for a whole period. Since the default period
> is 1 second, this ensures the benchmark never trips this, overhead
> gone.
> 
> Fixes: 557a6bfc662c ("sched/fair: Add trivial fair server")
> Reported-by: Chris Mason <clm@meta.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  include/linux/sched.h   |    1 +
>  kernel/sched/deadline.c |   31 +++++++++++++++++++++++++++----
>  2 files changed, 28 insertions(+), 4 deletions(-)
> 
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -702,6 +702,7 @@ struct sched_dl_entity {
>  	unsigned int			dl_defer	  : 1;
>  	unsigned int			dl_defer_armed	  : 1;
>  	unsigned int			dl_defer_running  : 1;
> +	unsigned int			dl_server_idle    : 1;
>  
>  	/*
>  	 * Bandwidth enforcement timer. Each -deadline task has its
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1215,6 +1215,8 @@ static void __push_dl_task(struct rq *rq
>  /* a defer timer will not be reset if the runtime consumed was < dl_server_min_res */
>  static const u64 dl_server_min_res = 1 * NSEC_PER_MSEC;
>  
> +static bool dl_server_stopped(struct sched_dl_entity *dl_se);
> +
>  static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_dl_entity *dl_se)
>  {
>  	struct rq *rq = rq_of_dl_se(dl_se);
> @@ -1234,6 +1236,7 @@ static enum hrtimer_restart dl_server_ti
>  
>  		if (!dl_se->server_has_tasks(dl_se)) {
>  			replenish_dl_entity(dl_se);
> +			dl_server_stopped(dl_se);
>  			return HRTIMER_NORESTART;
>  		}
>  
> @@ -1639,8 +1642,10 @@ void dl_server_update_idle_time(struct r
>  void dl_server_update(struct sched_dl_entity *dl_se, s64 delta_exec)
>  {
>  	/* 0 runtime = fair server disabled */
> -	if (dl_se->dl_runtime)
> +	if (dl_se->dl_runtime) {
> +		dl_se->dl_server_idle = 0;
>  		update_curr_dl_se(dl_se->rq, dl_se, delta_exec);
> +	}
>  }
>  
>  void dl_server_start(struct sched_dl_entity *dl_se)
> @@ -1663,7 +1668,7 @@ void dl_server_start(struct sched_dl_ent
>  		setup_new_dl_entity(dl_se);
>  	}
>  
> -	if (!dl_se->dl_runtime)
> +	if (!dl_se->dl_runtime || dl_se->dl_server_active)
>  		return;
>  
>  	dl_se->dl_server_active = 1;
> @@ -1672,7 +1677,7 @@ void dl_server_start(struct sched_dl_ent
>  		resched_curr(dl_se->rq);
>  }
>  
> -void dl_server_stop(struct sched_dl_entity *dl_se)
> +static void __dl_server_stop(struct sched_dl_entity *dl_se)
>  {
>  	if (!dl_se->dl_runtime)
>  		return;
> @@ -1684,6 +1689,24 @@ void dl_server_stop(struct sched_dl_enti
>  	dl_se->dl_server_active = 0;
>  }
>  
> +static bool dl_server_stopped(struct sched_dl_entity *dl_se)
> +{
> +	if (!dl_se->dl_server_active)
> +		return false;
> +
> +	if (dl_se->dl_server_idle) {
> +		__dl_server_stop(dl_se);
> +		return true;
> +	}
> +
> +	dl_se->dl_server_idle = 1;
> +	return false;
> +}
> +
> +void dl_server_stop(struct sched_dl_entity *dl_se)
> +{
> +}

What if we explicitly set the server to idle (instead of ignoring the
stop) where this gets called in dequeue_entities()? Also, don't we need
to actually stop the server if we are changing its parameters from
sched_fair_server_write()?

Thanks,
Juri

