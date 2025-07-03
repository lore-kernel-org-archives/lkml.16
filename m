Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC9018B47C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 06:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524522; cv=none; b=Pe697MTJgeecztIMq6vr7v4jabP1XEiSiMk6hwlU37k2hMiOmfZebo7xuaFrHYGVEtooKU86CWPSBGlQ8J7w8G6fx2eAh5ZDy64zX/XI+D+yR/aN4Ie88T+/yF2DT/MtdsGMCecRffeMoWywbzxMh1kFAqhLSDTYo0rALehMWO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524522; c=relaxed/simple;
	bh=bm6yfuoIYWG1RX2AWHnuGqORetKiqeH8x2T0au6tuGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tp+tNdqvKW3KwVMgAU3EvImFW5APINjcYjqBUJvJFAhGVsuqRqkNgCm5wlHnLsAUXdeaQlpZJRHWvAWMMS47Z74qHzVyQ06yoEgR+aP/v8jEnpwMvBqod58tZ3yfvWXJ/v3M5mttFIua4pFhmex+uDkp97L5KpFbA+jY3B8CT8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ww5Pa/hg; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ww5Pa/hg"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-315f6b20cf9so5530840a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 23:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751524519; x=1752129319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=keubylDshnXYrMMDFPWPP9xY4/RG98/KyvI4m1F+AUc=;
        b=Ww5Pa/hg3N+ZCIe4gZnFKS5uF9/LgSvcJqQzVUv+/Jtb7aBawoL13GC8e5fUN8qj0W
         fPBtNgSKMCBqxDncypdOxIBzLfrcbNCpVFQdzxBzOQlsgCOBm5mLLJVXKtX7Mk/6wauE
         pppYywcI8Rmd6KNBIO05F9Jsus/gRge5SrY8vki+cQ4UzYk3xuhVztK4y0rtWcYJ3Apf
         4j7wl88hpfvdB1+B5yFFH0Le+pYKhtxc/RiDzYZzJM7yx05iEr3C+lUbG6UiBmYSVRVq
         9C73VVaMqGXFqp8rmvlXofJWY1UBxMy2n+xcG1mbhYkOiqaKQyRrVabciy+lOm11TU+k
         ZPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751524519; x=1752129319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keubylDshnXYrMMDFPWPP9xY4/RG98/KyvI4m1F+AUc=;
        b=oEV3LHWr6Vwm4ItPLZJ453U4z2/mZlt1QuLuKL/dQv4xph356dFIk8Cb+Ce2UAnmud
         My8fFu/kKj1c/5O23gm0adB13h52do/bS5gVs+FW+22N3Z5tDTDsX8E603BtJ9tDq48t
         CK8+WuAWVWQylX1nURt1uSzjgG2Rzl4mwU/yBXK8DsCPHJA8Mt11ra/+EhgjqztxFbY8
         GPo7eaPbm2ckmXeFyQHdB+5dM41iCi9DV7lu7cIuG1yvNhkcpsuW66zuP5293bcmsvDG
         hNpCdpOLRhYXlmduEgudMpu7cGcq9R/L1D+kRzBSaLH9m5DfPUCiGmOWFFUR1rsNkayF
         R82g==
X-Forwarded-Encrypted: i=1; AJvYcCXo5C4shJQq3DY70ZFYTLHuAIqlEM320eNknjJhzaK/fvvWtq0wUAJS0lJtbRgLb6iFkYbb/lIfZsEKTXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+kn1ROnZKOfMiEcL85ANYzYNGf3RLclhK6vsCSQqx0ICeSaC9
	GjtOpNQVAty2Jf1chnUmjO9ChKWGSh4uLq75KAKq+mUlkHtxj7r0C6d6QQ9MSvB5MQ==
X-Gm-Gg: ASbGncs8xULJR5k41qBfb9toR1D7/ptI3WEA7HrX5jJPLT2PD3Lc8CTxr7fILd2CeI3
	Xo9AfKRoGvQBUFgBcqXTy57xN3w2gYONutIR817TNMnifHX+aAgGinCZR7WPYQbQiYujen3wtZg
	fXChyH8ovjPOYbr6CfKYQWya8OueRggdMoL5PPKtioi4sO6crXrk3/ebs6O4lJD6RJ2Ky7XNxTJ
	A9dV6Nfx+LOBWNqF6iz55GJdWAx7/bip8yBBMS96LSJ3pzZuoyvAdKXYaayItaW/5pLS9Cz87MV
	FFSTFcq4oYVLKaCbZdODkl3sy7QCwxPwOLumo7qjODUEgCcpu+YX8hbLnzWBxVey0MmrRi5o
X-Google-Smtp-Source: AGHT+IGn8E19Iyov8Z7ftrCbAYJPdztbbgrl3EO9CIP5R9ODQ6bX6a5cLjYd8Ucymy4DX+teHZIrpA==
X-Received: by 2002:a17:90b:1d84:b0:312:eaea:afa1 with SMTP id 98e67ed59e1d1-31a90bed448mr7959912a91.29.1751524519481;
        Wed, 02 Jul 2025 23:35:19 -0700 (PDT)
Received: from bytedance ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9ccf874fsm1487442a91.26.2025.07.02.23.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 23:35:18 -0700 (PDT)
Date: Thu, 3 Jul 2025 14:34:56 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Benjamin Segall <bsegall@google.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
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
Message-ID: <20250703063411.GA137889@bytedance>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
 <xm26qzyyb6cn.fsf@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xm26qzyyb6cn.fsf@google.com>

Hi Benjamin,

Thanks for taking a look.

On Wed, Jul 02, 2025 at 03:00:56PM -0700, Benjamin Segall wrote:
> Aaron Lu <ziqianlu@bytedance.com> writes:
> 
> > For pelt clock, I chose to keep the current behavior to freeze it on
> > cfs_rq's throttle time. The assumption is that tasks running in kernel
> > mode should not last too long, freezing the cfs_rq's pelt clock can keep
> > its load and its corresponding sched_entity's weight. Hopefully, this can
> > result in a stable situation for the remaining running tasks to quickly
> > finish their jobs in kernel mode.
> 
> I suppose the way that this would go wrong would be CPU 1 using up all
> of the quota, and then a task waking up on CPU 2 and trying to run in
> the kernel for a while. I suspect pelt time needs to also keep running
> until all the tasks are asleep (and that's what we have been running at
> google with the version based on separate accounting, so we haven't
> accidentally done a large scale test of letting it pause).
>

Got it, I'll rework this part to keep pelt clock ticking and only stop
it when all tasks of a throttled cfs_rq get either throttled or blocked.
I will paste a diff on top of this series and if the diff looks OK, I'll
fold it to patch3 in next version.

> Otherwise it does look ok, so long as we're ok with increasing distribute
> time again.

Good to know this!

About not strictly limiting quota, I suppose that is a trade off and
having a system that is operating properly is better than a system with
task hung or even deadlock.

Best regards,
Aaron
