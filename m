Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142E0205AB8;
	Mon,  3 Feb 2025 13:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590629; cv=none; b=mw4Mqr+nSDlpW3zr1GUyCDBiiNT2binGFU0SIQXNvsVTZocMNuV5Ad2SPtvibmstitCl5c81cCc6+OUAPzfJvaRfVVD/r8p70xY2FpYo0IK+CiSgvr3QkZtggrW4CTr7BLvzFeyDk0ekkf15xPgaC5eGVQeSt+0YRg4g5Ga2uMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590629; c=relaxed/simple;
	bh=nsaWgC9EBchhBdEL8vUad7iVmicmeO7R6aTxVUz/fTA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WptoryLsDKqibNHeU9KAVgjb6Yhuc1XNsNiCxSGjuL1VpsyhCDiYa1aSd0gSTcfvq1D4tvOUvq33w9U4BJDt471v4gblSNCkjN5lvxSBRJTY/hPE6lZBeTBH6E9bxGb1Co0GYcXwJAYFwQhQVCtq/peJbwd8dFdO3xyuHUkyQ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U5jaqNcM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AsX4h4lh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U5jaqNcM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AsX4h4lh"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738590625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6Of9Maol3sWb4Qd1PmgWM14UjgECcDGsYYP5rsqQCs=;
	b=U5jaqNcMlFG5jGUh4vFVWUw9In4xCjDxNDywuREBOqlz4BERqG45SK/+Y2a2rK2Z5ARoWY
	XSevM0A8IV42ag6PM/OWDnstR9LqjG73l5sP/9IeMClScaCIoivLkQUQQg5pGcNKBsLkGD
	OhXut0RPsEsICc6kSiffCjOuxcsFujatSi3NqHBj1mR6Ly0QdOCXSsnKwK7Zhx9mEdeVf6
	8kxBK2XpMmF0djWkmbyz8BQiNvX9ZrkuACg/3LPvR40baOM5N3M/hAOy2RWW4eUtY0dEDa
	u/Yzcd5EWUWPOQMwyY81h8P9l7kImUpWEgDwwXIuC0qs7lBHVQuWZc+bwoqyOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738590625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6Of9Maol3sWb4Qd1PmgWM14UjgECcDGsYYP5rsqQCs=;
	b=AsX4h4lhbtuQKC3s5kDd+iyWyhy/gKuPT6L8gRJFgrXKN/DlC/9vqgl33WtQVjIQCGeIzm
	Am1dUDJTihGrF+BQ==
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
Subject: Re: [RFC PATCH v2 11/17] irqchip: Add driver for the RISC-V RPMI
 system MSI service group
In-Reply-To: <20250203084906.681418-12-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-12-apatel@ventanamicro.com>
Date: Mon, 03 Feb 2025 14:50:25 +0100
Message-ID: <871pwfp272.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 03 2025 at 14:19, Anup Patel wrote:
> +
> +struct rpmi_sysmsi_priv {
> +	struct device *dev;
> +	struct mbox_client client;
> +	struct mbox_chan *chan;
> +	u32 nr_irqs;
> +	u32 gsi_base;
> +};

AS requested before please use tabular layout for structs:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers
 
> +static int rpmi_sysmsi_set_msi_state(struct rpmi_sysmsi_priv *priv,
> +				     u32 sys_msi_index, u32 sys_msi_state)
> +{
> +	struct rpmi_sysmsi_set_msi_state_tx tx;
> +	struct rpmi_sysmsi_set_msi_state_rx rx;
> +	struct rpmi_mbox_message msg;
> +	int ret;
> +
> +	tx.sys_msi_index = sys_msi_index;
> +	tx.sys_msi_state = sys_msi_state;
> +	rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_SET_MSI_STATE,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +	ret = rpmi_mbox_send_message(priv->chan, &msg);
> +	if (ret)
> +		return ret;
> +	if (rx.status)
> +		return rpmi_to_linux_error(rx.status);
> +
> +	return 0;
> +}
> +
> +#define rpmi_sysmsi_mask(__priv, __msi_index)		\
> +	rpmi_sysmsi_set_msi_state(__priv, __msi_index, 0)
> +#define rpmi_sysmsi_unmask(__priv, __msi_index)		\
> +	rpmi_sysmsi_set_msi_state(__priv, __msi_index, RPMI_SYSMSI_MSI_STATE_ENABLE)

These macros are not really providing any value.

> +static void rpmi_sysmsi_irq_mask(struct irq_data *d)
> +{
> +	struct rpmi_sysmsi_priv *priv = irq_data_get_irq_chip_data(d);
> +	int ret;
> +
> +	ret = rpmi_sysmsi_mask(priv, d->hwirq);
> +	if (ret)
> +		dev_warn(priv->dev, "Failed to mask hwirq %d (error %d)\n",
> +			 (u32)d->hwirq, ret);

        if (ret) {
        	....
        }

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#bracket-rules

> +	irq_chip_mask_parent(d);
> +}

Other than those nits, this looks reasonable.

Thanks,

        tglx
