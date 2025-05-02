Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490FD146A68;
	Fri,  2 May 2025 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201950; cv=none; b=oGLyl39CS/kjh3T1gj7GjbQHIKCMyJwjEm5qCsrXnnh7Wj1Wn2BfFphtpHTOgQa1qBIAQhRWvN2su6jKMK3ItGlXDL1S/dT2927eaCMVJhZQsUpkPLcZqHifXjxiV0RLFJ/7UkGJ4cxjN89to5EB54zLGF1U9IdxLL2r6DrrpI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201950; c=relaxed/simple;
	bh=CW6howZuFs3OlyeVpRliyRH+sBNaJRlS2y4cpHK+3rk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPj1S9zFPbb5bT1Kw/KHlaJdtfcHAQmeIVaEqfWtgrPXMdTdNrcHXuZFxckjwK3MKLei7NFGDa/7otsX+KC1OXKrVFDLm38Oq6B9WV/Y5Kv25c7zdeAG8ZZ5BA9ywycgDZIBHtSIkze0tL44k7tzVvCHoE4dUA+XCBMqiLwSrHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BAtiocXK; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BAtiocXK"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542G5fEZ3900136
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746201942;
	bh=aIIlIfkYSdL5Az0Twy2pxwPEBxkLM4iI1QPUDLeCG60=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BAtiocXKCBJG7TvNW41q6P3Nk4zNUXGQ/cFhwRZqIOI0LqSqloen/q91Q3sr9EwB7
	 2+wwQ+TeI5Qbk2o1lHvYC+H/rx7Q1W4SR0B4ZT7gPraKSBTKpncTqhvw3hNxmnMuMo
	 Kbo5u1nfSeX3MHuc0W2eXI68BNL5NfdNAua8SjZc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542G5fbl084000
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 11:05:41 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 11:05:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 11:05:41 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542G5fc0090643;
	Fri, 2 May 2025 11:05:41 -0500
Date: Fri, 2 May 2025 11:05:41 -0500
From: Nishanth Menon <nm@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
Message-ID: <20250502160541.azhzbnmghrkory7h@cleaver>
References: <20250502153915.734932-1-p-bhagat@ti.com>
 <20250502153915.734932-2-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250502153915.734932-2-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 21:09-20250502, Paresh Bhagat wrote:
> The AM62D2 SoC belongs to the K3 Multicore SoC architecture with DSP core
> targeted for applications needing high-performance Digital Signal
> Processing. It is used in applications like automotive audio systems,
> professional sound equipment, radar and radio for aerospace, sonar in
> marine devices, and ultrasound in medical imaging. It also supports
> precise signal analysis in test and measurement tools.
> 
> Some highlights of AM62D2 SoC are:
> 
> * Quad-Cortex-A53s (running up to 1.4GHz) in a single cluster. Dual/Single
>   core variants are provided in the same package to allow HW compatible
>   designs.
> * One Device manager Cortex-R5F for system power and resource management,
>   and one Cortex-R5F for Functional Safety or general-purpose usage.
> * DSP with Matrix Multiplication Accelerator(MMA) (up to 2 TOPS) based on
>   single core C7x.
> * 3x Multichannel Audio Serial Ports (McASP) Up to 4/6/16 Serial Data Pins
>   which can Transmit and Receive Clocks up to 50MHz, with multi-channel I2S
>   and TDM Audio inputs and outputs.
> * Integrated Giga-bit Ethernet switch supporting up to a total of two
>   external ports with TSN capable to enable audio networking features such
>   as, Ethernet Audio Video Bridging (eAVB) and Dante.
> * 9xUARTs, 5xSPI, 6xI2C, 2xUSB2, 3xCAN-FD, 3x eMMC and SD, OSPI memory
>   controller, 1x CSI-RX-4L for Camera, eCAP/eQEP, ePWM, among other
>   peripherals.
> * Dedicated Centralized Hardware Security Module with support for secure
>   boot, debug security and crypto acceleration and trusted execution
>   environment.
> * One 32 bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
> * Low power mode support: Partial IO support for CAN/GPIO/UART wakeup.
> 
> This adds dt bindings for TI's AM62D2 family of devices.
> 
> More details about the SoCs can be found in the Technical Reference Manual:
> https://www.ti.com/lit/pdf/sprujd4
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

Looking at the board patch in the series, this is am62p5 ? what is the
difference? If there is a difference, why is there no dtsi
file for am62d?

> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> index a6d9fd0bcaba..bac821d63cf1 100644
> --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> @@ -31,6 +31,12 @@ properties:
>            - const: phytec,am62a-phycore-som
>            - const: ti,am62a7
>  
> +      - description: K3 AM62D2 SoC and Boards
> +        items:
> +          - enum:
> +              - ti,am62d2-evm
> +          - const: ti,am62d2
> +
>        - description: K3 AM62P5 SoC and Boards
>          items:
>            - enum:
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
