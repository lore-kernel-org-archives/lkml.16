Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B672475CF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016976; cv=none; b=Pt4jwRjdls3e2eNWcXQMV7kSmtxPyn7eC/QCIdDdZLbHHK0pFaT4kH2EQnZsyBYsEoe01PcZvEY9OuwTGVGA88pQn7zNDcXhtY+eJG3NgoA96IS6L2yf0bVinWedZSoJ788bY6m4VjAl9GhTN9Fh6HkqXHjxmOl6YtXkpA9xav8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016976; c=relaxed/simple;
	bh=sI2/AgqR3merR18766WgeswQaRcYH6kXkaSdGTPKJTA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Yo98dE/LrFVXXkS3y+YA/+CKmST2BM2LXldV/7LEqWOn/2xEDBiFYytdnVsKAXjmWsx5onPW3bmoT0TKb2sBFHKgmbma+Vo5iUMFSpm6aB+GICCBixMA4GxpIKxrkQdSCcnbR7PFI+S1UO8nmmRkJ+/7U6JUz9VjihLWsgsUWW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0Fl6hMdu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IXKjlD1+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0Fl6hMdu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IXKjlD1+"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746016972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bVwpBB4QYUEp6OQd1Ue9I9QKdCicaN98QgVc3B/CCuI=;
	b=0Fl6hMdufGuj4WYD8IajXpFPNiwuPpIrSbYiBUcf86a9q88lwo+8AaqUJh2jEF+kmu2m9n
	FBk1+19yrRTPVm1bAeOIxqetXAmXGW6YWE1tAxNMqhMUPGGqs2q4LYiO1OI3yAzPFu4giu
	zH9INNsLB32dXnZ3RTaudKoQ8Xc7LHGaFqUdF1N4lzrLB+3pMLOljKaCsmxemmz1+e2HGP
	TKF3AZwZb2ThfRToiA0YD3b4GgdFW1QvXa34QlgL7i6F5MAd0UmXepslaU/3HU+/A0A/68
	LIFuIH2Q5NSNfuoxjZeoaqtLYlhR/SRgC81lsVQuYm490el6PTzZrP+tN2oBXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746016972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bVwpBB4QYUEp6OQd1Ue9I9QKdCicaN98QgVc3B/CCuI=;
	b=IXKjlD1+hanyJ13BuciYMB+tyw9ts0crWqGxflDsvBHV8B3L98ri609YRsHYv3LvPi49oL
	RoUCGD1xEsdpIeDA==
To: Jiri Slaby <jirislaby@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch V2 35/45] genirq/manage: Rework irq_set_irq_wake()
In-Reply-To: <e9a0abc5-7ee0-4ee1-9e19-37d43a5d41de@kernel.org>
References: <20250429065337.117370076@linutronix.de>
 <20250429065422.128859754@linutronix.de>
 <e9a0abc5-7ee0-4ee1-9e19-37d43a5d41de@kernel.org>
Date: Wed, 30 Apr 2025 14:42:52 +0200
Message-ID: <87plgtq0qb.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 30 2025 at 08:37, Jiri Slaby wrote:
> On 29. 04. 25, 8:55, Thomas Gleixner wrote:
>> Use the new guards to get and lock the interrupt descriptor and tidy up the
>> code.
>> -	unsigned long flags;
>> -	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
>> -	int ret = 0;
>> +	int ret = -EINVAL;
>
> Hmm...
>
>> -	if (!desc)
>> -		return -EINVAL;
>> +	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
>> +		struct irq_desc *desc = scoped_irqdesc;
>>   
>> +		/*
>> +		 * wakeup-capable irqs can be shared between drivers that
>> +		 * don't need to have the same sleep mode behaviors.
>> +		 */
>> +		if (on) {
>> +			if (desc->wake_depth++ == 0) {
>> +				ret = set_irq_wake_real(irq, on);
>> +				if (ret)
>> +					desc->wake_depth = 0;
>> +				else
>> +					irqd_set(&desc->irq_data, IRQD_WAKEUP_STATE);
>> +			}
>
> So in this (imaginary) else branch (i.e. desc->wake_depth++ != 0), you 
> return EINVAL now?
>
> Previously, it was 0 (correctly), if I am looking correctly.

Duh, yes.
