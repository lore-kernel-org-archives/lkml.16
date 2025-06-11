Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A04C8FE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667924; cv=none; b=qQlMC99D1EG7j48JjkUs47MK0v5ay0pbx83S0/1Gg8tPVeDBgS00dJJ8UhtP7traJVdW1fqO5hW6fEfu0cPpmD/aaCgSYzYi7DHV6e6Kj1KDLfXZdM0dlL0Ojswwde+XaztyFT5VW/Hgrb/DsDtMKXwMSgBQ83dKdqSlDkxciLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667924; c=relaxed/simple;
	bh=kAGN3q7sLnscFHDkYJjPpSRwEd31KZvcJj4sfQlPVbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igF0kjcFXkEYkjZlbqmzei6XpyizDfvg0qZrdtYVGBWTebt2UNkhSoej50/7Psv/cp2q9/ozXen1Ebg9t8KfqCH2JWv1H2yy/wKd5iqBRzHKcpBiN508gCJA1izSetShyrqbad2pgsCq9NMbM5+xV02ALekwH1ySkiRGr4TDOgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mHcUFjk4; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mHcUFjk4"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234fcadde3eso2209295ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749667922; x=1750272722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8dNFQR6DwLKSqb/lm3sm6C2D1H+3BGQbDVmpKSvZzQM=;
        b=mHcUFjk4op1L+BgvtzxJxhJKysKKHGF77KA6QMcy+Zf7dgYAdDl3/DQTlMDqW3qgec
         SnXIgK8YslRen62xgTEQGnEdHScsNbx4PlErRU5QOd+MUwrjudj9jbWXi/smJ6/i7N1+
         mRS4kH/t4aEhiYrDa3RtlgB+6CgP3lxdjbmLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749667922; x=1750272722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dNFQR6DwLKSqb/lm3sm6C2D1H+3BGQbDVmpKSvZzQM=;
        b=ApDZsi6ho0495NINDXCIhIX/JWq9tiIlLJpqjIMi3Q8OAO/1zWbTKtt3Irsqwq9jSc
         u/e92xiOz/4NURKRsd5kjCJZhAaSzSuDuDGTq4HTtlcFXFXwuQlEX4bMb45CmokqXaJD
         T8M6Lv6LN2jQLtexKLYMFM52QNnznq/fsfFv5OCDS/XQHVnYoCP6jAB1DJq4P3lQUNLR
         yUl7EYUAGgKXdHmnYtShqBbZ1kQOQw2yYzgKn5yu8lUkwvxSC1Zrh/yD69SHEJyqZbMY
         GqPBXAt4CpACD8wYVDuGgHeMBClmjYcEt9uvfljIwpI3rNKiFpQSGyX/AYrDkkFxkfqz
         5G2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjAiDrEcOT74GSkAn/+pwmhSuyWfiPL2zUVMy964rCFqAzWYZkrB5GnB18J6WJEdWN8k0qMLft6hD9lrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEDb2F1lJ2ObGomi/SPzd5kBklGHVje2g+hhzFXJYXmwcueo4r
	EMG1Olre8+p1D7wi+lollB0V7Wg/0/Up5c2VHOh3JyOJfh5NzyaBiY52nRAT1peO5Q==
X-Gm-Gg: ASbGncsbg+MBLAjUlAQ0X0aroHA5Tgq0ewWE8a7hvMhhuhweiLLJ3hAXGox9OmOem9N
	rJWgUHLAFIs4aYj+RkjIOokiw3tk/+2+CXfpo1XSpt2dcBMzz2YytF9qsmlZ77O2eNo80qxPxnb
	ZKfht28fOpkrlSuCioV892vWWwfvupu4LQv555DCPXbNXKoyWeVaH332aV1SG487y9n3r7QFERJ
	zOcAst/eD0IHruVQWUWuXMlLaIg7vLwJ4rfxE0rB42nq1uP7BsevH8mZtM+E8olV4Cc5e9Mlnry
	Zdls0B1D+TiLJIiyc4REX8bDXesOOQPYULAQ+2FdfhCBCVbBpEIKy5P5100ISvkb3Jq6jhq+GRP
	NV0NpEAE18l4p/eZgzGSaGSVd
X-Google-Smtp-Source: AGHT+IHqMz/HEa7jAGZc/vMx+phqOG6eS1CA4PRutdXQxxU79ck93w78bDAVkOgKJBW7oPDVqbXuPA==
X-Received: by 2002:a17:903:1ae3:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-2364d8cc78bmr2780605ad.37.1749667922285;
        Wed, 11 Jun 2025 11:52:02 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:4ad1:78dc:7f25:dde3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23603410b4csm91615085ad.212.2025.06.11.11.52.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 11:52:01 -0700 (PDT)
