Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53553298CA8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631720; cv=none; b=eX78KES6Od2/2BjEEEbrIIcq4YPNcvtD0Ee0a74TwzmEMdTX2fMKZjXfnVj/wUH1Qug+suUuMdq8AORhxhYgyKw83pwvSTt1DS1Ov7z1RKnIgJz0e4T1aIp1jXB6+RoTHB+1wJAZoPEQ48mRN9GoR9/x4sjuRUKlrxLcCu1aYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631720; c=relaxed/simple;
	bh=0fFfBRls/z+8KQD/M53Z0B1SaecisTjEwFpVrgjPum4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qH1Xx1nvnX/a5cX7NWIZUt7dxk9btGx32Uuwr+8YERFGKK617LCWqk4QaaX4zed4sQc52GZtCz8lxZTznv4x9yLO6/8DBc/cWdOWu+8EJeBpgvCTnZ1VWTksFM87hDObhempofqlBgQeKfbVgfnukuhxMr7IZNIryY+D/w/9bo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=MZlFimpa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="MZlFimpa"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227aaa82fafso31481295ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744631716; x=1745236516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5yJE2K+GCjM4XeBBsAl4roiQvOwwQaDhCJLIwxH+aas=;
        b=MZlFimpaiN4BVw+ofGMAav1Hdblkk3MHXzKEOvoWlFFQf4zfBvS1mENOZaTdUF/CVD
         KfruydXKmjscth3ckAye/rMwd6HHFu1hGc17oUhYgm+UNCF2TIXtJtYONpSKodbrjNHv
         +LRPyF5adPBN2HE92ZWlgweYGy3SqEJYO2v0Zj+MpqtVoRYpQS1Q5UOwrE1C4qiEz2OF
         UbjqLipEyUJ9cl6K4hcj0Cel09wnQcni3Cizva+1BfRcsD4CBAQup1UD9YNC1whWikeh
         eFkP+4cY9jVX8TQqyiEbsTwFXdNGZbH7JtFBCAysGvlBPxQXvutp1cM7RIL8lmtxtPPG
         bb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631716; x=1745236516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5yJE2K+GCjM4XeBBsAl4roiQvOwwQaDhCJLIwxH+aas=;
        b=DhFFqril0PSbtpfK1ZYGIs6DLuyLmSkjuKY7S8R4RKWUgKTKHQYNZ7AKpK6a8PlQSu
         HbXli1H7J0zy2/erpY4Lsqv2/cYAsTiiWioP+DzD/Xy84c323/Ji+CAn8A65SgIbM20q
         pbfPNg8cm/Fo7kfkyg/XW01ll2hRomfwtMEPO8GjAjDkfCPuh7/OA5GYxUjX8TJYz1WI
         BVcFqRm9DjVXlKMtNdsEejZEXc7RTD7YYp3hghhg/ZOX21TAvh6bd5h7SccGmsPxeZQ5
         bOkizpBiRzjsFcG/2K++ow1lVZ+05DhLUaqcLEkp/LsUpwPlQVDYEhb7b9nzxyc7QVLk
         NCaw==
X-Forwarded-Encrypted: i=1; AJvYcCXxcNSSXz0ijBDIa6ptZfSxrPt1L/+SuzfnCJdBZnwe/ad+s5UBe+1NSVsl1LQt5EB4xev/PjsL/RKpGc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzkwYrYrCB+p5ZYwYBsKqJLzTdAjxYlrPNTNcCwzruxBjxqOvN
	ppuE5DUI8SfZ2POKqUHdrloDUXIMhoDuVw1MieTRyaPNVF61kstrOhferikFTw==
X-Gm-Gg: ASbGnct8WsVyRunvXs0vMxyigoO+YleE5IzhbPXGL6okZFC2/ZsYi7174U2R1HXyLtU
	0akn5jO85DXe4Ne6OO5m9tSWeOWbPytX+ylCZVt+V2xKKL/YK/drhupGDkVqlkg/jgXHicYXUHl
	TpTTeTb1+FzugcwplHJrsUMML52lo3EhLHonydTf8Krhrb1K4JgnQz8/whpqYXG9cAvkCD9pamY
	MpB1BW+RAfOFgmSZTJtm/SsYAD8T2gD0RctKIQYpfBw2t+jkizw1yWT2bAHmLKiIcOrORM3QJcZ
	GbBgQzEMtVKDUCT4w6usv6DEe2Nga+50LBuZFO2B
X-Google-Smtp-Source: AGHT+IELN4V6Ut99rNqTLZmsH0vdlhDw7R/X5pZYNpBxm/01UGuIovlujTKOBe6lezAq/4Q7OxM51g==
X-Received: by 2002:a17:903:1ca:b0:223:5a6e:b2c with SMTP id d9443c01a7336-22bea4adddemr142035675ad.17.1744631716316;
        Mon, 14 Apr 2025 04:55:16 -0700 (PDT)
Received: from bytedance ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62b70sm96710185ad.39.2025.04.14.04.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:55:15 -0700 (PDT)
Date: Mon, 14 Apr 2025 19:55:09 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
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
Subject: Re: [RFC PATCH v2 1/7] sched/fair: Add related data structure for
 task based throttle
Message-ID: <20250414115509.GB3558904@bytedance>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <20250409120746.635476-2-ziqianlu@bytedance.com>
 <a227dd46-e6ec-4cc3-a0a3-427c4ffc9d07@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a227dd46-e6ec-4cc3-a0a3-427c4ffc9d07@amd.com>

On Mon, Apr 14, 2025 at 09:28:36AM +0530, K Prateek Nayak wrote:
> Hello Aaron,
> 
> On 4/9/2025 5:37 PM, Aaron Lu wrote:
> > From: Valentin Schneider <vschneid@redhat.com>
> > 
> > Add related data structures for this new throttle functionality.
> > 
> > Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> > Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> > ---
> >   include/linux/sched.h |  4 ++++
> >   kernel/sched/core.c   |  3 +++
> >   kernel/sched/fair.c   | 12 ++++++++++++
> >   kernel/sched/sched.h  |  2 ++
> >   4 files changed, 21 insertions(+)
> > 
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index f96ac19828934..0b55c79fee209 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -880,6 +880,10 @@ struct task_struct {
> >   #ifdef CONFIG_CGROUP_SCHED
> >   	struct task_group		*sched_task_group;
> > +#ifdef CONFIG_CFS_BANDWIDTH
> > +	struct callback_head		sched_throttle_work;
> > +	struct list_head		throttle_node;
> 
> Since throttled tasks are fully dequeued before placing on the
> "throttled_limbo_list", is it possible to reuse "p->se.group_node"?

I think it might be possible.

> Currently, it is used to track the task on "rq->cfs_tasks" and during
> load-balancing when moving a bunch of tasks between CPUs but since a
> fully throttled task is not tracked by either, it should be safe to
> reuse this bit (CONFIG_DEBUG_LIST will scream if I'm wrong) and save
> up on some space in the  task_struct.
> 
> Thoughts?

Is it that adding throttle_node would cause task_struct to just cross a
cacheline boundary? :-)

Or it's mainly a concern that system could have many tasks and any saving
in task_struct is worth to try?

I can see reusing another field would cause task_is_throttled() more
obscure to digest and implement, but I think it is doable.

Thanks,
Aaron
