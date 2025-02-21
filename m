Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB372200BB8;
	Fri, 21 Feb 2025 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740128845; cv=none; b=ItqgtqMDrgxrTm6VLL1GXIxPHIYD3s/MtOSHuwujnbQCjV7dSVKNe7/ZWRVIWemUb2G/Hah1LSr3X2GcZ0z3LoEsrZaWuJndFPB6GecwaGqr0B7iFYhvLD4zNMu+C345K7FudsIiTRACiNLcHSaJPD9gw4NZKYiUdp783yEQtfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740128845; c=relaxed/simple;
	bh=0h0KpTGZDIVKElckKrZ+svrK42oXdAOUjJmyf+eJKIk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kZehkx31jt/LgE1F3ZOYR4ZD5KRrFOF4IzuQsSqKT01Rw0tlNDKOamkCLjLICceXYHF/gav2ZYGYXH600RyYg89JZVzTO12O3eUHxaHuztbFOP8rRkuVcQTTQJIDTNC+wOcBQaX2+eMm2omMLuQjq9gex2vdd/iBH27PWraOdfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sVkzAQAs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1s81yxFB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sVkzAQAs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1s81yxFB"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740128842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvIQ8d5TYCzCTqp4FjW1nkQDlwUNWCKgzYX5Dv2bm5E=;
	b=sVkzAQAsvdHbBqFtg7QgnAn6l5yKDF8NHa3H9r8wViYVWLFwrnfbAMGvtA10nL3lIsm45q
	GsKjn76FujDmJY41kEqOTOpWcZmKE/EeNEqeaRkeDAqFlXWjWeD65PPhSHXy8NPXGus4s+
	OQStSauBYfW41bVXuRs5YT/UiFPpqB1KeYaueaetAAqbw1JB5ZS+/+INLYiepoToMsFB/e
	H6GENMhowl7fLn/3Kukx/Ydq+O5iwuHojqGLdNdPOr8OTjxX7CVQnWL+UHxxofNu5Oj7IY
	Mi0RzzLBxl4BDooHUzFWRqDHhJqZt+ogZYy0XYvl42YQkC9k6siMSYqJlxzhxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740128842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvIQ8d5TYCzCTqp4FjW1nkQDlwUNWCKgzYX5Dv2bm5E=;
	b=1s81yxFBfBM6r5o8P7Xc//nNkIUNEmn04A1iCXJM+bKCkKdc0ram9G7uNYN43Z8lWU4v2X
	FpRM3tkDIFG0psCw==
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 2/4] irqchip: Add support for Amlogic A4 and A5 SoCs
In-Reply-To: <20250219-irqchip-gpio-a4-a5-v1-2-3c8e44ae42df@amlogic.com>
References: <20250219-irqchip-gpio-a4-a5-v1-0-3c8e44ae42df@amlogic.com>
 <20250219-irqchip-gpio-a4-a5-v1-2-3c8e44ae42df@amlogic.com>
Date: Fri, 21 Feb 2025 10:07:21 +0100
Message-ID: <87o6yvhdiu.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Feb 19 2025 at 15:29, Xianwei Zhao via wrote:
>  
> +static int meson_ao_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
> +				      unsigned int type, u32 *channel_hwirq)
> +{
> +	u32 val = 0;
> +	unsigned int idx;
> +
> +	idx = meson_gpio_irq_get_channel_idx(ctl, channel_hwirq);
> +
> +	type &= IRQ_TYPE_SENSE_MASK;
> +
> +	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL_AO, BIT(idx), 0);
> +
> +	if (type == IRQ_TYPE_EDGE_BOTH) {
> +		val |= BIT(ctl->params->edge_both_offset + (idx));
> +		meson_gpio_irq_update_bits(ctl, REG_EDGE_POL_AO,
> +					   BIT(ctl->params->edge_both_offset + (idx)), val);
> +		return 0;
> +	}
> +
> +	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
> +		val |= BIT(ctl->params->pol_low_offset + idx);
> +
> +	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
> +		val |= BIT(ctl->params->edge_single_offset + idx);
> +
> +	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL,
> +				   BIT(idx) | BIT(12 + idx), val);
> +
> +	return 0;
> +};

This function is a full copy of meson_s4_gpio_irq_set_type() with the
only difference of:

           s/REG_EDGE_POL_S4/REG_EDGE_POL_AO/

Can you please stick that register offset into the parameter structure
and use the function for both variants?

Thanks,

        tglx
