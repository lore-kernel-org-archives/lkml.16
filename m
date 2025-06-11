Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238921494A8
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749625015; cv=none; b=pHEQC6E1kbD7yw0/ZovbMhaepllWkCo0VGrDnLhhl/7Ryi5duEJPaQei6R1yTU4EpCDjLHNpq7q5oWhDVzYhxxMGom9viGG1uRgZqywATSITf5JVdywyJ8jImLF2jz5RaayTeTY/kQWWkreiHcxKL/WYSlVViJZlb+hHbXeNL2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749625015; c=relaxed/simple;
	bh=lP+bNKVxduu0qCykytSn/HHrtfWfG9nIKavlBiRnWkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFO+Xiw4hpQcCoT7yaMKx9DbHTtJrG3I4/+nMBCqWvPmMElD/SMdEn0gNHozc5qYsw+pBxLZ77Mz2dW8oKCMtN2oiKwa01OTpt8lOpc2YEWaDaviaW59u8Sr9xweSAQ6CgEnnX9p3Vh9jwncvuelSNSz2uPoVeW2EAwCkeIUvl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDBQCsvj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDBQCsvj"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so40134085e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749625012; x=1750229812; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zUComgDeBiw1wUlIeJH9rIxh+wLfls2ffvRuDXZeWIc=;
        b=cDBQCsvjTIJWRyoAm6L4K8yKzR00Kr5nCvw/8WR/NgmTIOdbNJurXzr0YWeu6HtUEo
         gL4z9H2ZWEQeWJPU7tGj5uPc91DCgwrzfzShIUDZQFlpH4M9bpaeOI42LsUtFtfXn+Wt
         ysg35prVy1Yxewx8TjfxhIDwGOhk3mGPKjNxdK83PmGQ8a9knx5fvq+TURYYTR04R7Q3
         8HMKwLyUbq1nY06zsk3B1VRuRkhPUkQETtAlO8T6Jn9bJdvaMI+IeBNB+mcEqFkPSP53
         rFAczxhoZ0Ru9T/zDFNOoGwFLdsvvafulJdQFFc2fVLk4MbrJm9lXHXlsyCxj/f3SVpI
         S0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749625012; x=1750229812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUComgDeBiw1wUlIeJH9rIxh+wLfls2ffvRuDXZeWIc=;
        b=A6PzM9FZ65J3uGeGn+atGBPVjDg0f6cGbJeg4T4HHl4gne9BCBjEaQ+oagq+eNbYfk
         IvPmfiZf3KWN5LIPGjYnqJ1GeDeF0JIh026Ir0NbN5VqHA8w5XuhFuvbFODpY83jMf0m
         8AaCV8qwzRf0YJUt8kgAdMNLBiQnxuvIdfakFJW7dWjC20cf3W1m74qpHWNgTEbEeuqI
         vcQRPpLDe+JpKv/zZ5uVG1/AOBVKz4wAxfp6TmVXcD7FKQ+uu7w9mnl9KfINOmPi9drM
         qIA/UatiyXnXvSzhhgeK7HVbjb9PGMP368BPmwFVqUuosnMZQWIOUnCqBG1YQMVM/fQh
         uMmA==
X-Forwarded-Encrypted: i=1; AJvYcCX4aPdWTdV4/wdR5xa9QVbQpIUsnLdzhwwp1KIYnlGWt+XxxTlbmNQW2kLuRs0MEDngJvUngDzUeOP8Aso=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT/632CRGstZIa9wXDL3YHN12N9JdntN77LhSYUtUzC9S04ypa
	qhZ59SYq2aM2lP5rbDRbb+CpOcCIYFW+WJWOUjgm5utyjWv8vDWDDoyV5dH2XgmKDu3D3Oujd7a
	fsQ26imSC0MMoAO/9QMDdM5wNmgOtow==
X-Gm-Gg: ASbGncsR808fxN185xcdGzILiWg8Kh0EmoNWS5kZfUTucOqvF0lHLWCatxP2haoVrkT
	laAn/ygPxCLpN6vLwOcW7r6ywjQWWG5m9HJcqyT2lAKtSFRGTBAHtYfHkAWabRV9GRVK21I3NeI
	MpAn3ac+CzHbumbynyfs3LQ/nY7C3wnS2aNriT3HzWybg=
X-Google-Smtp-Source: AGHT+IG6VoyhLKcq6An5FXMA5IwOHiUMCFmFTH5hGxODx60jl4OMq0T5fvjBknm9BxpN5+xWRsaDTWbJER9irbSiecA=
X-Received: by 2002:a05:6000:2382:b0:3a4:eae1:a79f with SMTP id
 ffacd0b85a97d-3a558a325e3mr1492386f8f.33.1749625011802; Tue, 10 Jun 2025
 23:56:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201353.3481400-1-briannorris@chromium.org>
 <20250514201353.3481400-2-briannorris@chromium.org> <24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com>
 <aEcWTM3Y1roOf4Ph@google.com> <CAMcHhXqq9DHgip3rr0=24Y-LEBq5n4rDrE6AsWyjyBmsS7s+-A@mail.gmail.com>
 <aEiQitCsXq9XSBcZ@google.com>
