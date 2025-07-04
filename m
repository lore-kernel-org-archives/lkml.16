Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878B20298E;
	Fri,  4 Jul 2025 04:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751602259; cv=none; b=OXD5yNdEnUX70GAlKOY4MPG9lbnRfufjxMKvELQqkWBAf4nXRhNVQfLJojRo2Fkq5QZtZfUlTRLVBv1PMsI65DPn6eUejFVp2Qp6b9fVgHnPuw8YvjsXMd5z8Z3xelTjA4/vRpatwxnW7fpafjSWUbF+ZPlJtLSTDKDEYKFWqkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751602259; c=relaxed/simple;
	bh=2ifQg3oyu3Xg8ovGPMRP9ryzstnmdXufFFPNL9IWCEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pNIOzSPMe5BhMLA5biLk3l9JjBVLvOVL5x0UZkF7Lp7IyzFAnaytmOD+848aANwNhJQEn1iSqKMVAprVbgRcOxMc92xbIwnkbLE2xJXvj6oDj5PAoumKFRBFkakQFPDjPH5PnMHg2BzewkFGI5fuLSUmvsHLxUN6kw4roe16+qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PfU85ndY; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PfU85ndY"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5644AlXR3718250;
	Thu, 3 Jul 2025 23:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751602247;
	bh=zJkXfrPAxpJPDeMDmwVXBCvheZa++B3SkX7TfmxEWUI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PfU85ndYBC4X+eoY306KEwfcUjMe2cXNwldNP83irprGxwk8ILAxdwgDsj/x2z17A
	 0P+o85f8wBkDjXdBhSNFS+escb7U2UrMYuw+GsJYSiOdoJpdNUvaaOl2BJbKTaDByD
	 MIYYDi6xxAF1aFhAeIzd1+w6lrAZgRQQhPqzotEA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5644AlJ42464333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 3 Jul 2025 23:10:47 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 23:10:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 23:10:46 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5644Af6l2296864;
	Thu, 3 Jul 2025 23:10:42 -0500
Message-ID: <485dc90b-dc9b-4b1a-ad18-9a9ef117637c@ti.com>
Date: Fri, 4 Jul 2025 09:40:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: ti: Add support for AM62D2-EVM
To: Paresh Bhagat <p-bhagat@ti.com>, <nm@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>, <andrew@lunn.ch>
References: <20250627115753.2246881-1-p-bhagat@ti.com>
 <20250627115753.2246881-5-p-bhagat@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250627115753.2246881-5-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi

[...]

On 27/06/25 17:27, Paresh Bhagat wrote:
> diff --git a/arch/arm64/boot/dts/ti/k3-am62d2.dtsi b/arch/arm64/boot/dts/ti/k3-am62d2.dtsi
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


Norm seems to be to use /delete-node/ here instead. Please respin
accordingly.

-- 
Regards
Vignesh
https://ti.com/opensource