Date: Wed, 11 Jun 2025 11:51:59 -0700
From: Brian Norris <briannorris@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU
 hotplug
Message-ID: <aEnQT3PdjdNJGi25@google.com>
References: <20250514201353.3481400-1-briannorris@chromium.org>
 <20250514201353.3481400-2-briannorris@chromium.org>
 <24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com>
 <aEcWTM3Y1roOf4Ph@google.com>
 <CAMcHhXqq9DHgip3rr0=24Y-LEBq5n4rDrE6AsWyjyBmsS7s+-A@mail.gmail.com>
 <aEiQitCsXq9XSBcZ@google.com>
 <87qzzqojpt.ffs@tglx>
 <87o6uuoe5j.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6uuoe5j.ffs@tglx>

Hi Thomas,

On Wed, Jun 11, 2025 at 10:50:32AM +0200, Thomas Gleixner wrote:
> On Wed, Jun 11 2025 at 08:50, Thomas Gleixner wrote:
> > On Tue, Jun 10 2025 at 13:07, Brian Norris wrote:
> >> On Mon, Jun 09, 2025 at 08:19:58PM +0200, Aleksandrs Vinarskis wrote:
> >>  
> >>  void irq_startup_managed(struct irq_desc *desc)
> >>  {
> >> +	struct irq_data *d = irq_desc_get_irq_data(desc);
> >> +
> >>  	/*
> >>  	 * Only start it up when the disable depth is 1, so that a disable,
> >>  	 * hotunplug, hotplug sequence does not end up enabling it during
> >>  	 * hotplug unconditionally.
> >>  	 */
> >>  	desc->depth--;
> >> +	irqd_clr_managed_shutdown(d);
> >
> > If depth > 0, then it's still shutdown and the subsequent enable
> > operation which brings it down to 0 will take care of it. So what are
> > you trying to solve here?
> 
> I found the previous version which has an explanation for this. That

Right, I didn't update and carry the explanations here, as I figured I'd
format this all as proper patches after getting Alex's testing
feedbabck. (I think I'll split to two patches, since there are two
distinct bugs I'm fixing in here.)

> makes sense. You really want this to be:
> 
> 	struct irq_data *d = irq_desc_get_irq_data(desc);
> 
>         /* Proper comment */
> 	irqd_clr_managed_shutdown(d);

Ack, will add a comment.

>   	/*
>   	 * Only start it up when the disable depth is 1, so that a disable,
>   	 * hotunplug, hotplug sequence does not end up enabling it during
>   	 * hotplug unconditionally.
>   	 */
>   	desc->depth--;
> 
> ...
> 
> >>  	if (!desc->depth)
> >>  		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
> >>  }
> >> diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
> >> index f07529ae4895..755346ea9819 100644
> >> --- a/kernel/irq/cpuhotplug.c
> >> +++ b/kernel/irq/cpuhotplug.c
> >> @@ -210,13 +210,6 @@ static void irq_restore_affinity_of_irq(struct irq_desc *desc, unsigned int cpu)
> >>  	    !irq_data_get_irq_chip(data) || !cpumask_test_cpu(cpu, affinity))
> >>  		return;
> >>  
> >> -	/*
> >> -	 * Don't restore suspended interrupts here when a system comes back
> >> -	 * from S3. They are reenabled via resume_device_irqs().
> >> -	 */
> >> -	if (desc->istate & IRQS_SUSPENDED)
> >> -		return;
> >> -
> >
> > Huch? Care to read:
> >
> > a60dd06af674 ("genirq/cpuhotplug: Skip suspended interrupts when restoring affinity")
> 
> Never mind. After staring long enough at it, this should work because
> suspend increments depth and shutdown does too.

Yeah, that one definitely deserves an explanation :)

I wrote out a commit message already, but didn't include it here yet, as
I was only looking for testing. Sorry to have sent you staring so long
at it.

One snippet:

    This effectively reverts commit a60dd06af674 ("genirq/cpuhotplug: Skip
    suspended interrupts when restoring affinity"), because it is replaced
    by commit 788019eb559f ("genirq: Retain disable depth for managed
    interrupts across CPU hotplug").

IOW, the depth-tracking we added accomplishes the same goal as commit
a60dd06af674, but including both causes further bugs/imbalances.

Brian
