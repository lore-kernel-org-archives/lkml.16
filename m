Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F082D2A1A4;
	Mon,  3 Feb 2025 13:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590762; cv=none; b=cgAH3Rf514+V28KRV1vkaBSicktxwRuNGe5pob24dvmoRXHufmOxjJDPuZtfM2ZmM17Ya6LSLfMStEJSFteH4HgcvDc7mV0V+mXbEUqBeLJh2sg24NLQE2yzbSMA1KVG7xGIb6rKoeizCfKrk9lcbrRBkFq7PZvuFAMHfaW9Ct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590762; c=relaxed/simple;
	bh=0/Aa4eV89WKV//q22sabbUNU7T2f/PtjeEGnh0uRfa4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tgoFetmCDljbZZvXvWLu4dursl2o57jgWeQFdR+kFDPFAAJ6w/YYRlzqqb4Kup+E8VXG/TDPdsyS27yjuzCj1YQlVhxRyYK6bi0BHnLNzxtt751BgGrZMm0iS1VOsAwyir8vim7ixcLwgGbk4uONG4YmWBoYm9YzRk28T1A/bDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DWbt8mzk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vhCuX6ed; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DWbt8mzk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vhCuX6ed"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738590759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zLHVOEFTbtw28lXGqZ/3v2t+7cTLKHCxNyw/+InlffI=;
	b=DWbt8mzk758d9C/6+fqiS0jfoaes7BoKIiEvwnJ/B5ableKwXNKbxwt3TZ53yLIWvVbNeC
	8aQkZOBmygeVtFspiEXM3WP2mFRes8Poj2IHk6LE9I4dLWYXY6xyH+sJzOeLf57p/BhoKa
	HhAk7jhBZK87q+y8xMzdFL7UHhGdaH6KlStrOy59Q8GjatbQVGmbNywqPYOu316sKwLU63
	mOkVkauwakMftvSiZAMDuHPfx7qEeoG8tlXzqG9BaHxbmOoDw+yzInwYwwc9cJw5YpREZM
	C3m9um2YeF85U17ENc6hNdEfygXJ7NwDsUkDhVbHgkYf9wo4vxdvWuv6xInMrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738590759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zLHVOEFTbtw28lXGqZ/3v2t+7cTLKHCxNyw/+InlffI=;
	b=vhCuX6edI1d1zrChh+7PFwxQcCfeXIS3rO7dUcXxZWg+lFoKBvdwACUseRYnhEKsjQqo6k
	nxpULwQTX6sAYlAA==
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
 <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Samuel
 Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [RFC PATCH v2 16/17] irqchip/riscv-rpmi-sysmsi: Add ACPI support
In-Reply-To: <20250203084906.681418-17-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-17-apatel@ventanamicro.com>
Date: Mon, 03 Feb 2025 14:52:38 +0100
Message-ID: <87y0ynnnix.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 03 2025 at 14:19, Anup Patel wrote:
> +
>  static struct platform_driver rpmi_sysmsi_driver = {
>  	.driver = {
>  		.name		= "rpmi-sysmsi",
>  		.of_match_table	= rpmi_sysmsi_match,
> +		.acpi_match_table	= ACPI_PTR(acpi_rpmi_sysmsi_match),

Please indent .name and .of_match_table accordingly.

Thanks,

        tglx
