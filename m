Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102882E2678
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165515; cv=none; b=jckrz5vCTF1Dt+ISdtkItWDZX3a3qIwjf+U4cQFL+Dt+XqBH7cn8zpkfz+DH82cPh/0Xejiom46VZHJDe0hGuE2TL1rHJ7yY0C3mYrG2Ipxl6rVJMGwNtsmulRYXAXmIumyMGhYn+cspvVCEXOwvPTU0VMF8SOgBM/LTJxiavfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165515; c=relaxed/simple;
	bh=1LZIrfWJ857NAZTrbkwPrBYTmy6Sp3Z12qHacwq+vM8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2XUXB0cnrhDKwrGaP7C6UbTC0KqyStWSr1p+apxtTaestsmHEwUw8iaeaYmeFe1k8Isxwz1a9I55Y00yOFYzguMAYx6j2GtivYhDDQIgd8u2wkqgcUDNRkX1XeynaNrJixdkATc8IIrr9+BmKRMM42i1uctChp1t5PgmN7Hi24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iOPUzq/W; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iOPUzq/W"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55HD4OSn014423;
	Tue, 17 Jun 2025 08:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750165464;
	bh=bMoUi4cuL4Udgs4T48YUDRqAwuLLsrWE2yiMKniBN8Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=iOPUzq/Wv/zVI915DrZDgofpMJTW9L4QqExXTyKz1FejMUYdWg4LQ/AHhrXt7ypdb
	 ktgvBsoWBF5nZCatCoTKHFpjX0J0tzQU3MKo2tEH9srz0Ss8BC2Y2Hw36TNwC8Qor/
	 nscAi77V/8rxjryCvbG/6ddP6GJoiuDrQEZc7Alk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55HD4OA53625511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 17 Jun 2025 08:04:24 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 17
 Jun 2025 08:04:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 17 Jun 2025 08:04:23 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55HD4O6R1941963;
	Tue, 17 Jun 2025 08:04:24 -0500
Date: Tue, 17 Jun 2025 08:04:23 -0500
From: Nishanth Menon <nm@ti.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <tglx@linutronix.de>,
        Shawn Guo
	<shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix
 Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH] irqchip: Use dev_fwnode()
Message-ID: <20250617130423.nrqcprlpdxdmddbo@truck>
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-10-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250611104348.192092-10-jirislaby@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12:43-20250611, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> 
> ---
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Gregory Clement <gregory.clement@bootlin.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  drivers/irqchip/irq-imgpdc.c              | 2 +-
>  drivers/irqchip/irq-imx-irqsteer.c        | 2 +-
>  drivers/irqchip/irq-keystone.c            | 4 ++--
>  drivers/irqchip/irq-mvebu-pic.c           | 2 +-
>  drivers/irqchip/irq-pruss-intc.c          | 2 +-
>  drivers/irqchip/irq-renesas-intc-irqpin.c | 6 ++----
>  drivers/irqchip/irq-renesas-irqc.c        | 2 +-
>  drivers/irqchip/irq-renesas-rza1.c        | 5 ++---
>  drivers/irqchip/irq-renesas-rzg2l.c       | 5 ++---
>  drivers/irqchip/irq-renesas-rzv2h.c       | 2 +-
>  drivers/irqchip/irq-stm32mp-exti.c        | 4 +---
>  drivers/irqchip/irq-ti-sci-inta.c         | 3 +--
>  drivers/irqchip/irq-ti-sci-intr.c         | 3 +--
>  drivers/irqchip/irq-ts4800.c              | 2 +-
>  14 files changed, 18 insertions(+), 26 deletions(-)
> 

[..]


> diff --git a/drivers/irqchip/irq-ti-sci-inta.c b/drivers/irqchip/irq-ti-sci-inta.c
> index 7de59238e6b0..01963d36cfaf 100644
> --- a/drivers/irqchip/irq-ti-sci-inta.c
> +++ b/drivers/irqchip/irq-ti-sci-inta.c
> @@ -701,8 +701,7 @@ static int ti_sci_inta_irq_domain_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	domain = irq_domain_create_linear(of_fwnode_handle(dev_of_node(dev)),
> -					  ti_sci_get_num_resources(inta->vint),
> +	domain = irq_domain_create_linear(dev_fwnode(dev), ti_sci_get_num_resources(inta->vint),
>  					  &ti_sci_inta_irq_domain_ops, inta);
>  	if (!domain) {
>  		dev_err(dev, "Failed to allocate IRQ domain\n");
> diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
> index 07fff5ae5ce0..354613e74ad0 100644
> --- a/drivers/irqchip/irq-ti-sci-intr.c
> +++ b/drivers/irqchip/irq-ti-sci-intr.c
> @@ -274,8 +274,7 @@ static int ti_sci_intr_irq_domain_probe(struct platform_device *pdev)
>  		return PTR_ERR(intr->out_irqs);
>  	}
>  
> -	domain = irq_domain_create_hierarchy(parent_domain, 0, 0,
> -					     of_fwnode_handle(dev_of_node(dev)),
> +	domain = irq_domain_create_hierarchy(parent_domain, 0, 0, dev_fwnode(dev),
>  					     &ti_sci_intr_irq_domain_ops, intr);
>  	if (!domain) {
>  		dev_err(dev, "Failed to allocate IRQ domain\n");

[..]
For the ti-sci irqchip drivers:

Reviewed-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
