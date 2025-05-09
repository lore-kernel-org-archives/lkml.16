Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7849A78F40;
	Fri,  9 May 2025 02:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746757430; cv=none; b=pk9D00SDFwAyrItcfb3265464pYIUy0STCkfprF5TKQYrhdk/n9yNKFkVZEDCPN6ed0HzB1EEaVcGMjGCHQgICgEm40kt2YY+jMU4n+nnrQ//5x+XZnUS13kYwfMA/z9a30gRtXsRw9IEJ4QJZXxOiUaoH9KgdBWCIFj/uNn8xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746757430; c=relaxed/simple;
	bh=Id/HNloLE9NfCQ/k1JTxxAqMLu3q1anFpEvxmBzN6TI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4H6czR4nvj1Eze75sNdRyuVfapwa95AnrOcDq+0vOmaBoKvu/fC5YhtTsWYNOAxz8YmdVe/0FoGa1aQ3Su+0sxpFhDUrNTukcgw6yWLd+MIohdAaApBotSqc6PJD50ViY6pazWRC5SZsLmLFbW6a36ndLK8oV20krMfooZVRTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yp0y45A+; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yp0y45A+"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5492NfXa1818466
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 21:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746757421;
	bh=RZLTMhZywyKwCxB1jTgnlgJn0C3qbn1W+s81lVEcG4U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yp0y45A+gz++rWOCl+2gdnSeJOd62Sg1M/ZEmrJH8DhzxZAWMTyQUlAEHMOd6noEI
	 YRcMsCaCp60IBf0/XnKcDUOWTgsk/ulIHPYlrFvRTHp8ghqXwUrbv2vHbo+A/BObJP
	 m2DLSIWzgHs29bGaZsttAiiq5qHzezHAjEZgNoRM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5492NfaC016600
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 21:23:41 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 21:23:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 21:23:41 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5492NfoY078015;
	Thu, 8 May 2025 21:23:41 -0500
Date: Thu, 8 May 2025 21:23:41 -0500
From: Nishanth Menon <nm@ti.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <u-kumar1@ti.com>, <r-donadkar@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jai.luthra@linux.dev>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: ti: k3-j722s-evm: Add overlay for
 TEVI OV5640
Message-ID: <20250509022341.m7gfna2y2fjv2ak7@quiver>
References: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
 <20250508155134.2026300-5-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250508155134.2026300-5-y-abhilashchandra@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 21:21-20250508, Yemike Abhilash Chandra wrote:
> From: Vaishnav Achath <vaishnav.a@ti.com>
> 
> TechNexion TEVI OV5640 camera is a 5MP camera that can be used with
> J722S EVM through the 22-pin CSI-RX connector. Add a reference overlay
> for quad TEVI OV5640 modules on J722S EVM.
> 
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile               |   4 +
>  .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 322 ++++++++++++++++++
>  2 files changed, 326 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index b317eaff64cc..b0ac5c05274f 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -133,6 +133,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
>  dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
> +dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
>  
>  # Boards with J784s4 SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
> @@ -230,6 +231,8 @@ k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
>  	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
>  k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
>  	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
> +k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
> +	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo

Same comment as previous patch - keep this alpha sorted.

>  k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
>  	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
>  k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
> @@ -268,6 +271,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-j721s2-evm-pcie1-ep.dtb \
>  	k3-j742s2-evm-usb0-type-a.dtb \
>  	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
> +	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \

Same comment..

>  	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
>  	k3-j784s4-evm-quad-port-eth-exp1.dtb \
>  	k3-j784s4-evm-usb0-type-a.dtb \

---
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
