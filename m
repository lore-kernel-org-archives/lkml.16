Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711238633F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749489234; cv=none; b=gMnCyyBcvMBBaERCHBsvUUtNT0N1bO7+zoWIe658OjksU7JHXuJ2zvSGYD1PgW0YfsP8FUACyodNlKkxsly0ieViXuFzFzYPQ8G25UZyCkfHD1tyCmU2UJEYVixsci4MUC5sW2CRGZEuh2dqj/FgodgNpAu6i0kU3sItadB5Qw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749489234; c=relaxed/simple;
	bh=Kql8orYFF8or/bhIp0BlTb1WLbFL6PW6494eV1SEhHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kT4IZSe2v9etio2tvDesfyq8fs49QCx6qALfLXo43ZSW2ro3M54B4tP78UdOPIi0l12t96z+uSpJfzxOKW91CXFcZo2AGFCZMSUf7QailBa8wh7Als8tnHQK3Ou59/P8XMV6S8w81xzAtK3ix710zgxTMl+50MRwlZAADKr2rWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gkgXQYmv; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gkgXQYmv"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-747d59045a0so3129875b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749489232; x=1750094032; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NvhVPXS+eQ/jyt1KVo/KteILDY5VYpwnN9IW8up8lqg=;
        b=gkgXQYmvRNKAjrY3XKmaeTSiCGAwMFnhSUAOOjWia1MAuy0YCtf7KaZxpljCFOKvnW
         c2gxupAeckFlc0FRxaR6MOXN5uGoNPSgGpWbFEiSfOIp+/1qVLnf4KYrNsErK7gm1RSg
         qxz1beA+M4Qv3TbBhw1G5mzCA9q04SEUtr4As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749489232; x=1750094032;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvhVPXS+eQ/jyt1KVo/KteILDY5VYpwnN9IW8up8lqg=;
        b=Xp/UOe2Kkin/G8L2xxMqD9a1C/+q5Yok8nKmp4F7CcvFx7n7gfxlORoaisHeWdr6t2
         rLy+zNGNRdnrWWkQqexhY+YJ02DQQ+p8RnJlXJzr6chyvD1JAz2YvJtm/czyoZ096ag5
         bnpCSqEHE1mFjN3iiSyDIeJDJ2BWU2YZJL2KxYn9BPDLNTzcgkca89Je4Yfm1646hzB/
         kY7gXzqaaQYgXgXDEGEoBnqb4x2Hk88p6MpjBCnoV1QEVCZSPEZF5QhH0gK/i7j/17bd
         GeBjc/Zm3pNOLtojXj5um0IsWuB1KIyG514KJvwPWozBSgTdWjNdewKw2qq6twfNurCD
         2c4A==
X-Forwarded-Encrypted: i=1; AJvYcCWZD9go/4S+7Kc+M2pynvoExfqFKbNQ7tiq5m0+HRSVzS6X/QHCdtUYHbMNPE7An4ud8wkqgk8cLgF+5KY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5FhRHw1M1c/5gZH7Pw8/P3o/Mze/nJja50ywvqIf3UFIoiFlv
	97WRGGAQfZw9/ejGB9SK5KzDtbGPKJK0aNwSwDY1zQhXXzim58fTbzbNo5gZ0itMtA==
X-Gm-Gg: ASbGnctXu3zzYDWTkE1t9fXtW+vUPsSYx5bs6xinwHuLUJ+tCmngj8P4MPcFWr8hv1D
	LvYGsNguOQZ2B+RDP0hAyFjLQ8R7CgYR1g5e+jVTwEy1BeH0gKOC3jOc1+GegOfiES9bSZoT3VI
	AiUfXSr4MAbTXTPI/lKI0rrooHEUCS6+e/XPBtRCFV6nQ9XddqgTs4EwjvKQbUAPhEc7w97JkYg
	eQGrYfsCyD8jtEeltQaqTEP/ya2HZt5fQqaL6WC4Ef1OGC0d10mzXffHs18zXH1xpE2iclbRB96
	xt6LjDpAdjB78lSXL6Izh8SbgJ3RXtwZyIurKo1v5MuFd1yTuTMzGhrX/3lQbAQxa/ibdjd/dLm
	4jrDLzk6NMneVqYLcjKtfW/5e
X-Google-Smtp-Source: AGHT+IEilSlodZrFAuTQkVSTAzRUtUsgxzHGx/8bjJjjbScjM1YKZmwcrJGnCtUSgG+V86QY+FySfA==
X-Received: by 2002:a05:6a00:4390:b0:740:a52f:a126 with SMTP id d2e1a72fcca58-74827e8060dmr16684056b3a.9.1749489231660;
        Mon, 09 Jun 2025 10:13:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:4467:836f:8c18:b854])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7482b0836d4sm5955153b3a.85.2025.06.09.10.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 10:13:50 -0700 (PDT)
