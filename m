Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50CC264FB2;
	Mon, 14 Apr 2025 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626455; cv=none; b=F9liBDofahQomgN8WdNrQhl8+bSq7pcSliu3mNoHtjMYItKodc2sRFaD5DgI97uHiw56nAg4ae1fGkn0Avcs0r++CsyHZ7gD1S5xHAq9R/mXRWpQ6tjvJM9maeN/eWgtEIRK9DRIrQX5kv+wGIZ41a12LQm+Ii4wjXUNpi1Et24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626455; c=relaxed/simple;
	bh=kh41PVQ169ONxY8zyLUhq7Qb7ay3Ohg0lpouG+/0TLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rbY8XFlRccwSIZpSRfk2YNd2ia8BC0oE1gjj2l4Fsj3zdMpSFvJC2dnD/Fs86/fhEBDDGRJkxwfGMYaYQiq0HAabE5nbFfRaQh1aOw80aNxsjFDzlCcExmHl0+aNGG2xli3C/61NtZYVCDqLiFjQzu7+kYoPhrMtG/BOIi+oQdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=S9nq3Eq3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="S9nq3Eq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744626451;
	bh=kh41PVQ169ONxY8zyLUhq7Qb7ay3Ohg0lpouG+/0TLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S9nq3Eq3LbgcNAFS71/6y0Loiki36qKw4lTfmjLUQIg569/6wtxPY33vUfuackdB2
	 jIUUgl6E4af0L+/hPW/2bbvBspm7c+li4HdhUiNSOKspXpujLCNcWoKEFGCtDfpiit
	 ujYWEPyEq30v2l8yJd2TYnk8lIfR8bfYUAFyY9CtNozZm0nY/dSavqjYOIgH6B+beS
	 M28pmaVNC6YsJ4jVTe+V6wFZLTeKmD62r20+VJwLLQmrpYgG0arFjvIBRnxSEzoWuC
	 EfFKDv+Bux+rDy2OWXm7uFWcqrEuh0ZNm4kY2MyMmL98PicI57Io57ma468ZE6GG3u
	 aEunzGofAW6Ew==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B9FD17E1034;
	Mon, 14 Apr 2025 12:27:30 +0200 (CEST)
Message-ID: <e243cca4-40d7-4cd6-804a-7e63bb5581b0@collabora.com>
Date: Mon, 14 Apr 2025 12:27:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 5/5] arm64: dts: mediatek: mt7988: Add xsphy for
 ssusb0/pcie2
To: Frank Wunderlich <linux@fw-web.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250413085806.8544-1-linux@fw-web.de>
 <20250413085806.8544-6-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250413085806.8544-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/04/25 10:58, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> First usb and third pcie controller on mt7988 need a xs-phy to work
> properly.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 39 +++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index 88b56a24efca..10525d977007 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -334,6 +334,8 @@ usb@11190000 {
>   				 <&infracfg CLK_INFRA_133M_USB_HCK>,
>   				 <&infracfg CLK_INFRA_USB_XHCI>;
>   			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
> +			phys = <&xphyu2port0 PHY_TYPE_USB2>,
> +			       <&xphyu3port0 PHY_TYPE_USB3>;
>   			status = "disabled";
>   		};
>   
> @@ -398,6 +400,9 @@ pcie2: pcie@11280000 {
>   			pinctrl-0 = <&pcie2_pins>;
>   			status = "disabled";
>   
> +			phys = <&xphyu3port0 PHY_TYPE_PCIE>;
> +			phy-names = "pcie-phy";
> +
>   			#interrupt-cells = <1>;
>   			interrupt-map-mask = <0 0 0 0x7>;
>   			interrupt-map = <0 0 0 1 &pcie_intc2 0>,
> @@ -548,6 +553,40 @@ tphyu3port0: usb-phy@11c50700 {
>   			};
>   		};
>   
> +		topmisc: power-controller@11d10000 {
> +			compatible = "mediatek,mt7988-topmisc", "syscon",
> +				     "mediatek,mt7988-power-controller";
> +			reg = <0 0x11d10000 0 0x10000>;
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		xs-phy@11e10000 {

That shall be just "phy@addr"

> +			compatible = "mediatek,mt7988-xsphy",
> +				     "mediatek,xsphy";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			xphyu2port0: usb-phy@11e10000 {

Perhaps just u2port0/u3port0 like done on the other MediaTek SoC DTs is better
for consistency :-)

Cheers!

> +				reg = <0 0x11e10000 0 0x400>;
> +				clocks = <&infracfg CLK_INFRA_USB_UTMI>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +			};
> +
> +			xphyu3port0: usb-phy@11e13000 {
> +				reg = <0 0x11e13400 0 0x500>;
> +				clocks = <&infracfg CLK_INFRA_USB_PIPE>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +				mediatek,syscon-type = <&topmisc 0x218 0>;
> +			};
> +		};
> +
>   		clock-controller@11f40000 {
>   			compatible = "mediatek,mt7988-xfi-pll";
>   			reg = <0 0x11f40000 0 0x1000>;