In-Reply-To: <aEiQitCsXq9XSBcZ@google.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Wed, 11 Jun 2025 08:56:40 +0200
X-Gm-Features: AX0GCFsxL5ZNcC5clGAWp7J5xNe-JRmoWB5pVCdQczsXzfYqkAbC52uL6KqTmk8
Message-ID: <CAMcHhXrT-y3EotxrcCZ0Pj8Sic6wsPSmRiW7NSzdG=9iH8xqKg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU hotplug
To: Brian Norris <briannorris@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Tsai Sung-Fu <danielsftsai@google.com>, 
	Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 22:07, Brian Norris <briannorris@chromium.org> wrote:
>
> Hi Alex,
>
> On Mon, Jun 09, 2025 at 08:19:58PM +0200, Aleksandrs Vinarskis wrote:
> > On Mon, 9 Jun 2025 at 19:13, Brian Norris <briannorris@chromium.org> wrote:
> > > On Fri, Jun 06, 2025 at 02:21:54PM +0200, Aleksandrs Vinarskis wrote:
> > > > It appears that this commit introduces a critical bug observed on at least
> > > > some Qualcomm Snapdragon X1E/X1P laptops, rendering the suspend function
> > > > unusable.
>
> For my reference, are these laptops represented by the
> arch/arm64/boot/dts/qcom/x1e80100.dtsi family of device trees? I'm just
> trying to reason through what sorts of driver(s) are in use here, in
> case there's something I'm overlooking, as I don't have the laptop in
> question to test.

Hi,

Yes. Dell XPS 9345 is arch/arm64/boot/dts/qcom/x1e80100.dtsi based,
and Asus Zenbook A14 is arch/arm64/boot/dts/qcom/x1p42100.dtsi based,
which is a derivative but has a slightly different PCIe setup. So far
both laptops would behave in the same ways.

>
> > > > With this change in place, after successful suspend the device either:
> > > > 1. Cannot wake up at all. Screen stays black, even though PM has existed
> > > > suspend (observed by external LEDs controlled by PM)
> > > >
> > > > 2. Wakes up eventually after minutes (instead of seconds) with SSD related
> > > > errors in dmesg. System still exhibits errors eg. UI icons are not properly
> > > > loaded, WiFi does not (always) connect.
>
> FYI, my assumption here based on the log snippets and the patch in
> question is that "only" the NVMe driver's IRQs are getting b0rked by my
> change. I could imagine that would produce the above symptoms in most
> laptop configurations, because failing disk I/O will likely block most
> wakeup-related activity, and cause all sorts of UI and system daemon
> (e.g., WiFi supplicant) misbehavior.
>
> > > I'm sorry to hear this has caused regressions. I don't yet know why your
> > > particular problems have occurred, but I did notice last week that there
> > > were some issues with the patch in question. I wrote a patch which I'll
> > > append, and have started (but not completely finished) testing it.
> > > Perhaps you could try it out and let me know how it goes?
> >
> > Hi Brian,
> >
> > I have tested your attached patch in addition to the original one, and
> > unfortunately it did not resolve the problem on either of the two
> > laptops: neither managed to wake up, just like before.
> > Will be happy to promptly test other proposed solutions.
>
> Thanks for the testing. I've found a few problems with my proposed
> patch, and I've come up with the appended alternative that solves them.
> Could you give it a try?

Just tested, and it appears to solve it, though I see some errors on
wakeup that I don't remember seeing before. I will test-drive this
setup for a day to provide better feedback and confirm if it is
related to the fixup or not.

>
> Also, if it's not too much trouble (and especially if my patch still
> doesn't help you), could you also provide a more complete kernel log and
> kernel .config file? (Attachment is fine with me. Or a direct email, if
> somehow the lists don't like it.) It's possible that would give me more
> hints as to what's going wrong for you.

I will share the logs with and without the fixup by private email
attachment in a bit.

Thanks for looking into this,
Alex


>
> Thanks,
> Brian
>
> diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
> index b0e0a7332993..3e873c5ce623 100644
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -205,12 +205,15 @@ __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
>
>  void irq_startup_managed(struct irq_desc *desc)
>  {
> +       struct irq_data *d = irq_desc_get_irq_data(desc);
> +
>         /*
>          * Only start it up when the disable depth is 1, so that a disable,
>          * hotunplug, hotplug sequence does not end up enabling it during
>          * hotplug unconditionally.
>          */
>         desc->depth--;
> +       irqd_clr_managed_shutdown(d);
>         if (!desc->depth)
>                 irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
>  }
> diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
> index f07529ae4895..755346ea9819 100644
> --- a/kernel/irq/cpuhotplug.c
> +++ b/kernel/irq/cpuhotplug.c
> @@ -210,13 +210,6 @@ static void irq_restore_affinity_of_irq(struct irq_desc *desc, unsigned int cpu)
>             !irq_data_get_irq_chip(data) || !cpumask_test_cpu(cpu, affinity))
>                 return;
>
> -       /*
> -        * Don't restore suspended interrupts here when a system comes back
> -        * from S3. They are reenabled via resume_device_irqs().
> -        */
> -       if (desc->istate & IRQS_SUSPENDED)
> -               return;
> -
>         if (irqd_is_managed_and_shutdown(data))
>                 irq_startup_managed(desc);
>
