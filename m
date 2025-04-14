Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC7B25D20B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744621767; cv=none; b=tWCEpP+7kvaBsIYUeSYrEfQgRYx05DrTSTa60a9povDbDm8SfVlJUqdgnrF3cizjsg+Ch8PjBUnt/EzpmkLqdM+RnBecbq7iSHYoSn/T7O6gnSnZ1jQZRLI39wxidvX8p3uxlAg95/txh6ed12WLNfRzZPzgtz6HGMyZvrv4c5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744621767; c=relaxed/simple;
	bh=XQMo0uczyPP0GXC+0WEdFqI0nC3jUulQ06qf2jkqAgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWxolMTuhvS0iCmzOqkUCYAUXfBopjBrorm13PSEcF6xYKd9xop3qg+HbHsPX2ZSKh/CXRSyodBxxiffzNQ+gKQGFcxnytoiCDkPYSt2P8PJOCIuuumvNekdelMuxExc1PrYZ8yi7p7foEL8QOmzM8sx94NvhlOIuf+S4wmQdP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P8CEMBt/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P8CEMBt/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744621764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Czg22D4jD5meostV/Wb/dw3xgxlk3uHhu2dp+mQ6LZE=;
	b=P8CEMBt/sFOEnOHprg4JWEwHxoRnXd9AJICzj7lBeW73ueEOKDu4clbbJFCrbEmyXpZBqW
	UyjSkVFXhrRoS99Wk8h8qUqhaOn4HcS9B8VqbWLI//kYwHmObRKcePwHjfR+f61QoKw0H+
	QZWKRgeWkyvEiUeI//zs89nsRTQKSZo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-AtiwVJ8kPgm7qKGOabSIyw-1; Mon, 14 Apr 2025 05:09:23 -0400
X-MC-Unique: AtiwVJ8kPgm7qKGOabSIyw-1
X-Mimecast-MFC-AGG-ID: AtiwVJ8kPgm7qKGOabSIyw_1744621762
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so21192635e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744621762; x=1745226562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Czg22D4jD5meostV/Wb/dw3xgxlk3uHhu2dp+mQ6LZE=;
        b=DupdN5kaKPzEfg+oTBcFQ51UYyIS6emVnLsBjRUQ0yI9Dz0KEJdLmHa4jqdbizkIqD
         ZxGfResv1EG2EZBU03sWf1yT2fYROgRhhVTzCcForbJMKirq7Hlfwthum9GW35+9l+ve
         9Vmcivv6jZheRtn8ZsEshVSEJdEJhWbiQkuU6UdzXqL5325fUf+q3dCFHsPGUtiRGrFu
         yyJn2l7MajOIEWVT/Qhvm+HlpbHpyG9YxcGYqV39fPZQbrF4Z6s5+UgJQx3RSUrabJSo
         QSeK97TsF0XTj2vQdFCAcMJu4ikwu8UbV6x8YyMUmvG+u7ZZ4buEDru4qIwgAdnxJaXO
         WIUg==
X-Gm-Message-State: AOJu0YwxNpzZZdl+6zwfg+dj4opoDBvEHYu8EiNfiDNvwVnVquoBNQFW
	FpjJ6nXki8zGzy+E3PRScLmeehPWXFi7ec+mO+I9/0BdQeOYvtp0pXPspyjL1kTjy080zAecxk8
	rkfLPPBUThhrCgYH+RztXnhLE+xk/Uk50TkNyMUJaQvgoi3qjaxkkQeTytky4ng==
X-Gm-Gg: ASbGncv+SbdiBRrQBy9DNP+b/dlDwwfV6BRiYfI+1ZvPEnkmXgr8nW4t/dg6uyCPTMt
	4Tjx6sJNkBXMqieTDXzVlceE+BEGVulk1l7VS52NYtJCQMC6NJtz0gcvFnJvgaNlLCBCkuAdHLn
	gzWmbvczsId9lyLEgpTww7YBKkd1wfw0KlQDpj1G7R4/khYdWz/XKKMNMYipxb8nF7asqBlekqb
	0lKQbewWWy4fGoAWSVxKTBjB4jqu0C1CWzFeFXBW7oAqTfTaqBqOGdAv9GGlrV3mDsRJLkNMGMF
	XHHuU42hcIRyhWGhFCf18QANYz+WsTSrXCFSl2L0
X-Received: by 2002:a05:600c:5251:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-43f3a93f77fmr88615885e9.14.1744621761983;
        Mon, 14 Apr 2025 02:09:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0R3zHohnMc/AUPNjmdF9kk37P9530AK5pzqcjNIDCtiicbg2J1qwMvKIIfrJJNKzlTULYxg==
X-Received: by 2002:a05:600c:5251:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-43f3a93f77fmr88615505e9.14.1744621761424;
        Mon, 14 Apr 2025 02:09:21 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.85.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d14fsm174055645e9.21.2025.04.14.02.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 02:09:20 -0700 (PDT)
Date: Mon, 14 Apr 2025 11:09:18 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Valentin Schneider <valentin.schneider@arm.com>,
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
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com,
	Connor O'Brien <connoro@google.com>
Subject: Re: [PATCH v16 3/7] locking/mutex: Add p->blocked_on wrappers for
 correctness checks
Message-ID: <Z_zQvuPOlMj3oM3z@jlelli-thinkpadt14gen4.remote.csb>
References: <20250412060258.3844594-1-jstultz@google.com>
 <20250412060258.3844594-4-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412060258.3844594-4-jstultz@google.com>

Hi John,

On 11/04/25 23:02, John Stultz wrote:
> From: Valentin Schneider <valentin.schneider@arm.com>
> 
> This lets us assert mutex::wait_lock is held whenever we access
> p->blocked_on, as well as warn us for unexpected state changes.
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
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
> [fix conflicts, call in more places]
> Signed-off-by: Connor O'Brien <connoro@google.com>
> [jstultz: tweaked commit subject, reworked a good bit]
> Signed-off-by: John Stultz <jstultz@google.com>
> ---

...

> +static inline struct mutex *__get_task_blocked_on(struct task_struct *p)
> +{
> +	return READ_ONCE(p->blocked_on);
> +}
> +

Shouldn't we check that wait_lock is held also when reading blocked_on?
And, if that's the case, why do we use READ_ONCE?

Thanks,
Juri

