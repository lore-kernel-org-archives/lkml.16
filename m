Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5594271A7C;
	Tue,  1 Jul 2025 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379338; cv=none; b=iViWbpH/QwiUIoCLsUkV4lOyGpD+iOxqI+bKM9A2ulVut/JUBV2ZxY+ASCWjXE9G6n0E/zOe+1PnSd8ycwM3thQXhOrNGoKeOrVGMKmYck7ykXQHhyKIlVeTyIAa73duX5TxC0WYUDuil7LzvpgXxoDUZ86Gb7LHV141faadCuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379338; c=relaxed/simple;
	bh=jHdi8+bTev54Ym5dBuCrjPQtYHExSbRkMbKWgPuA8Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=koiW/YypZNVfBV6PiWhw65+6z8td6xd0ZqB2Rxn036iC3FHAKynxSA09XbEbNk266w6xLtR4blEDqzjpVQnclZJh0cAvSnTYCQInXFfKJOA78ONdYNrYHBFNBtyCTjUqY2BeGUmLhFjKiXjSUCcoDWz3Nhs8vnZYqDTiRvFfEDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=U3CnYPmP; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="U3CnYPmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=BTWZ3fHGa7D6q7y60m0EG2fACXLmItVUIq7xJ4IjjQY=;
	b=U3CnYPmPEVwCoaI0np4ka5Gsdc2I4ORmD17aTa2WfYQDoNSHi9mdV3lbg68Sjk
	4vQ2dmezvfuCeJRm9pLq4AAGmbVAZaOeQi6zLmghRQrIx3Ww/OaGDjWfAULoj3Ar
	6EC3XChsX8k1tCEaNfiAbYisoRRFRr9tZ01RSZTiEF/Cw=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD336hg7WNovcABAA--.3851S3;
	Tue, 01 Jul 2025 22:14:58 +0800 (CST)
Date: Tue, 1 Jul 2025 22:14:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	andrew@lunn.ch, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: freescale: imx8mp-var-som: Add EQoS
 support with MaxLinear PHY
Message-ID: <aGPtYHLk+UbRscnk@dragon>
References: <20250609160949.35654-1-stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609160949.35654-1-stefano.radaelli21@gmail.com>
X-CM-TRANSID:Mc8vCgD336hg7WNovcABAA--.3851S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1kKFykCry7XrykKFWxJFb_yoWDAFbE9F
	W3Xr48J34UtFyfGanYgrW8JF1Fkan5XF10gr4UWr93taySvws3AFyvqa45KF4UXayftrsx
	Z392krWFv34rWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjVbyJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxx9ZWhjvz7WaAAAs7

On Mon, Jun 09, 2025 at 06:09:48PM +0200, Stefano Radaelli wrote:
> Enable the EQoS Ethernet controller on the i.MX8MP VAR-SOM with the
> integrated Maxlinear MXL86110 PHY. The PHY is connected to the EQOS
> MDIO bus at address 4.
> 
> This patch adds:
> - EQOS controller configuration with RGMII interface.
> - Proper reset timings.
> - PHY power supply regulators.
> - RGMII pinmux configuration for all data, control and clock signals.
> - LED configuration for link status indication via the LED subsystem
>   under /sys/class/leds/, leveraging the support implemented in the.
>   mxl86110 PHY driver (drivers/net/phy/mxl-86110.c).
>   Two LEDs are defined to match the LED configuration on the Variscite
>   VAR-SOM Carrier Boards:
>     * LED@0: Yellow, netdev trigger.
>     * LED@1: Green, netdev trigger.
> 
> The RGMII TX/RX delays are implemented in SOM via PCB passive
> delays, so no software delay configuration is required.
> 
> Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>

Applied, thanks!

