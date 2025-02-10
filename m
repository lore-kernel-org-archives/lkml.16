Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF6F4C6D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739149771; cv=none; b=QlIfKP6f7cIxyv76nj1CZJC/vslB8eZ28R+dkWKG9oFFy0P+71rPWVm1GUruOedmnw0hYGHoOxJB6CFGZuFWeUEcvbNb1GjYStcCjf837f9f49PMOP5O5XeW1wnDgGGkw90AOpKZjUSzobgbIX45Ic3r4rcIWX5D2NysqgxE798=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739149771; c=relaxed/simple;
	bh=r1h0WqGGMVTSA/5Y2KrDxjNBDa7Bp7GqtOCP6SRAij0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUNdFcM4ANAabDuSNvsxGngpax6Jd9JzqOe9kAfcr8rima1fmy+cnj9vmUUJH0fIUrPDGZ2GsR6JBLy0Fk2f7dqu7s/2j86MJgk7iSL3CdyYzlT7xXf8pn1Ow2nZ60kH/GKaDwhaAhk7ligNDt+iaIjZzyRwYfA9mcQI8mcGcD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b=eJwEWZsO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b="eJwEWZsO"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43944c51e41so3571565e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 17:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20230601.gappssmtp.com; s=20230601; t=1739149767; x=1739754567; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uOpDVFM/8/rrlYtdbOj53QdpuHcpgNHwGIwNDYDMxvI=;
        b=eJwEWZsOjBTNDo34i8bYUIkLv6fzEgxb7Et7lmovqg7Dy7jcWmcUE3F5JLku1Y0N5c
         oKS/2cLI4+oOIuyn3IukebI/E7XU7D54wMFg0DljeX5Mdbi/Gfa6aZxcagEGwd9jp0PJ
         zt0lisap1Z7GWsnlhR+KMN3HebMZUw8Nfq0aX7RJToX63kKsQFquyIqfprMiSE0ZA+sO
         7M22r2DQxKeLrGHHIoWns/xro8R5eE0EOez7DUUT+79Q4AFOZw6QQ3FJ6+hYoS6Guo9Z
         XLXnWyObgxhFdM6uPonLviJOClo8P3vB10xl3e8b0c03lqdf8Dld7SUURO+8abFo6Fhg
         17Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739149767; x=1739754567;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uOpDVFM/8/rrlYtdbOj53QdpuHcpgNHwGIwNDYDMxvI=;
        b=MoVhuOAAgafUxt1Av60CtfGm7ZUYZHxMFCU/YYIqao8U4VIrh+n6M7mEsPBI1+3drR
         JSy2V6TbFrbzg1gPRKeCOrIt3gJnR8/jfDtEtM/vlV0IWADJyyOmI5qfgs6pjbjdGx8J
         kCiP5n7EtbST7mjAv/ufCkU7DzSVWL/VMXqJDiaC2K/EMSh07epsMYim5PtTI6MY0pC8
         llUj9TYypOPFxFs94gPW+sW/E0x2+3/0nNJ2D9uurfw8otQrrbhKpyNVO6hQJSIfHVdW
         d56Zxz7G12Tkx8wHwZmMh6iWU6XdOXZ8paAQUbbaYnp5NchDtHnLUJ1aAmjaQFHi1HHT
         H6+A==
X-Forwarded-Encrypted: i=1; AJvYcCXHBgIYTqn+k4HTcPml28EMWBthim5Tom1Y9TJMQgKy0S4Z1i+RDCXRoq/iLSSEQ05VPNzeWxQ0op0vxEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3fz2RXcy44rUVD+oUCT9Zcl4WhYFxCZZ0/AFt4wzDivlriLdf
	o55M4CwGhWQCXosySt5OYo5I03T/tl2HMBOHY1geQGh9eOJMcsnbIsI94kIY6eo=
X-Gm-Gg: ASbGncvTesfuPPOUQHMb0rtuhNoqav5v9TSR2RCPasoZJVEMHRMLgWfoMdXjgSSpZG/
	Ncy1Ts4zR3trXnSRIg7gle2rZ1UfdvGtiltBfsFK2A+a6avdwCNVLA7AB4Thya2e9r9sSSBmaiU
	Rfh1yJyQ0Pi1pbuQUyEDVr4G8Yqn7UL3MGe1Pq6UPYOX9Diwp94+hVGKZEGkklLXy0Wu0ZM8Cy1
	Yg0cHh2fF/hx1OvwFmwIRqhR6dmr2sL6dpTMec1dDsc0Q32G470chZe01660uxPQG5M0Xmz7yha
	dMRjshm/AHleHT2jQb5y36sH5YNtqghlodvX0T9tdbGtm6Wgk4pdED6qRbBgG9lka3Kn
