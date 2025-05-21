Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7C62D600;
	Wed, 21 May 2025 02:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747794441; cv=none; b=B9HYuRNHA0vd7hETF20shXGhDQcLaopbzmRrkXlQbBMfojvA6JlAM0j64ZopvtDhZdjzKQ+3oP9cSGIHp7qsJqFekvpZsSN0s0tKbnTyc02+9Ub4fQ7CIcr4wpSpyW96b4of0CKdSOTNxiFeAmqQlCfqomSyWFztj3Ds/F+Pjjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747794441; c=relaxed/simple;
	bh=uynU6P2rot4uafnvWQDI8RKCr3IPZZ3LS41NhE+S4sE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEoORATySZg6Q5wq1UBvzMlxPcmOiuVTyv7o8JX7DoPyNHc1rmlqCiJFo6p7sDUHO2cwPNUia+16tsdBmlsn+gcpCdUC2mutDZ4qesRXIJN3O/Q69D5vRc4vW69CqjDcWtAFLOLMBPobbPv8YAS8PWcZVsgtApaML278dfs4kOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=iex3AFRz; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="iex3AFRz"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9139525F81;
	Wed, 21 May 2025 04:27:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okZ1Ld-0Nx5j; Wed, 21 May 2025 04:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747794435; bh=uynU6P2rot4uafnvWQDI8RKCr3IPZZ3LS41NhE+S4sE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iex3AFRz+Gx1/hMg4ww6RLlp29PSfbIx3tRA+ixkIiY1d83Jx8R1JsThAYZRcPTUQ
	 /1huVKBGcpZtVrhw19IJV0gITW9pU5C9oCFypexaAUPIfTuihShUzH8p2+WZO4SguT
	 VeTi922bclzO2bGu6XhrZZdX6uSVog+eeUjmASuSJvCArHfPoHqx2jNwNT5c9nIXwL
	 1Rno4kVaoFa5nhIoUhPeFcBnnUDk+mw79fMSv6o20dURjRtOjsJa4HVPtRdeh7YY26
	 Q8TFna9BnpmZqUc6Lj14Ua/HQ3qzscAeCHS70i8/2yI8rn9kGMNGNZ6Mkb01Rvk5c0
	 iEftsaQ/fO52A==
Date: Wed, 21 May 2025 02:27:00 +0000
From: Yao Zi <ziyao@disroot.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: rockchip: Add naneng-combphy for
 RK3528
Message-ID: <aC059MLlfeUT2a18@pie>
References: <20250519161612.14261-1-ziyao@disroot.org>
 <20250519161612.14261-6-ziyao@disroot.org>
 <079c08bc-e8cc-4ed6-a71e-7ef103f635c0@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <079c08bc-e8cc-4ed6-a71e-7ef103f635c0@kwiboo.se>

On Tue, May 20, 2025 at 07:51:57PM +0200, Jonas Karlman wrote:
> On 2025-05-19 18:16, Yao Zi wrote:
> > Rockchip RK3528 ships a naneng-combphy that is shared by PCIe and USB
> > 3.0 controllers. Describe it and the pipe-phy grf which it depends on.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > index b2724c969a76..314afb94e19b 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > @@ -318,6 +318,11 @@ vpu_grf: syscon@ff340000 {
> >  			reg = <0x0 0xff340000 0x0 0x8000>;
> >  		};
> >  
> > +		pipe_phy_grf: syscon@ff348000 {
> > +			compatible = "rockchip,rk3528-pipe-phy-grf", "syscon";
> > +			reg = <0x0 0xff348000 0x0 0x8000>;
> > +		};
> > +
> >  		vo_grf: syscon@ff360000 {
> >  			compatible = "rockchip,rk3528-vo-grf", "syscon";
> >  			reg = <0x0 0xff360000 0x0 0x10000>;
> > @@ -867,6 +872,23 @@ dmac: dma-controller@ffd60000 {
> >  			arm,pl330-periph-burst;
> >  		};
> >  
> > +		combphy: phy@ffdc0000 {
> > +			compatible = "rockchip,rk3528-naneng-combphy";
> > +			reg = <0x0 0xffdc0000 0x0 0x10000>;
> > +			#phy-cells = <1>;
> 
> Should probably be sorted at end or before resets prop.

Will sort the properties.

> 
> > +			clocks = <&cru CLK_REF_PCIE_INNER_PHY>, <&cru PCLK_PCIE_PHY>,
> This break the ~80 line length limit mostly kept in this file.

Oops, I didn't notice it. Will split them into lines.

> > +				 <&cru PCLK_PIPE_GRF>;
> > +			clock-names = "ref", "apb",
> > +				      "pipe";
> 
> Could be kept on a single line.
> 
> > +			assigned-clocks = <&cru CLK_REF_PCIE_INNER_PHY>;
> > +			assigned-clock-rates = <100000000>;
> 
> Other assigned-clock props are sorted before clocks props in this file.
> 
> This is also missing power-domains information (also missing from
> dt-bindings patch):
> 
> 	power-domains = <&power RK3528_PD_VPU>;

I didn't expect your power-domain series when writing v1, thanks for the
reminder.

As the power-domain series just came out, I'd like to wait until it
merges and then work further on RK3528 support for naneng-combphy.

I'm not sure whether it's possible to get the combphy cleanup patch (3th
in this series) merged first. It should be ready for merging and I think
this may avoid possible conflicts in the future, Any suggestions will be
appreciated.

> > +			resets = <&cru SRST_PCIE_PIPE_PHY>, <&cru SRST_P_PCIE_PHY>;
> 
> This also break the ~80 line length limit mostly kept in this file.

I'm willing to keep the ~80 limit and will split the line.

> Regards,
> Jonas
> 
> > +			reset-names = "phy", "apb";
> > +			rockchip,pipe-grf = <&vpu_grf>;
> > +			rockchip,pipe-phy-grf = <&pipe_phy_grf>;
> > +			status = "disabled";
> > +		};
> > +
> >  		pinctrl: pinctrl {
> >  			compatible = "rockchip,rk3528-pinctrl";
> >  			rockchip,grf = <&ioc_grf>;
> 

Best regards,
Yao Zi
