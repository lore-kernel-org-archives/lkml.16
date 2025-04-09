Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E1725B683;
	Wed,  9 Apr 2025 08:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187248; cv=none; b=An/3+bphcARZymvTvYz+Q8+pCggmT9FKfuqqcTgbPR4XA81MpMPRw0cD6vqB2C08djUw5O/hXxOMwf+iKQjdPOcfkxEp0QTEpDPwA+V0xB7fPfNvye1u91AXxVgpDf2fyoFonvZKadWbVR427/7X4TNvouLHVxlap4y2ChipNS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187248; c=relaxed/simple;
	bh=G3spHja+t7swvyipJ/vLXF0lt8/0DKjysSgKTLoOqlk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N58gUqabBpmxG/XuyAEDDPYTQs1o6M4KLeLhsq+f3/TOCX+48efXeFHZWwH5duiUwkskBymia6jG9zqfffeBPqMEl3KwB6/sf4ch56vaVF/uHtds54LPE7TGekWe5mDswP+yPCxwl4ZXwbmFdoCuTcssNKAfBgJNOdQZp1yC4dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cEqbhwTo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XU06grse; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cEqbhwTo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XU06grse"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744187244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=beqSCrthJJ96ffNv3VxFRcPOEYbKMeCzBJvR9ZAwmRo=;
	b=cEqbhwTougUpomdumFtZLkpuEa6pFWI8Ce4+URMRNQwDpvuX3iLQ8D95jsn1TrL5ApN57d
	s1fYke81i0ORSg+/67l8P4xSEqb7rhdxujU9Bp3YZEu/f5hMjEsM4I9JkyHmN++E9hItRZ
	+ySNNZ+9reK6a7EE7/86AA3JVJF4vxB5uoOq56lNgr0cxWBKG6SBfRnTceifjiA5ur9g66
	DiDLKEZTqEHSBzdnUgYnrLClugiJPfiLuKzjrDo2xwnSEWtg5xbEE+2OL7VpIYN2NgkQUt
	H017FlRcZE7RaUO0hsf2lS7H/1ElA0H7QcejDvgA3ugefNS8X0uhKZcZ/pODlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744187244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=beqSCrthJJ96ffNv3VxFRcPOEYbKMeCzBJvR9ZAwmRo=;
	b=XU06grseNXk6NF5fs+KuOxKTjWZFrN7EUjv1zo7cX9FSdrHcycwpYCk0dxAwjpUSKQ9GQC
	PEVl8g+1LE5EuGDQ==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
 <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo
 Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
In-Reply-To: <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
Date: Wed, 09 Apr 2025 10:27:24 +0200
Message-ID: <87wmbtu4cz.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> +/* Wait for completion of an IST change */
> +static int gicv5_irs_ist_wait_for_idle(struct gicv5_irs_chip_data *irs_data)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = readl_relaxed_poll_timeout_atomic(
> +			irs_data->irs_base + GICV5_IRS_IST_STATUSR, val,
> +			FIELD_GET(GICV5_IRS_IST_STATUSR_IDLE, val), 1,
> +			USEC_PER_SEC);
> +
> +	if (ret == -ETIMEDOUT)
> +		pr_err_ratelimited("IST_STATUSR.IDLE timeout...\n");
> +
> +	return ret;

I'm sure I've seen that code before and without looking I'm sure the
diff between the two functions is ~2 lines.

> +
> +	mtree_lock(&lpi_mt);
> +	ret = mas_empty_area(&mas, 0, num_lpis - 1, lpis);
> +	if (ret) {
> +		pr_err("Failed to perform a dynamic alloc in the LPI MT!\n");
> +		return ret;
> +	}
> +
> +	lpi_base = mas.index;
> +
> +	/*
> +	 * We don't really care about the entry itself, only about
> +	 * allocation of a maple tree ranges describing in use LPIs.
> +	 * That's why, upon allocation, we try to merge slots adjacent
> +	 * with the empty one we are allocating to minimize the number
> +	 * of slots we take from maple tree nodes for nothing, all
> +	 * we need to keep track of is in use ranges.
> +	 */

I'm really not convinced that you need a maple tree and the code
complexity for this. What's wrong with a simple bitmap other than that
it might need 1MB memory?

> +static int gicv5_irq_lpi_domain_alloc(struct irq_domain *domain,
> +				      unsigned int virq, unsigned int nr_irqs,
> +				      void *arg)
> +{
> +	irq_hw_number_t hwirq;
> +	struct irq_data *irqd;
> +	u32 *base_lpi = arg;
> +	int i, ret;
> +
> +	hwirq = *base_lpi;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		irqd = irq_desc_get_irq_data(irq_to_desc(virq + i));

irq_get_irq_data() and irq_domain_get_irq_data() exist for a reason.

> +
> +		irq_domain_set_info(domain, virq + i, hwirq + i,
> +				    &gicv5_lpi_irq_chip, NULL,
> +				    handle_fasteoi_irq, NULL, NULL);
> +		irqd_set_single_target(irqd);
> +static int gicv5_irq_ipi_domain_alloc(struct irq_domain *domain,
> +				      unsigned int virq, unsigned int nr_irqs,
> +				      void *arg)
> +{
> +	int ret, i;
> +	u32 lpi;
> +	struct irq_data *irqd = irq_desc_get_irq_data(irq_to_desc(virq));

Again. Zero reason to fiddle with irq_desc.

Thanks,

        tglx
