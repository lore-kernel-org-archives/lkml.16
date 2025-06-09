Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFB355E69
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749493214; cv=none; b=rudB5ZPJb0Wtb7RrEZbmmcvFCN2ST+teI6DxUfo7F3HL2KuM7e4I98ZFi7NI8+ctIyGEV53Y/GG25fOS/H/A+i+xDt77RNHeYRnEuAZ7X2EJKwRdJELQRId8tQ9oxLKbqc52hR7NQ4+Zdllt7MVrpdNvvHfRGqTC8/QchnF4VsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749493214; c=relaxed/simple;
	bh=6iXXn1i08444My9GAn1Q9mxmSPhpIxPBQDnn3gF3aYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2i5yd0EhisZgYNw3A+PDd7ewaJtBYJ1Nd476K3O5aahLbAlSlTF7QUw8Cm84CEYUfKadzuouz3MYTSIfkWaIP4X9wyGvGNVo6BJR8yriZoanFdWUg0hdTac4Hzt/bI2hS2xwC/cQ42ss6Lh1tH4i1xuGijS72Y+CfvCJBeZlbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMYrS0z6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMYrS0z6"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a54690d369so1284035f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749493211; x=1750098011; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4umDxSaa/CllRJxP6WItn4fR2Uskfj6zvGKYnDBtNR8=;
        b=TMYrS0z6Dn9FHPqRUbphMMo+EewjIIEoFTn9YSfXQgACC+V9JXDUxPszokWigpKKr2
         jvkFL4pToeervzTwgoMpQdZhCByKoqbGZoZxH6V+1a/IwiAK9e+pjvtTqEbXUIBdZlIK
         Uyip4uIGXbMicTF2ThwQJUvfjI+hEvos3nZiMFSQOjmZ22zJOQfC9LuJCIy87oK24SmB
         tU+pHgSBCUaZJwsDx7SOY65ZuXOn1RrJiQXvih7/sHiRaDbE2BkIwUxy36IA3hoK5nIs
         i4HCx/+KC0vaXgMraAfCq+hKdpyLjgPm1kFLbov+yxO7Z+VOxHeQQzxbG1K01M5m2pkH
         exwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749493211; x=1750098011;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4umDxSaa/CllRJxP6WItn4fR2Uskfj6zvGKYnDBtNR8=;
        b=ltIahV30UZ/GukconLHcYBt2qrr3gELJXfwT6gEGX2YUemmacJxFq136oKodx9cJaI
         Okf8dNvTxIMx2CDDJrHKVYLVsZ2bJ2E3PvTy2t+h44+g5EO9ipF8Bb4+ocUzTPblFa41
         HFv2jFWmjPE15bgtJ2uvPeNZv1cx6/NY0zS5PHVg+RTqJoRgX/fZAa1R4xsFet4XIAp5
         QgbWT9wfY6/b26sEEDoRr4DNxgJsPAbJZPkks9wverkL2quSV0UmtLETS0DSGN1+kT4a
         NOVOfpX9nLHuEeMzfHP7XvwM0gYb7lsJSFfTOC03H3fcaA9R/QbD0L5kQ4dqLkGLw9A5
         IrTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIwLR+C7yEVv9V4nCUF054xGrNtBUKaO6jEP6SwFvm4i6eif9S2CTki6VztTyPMLBGyoqhoPn3x39K/yg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9gQQz3IvCzTB6M3IxIxcRvvlB2+WqRFty5ifVGWjacCj72bPm
	5SS5DTKHqPzN4rB0Vbahrtbx/NilIebF2KWCfhIvG+RRy5s8WWHh2CZ5T5psLkZiYw1EjMkk0Kp
	+fVAUY+ygx6ppisdt3i6Kuj2A5o4Q8A==
X-Gm-Gg: ASbGncst5LAbXQL5rghdm/xX48h+Bp9G22J9E2+lx9mTM9Xy8xDvFCFf0eu0/UOwT1v
	+WtRZw8thHvuJaf6J23m4jwm+kKD/9GdDZd4ZW9hZMGNZn7hqRoN++62AHEtj0T7A85BsZ0Q8QT
	Ca/pnxXCLmuy6uzzzoYgKW5ybB0cNrZOxH0wNYGbEoM84=
X-Google-Smtp-Source: AGHT+IHQvMk7IA6vhDefSLchGmrpzxT38bhJMPUtrBKemqHdaXLGZ0KKeFC3cFMFutfbgWsbX5+lpM6JeAWy8TPNNus=
X-Received: by 2002:a05:6000:2289:b0:3a5:2fad:17af with SMTP id
 ffacd0b85a97d-3a531cf30abmr10584332f8f.57.1749493210803; Mon, 09 Jun 2025
 11:20:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201353.3481400-1-briannorris@chromium.org>
 <20250514201353.3481400-2-briannorris@chromium.org> <24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com>
 <aEcWTM3Y1roOf4Ph@google.com>
