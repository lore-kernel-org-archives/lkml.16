Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB91A21C177
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987410; cv=none; b=ndb04WMAdwCqaUAhkaMjZ6yexwkqkRytctMSCuLhbYtAExvBHxObbtHxUWAJ2xybdH7QZy5CcThMM1g3oNRB6l+Ito/auBAhnujAUSEBuAoEGSV0PF81V8sF6lWsm810Ke84TOIkdLiwUqVBDzH2fQEvdfH8IN7UiZsc1huahmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987410; c=relaxed/simple;
	bh=Zea9zgkE7j9TQmRJxh9RGikbH9+BKRVfnBdHUMT7lXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=te+f6bbGeeJwETTL8o9JZatwm0orzrm3hflkoZzq6uHOrTLeOQc4/7xzVzg12l2E2yol605cb6KyxUnthKh3hEPSRKTqapzYCk27zNPZYEv0FJpRYY2quLTRt949E48tXO4VG54zTHiAvAvGpRN5oEmQkWMj+6v6+qgEOJgGAhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UfqU1LZN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UfqU1LZN"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e331215dbso4906525ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747987408; x=1748592208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VWBbt0sxSAcpcSA0REXmuTjUDCFVmjAqDOchLNhLTLE=;
        b=UfqU1LZNKKA6zwQF+DvK8IYK0kXyqk+DXXSy/dHCk6Wk1v4J1ylC7fHOn/XgzkR0vm
         2Mfgy+88DWFU6GlLunOCBFHbh1MXycX2UgXIA1bCw0YI0n8f/+zknbUV/21YC/J8dxdF
         at6iJGpHZ+vbg5vYkqAtqfPaHV9z2X0xiWItwO3G9XP6UiOUz0gB/MTuQaD6uEVH0FP2
         fmuinzfVo3xoOP0tD7On+vEOCfNZAryCzr3TrU5JdH5+PYXDFsTxnm1Lh/GHF5eycxU9
         WUbiTEOnYdjxfikHvRPeiVIVcuJUqULliXcobGablMFgc0KfKTD0Sfm4WH6sCa+PBAbf
         8vFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747987408; x=1748592208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWBbt0sxSAcpcSA0REXmuTjUDCFVmjAqDOchLNhLTLE=;
        b=LdGuwCpV7i9XOYdv6pqA74SJFu+OrsNpNw2nhjGWkyMA81ynR11CJgW+vVynKQQam/
         ypInPAItplWCelnEbd/TYf5SwbiG50Q86hgy28i1H0u8esXTS3iWmD+QuPkmJieEXFpq
         bVk+E4XzxNH/jH68xVrToLVp+9xAVCT2nLv+jw3/6rRBB1CIAs4dVqDnYW+XPkc81HQC
         EPcLB7t6tH5uR3DAJcQeaEGafJVs70yr0C7PaoVMW9TWUNRs9mK3Wy8iqOw8QkEYG4r6
         UpOrifMLX105KTqaZkxIWFmX+hTEHEHUQfnYVN+JsNxwt0SUGFkmLVFzbsRlDHYB9hY5
         FOHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7lBoGt/Jw4Fw7ygoQ6aokLndA2f/xRYQKC01Qu2CrUkr3IAgd6idklo8iW2uxl4pQZmlGUwp8FdjdtOw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8MERsFCMmECCqsHlyAIvCnoqYHFpctLHv5Ox+VdswK0oil5mC
	vYjrQocFm3R5badJ7tx8q918+/oZAF1JOt8Zz0I7YmB5+SjEibMpApYn4S5Jo3AnAg==
X-Gm-Gg: ASbGncvfI6ubilNdRLFG3AyNwZftLU2mIxJkyg8PX2MreIfbfxVzihs0kKdDR5pXYjb
	gvcuMhlvYgJgmJA3MEzMoxIpAiCKz5D0qIqrM3dlc/6ltsYdK9qhA1PHG179LReU1me8YKSBE1u
	R9EDnHehdnVr5Bp++sHWYeDBVsY943dBZh75UY8yGYp58zOP3emh+L9uwdn1LGkfpffK+7ZqdaF
	Vmih+6II2Lsp/2PJ18pq5nk7Mie0p2AVxjehBW4bQzMFqvIWdZPkD4KQnYH0+Z85wM6Zc/xM07M
	dcjwrv5Z3+rWiio2y9UhO54LPvdJHZedxF6aI62IVHq+AEoc+Qc=
