Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B45272E6C;
	Fri,  9 May 2025 07:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777042; cv=none; b=FvHvthHTi2sbkoTQIUGVHq94dujp6tXGvFcMA+LhhFm7Un4+IJHvsn2XE3jcOTm/wVdN5AQ8UjM5sRQgoMeCDtgxHzJfSdufpRC0guMMJUxWzEs4Jc7/kBrZNn83tnhftcTIwN4305bWh7p1tUJua8fudetHbFe0Avbdb3EoGVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777042; c=relaxed/simple;
	bh=K2IHXzxqcmZjIgb8Mlt9nYfQ7MngvjYriEU3frBqlv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VpQW1RUNBE7ZH7XCBgkEEccuV6JxOadycrBwwZVhLdumbfNSbcIxVhXezToFX26PRKpfRpJkNsoaJpZ7SZSWfTuBHfmGt1HXnU/cSwCqJDQ2h577rHN36fGSTAFAQkQmftCVIqO0ny7YClFbprYx7Ey7MRunEOh7/2tznUIhIdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=B9KASlCA; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="B9KASlCA"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5497oV0u1897039
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 02:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746777031;
	bh=LekwP+ArvEoE0eGxVmnPiOhWhxLOfr95imAbcOo7FRc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=B9KASlCAQoYI/91Ry4UgRF1LJPa9AWty4SjnEyuX144ka6s6qNBDHRtbC8jQclg/s
	 nJSC16rF/2P6WEm3xa/rkGUYFecq1ZqFWTgCjDDdpiQHyC6lPZrKVXWR1b0gfAROtc
	 3K8HzcdHl2Ml3wNnVwe2iBE5B7Tw6i5laAssM9i0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5497oVkL113068
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 02:50:31 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 02:50:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 02:50:30 -0500
Received: from [172.24.19.187] (lt5cd2489kgj.dhcp.ti.com [172.24.19.187])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5497oQjf086528;
	Fri, 9 May 2025 02:50:26 -0500
Message-ID: <1aa31d6e-8f23-464f-9153-ded233429b41@ti.com>
Date: Fri, 9 May 2025 13:20:25 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: ti: k3-j722s-evm: Add overlay for quad
 IMX219
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <r-donadkar@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jai.luthra@linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
 <20250508155134.2026300-4-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250508155134.2026300-4-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 5/8/2025 9:21 PM, Yemike Abhilash Chandra wrote:
> From: Vaishnav Achath <vaishnav.a@ti.com>
>
> RPi v2 Camera (IMX219) is an 8MP camera that can be used with J722S EVM
> through the 22-pin CSI-RX connector. Add a reference overlay for quad
> IMX219 RPI camera v2 modules on J722S EVM
>
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>   arch/arm64/boot/dts/ti/Makefile               |   5 +
>   ...k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso | 329 ++++++++++++++++++
>   2 files changed, 334 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
>
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 3c3aa09a94b6..b317eaff64cc 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -132,6 +132,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
>   # Boards with J722s SoC
>   dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
> +dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo

I think, you need to care of comments from Nishanth.

With  that

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   
>   # Boards with J784s4 SoC
>   dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
> @@ -227,6 +228,8 @@ k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
>   	k3-j721s2-evm-pcie1-ep.dtbo
>   k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
>   	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
> +k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
> +	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
>   k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
>   	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
>   k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
> @@ -264,6 +267,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>   	k3-j721e-sk-csi2-dual-imx219.dtb \
>   	k3-j721s2-evm-pcie1-ep.dtb \
>   	k3-j742s2-evm-usb0-type-a.dtb \
> +	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
>   	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
>   	k3-j784s4-evm-quad-port-eth-exp1.dtb \
>   	k3-j784s4-evm-usb0-type-a.dtb \
> @@ -288,5 +292,6 @@ DTC_FLAGS_k3-j721e-common-proc-board += -@
>   DTC_FLAGS_k3-j721e-evm-pcie0-ep += -@
>   DTC_FLAGS_k3-j721e-sk += -@
>   DTC_FLAGS_k3-j721s2-common-proc-board += -@
> +DTC_FLAGS_k3-j722s-evm += -@
>   DTC_FLAGS_k3-j784s4-evm += -@
>   DTC_FLAGS_k3-j742s2-evm += -@
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
> new file mode 100644
> [..]