X-Google-Smtp-Source: AGHT+IGS7gfj3CB1/KUv1kIZTFX0xIkF0GhE2OfCEzcaH+6dOaiEk5/NSb6cz31biatxYHDynwdZmQ==
X-Received: by 2002:a05:600c:3ba3:b0:432:cbe5:4f09 with SMTP id 5b1f17b1804b1-4392497cf2fmr87197395e9.4.1739149767355;
        Sun, 09 Feb 2025 17:09:27 -0800 (PST)
Received: from airbuntu (host109-154-33-115.range109-154.btcentralplus.com. [109.154.33.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dcae129sm127716265e9.17.2025.02.09.17.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 17:09:26 -0800 (PST)
Date: Mon, 10 Feb 2025 01:09:25 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Stephen Boyd <sboyd@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Bitao Hu <yaoma@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>, kernel-team@android.com
Subject: Re: [RFC][PATCH 0/3] DynamicHZ: Configuring the timer tick rate at
 boot time
Message-ID: <20250210010925.2eyn42dj7mbft7em@airbuntu>
References: <20250128063301.3879317-1-jstultz@google.com>
 <87cyg67up9.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cyg67up9.ffs@tglx>

On 01/28/25 17:46, Thomas Gleixner wrote:

> > However, having to select the system HZ value at build time is
> > somewhat limiting. Distros have to make choices for their users
> > as to what the best HZ value would be balancing latency and
> > power usage.
> >
> > With Android, this is a major issue, as we have one GKI binary
> > that runs across a wide array of devices from top of the line
> > flagship phones to watches. Balancing the choice for HZ is
> > difficult, we currently have HZ=250, but some devices would love
> > to have HZ=1000, while other devices aren’t willing to pay the
> > power cost of 4x the timer slots, resulting in shorter idle
> > times.
> 
> The shorter idle times are because timer wheel timers wake up more
> accurately with HZ=1000 and not because the scheduler is more agressive?

You'll all find another patch [1] in your inbox which changes the default to
1ms. And (hopefully) explains the details of why higher values are bad for
modern systems/workloads. And why power could be expectedly worse in a number
of use cases.

TLDR, beside the reason above the system is generally responsive. It was by
accident ending up stuck at lower frequencies and in case of HMP systems on
smaller cores. With faster tick we respond faster to demand shifting
frequencies higher and biasing task placement to bigger core fixing performance
issues along the way.

> Aside of that, using random HZ values is a pretty academic exercise and
> HZ=300 had been introduced for multimedia to cater for 30FPS. But that
> was long ago when high resolution timers, NOHZ and modern graphic
> devices did not exist.
> 
> I seriously doubt that HZ=300 has any actual advantage on modern
> systems. Sure, I know that SteamOS uses HZ=300, but AFAICT from public
> discussions this just caters to the HZ=300 myth and is not backed by any
> factual evidence that HZ=300 is so superior. Quite the contrary there
> are enough people who actually want HZ=1000 for better responsiveness.

These lower HZ values don't make sense to me either and I think keeping them is
just giving people more means to shoot themselves in the foot. HZ=100 irks
particularly as to my humble understanding it is there to help throughput, but
I truly doubt this is a sensible configuration anymore. I believe they are
better with setting the base_slice to 10ms by default now while still keep
HZ=1000. But there could be sensible reasons why it is useful beyond my
knowledge.

My biggest worry this could be a common source of 'sched latency'. The ancient
trade-offs don't hold anymore IMHO.

FWIW I had a series that converted HZ into a variable and did a good chunk of
work to convert a large number of users and conversion code. Sadly I lost it
:''( Though it seems you had another idea on how it should be done. So maybe
I shouldn't cry too hard on losing it.

Not trying to side track the discussion. But just wanted to point out maybe we
should do some clean up on current supported HZ values and think harder whether
anything but HZ=1000 makes sense still. Having the dynamic option is great, but
my gut feeling is that we want to have a single HZ=1000 and fix the potential
remaining issues that could make TICK disturb idle (if any). I am not buying
the throughput argument, but have little experience with the monstrous
machines. If folks with big machine see throughput issues, it'd be great to
learn about those. As I tried to argue in my patch [1], I believe latency is
dominant on modern systems. It has important consequences on scheduler
decisions. Peter and Vincent can correct me if I went astray.

[1] https://lore.kernel.org/lkml/20250210001915.123424-1-qyousef@layalina.io/
