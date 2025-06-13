Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F001DED47;
	Fri, 13 Jun 2025 15:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828829; cv=none; b=lH6qJ0HQHKZcKI1tw9jKQlYbSFIf/FQemodgNjW+T/ow/lM9040viFsbw23tzvq7BUrovBMjIOp2UOn4T+55DtDBk1KM1KDEokkiVa/q0Ggep4RgA0K0bOQGRWzRG1BV5EG1Q1q2zNMNorN5DjRi41MlwEpv6OJ8pqk2nLdRCic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828829; c=relaxed/simple;
	bh=4A53RFLXlY4zQxfXBrQekZwEIReTVbrIpCwQ5LO8DLM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Cemyf5IgsgQy6tTIBGPPil/NCk7US2KmJE4EVuVTwh9KSxOElbcehEfpRUDuOEKzTpsPZyOqnstrJ9uhUy87cJL3gxE1V+LfUDDVr+w/Vl11DQzQTpv2dwMJtY6a+8gxX7+NmVm7gP7Jxf6ovTxB3XrkdXYk0NhLSt82SgZP75g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Wam1Zery; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3oyORhNP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Wam1Zery";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3oyORhNP"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749828826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h8Q++Tfje6GjVU5ZbxYDb9xgWKXCeQmLjtaQsH9Blrg=;
	b=Wam1ZeryyWsLC839quGmvrQZxsl2Qu2r1Wbbz10NjClptQ3jXkEJ2o3N5iCZ8jEqOCm/D1
	Q1Gfk3JDLdKsKMieahHNU1lT2runC8/OPNNVYUoaiObqBAS+lKVzghN3wc/cU9EtSrzuXo
	Ay2va7G4g6E+uUQYK1nqWJY71JA2ss2dkQSsAsVxFLoD/nt5RiSVqa3zq77DSUgCAWpiTB
	kG06m+Q8qAy9BxG0rXrjWq0T89cYIy5xKZBnH0xSwCYmP3YHbLlZwm2kRuWVf+0/WqzO+k
	xwwe4VBC5v12Pkm5+sDIIveRZeleIlaKg6YKcgYNk6PpNrP1YbAoRHUKJ0n7rg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749828826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h8Q++Tfje6GjVU5ZbxYDb9xgWKXCeQmLjtaQsH9Blrg=;
	b=3oyORhNP3386qwl3ZT3zsuGyBlNpKcQv05Bm+651IskbFfbN56X1uEmU/I3TikwWhkrzWk
	Nt8e7dFKI/DRzYCg==
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
Subject: Re: [PATCH v5 12/23] irqchip: Add driver for the RPMI system MSI
 service group
In-Reply-To: <20250611062238.636753-13-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-13-apatel@ventanamicro.com>
Date: Fri, 13 Jun 2025 17:33:45 +0200
Message-ID: <87ldpvirl2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jun 11 2025 at 11:52, Anup Patel wrote:
> +	ret = rpmi_sysmsi_set_msi_target(priv, hwirq, msg);
> +	if (ret) {
> +		dev_warn(priv->dev, "Failed to set target for hwirq %lu (error %d)\n",
> +			 hwirq, ret);

Just let stick it out. You have 100 characters ...

> +	}
> +}

Other than that:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

under the assumption that this goes all through either the RISC-V or the
mailbox tree.

Thanks,

        tglx
