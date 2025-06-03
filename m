Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5941B237173
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957925; cv=none; b=k6utUjUlP+CeCn4v1ca/JmvJDR4doLQhQ4rWvIuuE9ysVse11oy9DQL8Olg9HE9jcBKne62D5dMKM6RbSmHuTRLPSHPyVw39yqITMw7G0imh77v8ei3IZ9RJnoO+SlMqGJeCGZ8I5SqGAx/aTBg9Vs8F6Q7eaZeDBRohwLBWyU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957925; c=relaxed/simple;
	bh=BX/jykdhzQ67WKSMCkGsFaj4BonMbQRI+Tb2DDSAq2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpkqRbMPynmxTIyAOniJ3/JXYEBinh5FjOxJ1k4yg76nGBtmpd3NpsIUR7fQ4YD58Y8Y04/YlmY+wrkfJMd8PZ74Ogl2buroFlXDKl8m1SJjnZr8Sax2/Z1Lrpe62zfv8nGmp+x4KKefQ4AsnVcuVUJKR1x1Ccfr3QWCBbzkq4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uMRqF-0005gf-9F; Tue, 03 Jun 2025 15:38:11 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uMRqE-001d8a-1d;
	Tue, 03 Jun 2025 15:38:10 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uMRqE-008dA2-1A;
	Tue, 03 Jun 2025 15:38:10 +0200
Date: Tue, 3 Jun 2025 15:38:10 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <aD76wjgGqDSzinT5@pengutronix.de>
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hi Bryan,

On Wed, May 07, 2025 at 10:09:20PM -0500, Bryan Brattlof wrote:
 +
> +	usbss0: dwc3-usb@f900000 {
> +		compatible = "ti,am62-usb";
> +		reg = <0x00 0x0f900000 0x00 0x800>,
> +		      <0x00 0x0f908000 0x00 0x400>;
> +		clocks = <&scmi_clk 329>;
> +		clock-names = "ref";
> +		power-domains = <&scmi_pds 95>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		ti,syscon-phy-pll-refclk = <&wkup_conf 0x45000>;

This doesn't fit together. The register referenced here...

> +		status = "disabled";
> +
> +		usb0: usb@31000000 {
> +			compatible = "snps,dwc3";
> +			reg = <0x00 0x31000000 0x00 0x50000>;
> +			interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
> +				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>; /* irq.0 */
> +			interrupt-names = "host", "peripheral";
> +			maximum-speed = "high-speed";
> +			dr_mode = "otg";
> +			snps,usb2-gadget-lpm-disable;
> +			snps,usb2-lpm-disable;
> +			bootph-all;
> +		};
> +	};
> +
> +	wkup_conf: syscon@43000000 {
> +		compatible = "syscon", "simple-mfd";
> +		reg = <0x00 0x43000000 0x00 0x20000>;

...is outside the register range specified here. Consequently the DWC3
driver doesn't probe. Increasing the register range here fixes this.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
