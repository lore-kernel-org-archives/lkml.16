Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D415F1B5EB5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746007346; cv=none; b=G5seRHd6LTZEKxbFnIkrIR1eBWL0uoOfBWt5BHVrqoG+Rl4273Tgiou10/I1DYhJC/lzk7QAJ0tsr2lzwq8firArDRE+Ux/DV5uhgPqqz5NSAzBsR4JvR0HKUM7nAL3Y78mMngteg7j1b8fpqtfWVdH7lw8RfoYVydvWSefYK8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746007346; c=relaxed/simple;
	bh=jx6fbWJn0BBh9dndE2zt2rWSRhmW+XPzDEkYKu34euM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTxikYnkoKSkC1TojTuiUCHEdBql+NU2Z49FNZk5n42ktFRWTzyBMWb3AB1qId8LvvpxhZmTjIvblVpWgjSGg7AssExdljcMib8J60pgbbIln8pRXhsqWtj1E5fSVBNlgXyoRvjIJirzHqLv/mBE/KUXB/j8kH6nswOkYdnYaLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kUpxTWTu; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kUpxTWTu"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2254e0b4b79so105269985ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1746007343; x=1746612143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nzwccQg/OQiE/hCv7A7kP003l4PQz41CbPJ5sw/G/ts=;
        b=kUpxTWTuBOxxGL5oguFc8xJHLzC1B3se4H5A/NxcAGc1T1ecY2hUhBn4UFRnSwgkol
         OE5h8NG0CtMre7J0bTCGomP1ldf/qysJyY/PiBSANWtXHOgG4FvUPi5SYrGx3aYSHzkj
         WY1o8f/JRjy+vUX/UrHqTd1BPo1NLqdI9XOL5H0aou605HM87Kw904c0dxFHRdY3zbQ1
         uYQx2pTh9yEMj3Jcc0neJXD0hely/Aye6aFCv/JpNRmzP31ywT81BQZkb8qJ0zM1xe2j
         AEyufULSAf6yHsDNONK+n1TNRgbcbC0PEP4Q5S8CRVDPLxg6VL3YjaqOG0QUCCzcUSKI
         3TKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746007343; x=1746612143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzwccQg/OQiE/hCv7A7kP003l4PQz41CbPJ5sw/G/ts=;
        b=QKkaqS8yFVWMs/IWtPs7KAmvrBcrS+1sJWitFjujg4l8TEf2RM5alswr5rlXbafekJ
         VHF3nAMW+7tVFH7T9SBb8gvfukzWBJ9fQhWL+Z/6Cbs7ngTxhPGEY6jjDcgJ9cDUn9sV
         sl4eg//qYHCw2ThaBFycvIjyfURdjEit6eUFwMYs6vngIQnPQU3Gvk2oKbo2/hPTxDAd
         VwN77jY5OxdSJ7SeUkt2pt+yjYdSRINC4YaLAIC6ZUXm24yZNYjEXVEZJSmGYKUl08M6
         hUYUZOcv51c+yZQDRTpLigqXRLzhvDLH4uhH2rm36LGWC3pCY1f2cZ3eFvyb8MkF2MIY
         qwXw==
X-Gm-Message-State: AOJu0YwTWsunZdXigsuDdxnVRP4K3J1NecVzzLGG8YMfJ9YUQVg2maV3
	VS4Hyn4urbtuTM1soCXSJ+cGLZSMq0+F5iQKcykpTRs8FGhIoUhYzv2qwzMGOA==
X-Gm-Gg: ASbGncve7F/G9QIrEDQ+jVtTPkqULPFQ9BSTqFf7TpreVT9gJAWZA1FxbZ9+9V//XyR
	8wRZAZN0I5+StoMKq0cBdRZpJb+0GAYLMG0+tET5Vh+y0z+AJr/v7eDfLJTDcw4GGUkRWuWSvyp
	gT74JXyxSQlK2saqJvrOR/bacEi7n6qAYwZL0xTu/23AultIj3QH96Ol7hn1cfZz9On73MX9xWV
	AjPFPdmU2hx7WkgSCV+MFWbx7pbsqODbgD2KJzDdBY0sBqIOvAZt0qZgCuQVGFD5WGBmeS/cplX
	DgmSvkyirUdp3df7dwTIe4rS8RONSlDh5BZLtu96bpHEn0ktr68=
X-Google-Smtp-Source: AGHT+IHOLaJXvJu25Mn1nmChW3XSuq2FgzTOlJ0t/doRTx/VGJGFUD49qpVpXFIkbB7EHihidQ010g==
X-Received: by 2002:a17:903:1c9:b0:224:376:7a21 with SMTP id d9443c01a7336-22df357669cmr40274115ad.42.1746007343031;
        Wed, 30 Apr 2025 03:02:23 -0700 (PDT)
Received: from bytedance ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbc0c6sm117776335ad.81.2025.04.30.03.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:02:22 -0700 (PDT)
Date: Wed, 30 Apr 2025 18:01:56 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [RFC PATCH v2 2/7] sched/fair: Handle throttle path for task
 based throttle
Message-ID: <20250430100156.GA322193@bytedance>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <20250409120746.635476-3-ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409120746.635476-3-ziqianlu@bytedance.com>

On Wed, Apr 09, 2025 at 08:07:41PM +0800, Aaron Lu wrote:
... ...
> @@ -8888,6 +8884,9 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
>  		goto idle;
>  	se = &p->se;
>  
> +	if (throttled_hierarchy(cfs_rq_of(se)))
> +		task_throttle_setup_work(p);
> +

Looks like this will miss core scheduling case, where the task pick is
done in pick_task_fair().

I plan to do something below on top to fix core scheduling case:

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 70f7de82d1d9d..500b41f9aea72 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8858,6 +8858,7 @@ static struct task_struct *pick_task_fair(struct rq *rq)
 {
 	struct sched_entity *se;
 	struct cfs_rq *cfs_rq;
+	struct task_struct *p;
 
 again:
 	cfs_rq = &rq->cfs;
@@ -8877,7 +8878,11 @@ static struct task_struct *pick_task_fair(struct rq *rq)
 		cfs_rq = group_cfs_rq(se);
 	} while (cfs_rq);
 
-	return task_of(se);
+	p = task_of(se);
+	if (throttled_hierarchy(cfs_rq_of(se)))
+		task_throttle_setup_work(p);
+
+	return p;
 }
 
 static void __set_next_task_fair(struct rq *rq, struct task_struct *p, bool first);
@@ -8896,9 +8901,6 @@ pick_next_task_fair(struct rq *rq, struct task_struct *prev, struct rq_flags *rf
 		goto idle;
 	se = &p->se;
 
-	if (throttled_hierarchy(cfs_rq_of(se)))
-		task_throttle_setup_work(p);
-
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	if (prev->sched_class != &fair_sched_class)
 		goto simple;

For non-core-scheduling, this has the same effect as current and for
core-scheduling, this will make sure task picked will also get throttle
task work added. It could add throttle task work to a task unnecessarily
because in core scheduling case, a task picked may not be able to run
due to cookie and priority reasons but at least, it will not miss the
throttle work this way.

Alternatively, I can add a task_throttle_setup_work(p) somewhere in
set_next_task_fair() but that would add one more callsite of
throttle_setup_work() and is not as clean and simple as the above diff.

Feel free to let me know your thoughts, thanks!

>  #ifdef CONFIG_FAIR_GROUP_SCHED
>  	if (prev->sched_class != &fair_sched_class)
>  		goto simple;
