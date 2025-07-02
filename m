Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C209233149
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446325; cv=none; b=Sm0QSycTelVqMETsGLqWO00qJ2fFEQZvY2QD1qiLad2koaMsBHclHgMGL5uDamlXCoJJdwW9dEwdIGHSKjiaKBBd4MPCWoKaFr0kpvDU8HQKGoHEUCfpPVh2MN6+WziCqmbTuK1/1DcSyz3Y6H2J5gPlEbxf9dLdYVM4qPdN2oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446325; c=relaxed/simple;
	bh=2hwKR3T+E+kVWQRp84tekj3z4nHV3U8TyOjFVS2GDaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RG9h0dM93/UIRfw3bnctn5pTFTqWXgzHRjvFrnoArPeVpLmWCTUbT3/ClJtgwbIZTMUeCpLIvUBsM7oaHtNY3LxZOkrJvXlEQ4s60FXTLhIQNo7euQxGwk4Q4ytgIOecUp7+diUo3joHpTZKH3mS1aUEfVw8YIjOYI7dSvmVJbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=N3VvrJ0Z; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="N3VvrJ0Z"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2350b1b9129so27456415ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 01:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751446322; x=1752051122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8EDnQ66fmonB8ZlrM+TbhVSS5J8d/CUciEx8zeo4/UE=;
        b=N3VvrJ0ZdIRatB5sahxTiJdagEK4GZ0qMWgJxGx3qA+57HUn70Yioj6pXH9oUPOf7o
         oiio4GdOmvkXNusbp6zIuqjMgJ4mw6DA6NPaB+wosrhvVdVtIiZvMs8qbHkIwowBujRO
         9R8F54Fq3guoi+suY9Oi0VfbMirFwj1e7qbiztJk2vRxKnJDCNNxZs4xvUjoIGHSkqrz
         cOiOdxtSXIOsMd4kfQlMNw38Ud3V2w2qf4fXhImcqkLvVPCzMRhtGpd8JRpfWafDYqnG
         5NfVzsG5ytsH9x8XViDNkPS33/1Rqu9Qiay9fPs+1ZZjqf4RQX28j+wxRfIRJSSU0AOU
         zInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751446322; x=1752051122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EDnQ66fmonB8ZlrM+TbhVSS5J8d/CUciEx8zeo4/UE=;
        b=ZWHnMoVTTy8e1CgxDB++KSjANv7c1IMTHte8LJV5N1wNcRrc2LmQlDf3yoooHjSdVK
         tLkDHJUEhSsFkZZoDjcPhKK+0g4+2Y0kWFeVHidlfe7yPjf+5OXxJZ7qICfU48ZA4dOG
         8caG4yNtXgoFPBjAZ5UbtXCfZ11V8Xh8IO/lRkuLM5r/pN5DVtXhyzG5SPlNi+mjjJuR
         W64IbcmUgK/qk+RN5onOpT3ZAb7U4XmuMPzC18WIn9sjCrbLO2zzTu+a3qc+bvZxqBKi
         dccPga7sVUVEzhW8yz+4FGr2wq/2c76Ca7q5hOLHc7xcJGziHv1UO/P24JfKjZYXpDBo
         jiQg==
X-Forwarded-Encrypted: i=1; AJvYcCXy3FyHBXu6Y3zsTSKt4NKeLW8eg9gOH1Zyj5vhUXggLQShqFaE3Jiz0oDNXCdIKeobzaRkrchZPnZM5yk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfp7VFbBmA/ewO7V5/uDpkrh+9SEsu0ahZGptrJwfJ//wGt4VR
	z9UAqlQKxpyV5MXzqAJhpjk8oRq7lW6q91G0bfQnCL7Vaxd4YGHgC80ZKOXXP9qPnw==
X-Gm-Gg: ASbGncuAGWsD3tpN/3DlXs/kY5ZNaYxL39FbNYQFE2Bwn9A/0GC69p+FsgDnBn/3kXM
	HheL1cEe7mZQyEvFUV/vYXr2vl3+1V5UejzETyE/XXLxShzShym6VJfSuflfGsLYpVthMcSiUX7
	Uq0hFiD1ulBMZ44zq/0v7WugRE5GJotDLynxR+lkuiMMmgDj/fkHMf5G65MylM7oIrsuM4/i/Wx
	+DAMfdXd/3bGcPSfDtUvIWU99/nuxtubYQO1DNRDGwmYX93iP1iWZg1K/5VpXs4dfT44ydXmyCy
	tdxmwpJHoowUh3mBWnRVqWXBbYj3jebAXE3unK60vV8Z5qVgCPOZV6BskfY4UCCjOiQrbigBwku
	b6oo/LJ8=
X-Google-Smtp-Source: AGHT+IEn5p7Oe6Af0G64kNt1obzCKGQv5VwPcb7/xNvTSZLh8tWyNg0RqOpA+WF3uo3d+W+Ra2yIBA==
X-Received: by 2002:a17:902:e542:b0:234:aa9a:9e0f with SMTP id d9443c01a7336-23c6e4ced4fmr28268585ad.23.1751446322449;
        Wed, 02 Jul 2025 01:52:02 -0700 (PDT)
Received: from bytedance ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f1a51sm128727915ad.72.2025.07.02.01.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:52:01 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:51:39 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH v2 0/5] Defer throttle when task exits to user
Message-ID: <20250702085139.GA789@bytedance>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
 <9eab6c1f-31e0-40c7-8737-499976c0526a@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9eab6c1f-31e0-40c7-8737-499976c0526a@amd.com>

Hi Prateek,

On Wed, Jul 02, 2025 at 09:55:19AM +0530, K Prateek Nayak wrote:
> Hello Aaron,
> 
> On 6/18/2025 1:49 PM, Aaron Lu wrote:
> > v2:
> > - Re-org the patchset to use a single patch to implement throttle
> >    related changes, suggested by Chengming;
> > - Use check_cfs_rq_runtime()'s return value in pick_task_fair() to
> >    decide if throttle task work is needed instead of checking
> >    throttled_hierarchy(), suggested by Peter;
> > - Simplify throttle_count check in tg_throtthe_down() and
> >    tg_unthrottle_up(), suggested by Peter;
> > - Add enqueue_throttled_task() to speed up enqueuing a throttled task to
> >    a throttled cfs_rq, suggested by Peter;
> > - Address the missing of detach_task_cfs_rq() for throttled tasks that
> >    get migrated to a new rq, pointed out by Chengming;
> > - Remove cond_resched_tasks_rcu_qs() in throttle_cfs_rq_work() as
> >    cond_resched*() is going away, pointed out by Peter.
> > I hope I didn't miss any comments and suggestions for v1 and if I do,
> > please kindly let me know, thanks!
> > 
> > Base: tip/sched/core commit dabe1be4e84c("sched/smp: Use the SMP version
> > of double_rq_clock_clear_update()")
> 
> Sorry for the delay! I gave this a spin with my nested hierarchy stress
> test with sched-messaging as well as with Jan's reproducer from [1] and
> I didn't see anything unexpected.
> 
> A 2 vCPU VM running vanilla tip:sched/core (PREEMPT_RT) hangs within a
> few seconds when the two tasks from Jan's reproducer are pinned to the
> same CPU as the bandwidth timer.
> 
> I haven't seen any hangs / rcu-stalls with this series applied on top of
> tip:sched/core. Feel free to include:
> 
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> 
> [1] https://lore.kernel.org/all/7483d3ae-5846-4067-b9f7-390a614ba408@siemens.com/
>

Thanks a lot Prateek, I really appreciate your time on testing this.

Best regards,
Aaron
