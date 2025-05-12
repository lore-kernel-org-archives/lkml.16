Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943D82528E6;
	Mon, 12 May 2025 18:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076068; cv=none; b=q/qph0EpjeMiZhl7h4JAHsYHr7vo471dj0DhyaMOzFfJyq3wLoE8+baE9w3drfQHRQf9xE2Mabzq2oCanov88eXBXrKmj7mhNGmNrmJ0sxHJSPbl5bHnvyfAvLSP8hdAoHJUxNuvl/O5/Lt/5RPMo8q66yK3HFfnzPKQoOfApwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076068; c=relaxed/simple;
	bh=w7oEcVfU41O5LeCFj5QI0NfsFSPKqC4f1LR8nLwTudY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lEPMnaNuagX0ADaC3DMAyMnBfCL/SkcHAN1Jqv50qTBsAZkckIIkl2UlV09qKAA5fhcCaR+HZWxI9cd+p4BkLfyVtvPjQME5ehFDGjYjpzP/keHiQ96E7hqoYX2j+bmUzLWw7fOlyU9m3pPzt2hM62hstWatROtjVXUE7kNNi6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=btrch/cE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iVBNKaOL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="btrch/cE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iVBNKaOL"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747076064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VltVeIv5GGxIG9RGHvKQLO3xUlUvGDSdlR7aKaJ6JdA=;
	b=btrch/cEqr86dJRGQsEtfull/9m8ry+o3G9q0NtUrv/YMAUIYJqpFJM5bBQP0+LNvRD5a+
	C9zptRY6IItC5UFhaUFOT8s3ez+IzUYAHs6ZQgWSt02DI1kgYbwhOczAqmaL0uGoDoQm6w
	7uBm9/WgU/cORCvBkcKacZB0kAhj1W1rvxjrKOYnaspl2NXhz+47KRwoo0UwakyB3kMCJk
	VMpY/uqL9C2fHGdlIsppX0Gm9XbQv6mQttIz2p7j05TRTFiB45EZ1TDa/kfZb+B5bbadQI
	MvuExGR8ytiDNUIOtPG1yTw4pym7BROvJCMponID1E70wZhYEvKJ7ySRa8rqzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747076064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VltVeIv5GGxIG9RGHvKQLO3xUlUvGDSdlR7aKaJ6JdA=;
	b=iVBNKaOLSUGLqgjfwTl9NiIJgJE83w1jasJXi/sW1/C9czlM5w3qvg6WUTwUmY9RAZOR33
	6i5DbdKJNlgBBmDA==
To: Anup Patel <apatel@ventanamicro.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Len Brown <lenb@kernel.org>, Sunil V L
 <sunilvl@ventanamicro.com>, Rahul Pathak <rpathak@ventanamicro.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra
 <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, Samuel
 Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 07/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
In-Reply-To: <20250511133939.801777-8-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-8-apatel@ventanamicro.com>
Date: Mon, 12 May 2025 20:54:23 +0200
Message-ID: <8734d9lkww.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, May 11 2025 at 19:09, Anup Patel wrote:
> +
> +static irqreturn_t mpxy_mbox_irq_event(int irq, void *dev_id)
> +{
> +	/* We only have MSI for notification so just wakeup IRQ thread */
> +	return IRQ_WAKE_THREAD;

I was idly reading through this because I looked at the irq chip.

This function is competely pointless.

> +}
> +
> +static irqreturn_t mpxy_mbox_irq_thread(int irq, void *dev_id)
> +{
> +	mpxy_mbox_peek_data(dev_id);
> +	return IRQ_HANDLED;
> +}
> +
> +static int mpxy_mbox_setup_msi(struct mbox_chan *chan,
> +			       struct mpxy_mbox_channel *mchan)
> +{
> +	struct device *dev = mchan->mbox->dev;
> +	int rc;
> +
> +	/* Do nothing if MSI not supported */
> +	if (mchan->msi_irq == U32_MAX)
> +		return 0;
> +
> +	/* Fail if MSI already enabled */
> +	if (mchan->attrs.msi_control)
> +		return -EALREADY;
> +
> +	/* Request channel MSI handler */
> +	rc = request_threaded_irq(mchan->msi_irq,
> +				  mpxy_mbox_irq_event,
> +				  mpxy_mbox_irq_thread,
> +				  0, dev_name(dev), chan);

Just do:

	rc = request_threaded_irq(mchan->msi_irq, NULL, mpxy_mbox_irq_thread,
				  0, dev_name(dev), chan);

and be done with it. The core code will happily wake up your thread.
