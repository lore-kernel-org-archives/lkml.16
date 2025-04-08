Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315B721859D;
	Tue,  8 Apr 2025 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128799; cv=none; b=NvXO8s+GLnKEGcqKwfzyqCQAZKqbBvTchdBapUPh17hV6RrKPg/2LZSgk9gbC3xJVEzPwFn+/zAF35Aqi2pG/hLGwBT5bUziTs22vIu7mDHFjqIc0DFN3pAq4lkweFlXqkcxJAsC2pZi8R1R27WKaLi9X1o9eu2vKQygYmRnzmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128799; c=relaxed/simple;
	bh=Qc1TY5TBgRWiRlw2g3PMWP+HHylhaLXQ7+7HE1eiRc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eijevH6/NRruoWAaaZbmLZHt9qSsPTBb6me8OFJENyr7ir8QNPHW3o43FJY+EKp/+8jbr/LizyqbBokueNn4H5JS0I2JXy5A2+FmhDq2mBYIy3T/BRefHjiBnPr+I4HLkEYvx+QppzGQIIxZslG2+125QHwVP75CvUV5Kjxl9DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=xQHDKD9Z; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xQHDKD9Z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iHamA6MmAQln3g+ph5RzN9L5CgRNW7XpNoZqh01YomM=; b=xQHDKD9ZXptDaSK+dQASAxx790
	Ybh87tS1nZ3FusAZGh77bUylZwpxjm6ICZWRNMCCbeK3BDFf+XrZwIaTUeNHNl2mncQZsxLkl7Acq
	FR96apk9s3xS4f0APOr0XRJuOag3yS2jFyDzyK/zpm+y9Y37zDhSdhTY1OCd/dS4J8es=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2BZW-008QBU-Ty; Tue, 08 Apr 2025 18:13:10 +0200
Date: Tue, 8 Apr 2025 18:13:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, kernel <kernel@collabora.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	imx <imx@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add device tree for Nitrogen8M
 Plus ENC Carrier Board
Message-ID: <22e7df8e-51a2-4549-ad80-0e7fd256de0a@lunn.ch>
References: <20250327123907.542132-1-martyn.welch@collabora.com>
 <cf525617-b895-4d58-8455-a5c7fa9bbeab@lunn.ch>
 <196162332ff.b61ad5b5564260.8672918780815538746@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <196162332ff.b61ad5b5564260.8672918780815538746@collabora.com>

On Tue, Apr 08, 2025 at 05:02:07PM +0100, Martyn Welch wrote:
>  ---- On Thu, 27 Mar 2025 14:25:38 +0000  Andrew Lunn <andrew@lunn.ch> wrote --- 
>  > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
>  > > @@ -0,0 +1,415 @@
>  > > +&eqos {
>  > > +    pinctrl-names = "default";
>  > > +    pinctrl-0 = <&pinctrl_eqos>;
>  > > +    phy-handle = <&ethphy0>;
>  > > +    phy-mode = "rgmii-id";
>  > > +    status = "okay";
>  > > +
>  > > +    mdio {
>  > > +        compatible = "snps,dwmac-mdio";
>  > > +        #address-cells = <1>;
>  > > +        #size-cells = <0>;
>  > > +
>  > > +        ethphy0: ethernet-phy@4 {
>  > 
>  > Just conformation, the PHY is on the SOM? Are the magnetics and RJ45
>  > socket on the SOM, or the carrier?
>  > 
> 
> The PHY is on the SOM, the magnetics and RJ45 socket are on the carrier.

Thanks. So phy-mode is in the right place.

> 
>  > > +            compatible = "ethernet-phy-ieee802.3-c22";
>  > > +            reg = <4>;

and the reg value is fixed.

    Andrew
