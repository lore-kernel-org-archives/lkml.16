Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBD11AA1DB;
	Tue,  1 Jul 2025 16:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387115; cv=none; b=Z2ECUAY328lvNSXMs8PHk56HEa69uIAYEjAAn5/cDZGed59BhOPai99Xn0pOdHB9xfZQnun1VrqCvQZXPSPOZHY6BSfNglunXsb3D4pETDKUrmdxZV5qVbAsijHWEsHUMb4SkfF8DW1OgdjEdwAozZk8Mp5XY5J3zwKMMRiOZu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387115; c=relaxed/simple;
	bh=v/N4QvvT3ATX2IBwWwvEzAtudi8W1mMlQFC6impuzOQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxjwSpdL7bNZZI6/N1IKkLD3MiWtuJcVL21SISi8CvZjJTttXaAqaeiZ3mMTrEXm+KpYPQnVz9hsQKDr/oYucj4KrveSXKFM2vXMEKe/H1uKr2bOQ01pRcOlS0ejySbYwc0qc0zQ62T4I+5nUlUSQa8Ogpf4Bm/BTlxNNmFhoik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ltPjtZ98; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ltPjtZ98"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561GP4qi3678843;
	Tue, 1 Jul 2025 11:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751387104;
	bh=F0aaeqii1FsfQz1PyoUyvITJVetiar7DEiLzMVrI2l8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ltPjtZ98RAhON84b4aXNpNH51/kttGd5AsEdJ0PEqFE8DzOe1sgs9ruAzwtSUZfB+
	 OA9lXihCXvhCvJmfNlBzp8o1DmtOO82ULt24DbfT+V6Y9AWPqvpkBYVy5fuIJQOR7K
	 KKcjtVquzA1fZx5Dg7Mm3c5NOYlP9HuKI6qIWXEY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561GP4VY2716776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 11:25:04 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 11:25:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 11:25:03 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561GP43p1598131;
	Tue, 1 Jul 2025 11:25:04 -0500
Date: Tue, 1 Jul 2025 11:25:04 -0500
From: Bryan Brattlof <bb@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <devarsht@ti.com>, <s-vadapalli@ti.com>,
        <andrew@lunn.ch>
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <20250701162504.dck3763ik6kpo7ec@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250627115753.2246881-1-p-bhagat@ti.com>
 <20250627115753.2246881-5-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250627115753.2246881-5-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On June 27, 2025 thus sayeth Paresh Bhagat:
> AM62D-EVM evaluation module (EVM) is a low-cost expandable platform board
> designed for AM62D2 SoC from TI. It supports the following interfaces:
> 
> * 4 GB LPDDR4 RAM
> * x2 Gigabit Ethernet expansion connectors
> * x4 3.5mm TRS Audio Jack Line In
> * x4 3.5mm TRS Audio Jack Line Out
> * x2 Audio expansion connectors
> * x1 Type-A USB 2.0, x1 Type-C dual-role device (DRD) USB 2.0
> * x1 UHS-1 capable micro SD card slot
> * 32 GB eMMC Flash
> * 512 Mb OSPI NOR flash
> * x4 UARTs via USB 2.0-B
> * XDS110 for onboard JTAG debug using USB
> * Temperature sensors, user push buttons and LEDs
> 
> Although AM62D2 and AM62A7 differ in peripheral capabilities example
> multimedia, VPAC, and display subsystems, the core architecture remains
> same. To reduce duplication, AM62D support reuses the AM62A dtsi and the
> necessary overrides will be handled in SOC specific dtsi file and a
> board specific dts.
> 
> Add basic support for AM62D2-EVM.
> 
> Schematics Link - https://www.ti.com/lit/zip/sprcal5
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile          |   3 +
>  arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 599 +++++++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62d2.dtsi    |  25 +
>  3 files changed, 627 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> 

...

> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2.dtsi 
> b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> new file mode 100644
> index 000000000000..70aeb40872a9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Device Tree Source for AM62D2 SoC family in Quad core configuration
> + *
> + * TRM: https://www.ti.com/lit/pdf/sprujd4
> + *
> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +/dts-v1/;
> +
> +#include "k3-am62a7.dtsi"

If we want to reuse the AM62A chassis I think we should probably reused 
the AM62AX_IOPAD() macro instead of creating a new one.

> +
> +/ {
> +	model = "Texas Instruments K3 AM62D SoC";
> +	compatible = "ti,am62d2";
> +};
> +
> +&vpu {
> +	status = "disabled";
> +};
> +
> +&e5010 {
> +	status = "disabled";
> +};

So I could be a little out of date on the style guidelines here, but my 
intuition is device trees, much like real trees, can only grow, so we 
can't inherit the am62a.dtsi and remove things.

My understanding is we have to create a full am62d.dtsi with its 
features that the am62a.dtsi can extend with the vpu{} and e5010{} nodes

~Bryan