Date: Mon, 9 Jun 2025 10:13:48 -0700
From: Brian Norris <briannorris@chromium.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU
 hotplug
Message-ID: <aEcWTM3Y1roOf4Ph@google.com>
References: <20250514201353.3481400-1-briannorris@chromium.org>
 <20250514201353.3481400-2-briannorris@chromium.org>
 <24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com>

Hi Alex,

On Fri, Jun 06, 2025 at 02:21:54PM +0200, Aleksandrs Vinarskis wrote:
> On 5/14/25 22:13, Brian Norris wrote:
> > Affinity-managed IRQs may be shut down and restarted during CPU
> > hotunplug/plug, and the IRQ may be left in an unexpected state.
> > Specifically:

[...]

> It appears that this commit introduces a critical bug observed on at least
> some Qualcomm Snapdragon X1E/X1P laptops, rendering the suspend function
> unusable.
> 
> With this change in place, after successful suspend the device either:
> 1. Cannot wake up at all. Screen stays black, even though PM has existed
> suspend (observed by external LEDs controlled by PM)
> 
> 2. Wakes up eventually after minutes (instead of seconds) with SSD related
> errors in dmesg. System still exhibits errors eg. UI icons are not properly
> loaded, WiFi does not (always) connect.

I'm sorry to hear this has caused regressions. I don't yet know why your
particular problems have occurred, but I did notice last week that there
were some issues with the patch in question. I wrote a patch which I'll
append, and have started (but not completely finished) testing it.
Perhaps you could try it out and let me know how it goes?

> Is it possible to have this addressed/patched up/reverted before 6.16-rc1
> goes live and introduces the regression?
> It also appears this series was selected for backporting to 6.6, 6.12, 6.14,
> 6.15:  perhaps this should be postponed/aborted until better solution is
> found?

Regarding stable backports: yes, please. It looks like Johan requested
holding this back on stable here:

https://lore.kernel.org/all/aELf3QmuEJOlR7Dv@hovoldconsulting.com/

Hopefully we can figure out a mainline solution promptly enough, but
revert is also OK if it comes down to it.

Below is a patch I'm working with so far. I can submit it as a separate
patch if that helps you.

Brian

---

Subject: [PATCH] genirq: Rebalance managed interrupts across multi-CPU hotplug

Commit 788019eb559f ("genirq: Retain disable depth for managed
interrupts across CPU hotplug") intended to only decrement the disable
depth once per managed shutdown, but instead it decrements for each CPU
hotplug in the affinity mask, until its depth reaches a point where it
finally gets re-started.

For example, consider:

1. Interrupt is affine to CPU {M,N}
2. disable_irq() -> depth is 1
3. CPU M goes offline -> interrupt migrates to CPU N / depth is still 1
4. CPU N goes offline -> irq_shutdown() / depth is 2
5. CPU N goes online
    -> irq_restore_affinity_of_irq()
       -> irqd_is_managed_and_shutdown()==true
          -> irq_startup_managed() -> depth is 1
6. CPU M goes online
    -> irq_restore_affinity_of_irq()
       -> irqd_is_managed_and_shutdown()==true
          -> irq_startup_managed() -> depth is 0
          *** BUG: driver expects the interrupt is still disabled ***
             -> irq_startup() -> irqd_clr_managed_shutdown()
7. enable_irq() -> depth underflow / unbalanced enable_irq() warning

We should clear the managed-shutdown flag at step 6, so that further
hotplugs don't cause further imbalance.

Fixes: commit 788019eb559f ("genirq: Retain disable depth for managed interrupts across CPU hotplug")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 kernel/irq/chip.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index b0e0a7332993..1af5fe14f3e0 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -175,8 +175,6 @@ __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
 	if (!irqd_affinity_is_managed(d))
 		return IRQ_STARTUP_NORMAL;
 
-	irqd_clr_managed_shutdown(d);
-
 	if (!cpumask_intersects(aff, cpu_online_mask)) {
 		/*
 		 * Catch code which fiddles with enable_irq() on a managed
@@ -205,12 +203,15 @@ __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
 
 void irq_startup_managed(struct irq_desc *desc)
 {
+	struct irq_data *d = irq_desc_get_irq_data(desc);
+
 	/*
 	 * Only start it up when the disable depth is 1, so that a disable,
 	 * hotunplug, hotplug sequence does not end up enabling it during
 	 * hotplug unconditionally.
 	 */
 	desc->depth--;
+	irqd_clr_managed_shutdown(d);
 	if (!desc->depth)
 		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
 }
-- 
2.50.0.rc0.642.g800a2b2222-goog

