Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF2C25A2D9
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763551; cv=none; b=Q3hOMYIjRCsuCTf50ztlEFxP30J2Kx5OREQ+VKel1TTCCH0/sVuVh0xzh5muLGegN3ymio5/sGLSR88e4F3cBHWhQDjs4UO5owgFdiwxng3MIAME+YLG3O3du0kKyJ2XctVxQqB+Z+TWsUSZN3WDdr7z4q/noVyqgq6A/3hK5hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763551; c=relaxed/simple;
	bh=vWVcBsC9mzrZPsjoG3wIgtaU4yrU3K4N0P1LOA/Wtkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AxeCkHmk/PnD2she25V3c2hVMw+na/FuQzbKsVcnhu0azerDKwqcHyxdHgfnJpFruGHxiEydmg2ZFtT9AJRrCJDIFrC9YjRlC4HxDRfEdF8L9lBC/kOoOmbk8JtnMZ5BHYYKzA4B+C3vh0KoyYY4oo06gl/Ox9MWStUPLjsMZZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=xmfopyOu; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="xmfopyOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1747763543;
 bh=uKHEwnYvk3DoQnbDm76DtOrSSIM/yuksJQK3RjrtSzY=;
 b=xmfopyOusjtBFmE4rVoGUF+wJ9vCOtsjFWz+xNezP7ODeAhgDS73w/8cZ6o9c2K27d4CDhO0C
 +/urC9e6M7i9+LslhrFlcdv5fcAy8uPTnlGugt0mRL+pwOu9dPcSTot+oxLm7FsgHw10yW7CCWK
 X1QMUQtPflHelM2LfMeEocWIN5SLNj0Xu4LGZeBlSgGS9pe4y1WtfFqow1ELWf+YgxV/Vr+KDfH
 XGsdaeWxvkC486EvdP0m02xsTnXPqyvFM51RGiH2bxcVN/O4AiYnjgOlFcbSpx8h54uzBR07jxQ
 NIXC23YbhwAu7CfkpeL3QbLZmn21IPY/vQLRCmS/LwZw==
X-Forward-Email-ID: 682cc1437730016263d49d6d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <079c08bc-e8cc-4ed6-a71e-7ef103f635c0@kwiboo.se>
Date: Tue, 20 May 2025 19:51:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: rockchip: Add naneng-combphy for
 RK3528
To: Yao Zi <ziyao@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250519161612.14261-1-ziyao@disroot.org>
 <20250519161612.14261-6-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250519161612.14261-6-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-05-19 18:16, Yao Zi wrote:
> Rockchip RK3528 ships a naneng-combphy that is shared by PCIe and USB
> 3.0 controllers. Describe it and the pipe-phy grf which it depends on.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index b2724c969a76..314afb94e19b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -318,6 +318,11 @@ vpu_grf: syscon@ff340000 {
>  			reg = <0x0 0xff340000 0x0 0x8000>;
>  		};
>  
> +		pipe_phy_grf: syscon@ff348000 {
> +			compatible = "rockchip,rk3528-pipe-phy-grf", "syscon";
> +			reg = <0x0 0xff348000 0x0 0x8000>;
> +		};
> +
>  		vo_grf: syscon@ff360000 {
>  			compatible = "rockchip,rk3528-vo-grf", "syscon";
>  			reg = <0x0 0xff360000 0x0 0x10000>;
> @@ -867,6 +872,23 @@ dmac: dma-controller@ffd60000 {
>  			arm,pl330-periph-burst;
>  		};
>  
> +		combphy: phy@ffdc0000 {
> +			compatible = "rockchip,rk3528-naneng-combphy";
> +			reg = <0x0 0xffdc0000 0x0 0x10000>;
> +			#phy-cells = <1>;

Should probably be sorted at end or before resets prop.

> +			clocks = <&cru CLK_REF_PCIE_INNER_PHY>, <&cru PCLK_PCIE_PHY>,

This break the ~80 line length limit mostly kept in this file.

> +				 <&cru PCLK_PIPE_GRF>;
> +			clock-names = "ref", "apb",
> +				      "pipe";

Could be kept on a single line.

> +			assigned-clocks = <&cru CLK_REF_PCIE_INNER_PHY>;
> +			assigned-clock-rates = <100000000>;

Other assigned-clock props are sorted before clocks props in this file.

This is also missing power-domains information (also missing from
dt-bindings patch):

	power-domains = <&power RK3528_PD_VPU>;

> +			resets = <&cru SRST_PCIE_PIPE_PHY>, <&cru SRST_P_PCIE_PHY>;

This also break the ~80 line length limit mostly kept in this file.

Regards,
Jonas

> +			reset-names = "phy", "apb";
> +			rockchip,pipe-grf = <&vpu_grf>;
> +			rockchip,pipe-phy-grf = <&pipe_phy_grf>;
> +			status = "disabled";
> +		};
> +
>  		pinctrl: pinctrl {
>  			compatible = "rockchip,rk3528-pinctrl";
>  			rockchip,grf = <&ioc_grf>;

