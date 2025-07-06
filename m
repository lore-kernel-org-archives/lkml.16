Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E509517A2E3;
	Sun,  6 Jul 2025 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751818437; cv=none; b=g5LRkSiEPyAnFf6Afobm7ZmI7oqXP2MBYt04pbG3HMzsldayzrKdFJyuG2ffGSwzg63d6Ncxz4Q6cMPs9zGPpinfDMYpgbT3uREbeiDZBa0DL/63e7VdZofPET2YszewULK/B+m7v/Z6r97U2TfUGMJDRHNyKZePK5uzaGu5m84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751818437; c=relaxed/simple;
	bh=8+RuurwIe9Sja0ASOtNH6r52L+x+kJQZRVygjelM9vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNuOhcqohcv922y+WnosdynKW4bypmNsjU4OJT0kzElzAQR1fIIGiXlNsGqlkTE6h45WMfDwkHTEM71crsNzwOn2HC63sowPVoVWSh5S6S26vxIs558kiWJh44osL7ZP4xLayYGW7ODtXbk1ndAezsRBmy87mYIQ2YRNod2uXws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Yl3G8I36; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Yl3G8I36"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dVBOorKuIT7UYPImY9pxxlDpEL+PzMlcki2Z/1f6+vM=; b=Yl3G8I36EZk21kav9ptyI4TfIe
	A86kSvBJn8nvMAwdSaUeVsanhcB+rF5RN5XTNm/2X9t1i6/oBRvT6I7ynI4trNGAk56tduh2wfU5f
	Vy2yeQL2p596JKquRzJxFMOyCmTKFEns5sEFDl8WdN+vnkcu+u8y/vOr1x3Oauls7u5g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uYRzj-000akM-7H; Sun, 06 Jul 2025 18:13:35 +0200
Date: Sun, 6 Jul 2025 18:13:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 5/7] ARM: dts: sunxi: add support for NetCube Systems
 Nagami SoM
Message-ID: <279a7a96-2161-4dac-a09f-7bbbe2596538@lunn.ch>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <20250705213900.3614963-6-lukas.schmid@netcube.li>
 <b2351675-cba2-4d8c-af6c-f341f5c77ee7@lunn.ch>
 <5023306.31r3eYUQgx@lukas-hpz440workstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5023306.31r3eYUQgx@lukas-hpz440workstation>

On Sun, Jul 06, 2025 at 11:06:34AM +0200, Lukas Schmid wrote:
> On Sonntag, 6. Juli 2025 09:38:00 CEST Andrew Lunn wrote:
> > > +&mdio {
> > > +	lan8720a: ethernet-phy@1 {
> > > +			compatible = "ethernet-phy-ieee802.3-c22";
> > > +			reg = <1>;
> > > +	};
> > > +};
> > 
> > Just for clarification: The PHY is on the SOM? I've seen systems where
> > the PHY is on the SOM, and the magnetics and RJ45 on the carrier
> > board. I've also seen systems where the PHY, magnetics and RJ45 are on
> > the carrier.
> 
> Yes that' the case here. The PHY is located on the SoM and the MDI signals
> before any magnetics are on the SoM's Card-Edge. The magnetics are required
> on the Carrier board (e.g. a MagJack or dedicated Transformer)

O.K. great. If you need to respin, please extend either the commit
message including this, or add a comment in the .dtsi file for the
SOM.

	Andrew
