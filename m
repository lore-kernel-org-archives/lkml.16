Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D8E25DCE0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621207; cv=none; b=kmAZqqfX6Di7CZt69ma1W4ELNAdZFXAGOhxET0CR91l7j9PxtfNk8QoVq5V69z2bXXOcPL6L3Fqbm1xYOuTEd5F2K1M4CC+gc+3PporEM2pGm6D8i6uxK1bcvWNEY7RCFjIMIPSEkurr7YwugmMV5CIZ9av5Zp6lVgIlgo5N828=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621207; c=relaxed/simple;
	bh=PvGqL4O1OLy4ifh5qRpZDBYU1EkkpzjqjFMLx7gh7CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8SQ12Skf7MGS1Ze2rC6CHPrgpTTSAhzd09yNEMZ1Oco0nZ7c71xRqFMy9redDVpxaYbH4nBqei1Zlr/qRr8XDb53LYjhcegGHFUsXSyIAixgmmQDmcihMsfvtmgHmGL2YLwi5D+UTAlTlNFNFYHURqo0FaHyV0Jfqi5dJA2y1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EDwxmKzp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EDwxmKzp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744621204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NdWN/NxaGnt1yKXqdPyKDsgh7jVEW6bGet4uGWn6XvI=;
	b=EDwxmKzpPNRsRlWCrpRPRvNOXpINquXnCdPipEdLrWY/olxGUrQPb1g/TPfc7PdZppCqCe
	vTrxieBdtocZZ0AeWCBvEEFQa/GoEiKDjXVk3sRGGGunCSK6yVKrnHy5QLk94r52d8g/BJ
	IpcgMZIh311SKpgWXPxf+VAMtDFp9HQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-BmlHdFqeOaSy_GP3sv05bQ-1; Mon, 14 Apr 2025 05:00:03 -0400
X-MC-Unique: BmlHdFqeOaSy_GP3sv05bQ-1
X-Mimecast-MFC-AGG-ID: BmlHdFqeOaSy_GP3sv05bQ_1744621202
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso25814045e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744621202; x=1745226002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdWN/NxaGnt1yKXqdPyKDsgh7jVEW6bGet4uGWn6XvI=;
        b=cureHC4ACme2jxgtnPRrnSkkWIPSC95zkZ7ZEShoOxrKwyfDuPuwVfTu1o2TprNc9X
         rmlgdyt069xedHOfpgz14HlcZQz2fQkMVL6M6pBuPimpVkddfvD8Oz5dnFP4Kl4PP1On
         uHcKJqL4sDY+t7rmI9e4kUVi8X2OIhrAZ7W4xp7RiI9AXKccZzSQ4lYshFjtbu3sBigs
         iWBUMjZApZbSWUnwgGRQyhseOE46eeIzCj6hy/FBSAxhRSwIYPKy8maTkvhMgrwZGRhs
         7w9W7snVf7lgMeJuDk433VB2rfSjN27Ph2MoXTPjAm6YoiLirEFuLD5Y3xzB+gZDCtYJ
         DztA==
X-Gm-Message-State: AOJu0Ywr94JxcPCmD5MbwmgnjPotcjcL/lz//DqHomaktlUYHFXp15FS
	LSk+zxy1dWH7u09hchQmpAiJFhDg/PYO9G4GU4iGWKA5TpyWPQmPL6OwoHwfwtVJVJloWWEk3pZ
	DLIGoyHvzlar4DWu0CGqUKCx13suz5oybtl7GFts5Rlc2x0WYiompz5S0ys2NcA==
X-Gm-Gg: ASbGnctdnkrlxsA4KAhvWTbtUOjmQV8iS9Mcg5akvutKpwLiLRh5o8kTuEZ594USbPg
	vIsOMpysV9Sh9C3GRL1z+zaTmLdaKT1ZCIYkf63t/SNJnd25B59u5doIvgLDL3w4pHZSzj0ho9f
	HbFF2MOQhYyn3tcXBRbbjhlRk7vCR63ycYQqQTlkbxAaLgQEA+UU/f3HGKBMDX4TiFY3zWslJ5o
	ywN9+z5ieCy9vx00w59jP0Amec/vqO7+15G10k419vGbthZxeYBwD2UiMy9/IHyczjHZM7KZdSJ
	p03YxtsyK+MFjKWu6L0Dq8m9jO5hBG7oyvzvYX8s
