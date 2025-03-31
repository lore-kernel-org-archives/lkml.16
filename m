Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FCD19D8A7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743403336; cv=none; b=dBq7seYxsDf0rf/ArOvNZUw+uL8RsT79BlIWQ8JjdlnRmTC0LLV/440YE1Y2x5i/D0kiz1KdUTpqSOGtGL3Wk1+vOui+82wyEDl8582aaS7szjbSU2iUOWhvcH2E+qVXtp4pG1fK+fjkqFtATlBNqOSzM1bTlxYwZTtXRf+XQg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743403336; c=relaxed/simple;
	bh=BJi+9bf1F6qHuObyRl4fO3iNK7sHQ6yjiGr4zBnOcCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+vVFarOv/N6wDqADUXH7ZJ8A8v6oBhaaqcox0OVCAbxQX+myPW7uJoi53wIsCttJ7LoYrxEiG+2Q+JwiXTV7XGNJK4bRwpQ6bIxrkm+GWQSLX/vYjQ33zN/kqTrgJbqllxlagiY+fO7/27J0Jh4+4sq+3FU7X+U2xf1eJSetVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=gdpCURQA; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="gdpCURQA"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-301c4850194so5586305a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 23:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743403333; x=1744008133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2S1fWwrkT5+T3LFHqqOb7SfD5kyoqceUCC1Z1vFxwmQ=;
        b=gdpCURQAPQKABydYndxrBdUNmKpLawu1KdSgExLjQblWP0qz/CqnjC7uhRvWXK6bPU
         r8TuHm+yRN7UP66YAtq1vWWeyzAZPvBhG39/BuUcUbja8PLlgDoov6oS5aPUouSjQo5A
         l/UF8jbTTgXYqSBEL4nPcl3MztP7jumhfIAlirHbr2VzTWsTEtMdM3+F3qBwyciM1cz5
         UZby3OPRjMdB24u7yCmbXm3XUtI8/50D+741VmIh4y2hbq9Jq6k8/kaI7uNk1EgaD+zW
         xkK4vJtw/3QelOcuQk2/ItfKcpp9bagasbAYi4Z/8kvV5n1oAjVpG9mX4StkPZyTx9Lz
         0YxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403333; x=1744008133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2S1fWwrkT5+T3LFHqqOb7SfD5kyoqceUCC1Z1vFxwmQ=;
        b=nhu82x3DevOx5bQJHg05A4VYvfq58BeC75zsKkLfsR/sMQvJuOCap7dz5uz8V5ThnS
         iw3H+t9EEdN98/DxCtqvhpeD1AIBOcOgTXwRI9CV7uT9Sg3WGYslsN2aN3jyruWnjVpL
         jTi/qmry954c5RZsD7iGdvTHWZbA/eeey+rOl53C6BLD6ZMPIyn8KTCaPSXIgvxu08od
         OMl4Iq9fBgKY2+Qu5LXCDufLnJCTHRdAaLt0eS1m13SJ7XmQ8MpkMURecJR7GMzGZtkX
         L6N7BnHCfrGbqJ3n67gDcjrDCv+Z9gbn4u2Fw9gQ3i/bVwhhd0+U5nYFHXjpfgAfhcnO
         DCUA==
X-Forwarded-Encrypted: i=1; AJvYcCWUVq/NiHKJ3yAstCu9zU0QYs4j0lgcfxn2HM+/3ld4hUwtw1Egiv3X3xD1C6PJz4hqBW4/RDMCNmGoGmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQFTwT2wUyTkbwpEWusWxPcLElKqxg7j/CSmhvCVSG3VN6+tmI
	RgYAZVBSNvIzvjLPZqfLcRm1pj6fGB982ekUXOs579kY+AmVVAzwgoT8h10HyQ==
X-Gm-Gg: ASbGncsM72r6WDGxzVErxYyJWJMGZlMUl+O0IKcmLdZAD5glQFAq+ZVxdh0mS9kHBkB
	En+0beQ9AXOcdJ3L2azrEr/Qb8iAFJUwWi6cc1z8sndUf0VAV+bQobgrRaZOiV/QOhp35mDkXeE
	P2jZEwf/wt41PWz6ECYhqdqdlAwI/rsb75BaPVnPwmtyrj0IxPym3QSVmUbUg16J97HbLQlJrLT
	2XEUeUyR/brMEOYb289A+/Uk64WKqYk7uihwI2kiHz81yjYdk6vYvLKglnBh6Jy4/EqGaxa8Nyq
	cZhE8Bf56bxdOy7M2fmixiIC6eKtdO0FQBLO+PPqcS4I
