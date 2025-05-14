Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A070B2777FB;
	Wed, 14 May 2025 12:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747225380; cv=none; b=spzdknthtKUiFC2JrsxFfvPtItoFlZJ1ON09FZ3Ijt8qgFMcFtfmF6WZkrD+hoxMXhnvaKG5Uaxa1vxRR3GdysZN/4pGMrQWGVGMTlQPOOtAKoffq6ozJPhwOcwvpSp1UlnezyonzgbzshIExIKWs/W9iPFIXspN6UjMPKXuMbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747225380; c=relaxed/simple;
	bh=kl3LU8ZOh/Nr6ImH0KVt+SK8CPEOxigB6uYi4mx9n78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlQ9hHzFf5NskBzVMAlng1/oFlYE9kXIp8ngGz1TkClBwPolXBdTHNWbE95qx/y2wCgz4B3/3FoluGULI3Ipja+1HBQrnFazZ6SriShWDP27xiEvLU6emV51Dl8Mua+/QpJteayVuUsLPTU2Dc/LkmxMm37DvgYVJYBX46BHYYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=OFimIgF1; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="OFimIgF1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aHcB4ipclq9No6jN4EurS7mibOSdJRLDM47C2pkSMRQ=; b=OFimIgF1i9pscT4GLbfexIK3+l
	J+U7a7lkp+IywEWgUxOuFU+0d+9ygz8P3tkyJHYEzwssdsiebPQtCikFBnSS2TTjEsRlwDjuFplhq
	apYw8615Zpd4y6VqsTCXFrkKf2DVGOhfraGSsyFX4I09hZemGucjbtA5s3UZjoOXxm08=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uFB8K-00CYc0-2K; Wed, 14 May 2025 14:22:48 +0200
Date: Wed, 14 May 2025 14:22:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/3] net: phy: dp83869: Support 1000Base-X SFP
 modules
Message-ID: <99c9d8f8-1557-4f90-8762-b04a09cb497c@lunn.ch>
References: <20250514-dp83869-1000basex-v1-0-1bdb3c9c3d63@bootlin.com>
 <20250514-dp83869-1000basex-v1-3-1bdb3c9c3d63@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-dp83869-1000basex-v1-3-1bdb3c9c3d63@bootlin.com>

> +static int dp83869_port_configure_serdes(struct phy_port *port, bool enable,
> +					 phy_interface_t interface)
> +{
> +	struct phy_device *phydev = port_phydev(port);
> +	struct dp83869_private *dp83869;
> +	int ret;
> +
> +	if (!enable)
> +		return 0;
> +
> +	dp83869 = phydev->priv;
> +
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_1000BASEX:
> +		dp83869->mode = DP83869_RGMII_1000_BASE;
> +		break;
> +	default:
> +		phydev_err(phydev, "Incompatible SFP module inserted\n");
> +		return -EINVAL;
> +	}

There is also DP83869_RGMII_SGMII_BRIDGE. Can this be used with the
SERDES? Copper SFPs often want SGMII.

	Andrew
