Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF6628C2C1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650105; cv=none; b=FWX2UV7aTsJoy8Tt973+3PNe59N9k/jwpVK8FiQSVJBFkdtxwXBI5qvVCW7i+wKZEthZVun4yGA2dgqZYyD9Z8vikRuKpzwJNIfU/qbcVze00PDI/hwJLgXEq07Vo17MMZbJwPTMyj0DvnFbZ663IWQnOYT5scZ2HEfW/kauPUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650105; c=relaxed/simple;
	bh=SVo3B24OwlGB4MegvwJiCx+gPz1XAKK8W690GqvITAQ=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NCRC084funA5xHZUmcL15Y1yKVs8CgKlLI4Lxhvv8SmFz8rk4Jp3FaVFYiqqo39r2nD65YFbqPotNwbX5cNYuikJmvdZ7ljP/OtAwN5qsxkvXsCQS6UwotLBLaUnPNkQ0Zm/8Wz1Qd5RGM8UHP/xJwKQ4SoqIA8MtfiFkRGNxJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=a3CiH6h0; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="a3CiH6h0"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BCFOAP014824;
	Wed, 11 Jun 2025 15:54:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	SVo3B24OwlGB4MegvwJiCx+gPz1XAKK8W690GqvITAQ=; b=a3CiH6h0cxGgTkgA
	Aqee/5M/6dNuYYLxJdIVA+T0Im2/E65K7ptBXpADH0V+zNyZa3b8Qpv3rxV67eGR
	mCO87tx4+jGIAHUiwJAeThs04F7Rk8GF35De9xoq1+ECrpydeANzzpD4pbY2b0IN
	mjcwVS6eDOPTQTwd/DPfLJjwkRQHtWepwPiX3iEUt+aWUcTdrDO/ePYyEHnHwtwi
	SIGHKSiRI8e2KB+VUWXYJhr67wWD47NYR7Nvd3a++wt9u0odcRes/VkTwpaU09ms
	H+YeJmq+CCRjU53+AKY4FQYwNQYjiCBDMMi4DCSWkNqSa0VLl8dETa6DU7j8Nkqj
	u3NJbA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474ajaa6d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 15:54:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CE8EE40048;
	Wed, 11 Jun 2025 15:52:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00A94B12446;
	Wed, 11 Jun 2025 15:51:46 +0200 (CEST)
Received: from [192.168.8.15] (10.252.18.240) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 15:51:44 +0200
Message-ID: <a5e25ab7c595936f93198c9ac0b2e048a83f5b57.camel@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH] irqchip: Use dev_fwnode()
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, <imx@lists.linux.dev>,
        Fabio Estevam
	<festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Tero Kristo <kristo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Santosh Shilimkar
	<ssantosh@kernel.org>, <tglx@linutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>
Date: Wed, 11 Jun 2025 15:51:42 +0200
In-Reply-To: <20250611104348.192092-10-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
	 <20250611104348.192092-10-jirislaby@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01

On Wed, 2025-06-11 at 12:43 +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
>=20
> So use the dev_fwnode() helper.
>=20
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
>=20
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
> =C2=A0drivers/irqchip/irq-imgpdc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-keystone.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0drivers/irqchip/irq-mvebu-pic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-pruss-intc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-renesas-intc-irqpin.c | 6 ++----
> =C2=A0drivers/irqchip/irq-renesas-irqc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-renesas-rza1.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 5 ++---
> =C2=A0drivers/irqchip/irq-renesas-rzg2l.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 5 ++---
> =C2=A0drivers/irqchip/irq-renesas-rzv2h.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-stm32mp-exti.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 4 +---

For drivers/irqchip/irq-stm32mp-exti.c
Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>

Thanks
Antonio