X-Google-Smtp-Source: AGHT+IHlc/gNvORXeV6g+AuCy0RMVJS00Uun8VkbwhAnWdFrdLW2xbn+71hUFmFzw0o6wLO/n3L+Ug==
X-Received: by 2002:a17:903:1786:b0:232:609:86c9 with SMTP id d9443c01a7336-233f0669b04mr35533635ad.9.1747987408018;
        Fri, 23 May 2025 01:03:28 -0700 (PDT)
Received: from bytedance ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231e2f57f0csm115269595ad.251.2025.05.23.01.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:03:27 -0700 (PDT)
Date: Fri, 23 May 2025 16:03:19 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Chengming Zhou <chengming.zhou@linux.dev>
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
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH 2/7] sched/fair: prepare throttle path for task based
 throttle
Message-ID: <20250523080319.GB1168183@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <871cf7c1-951c-4ddd-9800-db96e050c6d9@linux.dev>
 <20250521092155.GA24746@bytedance>
 <a129d146-755f-4559-9851-2babf173148a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a129d146-755f-4559-9851-2babf173148a@linux.dev>

On Thu, May 22, 2025 at 07:43:40PM +0800, Chengming Zhou wrote:
> On 2025/5/21 17:21, Aaron Lu wrote:
> > On Wed, May 21, 2025 at 05:01:58PM +0800, Chengming Zhou wrote:
> > > On 2025/5/20 18:41, Aaron Lu wrote:
> > > > From: Valentin Schneider <vschneid@redhat.com>
> > > > 
> > > > In current throttle model, when a cfs_rq is throttled, its entity will
> > > > be dequeued from cpu's rq, making tasks attached to it not able to run,
> > > > thus achiveing the throttle target.
> > > > 
> > > > This has a drawback though: assume a task is a reader of percpu_rwsem
> > > > and is waiting. When it gets wakeup, it can not run till its task group's
> > > > next period comes, which can be a relatively long time. Waiting writer
> > > > will have to wait longer due to this and it also makes further reader
> > > > build up and eventually trigger task hung.
> > > > 
> > > > To improve this situation, change the throttle model to task based, i.e.
> > > > when a cfs_rq is throttled, record its throttled status but do not remove
> > > > it from cpu's rq. Instead, for tasks that belong to this cfs_rq, when
> > > > they get picked, add a task work to them so that when they return
> > > > to user, they can be dequeued. In this way, tasks throttled will not
> > > > hold any kernel resources.
> > > > 
> > > > To avoid breaking bisect, preserve the current throttle behavior by
> > > > still dequeuing throttled hierarchy from rq and because of this, no task
> > > > can have that throttle task work added yet. The throttle model will
> > > > switch to task based in a later patch.
> > > > 
> > > > Suggested-by: Chengming Zhou <chengming.zhou@linux.dev> # tag on pick
> > > > Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> > > > Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> > > 
> > > I'm wondering how about put 02-04 patches together, since it's strange
> > > to setup task work in this patch but without changing throttle_cfs_rq(),
> > 
> > Do you mean 02-05?
> > Because the actual change to throttle_cfs_rq() happens in patch5 :)
> 
> Ah, right.
> 
> > 
> > > which makes the reviewing process a bit confused? WDYT?
> > 
> > Yes, I agree it looks a bit confused.
> > 
> > The point is to not break bisect while make review easier; if merging
> > all task based throttle related patches together, that would be to put
> > patch 02-05 together, which seems too big?
> 
> Yeah, a big patch but complete, instead of changing a bit on the same
> function in each patch. Anyway, it's your call :-)
>

Thanks for the suggestion and I can try that in next version.

I'm thinking maybe one patch for newly added data structures and one
patch for throttle related helper functions, than a complete patch to
switch to task based throttle and the rest is the same.

Let's also see if others have opinions on this :)