X-Google-Smtp-Source: AGHT+IHAUGne7EWQjusN2K4LfniicNgTIn86AVc8uYbPk847VJkpJ4EheBEVGlWROzG6KQzOX8OMOQ==
X-Received: by 2002:a17:90a:da8f:b0:2ee:aa28:79aa with SMTP id 98e67ed59e1d1-30531f7a5e0mr11680650a91.6.1743403333401;
        Sun, 30 Mar 2025 23:42:13 -0700 (PDT)
Received: from bytedance ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039dfd38a6sm8817742a91.10.2025.03.30.23.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 23:42:12 -0700 (PDT)
Date: Mon, 31 Mar 2025 14:42:04 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Chengming Zhou <chengming.zhou@linux.dev>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>
Subject: Re: [RFC PATCH 2/7] sched/fair: Handle throttle path for task based
 throttle
Message-ID: <20250331064204.GB1571554@bytedance>
References: <20250313072030.1032893-1-ziqianlu@bytedance.com>
 <CANCG0GcFF7cnR4rCbU5MmY1Gq3M+r4gPXv39QPXXC=Cdr6sRww@mail.gmail.com>
 <58e0515a-ed67-4d1a-825f-bfc2b31d1d18@linux.dev>
 <20250314094249.GC1633113@bytedance>
 <a257205f-525f-48cf-b8d9-101ad8a95081@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a257205f-525f-48cf-b8d9-101ad8a95081@linux.dev>

Hi Chengming,

On Fri, Mar 14, 2025 at 07:07:10PM +0800, Chengming Zhou wrote:
> On 2025/3/14 17:42, Aaron Lu wrote:
> > On Fri, Mar 14, 2025 at 04:39:41PM +0800, Chengming Zhou wrote:
> > > On 2025/3/13 15:21, Aaron Lu wrote:
> > > > From: Valentin Schneider <vschneid@redhat.com>
> > > > 
> > > > Once a cfs_rq gets throttled, for all tasks belonging to this cfs_rq,
> > > > add a task work to them so that when those tasks return to user, the
> > > > actual throttle/dequeue can happen.
> > > > 
> > > > Note that since the throttle/dequeue always happens on a task basis when
> > > > it returns to user, it's no longer necessary for check_cfs_rq_runtime()
> > > > to return a value and pick_task_fair() acts differently according to that
> > > > return value, so check_cfs_rq_runtime() is changed to not return a
> > > > value.
> > > 
> > > Previously with the per-cfs_rq throttling, we use update_curr() -> put() path
> > > to throttle the cfs_rq and dequeue it from the cfs_rq tree.
> > > 
> > > Now with your per-task throttling, maybe things can become simpler. That we
> > > can just throttle_cfs_rq() (cfs_rq subtree) when curr accouting to mark these
> > > throttled.
> > 
> > Do I understand correctly that now in throttle_cfs_rq(), we just mark
> > this hierarchy as throttled, but do not add any throttle work to these
> > tasks in this hierarchy and leave the throttle work add job to pick
> > time?
> 
> Right, we can move throttle_cfs_rq() forward to the curr accouting time, which
> just mark these throttled.

While preparing the next version, I found that if I move
throttle_cfs_rq() to accounting time, like in __account_cfs_rq_runtime(),
then it is possible on unthrottle path, the following can happen:
unthrottle_cfs_rq() -> enqueue_task_fair() -> update_curr() ->
account_cfs_rq_runtime() -> throttle_cfs_rq()...

Initially I was confused why update_curr() can notice a non-null curr
when this cfs_rq is being unthrottled but then I realized in this task
based throttling model, it is possible some task woke up in that
throttled cfs_rq and have cfs_rq->curr set and then cfs_rq gets
unthrottled.

So I suppose I'll keep the existing way of marking a cfs_rq as
throttled by calling check_cfs_rq_runtime() in the following two places:
- in pick_task_fair(), so that the to-be-picked cfs_rq can be marked for
  throttle;
- in put_prev_entity() for prev runnable task's cfs_rq.

> And move setup_task_work() afterward to the pick task time, which make that task
> dequeue when ret2user.

No problem for this part as far as my test goes :-)

Thanks,
Aaron

> > 
> > > Then then if we pick a task from a throttled cfs_rq subtree, we can setup task work
> > > for it, so we don't botter with the delayed_dequeue task case that Prateek mentioned.
> > 
> > If we add a check point in pick time, maybe we can also avoid the check
> > in enqueue time. One thing I'm thinking is, for a task, it may be picked
> > multiple times with only a single enqueue so if we do the check in pick,
> > the overhead can be larger?
> 
> As Prateek already mentioned, this check cost is negligeable.
> 
> > 
> > > WDYT?
> > 
> > Thanks for your suggestion. I'll try this approach and see how it turned
> > out.
