Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B111A213E8B
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682433; cv=none; b=pHgaVbyuZsY0PlipS1pTRFjoqeZq0qA84dm52M3OSOkuP4jrU84lEIdez+6fS75bVN95C6vlijC0KTDzTk1NqBWVJn+IlgVvRMdZ78Diz5NUara0veu8O7Hxj7E9BDiVMlAXwmvXlcatRmc5EJMZNuqFjtzEerdGUSmnB5ZwmQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682433; c=relaxed/simple;
	bh=b+np3wghDxTYvPM4DJ7Bcv/JvDfMQYeUeUQQTzNPD3A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H9kyaahwdIuT3eNWiU8x6ao8tasUwZRK1aX5KCNzJFKBdHSGxAg8gniaC90zDpw7ynFtnRonAKzs+KYXlAouEg8mC0adreiQ9nly9LeHtzP7lS2AafBKUB1H++/YMUWw/Cx9Y2N5AY3eQD1aKPVOZZdHrvIiNsMG5koxDYX3Pjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PhnloDKY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rOLEsODC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PhnloDKY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rOLEsODC"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738682429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+np3wghDxTYvPM4DJ7Bcv/JvDfMQYeUeUQQTzNPD3A=;
	b=PhnloDKYNBOrZBEe9vEbIX8wdTJMzWPCq9rB3iYhHnl9FFRrKeNxTrKOBpjWlKWGB8W6xb
	R0MGAX/uT5/nGmCn3pxBnubFyDeu5WDKk5kpLj0/4xJ9sS1raOa3AuslhdOIvWrQXPtErr
	tQxrsQ6ksCJ4v2KS7nCQeFBzUrauP+7CjBmtzIw//Sc0kn4MZ3iHwrgp6E7tJcRc+CTP5f
	6kvvz1+6fF1pTuOANHtCH/SwS3oD+xs/q9bgrEcUhilZORvJlD5Dx/jc+R4mKx8+Zgi0SN
	LJVZPshsHOrvPMuz4guozzsqmaU9j8kqm/EUyTKvJPLTvor/FTxbvXs4fDNw+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738682429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+np3wghDxTYvPM4DJ7Bcv/JvDfMQYeUeUQQTzNPD3A=;
	b=rOLEsODCJvNLJOUwg/qKcv7l3HvdSVhKFHYQM9G81quzT2zY0VtGTOwVSSYqSKg2g1lrUr
	gLT6jEyfQOk5+dDQ==
To: Anup Patel <apatel@ventanamicro.com>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Sunil V L
 <sunilvl@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 10/10] irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED
 flag for PCI devices
In-Reply-To: <CAK9=C2VgOnSVBRPh+bJBQnGreVYcUh6HWVg1MEzDtfYsuT0s-g@mail.gmail.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-11-apatel@ventanamicro.com> <87o6zinl5o.ffs@tglx>
 <CAK9=C2VgOnSVBRPh+bJBQnGreVYcUh6HWVg1MEzDtfYsuT0s-g@mail.gmail.com>
Date: Tue, 04 Feb 2025 16:20:28 +0100
Message-ID: <87cyfxohxf.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04 2025 at 20:19, Anup Patel wrote:
> On Tue, Feb 4, 2025 at 2:26=E2=80=AFPM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
>> The same could be achieved by executing that intermediate transition on
>> CPU0 with interrupts disabled by affining the calling context (thread)
>> to CPU0 or by issuing an IPI on CPU0 and doing it in that context. I
>> looked into that, but that has it's own pile of issues. So at the end
>> moving it in the context of the interrupt on the original CPU/vector
>> turned out to be the simplest way to achieve it.
>
> I got confused because IRQCHIP_MOVE_DEFERRED updates affinity
> with the interrupt masked which I interpreted as masked at the device
> level. Also, PCI MSI mask/unmask is an optional feature of PCI devices
> which I totally missed.

That's the problem this actually handles. If PCI mask/unmask would be
mandatory the problem would not exist in the first place :)

