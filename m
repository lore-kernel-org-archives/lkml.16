Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A639D1A2C27;
	Tue,  3 Jun 2025 21:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748987140; cv=none; b=H2gkrdjVpWoz4vpclocpRC2dMNAUBw9t5beE1Tpx1TfFsLCIsdMYmaLGRvZ8gjvVS99d2CEUWrspYTO4DFfF2WMb/y3s2M5kV94TOGw+E0Jxhvh5oDXdKkP0HvtJ8bpBJ1FRjcsU5mzMprkVb40mZ8SAeaT+jeH3HP1JIgfl9nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748987140; c=relaxed/simple;
	bh=253C8vPRCK3lnPBMhkfCoAzrBIqZBv5TmAZXkuTaoG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNDUyHSpRfYPGA6cMDJFGOeUSQtCy6GKQgNFF4ceQuLjdwr4zK8TBPKmb7Q8LKh1guP1foZEWTmCTkuziC2cFZSU+T1txJmGhumeOBWKWkkTou99u6obHnUtcpA7kH7Kiwf1FE69SBhsQD8eb8ZBBKASYDbY1D69x3XONirTOkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=nliAvRAX; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="nliAvRAX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MTrgU+1AMH8ppDvhBBziD30T8+V1scNAGU4VvZ9oUo8=; b=nliAvRAXIFg3vXZcbWDKYDOZTF
	+ICpkfgM1AmA6ULQ0px1RarDvIXCHCZufR/PninsH6nwPz5vU2DDUIePV1+eu7HwHNkBjCERsx+Qo
	IXYc9PQlnqs6r8z9zNuvd+4GY2M99Abc5cYz0r4Cvhuta7uNmrBHGY9xvF91daqBy6j8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uMZRf-00Ec3N-Ta; Tue, 03 Jun 2025 23:45:19 +0200
Date: Tue, 3 Jun 2025 23:45:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Nvidia's GB200
 UT3.0b platform BMC
Message-ID: <dbcdeb49-7118-4517-b965-af580164722b@lunn.ch>
References: <20250603203241.727401-1-donalds@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603203241.727401-1-donalds@nvidia.com>

> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	phy-mode = "rgmii-rxid";

Does the PCB have an extra long transmit clock line?

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

You probably want 'rgmii-id' here.

> +	max-speed = <1000>;

RGMII has a maximum speed of 1G, so this is pointless.

	Andrew
