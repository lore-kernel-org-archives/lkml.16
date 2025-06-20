Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD712EA144
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433325; cv=none; b=n22YYCdHA7VA/H9Y/JTOTde8XOReq4emWgx5ZliKibCzgKBRSzU+Xxo7bOOOEfiBsA+lq9+04CRBH4nF5Av/EMIioMazH52+ZEVHc2Tz4WiYUeBzeA9A/8DE4OzVlLrfq7WMAkg/nZjXPUjQL0H8nRA6lAOj1jOyf0A+3jEh7xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433325; c=relaxed/simple;
	bh=4ifyr5HwnktnFxdMvxkYPi1tDYPvTrYNXWPX3/Gw/bM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBErDBIC364c/AiOXvjrJoTNaLMpBxl4aw58EFSEs9bTDbbDWwGt2nhvYnBy/MOBXVf4dwTxKcR8Ec9A2Li0mVL6KGoex2Lj9zqRnTWf002NZyFoWlfwZcRAflqs9lfToZr9mkn2xa666CpoNAJxC+Fuxbo9YZm7WkLzsJqfvis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IyIT9VXP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IyIT9VXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750433317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1gqWJUasBkQtdvrq4yCSG9fuArz1J0NNTveYdexIZwI=;
	b=IyIT9VXPOY2aiBjKmRHIvopXY8Y0MPYLvv+sWXv6XKsZ39ZFZy7lKyfX+ybZ+EEvtf7SSj
	6eiF4B2L5PjYFToLLaE9ETTK2UQ+GMG/ZQQVCdv7EmmWiMyPYSr/4Drx+NwQFZU9+0CAEX
	rEKVOFpm7JVscwXwjFrPJklgavOBcJc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-BfdEqYcIOo2YT6DT3SEXwQ-1; Fri, 20 Jun 2025 11:28:35 -0400
X-MC-Unique: BfdEqYcIOo2YT6DT3SEXwQ-1
X-Mimecast-MFC-AGG-ID: BfdEqYcIOo2YT6DT3SEXwQ_1750433314
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so9728705e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750433313; x=1751038113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gqWJUasBkQtdvrq4yCSG9fuArz1J0NNTveYdexIZwI=;
        b=efE5foWzl1cUwfVRm2K43Q0nVqmvR3n73gwh1osqQ+OUpKYru6HRxvAnECxYBmEeAg
         8kIn8icgjWL/I9zr7oOZAN/LM8A8NXq6bMvu94jMe1AMEqedoGIlaXjwBGkc0xXof8To
         jY+LFVjciG9PpYSAuPHMdQmQslu3+BjkbA87gizqNLseJFBW3HIBaDvJmVzngIO0Hgup
         NHEg1eYaOY31o3FIffYXZ1dfSeYPyYNx+vU+CR1ZHPkB+3p2cxG9BSZZrqFx0SeJRn8r
         Mp2t/rKes/REGoSH+hnqnu/06fqLBMml3MidnOTDd6YgDVGmyV0YOkjkkNt+9NOQp6sS
         kn4w==
X-Forwarded-Encrypted: i=1; AJvYcCVad0t//4OSea7hI4gFgPQ5BE0uCv6mQfOXiRb+NQ1MOlUKcA65KaFRnlgoNbGzTd7NttqDb47qXBwc4mo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlTqtxZq5AaYVLuuXmpKwQVhEOPfuSJAlbDykfNmhuy/oSvTs2
	LiyxpdGwFD9/3S9dcAZzEsAuQHtu+k4KSQ8kkTtqhUGwQyg0Gwzbru1YriC7g3eS8+Q1y/xrkRF
	r2xEuyOx/0wPUwPat4zp7JZQGc3Upu7MnBpK6P5eamrDoG0uEdKAa1nRXpXHqc48equgiGVDXDg
	==
