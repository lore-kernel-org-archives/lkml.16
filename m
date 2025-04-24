Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569DC383
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745461608; cv=none; b=A9Tp3WiePa2fnRTxJ4jHqeCsL1qrobAMR6frgEF0L5Q6NJ4P8qnyvmnDWMAo2vN7BEoNl2lfoJz2NduRV6OYWEGanoqu45od4Tntjzk5EhXv/1oVKf1QwVX1D/c+iL1Gjv/zyg+s8jBFu9vjEqHGRfW3czglZ/1G7o5wb3JWRl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745461608; c=relaxed/simple;
	bh=6rW+kfigvqbW9Z4JCP6WIgO65Uj44x7d5t4+afjM7tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NW72q/iDYc2u8ty86h40ATPrjP7j5D+kVWF2T7cACetxTyXGXLc0ryB4y+82nLhf7Bcu+SdQM6xKpIVD8l/yQv6tD/WLrO1IB10AcmDmEprPETbp5CORy0oxxPPwgb5rQVkP5mmRth8O2rCYbpZdny0oU5xLGcI51BgcXakwkDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=gXHG8+Vm; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="gXHG8+Vm"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7394945d37eso377561b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745461605; x=1746066405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu87bTh/CAqApVyAMabtZmc3TeO35zS1eEKo2N4QQGY=;
        b=gXHG8+VmjXddKwG2rdrXOFVBf72MZIC0jj0pAUnMAAkwVzGODzGgMpEhVx0WGORnQY
         yi+7eAUpgZGbFPVNYwYr8W+90xeipHX1pewsYf0YQfkfVg1T4MM3vPKZ9ObXn9e9cy9M
         AGvMsLtVkRWsjBwKll19771nzYqR0MY4VK6KCRKhn2WY12uN23TCfrRzJm6qW6uNkCal
         IpptxaAezftLppQ9iRQ/U55dpxHl6LTOy4+5jlvo/JuwvB/YIeZGoDJCXIT/huMErkmx
         V6SQtn/9ynnLedFgezELNBvRluZgIg3Z9jlLOf7bLnIKzq3ZJSaXyM69UonY2kbKwzwq
         zzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745461605; x=1746066405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qu87bTh/CAqApVyAMabtZmc3TeO35zS1eEKo2N4QQGY=;
        b=eniZUVD9UHqwC3E3AOhXJ1qZXfkhwsBzxtnCXN7TTYYWRHzUIaIvZrdVq0k1Opuaz0
         9qaKm6ryoKSe1fUXFMaJQK0VweAq6XhxXZ160I17RsamOvU4n9M++upFBRik8NlaTMoN
         6Cv2yZqxQb20++491PAuxTb0/V4MAzlBXg+18XHmFlOltvP60xIk2q0lC80wQZXF7w4e
         nWVJxJHRdQ2H41kvqWbGYiB+GePG9UO5gUGmRD+4qLnOH9mVuuTirIlPfyKGnhFg5zyR
         5YQLXuIK6qyE8vU0cOtwR2+9ca/6UHb1x/Bg+Z3LIw9d29GYjo6ErdfDEcv0Bc2q/vG5
         jjjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX222rvjTUQBPRA3dSmNjyatw2reMg6Jb1PnDtCq2xlku0sVMEc7hwm4ZtoxdwbKLqxt/xZ1Lw9valzdzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzgVvZvFb4QBNtcj3nsk2bUp3XTPXCf/z4o6pD5nvmgg2j3Zp1
	VR7Vc0BcsZ4e2annh4m01DKm2MzhRYp0oWRNNh4XVFqbW9lsE7bOUzh4H8tTxw==
