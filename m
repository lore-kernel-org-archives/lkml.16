Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643A121ABDA
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747391027; cv=none; b=G2He6QOzaHAqBGXQ1BwRkvW3Dlqz/9G83ZGjajP01BWb/sSvGUFLiivWkP5VaH5R0D5EWr5My2pi7D48tSzZPVnxHDuHZ7jgeJINByqhkzCcUpevGGnmjyop5gw3xnanvOVuuh+OmnmOg8eTeZtL4IuU06sC1uXyCyi+tpET83s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747391027; c=relaxed/simple;
	bh=O62hwLD99pjENKaFOtAe4SzABf05kZaTfZAi8O/Xa/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8dyXNnVJcaCLUjk4ml/irLeu09h81qBIbbpvCqTG7UDNMqxqHbJahmoofR28k5Abm0BwrjAsH5olYTzcGVuEyiwtvutsWn4i8JskDxtqqdaXexnwEz9BMbEJLBh+8WyKJDZC8fIpgfWzfzdmMHeF7slJ8yGtcrMXKu8+Js1pvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uFsDs-0002TA-Kk; Fri, 16 May 2025 12:23:24 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uFsDr-0031Py-0C;
	Fri, 16 May 2025 12:23:23 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uFsDr-008SsJ-0x;
	Fri, 16 May 2025 12:23:23 +0200
Date: Fri, 16 May 2025 12:23:23 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <aCcSG5ah12N0yOwi@pengutronix.de>
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

Hi All,

On Wed, May 07, 2025 at 10:09:20PM -0500, Bryan Brattlof wrote:
> +	rti0: watchdog@e000000 {
> +		compatible = "ti,j7-rti-wdt";
> +		reg = <0x00 0x0e000000 0x00 0x100>;
> +		clocks = <&scmi_clk 273>;
> +		power-domains = <&scmi_pds 60>;
> +		assigned-clocks = <&scmi_clk 273>;
> +		assigned-clock-parents = <&scmi_clk 1>;
> +	};
> +
> +	rti1: watchdog@e010000 {
> +		compatible = "ti,j7-rti-wdt";
> +		reg = <0x00 0x0e010000 0x00 0x100>;
> +		clocks = <&scmi_clk 279>;
> +		power-domains = <&scmi_pds 61>;
> +		assigned-clocks = <&scmi_clk 279>;
> +		assigned-clock-parents = <&scmi_clk 1>;
> +	};

In the TI downstream TF-A we have this in the readme:

| AM62L Clock SCMI ID List:
| =========================
| 
| **Note:** For using the clock parents, the scmi clock ID will not be the actual number itself,
| rather will be starting with 0 for respective parents similar to how it's being done in TI SCI
| Documentation: https://software-dl.ti.com/tisci/esd/09_02_07/5_soc_doc/am62ax/clocks.html
| 
| For eg. for AM62LX_DEV_MCASP0_AUX_CLK device, clock ID will be 192, however if we require the parent
| to be AM62LX_DEV_MCASP0_AUX_CLK_PARENT_HSDIV4_16FFT_WKUP_0_HSDIVOUT1_CLK then we would represent in
| the device tree as:
| 
| ```
| assigned-clocks = <&scmi_clk 192>;
| assigned-clock-parents = <&scmi_clk 1>;

This doesn't work. It's not conforming to the SCMI specification and it
also doesn't work with the Linux SCMI clk driver which will hang on a
cat /sys/kernel/debug/clk/clk_summary. This is because all clock
parents will be the SCMI clocks with the lowest ids including the clocks
with the lowest ids which will expose themselves as parents.

It also prevents the userspace from being able to make a tree structure
from the clock tree.

The corresponding TF-A code is requested for upstreaming here [1] where
I also commented on with the same issue.

Please stop spreading this further. The parents must be the actual
clk_id, not numbers from 0..n.

Sascha

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/34834

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