X-Gm-Gg: ASbGncsP58iBWdR+iT+TR0/cBc2zDsm+rsw5eB6bHb3iHCNxZ1OhQjg0x4MOHJURqii
	xxCz7ApmLm1CSAF86agy3LzEjigZ4Hr7d1tpwZDujsdKfnJ5aBY6lI21MIqoan5ghuEmbtSNqpH
	67LAHxaTyWBandpordVr/moPOsKWb1fz2zDgSjqyJCQ7QgfSkirNo4WLZ6Po+H90Mce+GADYeuR
	SLjmvQEbQZsgIeDMzwDhtVysM+yXBgTJ4tY166MxAUVfwbAXphwfoGFNitCiegeOZQsfNiD9xNH
	XuGIO0AYAGBJhAFyxgRHP8wGwdKrGvjX4TyvRVVJih0nvYGx56vu
X-Received: by 2002:a05:600c:3112:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-453659be4a1mr30214215e9.6.1750433312966;
        Fri, 20 Jun 2025 08:28:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKY+dYrr143FLk/XG0o0u1D9fPvHuSZMjgZhsHAersc8CLX74Nsye96HTYZhCJfKJjFFdYQw==
X-Received: by 2002:a05:600c:3112:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-453659be4a1mr30214045e9.6.1750433312573;
        Fri, 20 Jun 2025 08:28:32 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.47.238.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1050dsm2433175f8f.19.2025.06.20.08.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:28:31 -0700 (PDT)
Date: Fri, 20 Jun 2025 17:28:28 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: luca abeni <luca.abeni@santannapisa.it>
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <aFV-HEwOTq0a37ax@jlelli-thinkpadt14gen4.remote.csb>
References: <92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
 <20250523214603.043833e3@nowhere>
 <c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
 <aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
 <8d6dd3013b05225541821132398cb7615cdd874e.camel@codethink.co.uk>
 <aFFdseGAqImLtVCH@jlelli-thinkpadt14gen4.remote.csb>
 <880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
 <aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
 <20250620113745.6833bccb@luca64>
 <20250620161606.2ff81fb1@nowhere>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620161606.2ff81fb1@nowhere>

On 20/06/25 16:16, luca abeni wrote:
> On Fri, 20 Jun 2025 11:37:45 +0200
> luca abeni <luca.abeni@santannapisa.it> wrote:
> [...]
> > > Luca, Vineeth (for the recent introduction of max_bw), maybe we
> > > could take a step back and re-check (and maybe and document better
> > > :) what each variable is meant to do and how it gets updated?  
> > 
> > I am not sure about the funny values initially assigned to these
> > variables, but I can surely provide some documentation about what
> > these variables represent... I am going to look at this and I'll send
> > some comments or patches.
> 
> So, I had a look tying to to remember the situation... This is my
> current understanding:
> - the max_bw field should be just the maximum amount of CPU bandwidth we
>   want to use with reclaiming... It is rt_runtime_us / rt_period_us; I
>   guess it is cached in this field just to avoid computing it every
>   time.
>   So, max_bw should be updated only when
>   /proc/sys/kernel/sched_rt_{runtime,period}_us are written
> - the extra_bw field represents an additional amount of CPU bandwidth
>   we can reclaim on each core (the original m-GRUB algorithm just
>   reclaimed Uinact, the utilization of inactive tasks).
>   It is initialized to Umax when no SCHED_DEADLINE tasks exist and

Is Umax == max_bw from above?

>   should be decreased by Ui when a task with utilization Ui becomes
>   SCHED_DEADLINE (and increased by Ui when the SCHED_DEADLINE task
>   terminates or changes scheduling policy). Since this value is
>   per_core, Ui is divided by the number of cores in the root domain...
>   From what you write, I guess extra_bw is not correctly
>   initialized/updated when a new root domain is created?

It looks like so yeah. After boot and when domains are dinamically
created. But, I am still not 100%, I only see weird numbers that I
struggle to relate with what you say above. :)

> All this information is probably not properly documented... Should I
> improve the description in Documentation/scheduler/sched-deadline.rst
> or do you prefer some comments in kernel/sched/deadline.c? (or .h?)

I think ideally both. sched-deadline.rst should probably contain the
whole picture with more information and .c/.h the condendensed version.

Thanks!
Juri

