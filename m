Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C30A1B85FD
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739228705; cv=none; b=aeRNyAq9wotJemQJVZf8kC9RGf616E3HWJRGkJMTIHUXjH070kV4om++CSGQmbtMgObHzz3xVAU9TsB5GATxaCl/juRp2sMrNdD8tkqyEAu8eoZlUperduZMYIqTM0P1p6KrYdXd0X9sfMbnoCGtl4s5PnPgp2xD477kveE6eOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739228705; c=relaxed/simple;
	bh=z3UrNMiR6l0uG5g5FmTcULYC9yoRVtWXllDPAWa3YZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9nrikZTU1YCvc5ZtV1qa/Hv/8bigBC2xVMddUhyej2Ks4zULj+/SSPJYZO9cdx05m84dKSxwIHuMp9gX44naQjMdfh27PAQRSDBYiAcY1WNLprfmdv4AHLD+cTFbBYvywreTtOGXQPmZqXBOmyqVjev9B4qp+lqHPGBquWmu7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b=e/TApre9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b="e/TApre9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so12337415e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20230601.gappssmtp.com; s=20230601; t=1739228702; x=1739833502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z76HIOpdBPSSXjmxkis4KHmu4HPkG0eb+tXjF+USnLY=;
        b=e/TApre9n9cF1EVic93Er6Hf+CgvN4MCF1/YAstJ8Bbb1ef24l4cBqIpqUf4wNUdV/
         rUHT0wnv5yOO0dKkU/4absIgmMCdA6LrZ6Ekn0e9duAqf5Oac7xdOdViQ7NJ7K7tn/V3
         3SeJowe958dk+prt8pS1czbQ7Tu/HMAGmLOm+hPJX4NZSPWCPW/hvQkjxurUIPCDWrnp
         pC/Mkx65P16seEkAK8J34b6Qn93iJTqGlHybfjFbf68CZTNXjLihJgoPGPU46JcoDTfn
         raKpY+MhM1rv/zzLV3qxU8mUaV00f9j8Af+knWw4t5KXfeWFfZM+8iwHfIUmXjuCPcrx
         3/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228702; x=1739833502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z76HIOpdBPSSXjmxkis4KHmu4HPkG0eb+tXjF+USnLY=;
        b=BA6LJH8JtJqfi913p4kAlXH7nCXb99C7l3UkX1lAnUvqu382Duf7XXsv8HdJ/0/ePI
         rl40lOiVeA1dCdBymvYLCmqYwPLR/Kjj2IoUp8UuFG/YHsGbZMpOBP7Yo4uQJrfjAlya
         lt6pJ8Q0fkc6SgtkPcS3mH8JPPzcuYfCjMS4Mf0ft7PMPLENz8ASfSBfklI4VREHf7lW
         BkcscCM9nJfl4gcqXKM50zt63+iZSYFAHKX1X+815d/kKrziShqK0+g4Dmb80e9KJcoU
         ttyrx1lxBYh6s5WxAoER2mC4pEFKyc50lBgfRhqajwGBE7liOyBoXWAbqicjNgP2CgbI
         nLgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn9mrDVYd8wDjvR1xILLIA7XXID9L/X34Q4olpEyEqg/cvOzIla2zi4eriI82HAc1m/8OBqxfAJSYMw+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ylpbkxRTBLpQkTIFVr6V7D9DJSdlQdK+5o8G1mscaxrISLfa
	ec2n34xxQ0JfBvHCpfYua9rUnbI2259O6/XzriAClrJGRhPjkNuAAbNADkwUOZk=
X-Gm-Gg: ASbGncsf8XSf2p2MIm9AS4gHHue7SQtLAjcyf5x8SQ9EaLfJPncIf+S7JVPSynKGfDp
	V7qWA5N1JSCyLJPEu9oxuegEbv/KfCU3wQEF8rof4HwhvNCDPV9pUZl/jwjUuCOraXwNudLOJz/
	c5FZGhx5qyhREGnted8NBTEf1en2NKJidNanHAIlrNRT4XxRVrbzbcFogpoPkVi6wzwQJLBc9en
	HtK1faA9n78KdX9DoC2kM+VZ30UuicLAizT30ybGiiwVdehB+SPmLJ2Yq94ww5pwBdn3u8k/vKu
	YV7Kc/tQsdKqsfbdN4DE0RAzIGY7U+JBs73HEDnd4DHj6Z0CtcjUZR2lANQI59DVW7am
X-Google-Smtp-Source: AGHT+IHeG1UL95C08yR7qKBfXrXwgifS2K4rKIoMNAtk+DZwWvwp29ocvdbNvsUs/lAHs9sQzbiaLQ==
X-Received: by 2002:a05:600c:348a:b0:436:f3f6:9582 with SMTP id 5b1f17b1804b1-4394c8185d5mr13151505e9.8.1739228701705;
        Mon, 10 Feb 2025 15:05:01 -0800 (PST)
Received: from airbuntu (host109-154-33-115.range109-154.btcentralplus.com. [109.154.33.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ff64sm155557835e9.9.2025.02.10.15.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 15:05:01 -0800 (PST)
Date: Mon, 10 Feb 2025 23:05:00 +0000
From: Qais Yousef <qyousef@layalina.io>
To: Peter Zijlstra <peterz@infradead.org>
Cc: zihan zhou <15645113830zzh@gmail.com>, bsegall@google.com,
	dietmar.eggemann@arm.com, juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com,
	rostedt@goodmis.org, vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH V3 1/2] sched: Reduce the default slice to avoid tasks
 getting an extra tick
Message-ID: <20250210230500.53mybtyvzhdagot5@airbuntu>
References: <20250208074821.11832-1-15645113830zzh@gmail.com>
 <20250208075322.13139-1-15645113830zzh@gmail.com>
 <20250210012931.ym337oexdcjmwwzv@airbuntu>
 <20250210091352.GC10324@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210091352.GC10324@noisy.programming.kicks-ass.net>

On 02/10/25 10:13, Peter Zijlstra wrote:
> On Mon, Feb 10, 2025 at 01:29:31AM +0000, Qais Yousef wrote:
> 
> > I brought the topic up of these magic values with Peter and Vincent in LPC as
> > I think this logic is confusing. I have nothing against your patch, but if the
> > maintainers agree I am in favour of removing it completely in favour of setting
> > it to a single value that is the same across all systems.
> 
> You're talking about the scaling, right?

Right.

> 
> Yeah, it is of limited use. The cap at 8, combined with the fact that
> its really hard to find a machine with less than 8 CPUs on, makes the
> whole thing mostly useless.

Yes. The minimum bar of modern hardware is higher now. And generally IMHO this
value depends on workload. NR_CPUs can make an overloaded case harder, but it
really wouldn't take much to saturate 8 CPUs compared to 2 CPUs. And from
experience the larger the machine the larger the workload, so the worst case
scenario of having to slice won't be in practice too much different. Especially
many programmers look at NR_CPUs and spawn as many threads..

Besides with EAS we force packing, so we artificially force contention to save
power.

Dynamically depending on rq->hr_nr_runnable looks attractive but I think this
is a recipe for more confusion. We sort of had this with sched_period, the new
fixed model is better IMHO.

> 
> Back when we did this, we still had dual-core laptops. Now phones have
> 8 or more CPUs on.
> 
> So I don't think I mind ripping it out.

Great!
