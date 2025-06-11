Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526C023ED68
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631836; cv=none; b=qhss3icujnoxG3U3HZ6H60Kpr5xXHAfw0jdnIuVkZf9AVqakh6wNlfKdVPJec++LK3XJxEk9R98FoZ8EIw8+8mZLfVvUVyWk9zIc+EchW/ZKIsr7tByS+6Jf5U8cIM7ynCL0DRxw7/pnm+MJoMFP1P1RylN1F9Wk37DESCd2RPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631836; c=relaxed/simple;
	bh=1+FTgQ2k/v9CsNTrmMmzRrd5L9KTPbODH6XvYB/Exds=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XDYK8ctp9CwROhkoTyItjIuzM5RS93zCsZVs9toZkzW+y1MyIyfnA9mmkgmi3Y0be1STMvRG77jvI24Fu2gqxOru5WO5sSyia5OCyLgDVJf84OH5xnpNeFjoTcV9mnZ2D3DDz2NufkoYHipNBx4aHTLLc1TfPOZ+lHvVS1hJxSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1Ql7efyO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rV7lTmie; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1Ql7efyO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rV7lTmie"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749631833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D2dAUCbtbULwlDtsxR4Qw7f9wBvQhtdPC/TSEC7o+qo=;
	b=1Ql7efyOhiVggZEyVZYhBlV/r3uXS2FpL12LNRxN0PJXK8R0cTJeycUGV0KUaRkhh8dQC/
	GSROEJWZ/TA/Ddlrd9OeIM8Tjs0IPYpRSZ82088BD5mWpceTgbR/L/Ony9cAK+EOjDvFyH
	jHpDIhnmQmh3xwGJz3gHR+YVhsbm8hofLSODuq3lTaKwew2dMSIpeFhZHwmbz21OrxQ3D4
	Gyw59sEq3bRo3QcR/zRlRq/woMi0jAE8XQytwmQQ1/uViCTXoQOKmWEjR0x1FZx4yIAGup
	vNe5Eg32VZlryZ6RIBHL0cIMwx+M20WU8EmFp34ClVdtEe4L2hF87YyRQfJ0eQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749631833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D2dAUCbtbULwlDtsxR4Qw7f9wBvQhtdPC/TSEC7o+qo=;
	b=rV7lTmie2kRxoYTF1mtht1y4ueAFEXIv0ol2K3koWmCa0/aZY60nKV6Qav/wfM0nRyMGiZ
	7UD6Mc9y05/8SQDw==
To: Brian Norris <briannorris@chromium.org>, Aleksandrs Vinarskis
 <alex.vinarskis@gmail.com>
Cc: Tsai Sung-Fu <danielsftsai@google.com>, Douglas Anderson
 <dianders@chromium.org>, linux-kernel@vger.kernel.org, Johan Hovold
 <johan@kernel.org>
Subject: Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU
 hotplug
In-Reply-To: <87qzzqojpt.ffs@tglx>
References: <20250514201353.3481400-1-briannorris@chromium.org>
 <20250514201353.3481400-2-briannorris@chromium.org>
 <24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com>
 <aEcWTM3Y1roOf4Ph@google.com>
 <CAMcHhXqq9DHgip3rr0=24Y-LEBq5n4rDrE6AsWyjyBmsS7s+-A@mail.gmail.com>
 <aEiQitCsXq9XSBcZ@google.com> <87qzzqojpt.ffs@tglx>
Date: Wed, 11 Jun 2025 10:50:32 +0200
Message-ID: <87o6uuoe5j.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jun 11 2025 at 08:50, Thomas Gleixner wrote:
> On Tue, Jun 10 2025 at 13:07, Brian Norris wrote:
>> On Mon, Jun 09, 2025 at 08:19:58PM +0200, Aleksandrs Vinarskis wrote:
>>  
>>  void irq_startup_managed(struct irq_desc *desc)
>>  {
>> +	struct irq_data *d = irq_desc_get_irq_data(desc);
>> +
>>  	/*
>>  	 * Only start it up when the disable depth is 1, so that a disable,
>>  	 * hotunplug, hotplug sequence does not end up enabling it during
>>  	 * hotplug unconditionally.
>>  	 */
>>  	desc->depth--;
>> +	irqd_clr_managed_shutdown(d);
>
> If depth > 0, then it's still shutdown and the subsequent enable
> operation which brings it down to 0 will take care of it. So what are
> you trying to solve here?

I found the previous version which has an explanation for this. That
makes sense. You really want this to be:

	struct irq_data *d = irq_desc_get_irq_data(desc);

        /* Proper comment */
	irqd_clr_managed_shutdown(d);

  	/*
  	 * Only start it up when the disable depth is 1, so that a disable,
  	 * hotunplug, hotplug sequence does not end up enabling it during
  	 * hotplug unconditionally.
  	 */
  	desc->depth--;

...

>>  	if (!desc->depth)
>>  		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
>>  }
>> diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
>> index f07529ae4895..755346ea9819 100644
>> --- a/kernel/irq/cpuhotplug.c
>> +++ b/kernel/irq/cpuhotplug.c
>> @@ -210,13 +210,6 @@ static void irq_restore_affinity_of_irq(struct irq_desc *desc, unsigned int cpu)
>>  	    !irq_data_get_irq_chip(data) || !cpumask_test_cpu(cpu, affinity))
>>  		return;
>>  
>> -	/*
>> -	 * Don't restore suspended interrupts here when a system comes back
>> -	 * from S3. They are reenabled via resume_device_irqs().
>> -	 */
>> -	if (desc->istate & IRQS_SUSPENDED)
>> -		return;
>> -
>
> Huch? Care to read:
>
> a60dd06af674 ("genirq/cpuhotplug: Skip suspended interrupts when restoring affinity")

Never mind. After staring long enough at it, this should work because
suspend increments depth and shutdown does too.

Thanks,

        tglx
