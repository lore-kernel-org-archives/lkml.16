Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194AA78F4C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620644; cv=none; b=CyHRWMgm0aJGS2gHeyJM1lasIvqk1ZF4Lr1ZtEKSJqUphcsNNYNdygoMq+uygm6LLompD/9q38ts5jehWIF0bJtACj38ZT38YvkccJTVOhaxEO+cnZTGy/k/5+HR9bDEcmWKNI6ezy+W4u2ZT+t/OYCnizeFNskksMWClgP+hsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620644; c=relaxed/simple;
	bh=0VKYswqLdbiZiI+MbwnjMwe1w3Xq13dTTf33YFstXOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKKZ06AXQyhxKIEsS9m9x4uNCdc7APKiuPMosNGtAyXlFcgcKjcGr9YYti/l3UD61nAfCLl4z8gWSUQkL3ugH1HXFVaKQH2utXac7fS5icMTDet5VZh9ZzvYrUEPLPEqnYeLybwR41P3Wtr8R/qRuk3jiQZBBpvwbirRIsJbnp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hIA+/1k8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hIA+/1k8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744620641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z5bbOjhNOCzRYNXP1twa6dRrZQXmxs4+zG3tR82kWo=;
	b=hIA+/1k8FYA4JM0JYOcBNXWg55Bew9K5Hmhc9ZNHow+ws0j7cK9O2ho4gPqcxQVcXQKbG0
	v6cnmz8L5a2JYsh4NTjiHxJbeDhRpLO0TnugV/FGYhIG1KoTTF5OhTWxYDI2KDbJPp4jta
	CndUqLlxnw1z7Wkmp6QdaehClbZWZ64=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-lT9Po7mJNBOZQvttutTLlQ-1; Mon, 14 Apr 2025 04:50:40 -0400
X-MC-Unique: lT9Po7mJNBOZQvttutTLlQ-1
X-Mimecast-MFC-AGG-ID: lT9Po7mJNBOZQvttutTLlQ_1744620639
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so29044245e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 01:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744620638; x=1745225438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Z5bbOjhNOCzRYNXP1twa6dRrZQXmxs4+zG3tR82kWo=;
        b=gljNP3yfLgWtA+qCi9bgd8lHdfUbFsizPEppsS56V0OXtBylgIB+5MnxUpC5jz+pr8
         mrnaDAhEPKzEdPgm2sf3AW7KPYCH6uHHQIC9HI+nV0npD4hx49jzD3diu6sReWd9ExxA
         t/6BIBC7riR9KTQCKei0mHAo3Wlr8hcuuFl7ZaVSbbwA1asek1ttuBOPBkIT4cCjzbte
         amGCycNRLVLiRducFFMtoYnFnINeu0ktNGsvlo082WnDHYO9PopnBwIxrNM9Ua+gny3M
         Yv8U8BhRkfbvkZiFQ7mGDXMIDg6fZdgNmRAHj8yIXqUb98la0sCAZ0l01NneydHLxb7m
         tU8Q==
X-Gm-Message-State: AOJu0YzrXSAL6PyjFMphBHfW8Tmwwk2C+Q+5iakA17m5/YVxsAW8MUFY
	oGfFKrYjt1xEVC57xsDegoXsvXgRMKhM44n/STGBH8CIEE7PaIYjFeVDi+sKYKDgsHgbKS/bW0D
	IgqpZ81jzKqxIKoF+/zucYjR2ADgmeBOTW91ZbKwzlw4mv1GY3l4OYBcskBAPzXF4ZJTnT1Bp
X-Gm-Gg: ASbGncu1DGuVk6yS3WhzJrnp1j9FWlVqSi0qKenPSjj1Cw0WeY441Mlgaa6NikVhdGX
	OENGAtBbPY8b1U14CQyjfJGv3XTmB9+KsPcK7tppWebUSULA1sRO1b1LhR3MCxLy9extowCXVPL
	k2r6L90/2Q15PS6DL8g5BB74ECRrim8NcjVUlI5+rkCgZgmilZPaDe16wqK4+qRAPvI80oRLDcm
	AK6Nhm9Yy2sG0rB3pvXoHGsa+5Rs2TXvwEwxfiefgcOts3MzjWU9Tzw+c7TxKfDryRfTwPRoeoh
	++W/OhxsL0jLCCiOaOLfR11zZH4vavT8vWEJuOte
X-Received: by 2002:a05:600c:3b19:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-43f3a92568amr113998185e9.2.1744620637798;
        Mon, 14 Apr 2025 01:50:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpve04R3TxjpvXzbv3NgiIxm8BakS/C3W2tRay25c3x4uByi3gKb2j/rsdBX8DlMIT6z4MBg==
X-Received: by 2002:a05:600c:3b19:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-43f3a92568amr113997755e9.2.1744620637336;
        Mon, 14 Apr 2025 01:50:37 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.85.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207aed49sm170281115e9.34.2025.04.14.01.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 01:50:36 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:50:34 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
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
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Subject: Re: [PATCH v16 1/7] sched: Add CONFIG_SCHED_PROXY_EXEC & boot
 argument to enable/disable
Message-ID: <Z_zMWkvtACZxahu-@jlelli-thinkpadt14gen4.remote.csb>
References: <20250412060258.3844594-1-jstultz@google.com>
 <20250412060258.3844594-2-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412060258.3844594-2-jstultz@google.com>

Hi John,

On 11/04/25 23:02, John Stultz wrote:
> Add a CONFIG_SCHED_PROXY_EXEC option, along with a boot argument
> sched_proxy_exec= that can be used to disable the feature at boot
> time if CONFIG_SCHED_PROXY_EXEC was enabled.
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
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Signed-off-by: John Stultz <jstultz@google.com>
> ---

...

> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 47972f34ea701..154f0aa0c6322 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1149,10 +1149,15 @@ struct rq {
>  	 */
>  	unsigned int		nr_uninterruptible;
>  
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +	struct task_struct __rcu	*donor;  /* Scheduling context */
> +	struct task_struct __rcu	*curr;   /* Execution context */
> +#else
>  	union {
>  		struct task_struct __rcu *donor; /* Scheduler context */
>  		struct task_struct __rcu *curr;  /* Execution context */
>  	};
> +#endif
>  	struct sched_dl_entity	*dl_server;
>  	struct task_struct	*idle;
>  	struct task_struct	*stop;
> @@ -1347,10 +1352,17 @@ DECLARE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
>  #define cpu_curr(cpu)		(cpu_rq(cpu)->curr)
>  #define raw_rq()		raw_cpu_ptr(&runqueues)
>  
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +static inline void rq_set_donor(struct rq *rq, struct task_struct *t)
> +{
> +	rcu_assign_pointer(rq->donor, t);
> +}
> +#else
>  static inline void rq_set_donor(struct rq *rq, struct task_struct *t)
>  {
>  	/* Do nothing */
>  }
> +#endif

Does this chunk belong here?

Thanks,
Juri

