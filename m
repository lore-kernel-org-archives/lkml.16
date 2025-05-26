Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EA01F8EFA
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748259428; cv=none; b=cL75zS3tsgl634E9F9tffipNufL4pK0Jm1QpX6RS/mI5mv5t+cwL1wa4Vuu+ubM9UY94hSlDQsc2C2oUK1V2v5kysZ/o08Ueoh1Pn6UMnoNK9g36xr8HNppvO+uixCDlJ5HVrm8SUXZFT4uVqTLZ+gptkzjRvc+An5FcHR0xitg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748259428; c=relaxed/simple;
	bh=SifRE1pYhzr1J7tzHiNbuqYAETJ4W9tXkZ1v+z8uW40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AE9OamlwG/4prnNPquc92TGprHW9gaVfm8ag9DxA/UCEN0iH9W6W5juzZ+a0N6j2lhb/Ht8L2JFuL8yK3WeJsD7Ap4HX5AM/MoXRfzFjJZlQsEysMq9y4D6vcRlDROsAwkfsrrizBo8twJa3eAoqV2CX+om/0HpDXMT0QQXWILg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Zy8w4a2h; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Zy8w4a2h"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234593b0613so8124075ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 04:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748259426; x=1748864226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1YomwbiNk+MK6OcEHnF5yaSCssRPLKQjTNK8YI+C2Y=;
        b=Zy8w4a2hbA4zWSV1dsvrvz5yj26N9OnxL2t6h/lbxNiSbNX3AJzxy9QGw3gpu0yohJ
         FtaTqqumlXaqxVlB5Ro/55cg32aAihxfd02gNeASfpldLhmyhzn/CvVafvOm52pHgEcG
         F9cdOEao3jRhM0mTk/OVvpNrn9JCCXk9PAVs4ivzXU3oqjBPxox17FRLcH3Hfka1226a
         dz8gDq79v3PlkgLwO+6hiTEOCm2x3JxvpmnjyXD1APFS0TU+w/QNKbm2Ui0/TnMgKul3
         BDQ6nf5rMTb6rtC3SqPfIsEVc1SbelehApv6Chua4fEmEuCf8rHXFn6TP+2ae4qLoNKg
         Wz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748259426; x=1748864226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1YomwbiNk+MK6OcEHnF5yaSCssRPLKQjTNK8YI+C2Y=;
        b=nv0d6PX3ywFGescj+NpiRROXHWsBO+hwKeb2ccJ2ad4Ria5y4y4EDHp6eP98Z73ou7
         yu4Q2t2q/SfK4twH3Sh4AndxdI6weaKnez1fkhA/vSaTuVs/v2Cjip5hzZnb659veSDR
         ReFwpmlSq+hB42Crg7necin25VpDiuZ4JU8Nu2jOPuv3YXBxE4V5Xl+f9+WuX6al3uoa
         KBYp4Jx7YbfRjGsXg2i4Hf4kWTfyDaCP0W09hJIj2Zq0PtY6h5wZqyKdf0EjI2sqQarE
         zAB2PWFwzwymvYsSAExigR9kcBR+DmkpUG3TTxA05x0D81EmCkndGt7lyI2o1ydAq7PI
         8ByA==
X-Forwarded-Encrypted: i=1; AJvYcCULfinT8dpWmQVIcWs/C9MCGMFSaibsY0PkyJHP50LjEZ1tdIBKgW/L+kbVObyODnUFgN0rySZOSxMAr10=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOWIe3dk4qE3wEQBMxrSvkY1RLSlQlis3KZmJkQ9wkWlEWzw6/
	bxk4npB7tBBGvjEIPLEm9y0VjRzHdY/7ON/pLEb2jc2l1FJzUKWxWGT5A1wToQt+Pw==
X-Gm-Gg: ASbGncsCEYwjaIFfb7BvDUhNuKEeq74LMHaYSI6CwBn3DxQbhyslUsPgxx/S852KLnC
	6MP41zxBJ8B/3XSsQQJ58xw9e0ovQRv/lFMD2iAP5b11slFN7/iGffdHSmbkmnR8Nxqm3Wt109L
	93xQQVQSXwTSyRgB+Grqm8eIOIeGIfQzraxvZDyAaQP6+4K8KrkVl8FzfDcnzbMwmNouNWxd4+d
	E8gqgZNLLjJ/TK2XhlE4QFrdFo9mLN8KVfRG7gjADyKFZ5QWjF6A59KcaL0mPbgqtw0Q0kNO5zL
	oAhB1njKt4SrZrEeuoqDwnGssLwpPw6GpUYA6eQSZVwN5ztW2S36x3qaSYNOXg==
X-Google-Smtp-Source: AGHT+IFkQDFmBkAnPnGneftimFbtdgNNGN+E/VrtolpuT3CD+/ZFJJ8ALPGEbQBknrRt5IOpY+a3dA==
X-Received: by 2002:a17:903:2ce:b0:224:2207:5130 with SMTP id d9443c01a7336-23414fdb06amr135077855ad.45.1748259425852;
        Mon, 26 May 2025 04:37:05 -0700 (PDT)
Received: from bytedance ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97fa6sm165962285ad.135.2025.05.26.04.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:37:05 -0700 (PDT)
Date: Mon, 26 May 2025 19:36:50 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH 4/7] sched/fair: Take care of group/affinity/sched_class
 change for throttled task
Message-ID: <20250526113352.GA2993700@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-5-ziqianlu@bytedance.com>
 <20250522120336.GI39944@noisy.programming.kicks-ass.net>
 <20250522124840.GC672414@bytedance>
 <20250523145942.GL39944@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523145942.GL39944@noisy.programming.kicks-ass.net>

On Fri, May 23, 2025 at 04:59:42PM +0200, Peter Zijlstra wrote:
> On Thu, May 22, 2025 at 08:49:43PM +0800, Aaron Lu wrote:
> > On Thu, May 22, 2025 at 02:03:36PM +0200, Peter Zijlstra wrote:
> 
> > > This is asymmetric -- dequeue removes it from that throttle list, but
> > > the corresponding enqueue will not add it back, what gives?
> > > 
> > > Because now we have:
> > > 
> > >  p->on_rq=1
> > >  p->throttle_node on list
> > > 
> > > move_queued_task()
> > >   deactivate_task()
> > >     dequeue_task_fair()
> > >       list_del_init(throttle_node)
> > >     p->on_rq = 2
> > > 
> > >   activate_task()
> > >     enqueue_task_fair()
> > >       // nothing special, makes the thing runnable
> > >     p->on_rq = 1;
> > > 
> > > and we exit with a task that is on-rq and not throttled ?!?
> > >
> > > Why is this? Are we relying on pick_task_fair() to dequeue it again and
> > > fix up our inconsistencies? If so, that had better have a comment on.
> > 
> > Correct.
> 
> But would it not be better to have enqueue bail when we're trying to
> enqueue an already throttled task into a throttled cfs_rq?
> 
> It seems a waste to do the actual enqueue, pick, dequeue when we
> could've just avoided all that.
>

The original idea is to keep code simple but surely this can be
optimized. I'm working on it and will paste diff here once I get it
work.

Thanks,
Aaron

> The immediate problem seems to be that you destroy the
> task_is_throttled() state on dequeue, but surely that is trivially
> fixable by not keeping that state in the list.
