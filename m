Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B63A2206B7
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544864; cv=none; b=gQQuWrDDeU6B5Xf2Bjx61xFfyWQLRhwZ+wrlbIZ0DfesZHVWE1bmuwYTQWcgnj/U0BOBGJtK/yo7VUeKF93WmwgPpI+ar4fEeMS2fJXLmbKvv/cLQY2a89jthYrLxyF2cYB1dGneGGF5x3zMuezjM+lumwIhX/pEgigTQ9bE/ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544864; c=relaxed/simple;
	bh=gEO7YSf8CgCFv4BTWdHJlWh3EwwkgVN5UPSYggIFAYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUmd3q9dGFq0u9TXEC8F/VEC0VaBfjGj43L2bWfVgj9HO8W/YO2px5Egn5U2vQSvzYVC28UFjkiVm6zmehrBOU6BsBtxGI1TlTK5EiXYGRdFiuf15w7fFPFpm4xIUc6HFvBXJ/UV8SHwwdKsQG43vaNzQbWdlQgkH80ApV902rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cvxheTvV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cvxheTvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749544861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z1nu6hXyakj9Q2hsho1Wu8fu0clPVHtBrEDl2uCVUQQ=;
	b=cvxheTvV8h28kD4ChiY6FfzGonqoOw+CsYi4uyrw5HWleMgO7NrsfODQMu7ulNXblLUn8M
	hh3suH3HBSJdJFqFAgbp6xwe8PH/VJojSEI/rjDTLvr25rm3lx/r2ZtVYyYYvlON13zVex
	aauQEH6gawUkE4ecBEPnYtI61weI5T0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-qNu4ceHeMW-fo0rSekHH2w-1; Tue, 10 Jun 2025 04:41:00 -0400
X-MC-Unique: qNu4ceHeMW-fo0rSekHH2w-1
X-Mimecast-MFC-AGG-ID: qNu4ceHeMW-fo0rSekHH2w_1749544859
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so29498335e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544859; x=1750149659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1nu6hXyakj9Q2hsho1Wu8fu0clPVHtBrEDl2uCVUQQ=;
        b=c6GvR7BM9m66ExdGodkcpQ97dXh6lab9l8/Z/RkHSZCrbw5hbQ0zR5GH5L5FRoigNA
         XVH5DCmCilGGTvngYrcEMvW1BVuwCpTv9LorFfLVK/T2QlKEE+iMZBkGK589Y1MbRF6F
         Oo/orVhtJx52TU9+F/7WLPjTcd2XER/RhQKosgXCdTZITC7oTgETgyaKQwOh7vm9YCGN
         ETiIkZCbFnu0FPb2nfVlMg9UGruVSZhMBnnYpcfUtLkCbAWoYIJmxIH84AG3L/0Molc6
         4wFPDvjCEn6uQvCEn4W+KcaXi9U/X72wbJYtEOai1bON9ZCtB8URcSH8cbY92CCFBB06
         E1YQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7V2Lkgv2TDch4bWwQp9QINK+pfq5G1zDv3MMn1svFG/iQJ/sp0uluHPE3vw+0Jo1n6DNarF4l8fbx6+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YypqVDFdjgqJZL1FxsCYVBBT669lbMHavdipTmpRGET8u80P485
	QtgEFlcc7RrvXVcOVc9j8b/Kf7NirvRCc2QfGlKJZoDm54xXGNw/7VfMcwJlEAl3TJpjvhc5DE+
	nzJDPnis2huLYwv66lgNS12RL0212F02BM6S5igHWlhy+3QochrjNbNbpu014HsSP1w==
X-Gm-Gg: ASbGncv525UsXEoTl2tGEeiXpNk9LivXNLGUIlM4blmIPH9bKExu2VPEHur2OqrlPzd
	nl2Qk6R/TiKe1XeN9kP6/6bYR5Z70fC85WR0C24EsbQI6gVjVDUlYQ1ll7OF/Zu9UvyGOQotoxP
	BPRWBDazXUkO8rESJpHyc2xyFyGNT4qxUyjk9/kPgpToB7ctCo9wR9oAxDpi8CNo608oo9ZZLuZ
	0OkFhof0jRROcfPKubV4nFA81esm7H7yVh9C2LI3CLJeLdp0wsBYBxw2t7SoHcPfPCqxvuSfPi+
	VX5UsB+VxxWbNFHAyAFuDXArpfqSE6IHFiYr1n4LmC1/ReDZuTv7
X-Received: by 2002:a05:600c:c4a2:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-45201497bd2mr96643125e9.22.1749544859049;
        Tue, 10 Jun 2025 01:40:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbDWjdaVktXafNbiRualejse1wr9Mj0IkmxWs9mmMuIId2sSwZolgbJx9kTiDclLvu+Vijsw==
X-Received: by 2002:a05:600c:c4a2:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-45201497bd2mr96642905e9.22.1749544858663;
        Tue, 10 Jun 2025 01:40:58 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.57.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e155500sm130072765e9.9.2025.06.10.01.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:40:58 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:40:56 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Yuri Andriaccio <yurand2000@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: Re: [RFC PATCH 8/9] sched/rt: Remove support for cgroups-v1
Message-ID: <aEfvmM-VpKru33Ql@jlelli-thinkpadt14gen4.remote.csb>
References: <20250605071412.139240-1-yurand2000@gmail.com>
 <20250605071412.139240-9-yurand2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605071412.139240-9-yurand2000@gmail.com>

Hello,

On 05/06/25 09:14, Yuri Andriaccio wrote:
> Disable control files for cgroups-v1, and allow only cgroups-v2. This should
> simplify maintaining the code, also because cgroups-v1 is deprecated.

I wonder if the change above and what below need to be split in separate
patches. They look orthogonal and we would have a single separate patch
disabling v1 support which is probably desirable.

> Set the default rt-cgroups runtime to zero, otherwise a cgroup-v1 kernel will
> not be able to start SCHED_DEADLINE tasks.
> 
> Allow zeroing the runtime of the root control group. This runtime only affects
> the available bandwidth of the rt-cgroup hierarchy but not the SCHED_FIFO /
> SCHED_RR tasks on the global runqueue.
> 
> Notes:
> Disabling the root control group bandwidth should not cause any side effect, as
> SCHED_FIFO / SCHED_RR tasks do not depend on it since the introduction of
> fair_servers.

Also, what summarized above needs to be well documented in the kernel
docs, as I am pretty sure it will surprise people (actually surprised
even myself while playing with the set :).

Thanks,
Juri