X-Received: by 2002:a05:600c:1c03:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-43f3a928905mr101284115e9.2.1744621201639;
        Mon, 14 Apr 2025 02:00:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg2a0HvKZnADIMyJ+IbUmjU+S2y9m9IoUEv5JJGIT+Bta9Kl7IJhueUJwesfMoku6hN5neWw==
X-Received: by 2002:a05:600c:1c03:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-43f3a928905mr101283555e9.2.1744621201165;
        Mon, 14 Apr 2025 02:00:01 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.85.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d26bsm175443945e9.22.2025.04.14.01.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 02:00:00 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:59:58 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com,
	Connor O'Brien <connoro@google.com>
Subject: Re: [PATCH v16 2/7] locking/mutex: Rework task_struct::blocked_on
Message-ID: <Z_zOjrlVng8eyFDh@jlelli-thinkpadt14gen4.remote.csb>
References: <20250412060258.3844594-1-jstultz@google.com>
 <20250412060258.3844594-3-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412060258.3844594-3-jstultz@google.com>

Hi John,

On 11/04/25 23:02, John Stultz wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> Track the blocked-on relation for mutexes, to allow following this
> relation at schedule time.
> 
>    task
>      | blocked-on
>      v
>    mutex
>      | owner
>      v
>    task
> 
> This all will be used for tracking blocked-task/mutex chains
> with the prox-execution patch in a similar fashion to how
> priority inheritance is done with rt_mutexes.
> 
> For serialization, blocked-on is only set by the task itself
> (current). And both when setting or clearing (potentially by
> others), is done while holding the mutex::wait_lock.
> 
> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Cc: Qais Yousef <qyousef@layalina.io>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Zimuzo Ezeozue <zezeozue@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Will Deacon <will@kernel.org>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Metin Kaya <Metin.Kaya@arm.com>
> Cc: Xuewen Yan <xuewen.yan94@gmail.com>
> Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Suleiman Souhlal <suleiman@google.com>
> Cc: kernel-team@android.com
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> [minor changes while rebasing]
> Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Connor O'Brien <connoro@google.com>
> [jstultz: Fix blocked_on tracking in __mutex_lock_common in error paths]
> Signed-off-by: John Stultz <jstultz@google.com>
> ---

...

> @@ -940,6 +954,14 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
>  		next = waiter->task;
>  
>  		debug_mutex_wake_waiter(lock, waiter);
> +		/*
> +		 * Unlock wakeups can be happening in parallel
> +		 * (when optimistic spinners steal and release
> +		 * the lock), so blocked_on may already be
> +		 * cleared here.
> +		 */
> +		WARN_ON(next->blocked_on && next->blocked_on != lock);
> +		next->blocked_on = NULL;

Here and below, why the WARN_ON() if the fact that blocked_on has been
cleared already it's an OK situation? Ah, maybe it's catching the more
worrying situation that the lock has changed since the task blocked?

>  		wake_q_add(&wake_q, next);
>  	}
>  
> diff --git a/kernel/locking/ww_mutex.h b/kernel/locking/ww_mutex.h
> index 37f025a096c9d..00db40946328e 100644
> --- a/kernel/locking/ww_mutex.h
> +++ b/kernel/locking/ww_mutex.h
> @@ -284,6 +284,14 @@ __ww_mutex_die(struct MUTEX *lock, struct MUTEX_WAITER *waiter,
>  #ifndef WW_RT
>  		debug_mutex_wake_waiter(lock, waiter);
>  #endif
> +		/*
> +		 * When waking up the task to die, be sure to clear the
> +		 * blocked_on pointer. Otherwise we can see circular
> +		 * blocked_on relationships that can't resolve.
> +		 */
> +		WARN_ON(waiter->task->blocked_on &&
> +			waiter->task->blocked_on != lock);
> +		waiter->task->blocked_on = NULL;
>  		wake_q_add(wake_q, waiter->task);
>  	}

Thanks,
Juri

