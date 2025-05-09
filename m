Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA08647
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815845; cv=none; b=M+HwYMFyOkkoeG4z6NWaSI2TiTnbbb0wOqKNCrYIkFYDSPeuEBR1FiDsxhJwzDIpBlf+f0fvcVonIMgp9WYb4vxDLwdBTIPYV141H5rL/rTWTIszGCdqJ4V2CnMUXNHYIedOc521WcuiuRpb3T61YJ+E3DOuOXUXjXW062E8Ofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815845; c=relaxed/simple;
	bh=PQocoXCWOqX5JImnrodOgZqpulIVkJoyIlyWHYLLSuY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fntj/tpZ8uQtTUTESAkRdpVxjg7yrfuAm9Add/xAI4jdgJgge1o4YT2ia1+IQY0aXBeDebKj8n5BO2cVZWkHkc5z+OY7ICYT13BhEDDJsb0kHZsfToRmdO24Thy/RPr35E/SID7NHLbakuE7TOfSoj3qefhWmZrx0Tf3hN50yc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q1jV1Fer; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=85oJjJeZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q1jV1Fer";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="85oJjJeZ"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746815842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wDB0bL9enLaCOmW0fYW0ssQWOZsCjyIgUEYMAQQEpic=;
	b=Q1jV1FereDc7AeYD7zs1TxuF5imrxeQT7qH1WFDWxNxYdgtbcmRBcc+xUFlKS4w3GmzAnx
	3oB5FXeQWxe+9gyq3dppeEyaGfuHbsrnSVvW97RzrpKC+lc1NGgZDL/kb5xVPDSKaMKAaC
	g9JlmnRWlzXS6HhNEzqZMrkJjgZH+4+nG0iFAo99Le2eEuwg3A2mzeqBn72MbPbJTjE7TG
	mhZ3VbFt2EKctMJ/b4n2BDxKmqtFzGjUWHJTdF65z1PgTk7lZn3kuEqGeGP7dxavFuysIj
	DCb8P/3YPgt/ZcaQt5b0UU3/IUBV0WuZZ809tjlyiyHyq6tCbvgU5xdheXFQ8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746815842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wDB0bL9enLaCOmW0fYW0ssQWOZsCjyIgUEYMAQQEpic=;
	b=85oJjJeZsiECE6zGsoNFPM78FcmZ2kUJPi8km/fetfNApR0+7iMjQBhasGqei7BfXIOCIG
	hURbKtF3Hp1WdCBQ==
To: Marek Szyprowski <m.szyprowski@samsung.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch V2 12/45] genirq/chip: Rework handle_nested_irq()
In-Reply-To: <46ed4040-ca11-4157-8bd7-13c04c113734@samsung.com>
References: <20250429065337.117370076@linutronix.de>
 <20250429065420.744042890@linutronix.de>
 <CGME20250508205629eucas1p2f8f2032c2d651be176acdf6ac4aa79cd@eucas1p2.samsung.com>
 <46ed4040-ca11-4157-8bd7-13c04c113734@samsung.com>
Date: Fri, 09 May 2025 20:37:20 +0200
Message-ID: <87msblljfj.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 08 2025 at 22:56, Marek Szyprowski wrote:
> On 29.04.2025 08:55, Thomas Gleixner wrote:
>> +void handle_nested_irq(unsigned int irq)
>> +{
>> +	struct irq_desc *desc = irq_to_desc(irq);
>> +	struct irqaction *action;
>> +	irqreturn_t action_ret;
>> +
>> +	might_sleep();
>> +
>> +	scoped_guard(raw_spinlock_irq, &desc->lock) {
>> +		if (irq_can_handle_actions(desc))
>
> This should be "if (!irq_can_handle_actions(desc))" to fix nested irqs handling in today's linux-next.

Ooops.
