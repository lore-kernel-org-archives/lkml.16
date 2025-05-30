Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114A421E082
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 11:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748602958; cv=none; b=inQmiYpVl0S0S2o2++GooRF6vvirBGlxrirsqpHZnAiv4ur3sTrGbxPtyW/erwinPohLw9N3JR1sXgl2ICsjD1X1y8SU3EpoNEI1OvB2N9X9VzePYH65tsVSzFQPG6EQFYPJeip+womVk7S5jS3HMMcwoAdRG1oidzm0t5ZZ1sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748602958; c=relaxed/simple;
	bh=BTaNLcKWNE/dkZor1PmACfFtq2cokcgQdG4prny8yE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWWRUIpmaZ55dSu6QvCK3mFl3vcZqf2P7XY0xGGZ9AemUfBuRF2EuMlYPuN6eb0/iWtbPmbl0765LXqzzN4k3DGnMb49J1G9rn4JmAtcdAMA6KFFNvImx1QqCZm4gBfCmbnR26vndwTxMRRDUiftVO2t+1psTBmh1Hh6pdojQzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HIQrcle8; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HIQrcle8"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3122a63201bso1129858a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748602955; x=1749207755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D8oclyUXXVrsqJp0U68IvkGZx2DxCz1oNZ2V671QO8E=;
        b=HIQrcle8XeEZhCbqewG/EhuOe0P4U+gyJxc6blH/hGgflV9CBjVjPxXVzHmMX2QLVz
         hyLHIZ4FMTiz/4bBgprFm42nbbXHBz7jAtwPS8juAcZhxsCj3qW2tw0Rr07+5dQmFFgd
         R7l4P+I7PjgbNWIvQwNmL/59hezWTuK9Gz97wJPtKlV3RsvN6eLDY5NBCUhyPdFR0bV/
         z0H/t7A/uDbVGLJgeA+r8GP0ksb8hCnPK2x6Y9OlKT7yHHGzUy17trBMAO++4J1wnGtP
         3lYo/IkKcu0CxKAqYuLE9CY9LebTWjwPNWLqZo8q614BSQhPIiBbpzQogDoJFGM0Xh6A
         7vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748602955; x=1749207755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8oclyUXXVrsqJp0U68IvkGZx2DxCz1oNZ2V671QO8E=;
        b=R8BSuHEN1F9OSySfe1efinh7iUzbRxwI1Z4gxD3KlkcDljNk11Q5A1WeT7O8d2t/xt
         1sIUvwiW9DjJuJc4k4a6crooDoJRBCRDH6fF/i/z6nILS+Eoolk7tD9n35cMFC/hu4Rk
         h4g+7JyhAvlLw94/aa74TQjSABlcJdPy/ukUWREy0Q15p6isslqZF06Nl5r9WEhjWrLi
         mYvnVfplP+1SJIz2wIJPnnSyL/CCF+FAgo7fYDDyCmD/PyYk5yVBlTKEI+MXvw10l/hX
         XFYkUInvw4DlT+lNGk5U9YkxJJfKbPahWAYCbPTFQOnr+8ak2n/l8tNkPIAFj1T4FN96
         oKSA==
X-Forwarded-Encrypted: i=1; AJvYcCV7TgMDrQX6UYU2DCo4pT/3791AOkWwmpPUKn2FNnpCI4OwDT2+ylyRRpLRgChMJbLqwuPWq6OF6ZqeD0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxya2SlRX6B0abusBz9cziaIC9e/Y84vvLzm52bpbHsFvYRZxKh
	hwpLLnN3vuy88DGKqTgm5/fvr/urzBuACmn9lNOn2nRiSGbd3tgviiMm/jjea6WsoA==
X-Gm-Gg: ASbGnct8K0CQJZtviUhaU6u8XJhH18ecbOPCrISrEme37E83XdIOA8Ay0AmpdzRiayy
	tqs2KlJD89c+IzdKhmDdVmeEftoSv1q6jykFTds2SANYjeQBsodsWdUorvRY8GSiVpjqxPqFrNe
	TR3lEKnnhYi6InnxEW/RVdkOwENy2S3WqcSqjObHBpwGtds3Iebz52YFt9MODi0WW3kw9iZpLom
	EEX68WkcNp8zJxd3eofdzN6FOg7GAK2Qu4uOPubeAKBi2xuLOCAM4yVvjKR2ElEbKA0Enwjc4R4
	ezTXEl8HDeb7513qzQzq7ySRpStV/st3FNDjhwH0nMalSG7wFumYVhV5WZyBG7SQsQyelLpr
X-Google-Smtp-Source: AGHT+IGcYhCKi4cyfxkeO507+j2tByvDDDAd/OhoT7CTu+/M8/wSvK1asVLMEl/ggtLr90P+a2LjOQ==
X-Received: by 2002:a17:90b:3dce:b0:311:ea13:2e6d with SMTP id 98e67ed59e1d1-31241e9c2dbmr4405709a91.29.1748602954636;
        Fri, 30 May 2025 04:02:34 -0700 (PDT)
Received: from bytedance ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9474sm985928a91.29.2025.05.30.04.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:02:34 -0700 (PDT)
Date: Fri, 30 May 2025 19:02:17 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>, Josh Don <joshdon@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH 2/7] sched/fair: prepare throttle path for task based
 throttle
Message-ID: <20250530105120.GA1117158@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <20250522110728.GH39944@noisy.programming.kicks-ass.net>
 <20250523073939.GA1038318@bytedance>
 <20250529115129.GA541982@bytedance>
 <10df58c2-cb24-4be8-846f-3e708ff04dc9@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10df58c2-cb24-4be8-846f-3e708ff04dc9@amd.com>

Hi Prateek,

On Fri, May 30, 2025 at 11:06:52AM +0530, K Prateek Nayak wrote:
> Hello Aaron,
> 
> On 5/29/2025 5:21 PM, Aaron Lu wrote:
> > A side note, now that check_cfs_rq_runtime() only marks cfs_rq's
> > throttle status and returns a signal, it no longer does dequeuing
> > stuffs, I suppose there is no need to call it in put_prev_entity()?
> 
> But perhaps it is needed to queue the bandwidth timer via
> __assign_cfs_rq_runtime() if the cfs_rq had built up slack when the last
> task was dequeued?
> 
> Otherwise, the throttle will only be noted at the time of pick and the
> timer will only start then but check_cfs_rq_runtime() in
> put_prev_entity() and check_enqueue_throttle() could have already
> spotted a slack and queued the timer which can ensure bandwidth is
> available sooner and reduce latency.
> 
> Let me know if I'm terribly mistaken :)
> 

Sounds reasonable to me, thanks for the insight!

Best wishes,
Aaron

> > Because that signal is now only useful in pick time and we always run
> > check_cfs_rq_runtime() on every cfs_rq encountered during pick.> Also,
> > check_enqueue_throttle() doesn't look useful either because
> > enqueued task will go through pick and we will add a throttle work to it
> > if needed. I removed these stuffs and run some tests, didn't notice
> > anything wrong yet but perhaps I missed something, comments?
> > 
> > Best regards,
> > Aaron
> 
> -- 
> Thanks and Regards,
> Prateek
> 
