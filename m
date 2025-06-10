Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C9227EC7C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545166; cv=none; b=e6jQSBs9xbCmrre+fhgohkyJC0AB58mgiQTyfx9/C0iWLeKKXFODyLh6jrlinq4AD8RmySLYA/plNPL7Ya0MrIa/YyZbw2nIByBO/RifnV/bFHUwMI2zkoctkrmlbZu6+K73sn6Wi7NzYc/lfRr8qy6yc2CVbc7bcBETxRPJ59A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545166; c=relaxed/simple;
	bh=fTK4CODosSDp24WHz78RHZJzCrsZ4IvSVKoYfL26+/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/NkIVZ+kYim+osEzL1NF5/HSS7Ci+MGctHm29bpmX02mwAJmETnqCVxeqe0H+X/OHqeNpoE+Fm5KqcbEysCrV5bE8WaNvH+kePCzxT2YXBmwPIZWATsc0Ji68cmFVnyr1U3/4IOR/FF9EUQPiHbxoGzE2zK8UH+ItPWGOM3o6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fIXPU9uM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fIXPU9uM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749545163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rg+gfSECsuTsHNHPqeWr329Fm5uWzbUQyBj2oWkXxPo=;
	b=fIXPU9uM4vI62CcEkMI8MtcfM3KPu45crllIW1IdDwGQp0L3ZRMU99DVgvQuhCrdapkAzE
	0tJJUgtGk7Xm6HYIjkw4S6UPmPMVUnQ4Cb2vqF58hukLDobqoGRmfBEvgeLqDb4p7vWEYo
	pXXP3qWwCCB22CMqRxLYsXYdjxdfmVc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-Ypua9qAGOtiAFPUTjYD-kw-1; Tue, 10 Jun 2025 04:46:01 -0400
X-MC-Unique: Ypua9qAGOtiAFPUTjYD-kw-1
X-Mimecast-MFC-AGG-ID: Ypua9qAGOtiAFPUTjYD-kw_1749545161
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45311704d22so11797995e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749545161; x=1750149961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rg+gfSECsuTsHNHPqeWr329Fm5uWzbUQyBj2oWkXxPo=;
        b=SCq3oKcgzyAjSPy2oUUluR0Ckxfnwn9gkyqQ3lpOQfVThzROhsKTiUXjb7TJd6jziq
         XS9AEAHLVVJvZpWuovjbZj7YRdxkGIk7mHtH/hsB/727Zjdsbo+38eIrLJK7FWPVBE8N
         C79V3VSsqfoxysvTT274zyyNNqhvzz1GeZlEP0TRChhwY3bDOVBONRCQasOJeCcvZdU2
         qCcewffX6QaJJ/7a+WqUzzaje76KDRO0WL/vKCJ+xB/i3WVzgnai2lq80fkpWAY1VIX6
         s8ULqzx+jgPe+v9UTXzPoNvt3aZAs96NKHMLCm9whNIe4t7lORs4tAHXkIcs2UkyMHJ/
         XK6w==
X-Forwarded-Encrypted: i=1; AJvYcCWrZOS9YGaqZYL9TXN2KOAWGjOG7fqJXbKPRtPXRpVHWlStsH+QqPUPYoNG6y4yPNyUfsMy4vVinP5t24Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1KcV1igRSuDG8J5hqMxa+wW2lVk0/wrw2AxmbtewuBFF+IIk8
	cl4SBf8jUYo4Kk308+7egVWqubUpRgRLduSD+TMFP4UJvF7e6MAHAhMBb/PhwqZTzx7g5t4erxn
	Z4ctjl9mcJtiC3HmB6yzTsFY7HF9jD6sjjGuhWh8dOw/eyaD/V6buyRyfUJjtBIKL9A==
X-Gm-Gg: ASbGncvaM1EHSxID9qIVw3mVefhTYgCpiyOZS/9bt8bxYQpuKV0n8EAJ6pGYg9VmPlZ
	3xpS1RtcdhiHa9ns5VFQUrCckUMNykuIw+zxucmsCdEyeFeaees13GBvF6wz5FH0t6qCeGC+EsF
	6mUbER5SPYd40HTa62YnSWqBZJvImu/OoppPMsMfEXkmOyOT5vrNafTmaA4rq7eAIi12AyPFlXE
	/661pTm2R7xPOMrQryEGwnnGhQPSQaMwUwVYVorh6Um0x4vcQ6QLJ8upoWj0kUkMI3mrOKibap1
	J1bRw9bF23uIIsHBDHiF0bZ6JJOpHlO0Z7+EWC/gcrHTTCIXotTo
X-Received: by 2002:a05:600c:8581:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-453066fbe7bmr58782455e9.11.1749545160745;
        Tue, 10 Jun 2025 01:46:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDOHo1EY5oQFYBfWg+noxGSwkAhS8linSqPJ0jhy60+mLHqV4TcT9OAKihyP9FsG3w5KVJ4A==
X-Received: by 2002:a05:600c:8581:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-453066fbe7bmr58782215e9.11.1749545160315;
        Tue, 10 Jun 2025 01:46:00 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.57.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532056486dsm4466525e9.1.2025.06.10.01.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:45:59 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:45:57 +0200
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
Subject: Re: [RFC PATCH 5/9] sched/deadline: Hierarchical scheduling with DL
 on top of RT
Message-ID: <aEfwxUyu54Y1EXJI@jlelli-thinkpadt14gen4.remote.csb>
References: <20250605071412.139240-1-yurand2000@gmail.com>
 <20250605071412.139240-6-yurand2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605071412.139240-6-yurand2000@gmail.com>

Hello,

On 05/06/25 09:14, Yuri Andriaccio wrote:
> From: luca abeni <luca.abeni@santannapisa.it>
> 
> Implement the hierarchical scheduling mechanism:
> - Enforce the runtime of RT tasks controlled by cgroups using the dl_server
>   mechanism, based on the runtime and period (the deadline is set equal
>   to the period) parameters.
> - Make sched_dl_entity store the cgroups' RT local runqueue, and provide a
>   rt_rq for this runqueue.
> - Allow zeroing the runtime of a rt cgroups.
> 
> Update dl_server code:
> - Make check for the return value of dl_server_apply_params on initialization
>   of the fair server.
> - Initialize the dl_server in dl_server_start only if it is a fair server, but
>   do not initialize other types of servers, regardless of its period value.
> - Make inc_dl_task and dec_dl_task increase/decrease by one the value of active
>   tasks if a fair_server starts/stops, while ignore rt-cgroups dl_servers in
>   the accounting.
> 
> Co-developed-by: Alessio Balsini <a.balsini@sssup.it>
> Signed-off-by: Alessio Balsini <a.balsini@sssup.it>
> Co-developed-by: Andrea Parri <parri.andrea@gmail.com>
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> Co-developed-by: Yuri Andriaccio <yurand2000@gmail.com>
> Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
> Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
> ---
>  kernel/sched/autogroup.c |   4 +-
>  kernel/sched/core.c      |  15 +-
>  kernel/sched/deadline.c  | 145 ++++++++++++--
>  kernel/sched/rt.c        | 415 ++++++++++++++++++++++++++-------------
>  kernel/sched/sched.h     |  59 +++++-
>  kernel/sched/syscalls.c  |   4 +-
>  6 files changed, 471 insertions(+), 171 deletions(-)

From changelog (and confirmed by changed lines), this patch might be
doing too many things at once and so it might be harder to review. Do
you think it can be split in smaller chunks?

Thanks,
Juri