In-Reply-To: <aEcWTM3Y1roOf4Ph@google.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 9 Jun 2025 20:19:58 +0200
X-Gm-Features: AX0GCFvI5C7RKrze_v26NEgsnROlH1i7tbicnaAyQrsiit-73tC7NTkUoVX9-fk
Message-ID: <CAMcHhXqq9DHgip3rr0=24Y-LEBq5n4rDrE6AsWyjyBmsS7s+-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU hotplug
To: Brian Norris <briannorris@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Tsai Sung-Fu <danielsftsai@google.com>, 
	Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Jun 2025 at 19:13, Brian Norris <briannorris@chromium.org> wrote:
>
> Hi Alex,
>
> On Fri, Jun 06, 2025 at 02:21:54PM +0200, Aleksandrs Vinarskis wrote:
> > On 5/14/25 22:13, Brian Norris wrote:
> > > Affinity-managed IRQs may be shut down and restarted during CPU
> > > hotunplug/plug, and the IRQ may be left in an unexpected state.
> > > Specifically:
>
> [...]
>
> > It appears that this commit introduces a critical bug observed on at least
> > some Qualcomm Snapdragon X1E/X1P laptops, rendering the suspend function
> > unusable.
> >
> > With this change in place, after successful suspend the device either:
> > 1. Cannot wake up at all. Screen stays black, even though PM has existed
> > suspend (observed by external LEDs controlled by PM)
> >
> > 2. Wakes up eventually after minutes (instead of seconds) with SSD related
> > errors in dmesg. System still exhibits errors eg. UI icons are not properly
> > loaded, WiFi does not (always) connect.
>
> I'm sorry to hear this has caused regressions. I don't yet know why your
> particular problems have occurred, but I did notice last week that there
> were some issues with the patch in question. I wrote a patch which I'll
> append, and have started (but not completely finished) testing it.
> Perhaps you could try it out and let me know how it goes?

Hi Brian,

I have tested your attached patch in addition to the original one, and
unfortunately it did not resolve the problem on either of the two
laptops: neither managed to wake up, just like before.
Will be happy to promptly test other proposed solutions.

Thanks,
Alex

>
> > Is it possible to have this addressed/patched up/reverted before 6.16-rc1
> > goes live and introduces the regression?
> > It also appears this series was selected for backporting to 6.6, 6.12, 6.14,
> > 6.15:  perhaps this should be postponed/aborted until better solution is
> > found?
>
> Regarding stable backports: yes, please. It looks like Johan requested
> holding this back on stable here:
>
> https://lore.kernel.org/all/aELf3QmuEJOlR7Dv@hovoldconsulting.com/
>
> Hopefully we can figure out a mainline solution promptly enough, but
> revert is also OK if it comes down to it.
>
> Below is a patch I'm working with so far. I can submit it as a separate
> patch if that helps you.
>
> Brian
>
> ---
>
> Subject: [PATCH] genirq: Rebalance managed interrupts across multi-CPU hotplug
>
> Commit 788019eb559f ("genirq: Retain disable depth for managed
> interrupts across CPU hotplug") intended to only decrement the disable
> depth once per managed shutdown, but instead it decrements for each CPU
> hotplug in the affinity mask, until its depth reaches a point where it
> finally gets re-started.
>
> For example, consider:
>
> 1. Interrupt is affine to CPU {M,N}
> 2. disable_irq() -> depth is 1
> 3. CPU M goes offline -> interrupt migrates to CPU N / depth is still 1
> 4. CPU N goes offline -> irq_shutdown() / depth is 2
> 5. CPU N goes online
>     -> irq_restore_affinity_of_irq()
>        -> irqd_is_managed_and_shutdown()==true
>           -> irq_startup_managed() -> depth is 1
> 6. CPU M goes online
>     -> irq_restore_affinity_of_irq()
>        -> irqd_is_managed_and_shutdown()==true
>           -> irq_startup_managed() -> depth is 0
>           *** BUG: driver expects the interrupt is still disabled ***
>              -> irq_startup() -> irqd_clr_managed_shutdown()
> 7. enable_irq() -> depth underflow / unbalanced enable_irq() warning
>
> We should clear the managed-shutdown flag at step 6, so that further
> hotplugs don't cause further imbalance.
>
> Fixes: commit 788019eb559f ("genirq: Retain disable depth for managed interrupts across CPU hotplug")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>  kernel/irq/chip.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
> index b0e0a7332993..1af5fe14f3e0 100644
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -175,8 +175,6 @@ __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
>         if (!irqd_affinity_is_managed(d))
>                 return IRQ_STARTUP_NORMAL;
>
> -       irqd_clr_managed_shutdown(d);
> -
>         if (!cpumask_intersects(aff, cpu_online_mask)) {
>                 /*
>                  * Catch code which fiddles with enable_irq() on a managed
> @@ -205,12 +203,15 @@ __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
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
> --
> 2.50.0.rc0.642.g800a2b2222-goog
>