X-Gm-Gg: ASbGncvsx7WdVjI5kHSUl7uZqU3xqjr2hUUInqRpU3YxqAUIy6LbMATg2RqViNxMOcL
	VOqdGPrKJgKaJV/FMVaFbNcFToK32wWkdfPpP5l0ci5SFBTAmdFBr4CRh+PsjxLCmzYjEjLkApA
	y1xmUIYCv8uszjO7l57JoIueDt1KVqX/ocRGfSbQbVoqqqloSB9XIG5jV3C2Q9k4E597h/iOc4F
	r3XjwoxiBzBNUjZ3LwRFC/gNzQusSt5TjcyWk7d/Zp2CdBP2hHzurR+KpRJdIq1VWsAbakpNq99
	KbT0jcyQuNM4JgmdcMjIHaPLr8KelRkbnoIW0VYt
X-Google-Smtp-Source: AGHT+IGL6zYaxDU657g+4YnzGpoAs4MzaLoWuNuYO66uGUu15Sr9hOokzzpdaVpEtPWIy3pT1QHSJQ==
X-Received: by 2002:a05:6a00:4606:b0:736:57cb:f2b6 with SMTP id d2e1a72fcca58-73e24640109mr1455021b3a.12.1745461605137;
        Wed, 23 Apr 2025 19:26:45 -0700 (PDT)
Received: from bytedance ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a99a39sm291656b3a.133.2025.04.23.19.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 19:26:44 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:26:38 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [RFC PATCH v2 7/7] sched/fair: alternative way of accounting
 throttle time
Message-ID: <20250424022638.GB437160@bytedance>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <20250409120746.635476-8-ziqianlu@bytedance.com>
 <099db50ce28f8b4bde37b051485de62a8f452cc2.camel@siemens.com>
 <20250418031550.GA1516180@bytedance>
 <87776d335eec8fe02b29d96818fd5c2dde5ed7af.camel@siemens.com>
 <20250423112651.GA437160@bytedance>
 <d2f72ac5650f740835ab09a562f24bf68ea581cd.camel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2f72ac5650f740835ab09a562f24bf68ea581cd.camel@siemens.com>

On Wed, Apr 23, 2025 at 02:15:55PM +0200, Florian Bezdeka wrote:
> On Wed, 2025-04-23 at 19:26 +0800, Aaron Lu wrote:
> > On Tue, Apr 22, 2025 at 05:03:19PM +0200, Florian Bezdeka wrote:
> > ... ...
> > 
> > > Right, I should have mentioned that crucial detail. Sorry.
> > > 
> > > I ported your series to 6.14.2 because we did/do not trust anything
> > > newer yet for testing. The problematic workload was not available in
> > > our lab at that time, so we had to be very carefully about deployed
> > > kernel versions.
> > > 
> > > I'm attaching the backported patches now, so you can compare / review
> > > if you like. Spoiler: The only differences are line numbers ;-)
> > 
> > I didn't notice any problem regarding backport after a quick look.
> > 
> > May I know what kind of workload triggered this warning? I haven't been
> > able to trigger it, I'll have to stare harder at the code.
> 
> There are a couple of containers running. Nothing special as far as I
> can tell. Network, IO, at least one container heavily using the epoll
> interface.

Thanks for the info, I'll run with PREEMPT_RT enabled and see if I can
find anything.

> 
> The system is still operating fine though...
>

So that means only the h_nr_throttle accounting is incorrect. The throttle
time accounting will be affected but looks like the functionality is OK.

> Once again: PREEMPT_RT enabled, so maybe handling an IRQ over the
> accounting code could happen? Looking at the warning again it looks
> like unthrottle_cfs_rq() is called from IRQ context. Is that expected?

Yes it is.

The period timer handler will distribute runtime to individual
cfs_rqs of this task_group and those cfs_rqs are per-cpu. The timer
handler did this asynchronously, i.e. it sends IPI to corresponding CPU
to let them deal with unthrottling their cfs_rq by their own, to reduce
the time this timer handler runs. See commit 8ad075c2eb1f("sched: Async
unthrottling for cfs bandwidth").

I think this creates an interesting result in PREEMPT_RT: the CPU that
runs the hrtimer handler unthrottles its cfs_rq in ktimerd context while
all others unthrottle their cfs_rqs in hardirq context. I don't see any
problem with this, it just seems inconsistent.

Thanks,
Aaron
