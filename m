Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE95278E7C;
	Tue,  1 Jul 2025 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386122; cv=none; b=b0UL7j0zz510cMGgsuPZqMxkLHHigK8xIeiRxIjS93iXU7ZKqf6LxdD2rA7JllRyzNSk6jkdrENuiqVM+pM8dCb4LcCc4wx8MI5NW5izoGTGvYBfbjk0QO3irr+8XL4cQtCbw6akim4LMUrox9wfYmIpe2Sle5wOiF5rHkJhlcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386122; c=relaxed/simple;
	bh=g/GS7iYo0DvmCAHdTRbNmxu7tE6/RBT/m+tGVE65GYc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJJ6NsTOz8LYaJILAHjDu+oxeFAB06Qg7hUAKPphvAs/qQmDLFb6vnqMsNN3197gcBjJW0ZpZnj/Eu/+FokaVjnY1SwjWq/z06vMQybl5eGRWaj8JGAbxkrdr3qx/5GkaIzcFuK/DC1qidSZU5Ts3BBC6BqPBsvLSBLVJmGn+Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YvqxZK1R; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YvqxZK1R"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561G8Tq43682752;
	Tue, 1 Jul 2025 11:08:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751386109;
	bh=u2QdfPMZKjTriOw/UTDyBbsrhrWHxRSetfZIlOQ8wps=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YvqxZK1RLT+rgLhoas2X7ZELky8RTCy3U1gssPxAE5Gyz88Vm+V4OZ9r5KVepH4Og
	 OCznBMhMkUrlQpy/3ebg1/vl3ooC5O3CgVKPhhUdBmZW4UOG2WL/k/4BqBu5tQxWWH
	 eOoINwCYQageT6yoPUcfz45x56NmuC/yoj/DXrSE=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561G8TgT028847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 11:08:29 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 11:08:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 11:08:28 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561G8SmU1852701;
	Tue, 1 Jul 2025 11:08:28 -0500
Date: Tue, 1 Jul 2025 11:08:28 -0500
From: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>, <s-vadapalli@ti.com>,
        <andrew@lunn.ch>
Subject: Re: [PATCH v5 1/4] arm64: dts: ti: Add bootph property to nodes at
 source for am62a
Message-ID: <20250701160828.lmmfgfrmfcqiwpzz@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250627115753.2246881-1-p-bhagat@ti.com>
 <20250627115753.2246881-2-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250627115753.2246881-2-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On June 27, 2025 thus sayeth Paresh Bhagat:
> Add bootph property directly into the original definitions of relevant
> nodes (e.g., power domains, USB controllers, and other peripherals)
> within their respective DTSI files (ex. main, mcu, and wakeup) for
> am62a.
> 
> By defining bootph in the nodes source definitions instead of appending
> it later in final DTS files, this change ensures that the property is
> inherently present wherever the nodes are reused across derived device
> trees.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi   | 14 ++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi    |  1 +
>  arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi |  2 ++
>  3 files changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> index 63e097ddf988..770f1258b0aa 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
>  

...

>  	main_pmx0: pinctrl@f4000 {
> @@ -262,6 +271,7 @@ main_pmx0: pinctrl@f4000 {
>  		#pinctrl-cells = <1>;
>  		pinctrl-single,register-width = <32>;
>  		pinctrl-single,function-mask = <0xffffffff>;
> +		bootph-all;
>  	};

I don't think the boot phase flags for the pinmux nodes need to be here. 
The child nodes for the MMC, UART and Ethernet pins should take care of 
this.

...

> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi 
> b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> index ee961ced7208..df4aa131097f 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> @@ -12,6 +12,7 @@ mcu_pmx0: pinctrl@4084000 {
>  		#pinctrl-cells = <1>;
>  		pinctrl-single,register-width = <32>;
>  		pinctrl-single,function-mask = <0xffffffff>;
> +		bootph-all;
>  	};

Same here. If we need any pins from the MCU domain during bootup those 
nodes can take care of adding the boot phase flag.

~Bryan
