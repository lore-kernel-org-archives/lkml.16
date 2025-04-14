Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7738F1A83E8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744623725; cv=none; b=uLfHruVDLzTM9QP3Qb6xHQbGoVanXIFECnvX45kRfvC1Ksm15qR8SsGdj5Iqw2scMdVW0VO4tTb/k113ajui/ESczb9AQ8i4ou4iJ24vbGgt7AAeWU4dndkVFuTgp4sutjXz4xrDblQstGoC/XvwmIw1+822zMQmzeVXlFjBKw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744623725; c=relaxed/simple;
	bh=4RJpB0q5NaWPN8EEvbrCWUeXezOsr2VYL1mVYllqRas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PE1XzdqO2M/nVJW+KSBPbqaL3/ENP9BbsFEcC4FIvYTLalJ4/bNZu/wA2BnWMt9mqX7HVm2zyLWdMIxxWnRyr3uSoBTJfGPSrIqdMiRxihCEq12QD1qHxy2lo6TJV4f4U5YKIhHogy5asMuZtv2ht6nOoGFUlF+1eu9BsWAjvCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NyGj8Zxs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NyGj8Zxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744623722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QK/7AZreqZVkjxHigwsMCq6Lf6FYPl5aMA5lsnqfXFs=;
	b=NyGj8ZxsRh7HHlJKoJnS2uIJGO6spAH3Pzf0FGA0S5TRCgp1nDGUYM7JHdaNnokPuEFang
	UqmQ9xQ6Id4QJg3xnkDhvUvPwSTKHCMss/NSk1u2IcDFukSzZb9t9uaJPhZq1nsA/8z/Xi
	NtuErtwIZmLkrEYMyiouFE92n8I3viY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-CQWKBw4IOJyIy2gZwDsCvA-1; Mon, 14 Apr 2025 05:42:01 -0400
X-MC-Unique: CQWKBw4IOJyIy2gZwDsCvA-1
X-Mimecast-MFC-AGG-ID: CQWKBw4IOJyIy2gZwDsCvA_1744623720
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39d917b1455so1574177f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744623720; x=1745228520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QK/7AZreqZVkjxHigwsMCq6Lf6FYPl5aMA5lsnqfXFs=;
        b=HtiSsM5ud7WCpGTvSRWpdRooFaMW3HQ9n2B/p9dQCjHMsreetBQssMNz6wXCH7q2kc
         PyrVg6cDIHwlDljq6IIhmnwIuJbSyOwG1P3ZOdTEeruoxjQIIrqBxk/inP/fSqG0NAVz
         kxEq1pdV/fwIXzTKM8DhY1gNytIDxB5ZSCxMBw/mYlVlIRzENlpu/f5mkIeTZpJTa0L6
         Ct0KYQkzDod9vc7HkOr3UUg8MZgTV59AN8arUKWitNyjGgJN1i/a9T6Wem55OxR0acvU
         cnoVVJKcPldIicyJAFSGxdhFd4pEDryUOo63MiuN/m3wqGpOlYQfAhLq4gSh4TbtztXx
         EAPw==
X-Gm-Message-State: AOJu0YxiKInGrLcnyyRW6jHaeIKFAY2iGTGGymgEmzDIhbUGtWqSiRvu
	KU+JGfbvHSM9UkrQHASOINw4d9zuu9Fg4Lzx0CUkUNsKJTMJuniIirANErgVK8k+CiIu88+1Frd
	gy6jD2CdQlwTm71miZrZxkeVjH91eNoPZnFHJieyR4BuVv8uv/RNw5Nxt5OcvTA==
X-Gm-Gg: ASbGncssVoBUQi4zAfQc+Ghk56PBIS/DGFcQ/RWjvB4s6Vmm8Cvmy8a8KovpHIOzZKi
	Xtu9DcJu6ougV2wJanx6d3GH13jGYy0iz/59mmr6TWsKNJIxJ6RTLOc95E8+tsAoR/0YUHAO7an
	iXHI6X5dDwd5ZLXWCLLo1NhQyqOT/U6LPkk7fQlH8p0BRv5YVbnFCrZSAvvLdG3dHPa9doZIEwi
	kPZRPBWG+ob5uEWg0s0UJPqkzOqWegUNqiOIBcVZjlOnL2pYobblCB+I1sTtWiZzVwuR7k30IGA
	crQFsPbf8+LLELXYJMMLSmX9FbuaEXyYB6+yQLaDCA==
X-Received: by 2002:a05:6000:40e0:b0:391:4873:7943 with SMTP id ffacd0b85a97d-39eaaea5c7emr8320032f8f.32.1744623719689;
        Mon, 14 Apr 2025 02:41:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYqyuQrmaEBLpWZcIXDEX0QoeCfP/76Z7l2ly5E6JgeCKlmVL69eF+/i0kew7NeQFEw6hp7g==
X-Received: by 2002:a05:6000:40e0:b0:391:4873:7943 with SMTP id ffacd0b85a97d-39eaaea5c7emr8320009f8f.32.1744623719200;
        Mon, 14 Apr 2025 02:41:59 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.27.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963c15sm10702179f8f.13.2025.04.14.02.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 02:41:58 -0700 (PDT)
Date: Mon, 14 Apr 2025 11:41:56 +0200
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
Subject: Re: [PATCH v16 5/7] sched: Add an initial sketch of the
 find_proxy_task() function
Message-ID: <Z_zYZAbv86MlITOM@jlelli-thinkpadt14gen4.remote.csb>
References: <20250412060258.3844594-1-jstultz@google.com>
 <20250412060258.3844594-6-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412060258.3844594-6-jstultz@google.com>

Hi John,

On 11/04/25 23:02, John Stultz wrote:
> Add a find_proxy_task() function which doesn't do much.
> 
> When we select a blocked task to run, we will just deactivate it
> and pick again. The exception being if it has become unblocked
> after find_proxy_task() was called.
> 
> Greatly simplified from patch by:
>   Peter Zijlstra (Intel) <peterz@infradead.org>
>   Juri Lelli <juri.lelli@redhat.com>
>   Valentin Schneider <valentin.schneider@arm.com>
>   Connor O'Brien <connoro@google.com>
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
> [jstultz: Split out from larger proxy patch and simplified
>  for review and testing.]
> Signed-off-by: John Stultz <jstultz@google.com>
> ---

...

> +static struct task_struct *
> +find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
> +{
> +	struct task_struct *p = donor;
> +	struct mutex *mutex;
> +
> +	mutex = p->blocked_on;
> +	/* Something changed in the chain, so pick again */
> +	if (!mutex)
> +		return NULL;
> +	/*
> +	 * By taking mutex->wait_lock we hold off concurrent mutex_unlock()
> +	 * and ensure @owner sticks around.
> +	 */
> +	guard(raw_spinlock)(&mutex->wait_lock);
> +
> +	/* Check again that p is blocked with blocked_lock held */
> +	if (!task_is_blocked(p) || mutex != __get_task_blocked_on(p)) {
> +		/*
> +		 * Something changed in the blocked_on chain and
> +		 * we don't know if only at this level. So, let's
> +		 * just bail out completely and let __schedule
> +		 * figure things out (pick_again loop).
> +		 */
> +		return NULL; /* do pick_next_task again */
> +	}
> +	return proxy_deactivate(rq, donor);

Nitpick. We might either want to use donor (and remove p) or use p
everywhere in the function; think makes it more clear.

Best,
Juri

