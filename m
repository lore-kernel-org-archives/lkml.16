Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5B8205AD7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743585922; cv=none; b=pdQAN5S0NAvBKUs8fPTBwDDenTfKNZeE88kVIbO2dYwgspaOZanXjvq7Jk0aQ/pvLf5c0qsgZ5J7Uo6eLbibfCsVOxVCcZnYbfLLnOK8EI/dfII9vIh/dGpKv8RFPo6gVyoV3sn3A71Ga7cmqz84otiGJd44hEc9pMzIdLlskSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743585922; c=relaxed/simple;
	bh=pqdqKAxz3IOrphKkYWZKu5jkYnvvwY/KUcn+r6dFacc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLuh5F5koiGTcx0fnbMLN0SCfTLFUkMqJCyU8gQvXkMcazLUrDR6Qu1fVLl3crU4yYXj3Hk7UJdmuUhCqHXi4EiANYo9n+Mk0cYqUjrvt/5YRodOrT4uv+vm9c7X6zmqWTTRtDOrmnYM1q9aanPtCkU6bxrahavz+voNTXFw1gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=USfHEqUp; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="USfHEqUp"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22548a28d0cso5988045ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 02:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743585919; x=1744190719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GvgI3MF+EIhRN0nzz78vjs/PtGnrIijJwZndT+zZb4o=;
        b=USfHEqUpoSy4y//PFPAAzfmCP/YeKS6lNsIEda6jLIvRq85lX0bBUd0Tk1R0j7m703
         8fjnYuQiwH8cd1J4mTtpQ8PTSKlE9lhPG5K9dXxJ6F2qVEppMsoEvNQifu6Jr7GRDiP0
         YbcpBXCalY7w1YwOqtF0FslngBlmzfYLdzmHKfScIM957EHvoWH5DnN7ctasjedmRqqu
         yzF1vNPzmOTG1li6Og5e5LLGhpFK5dHWQqYQGBqaQsLjuOWR6T4TkUtwEdz/cEHgXZuc
         pz4U9v4JbTqgqRNhVzX23nvv8eomt5MhSLUp2y56xnbDbVF/zriRw2qni0bEoqK0rpN6
         FL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743585919; x=1744190719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvgI3MF+EIhRN0nzz78vjs/PtGnrIijJwZndT+zZb4o=;
        b=Zw0aqFmxGly3Ss1Z+8kym9oNFI3CK8hjBtN89QcAaBdN8tGKd8a3YxkLm4xfRoq7Zh
         4cIhrBVOoEihw/H4JAshThWwPmkvXfQicFvXMJTNBA/jtuNZD4e2T9IBrzk9Txz+FZ+p
         /Hvgr7NZSVt9ns6oiBRUNo+RKIByOwrYP0AVvSF6rJAlhE/2ZeL36zryXOl90LsAPZGM
         Xmy9zpBMsmb5c+MrBceWVkkU30WUO58MqkK6CPjY86QzPiC0ozHfWfOORd6Syu5C82bM
         e+yjkRZDu84qY+j8mEgDWb7A+ReXtPft4N13+sNuT3O3dqEb+HUJqB0YEouYnSU4jMQ5
         PhxA==
X-Forwarded-Encrypted: i=1; AJvYcCWe7l+2M6wmO+v3PUmVhqGxuapekJs+Ur5b9VuJ/Q6f0BAH6sdOp2mtnj5rnIRURisHtn3sYpb+NYvmIqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP5JGhQo/ARrwFFFaLs7n2n1of/Y4/earHFgQ9w9mrCw0xiGKE
	yrJ1VKe6XzPkuooF/LAHKqkOLHHQA6FWOwX7ZuJte6Gf2DI4zOPePVp7xiZw6A==
X-Gm-Gg: ASbGncvQmbSqMgppnYX3xQOlfs6jHBoylKx4sv46wM/iWBDRsGgywqEJWzkeMOXt0Xx
	wcDBaTaLBdmQ4qb56jYvgQbRqLmRQFEM6np3qBWNAYHxyFjBWqSlKBnDwUznkBeMyVNSRQmBA4u
	MrGtbX7TIhRRZMap3x/gzaup4X/1PBZh1BRgGiHxVC+JZ9GA8v0omzet3nLexsCWv9K5XvAOzzJ
	wyL32uixg8ScMjnPQeJjstJsdLWQGldJ5XktURsHVJeFMSKnzrUTVHRHyTGNuXB4G8jH0Fv+cXq
	RmLXtiV6DcVQ18Kr/bdE+b3/JnxtSKSqNksCzJ3sBM3u
X-Google-Smtp-Source: AGHT+IFUwTthxcqzTiA7nOUvoORgnWc4vNWKjuCcgxQ0kG4ic1MIXt2VtamMV7shKAbflcgEXSX7VQ==
X-Received: by 2002:a17:902:e950:b0:224:2717:7993 with SMTP id d9443c01a7336-2292fa0e25emr243066715ad.45.1743585919523;
        Wed, 02 Apr 2025 02:25:19 -0700 (PDT)
Received: from bytedance ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec693esm103451205ad.31.2025.04.02.02.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 02:25:18 -0700 (PDT)
Date: Wed, 2 Apr 2025 17:25:05 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>
Subject: Re: [RFC PATCH 3/7] sched/fair: Handle unthrottle path for task
 based throttle
Message-ID: <20250402092505.GA643711@bytedance>
References: <20250313072030.1032893-1-ziqianlu@bytedance.com>
 <CANCG0GcAic5QThYG-r9CaXPgZtXJuB0RuCW5Y0SyBn7VyOQi=g@mail.gmail.com>
 <3fdb7163-d1f0-45c8-89fa-7c904b567696@amd.com>
 <20250314104315.GE1633113@bytedance>
 <dd749cb4-fcf7-4007-a68e-3ca405925e9d@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd749cb4-fcf7-4007-a68e-3ca405925e9d@amd.com>

Hi Prateek,

On Fri, Mar 14, 2025 at 11:22:20PM +0530, K Prateek Nayak wrote:
... ... 
> but with per-task model, it is probably the amount of time that
> "throttled_limbo_list" has a task on it since they are runnable
> but are in-fact waiting for an unthrottle.

I tried this way of accounting and realized a problem. Assume a
hierarchy like this: /sys/fs/cgroup/1/1_1, quota configured at
/sys/fs/cgroup/1 level. When throttle happend and tasks of 1_1 get
throttled, the limbo list of /sys/fs/cgroup/1 will always be empty so
its "throttled_clock_self_time" is always 0...This doesn't match
throttled_clock_self_time's semantic. "throttled_time" is similar.

I suppose we can somehow fix this by introducing something like
h_nr_throttled, but I feel that's an overkill. So I'll probabaly just
keep the current accounting as is in the next version, feel free to let
me know if you have other thoughts.

Thanks.

> If a task enqueues itself on a throttled hierarchy and then blocks
> again before exiting to the userspace, it should not count in
> "throttled_clock_self_time" since the task was runnable the whole
> time despite the hierarchy being frozen.
