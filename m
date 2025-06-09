Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50EF1922DE;
	Mon,  9 Jun 2025 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482220; cv=none; b=HjMpaHl4XLmQeeFTPvj2EzUrAh5OpfVfTJxKvqhxjaNzkKnusxk6XmPX9Xt9wk80Jvdmdt4HQ6MtZMVQ4qJqKZJydBEmZQ2Z88sdLmWHKS7d83VqWCL3WKdyryfUFw5KZhbBNZWpnkQTg61ODuOZ4mMmXm/fjnM1mx2QANjTvlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482220; c=relaxed/simple;
	bh=bjFYQVmlUPZFMI60vP2HU5/6zNL79PRJWY7+hJePmYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbwoGaym7yYdqu39D18G8N751uQatfZXJvACZoD0jUSDNI8O1z1D4XxC6MBvSDOlPF56kJfrtMQN92tIDbPhrBBJSN0Vn9qAf4xzXeoUCK1yCAXdJkxWxb4bZdKgLI69FyFpREEmgAqB/tlMxXEj0CsvjdAfnt1sjKdLaXLp2VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=lYjyQ3vL; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="lYjyQ3vL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZsA6KKXBssJ1iIcKLlTRguM4ORKS/1udB7qIaUjE/R0=; b=lYjyQ3vLi2ZFLQCqgjX2vvYXlm
	KZTL1Dnq2GZ9aiM4ulxWXsHnMxdYaaFsDzbvTuReyMl3a0Ss2vKiHYjHHbklnkHbU4J1Cq3y//cbF
	73xkHyzkON5CFtNs4p0w27GbLNXEYTk0jp6tvuOYhboBgdWPkd3opByLKbzI8/nKpu/8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uOeF6-00FA1Y-OG; Mon, 09 Jun 2025 17:16:56 +0200
Date: Mon, 9 Jun 2025 17:16:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mp-var-som: Add EQoS
 support with MaxLinear PHY
Message-ID: <ca71a8b8-88b8-4d81-a17d-1b46e10e55a9@lunn.ch>
References: <20250609140643.26270-1-stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609140643.26270-1-stefano.radaelli21@gmail.com>

On Mon, Jun 09, 2025 at 04:06:42PM +0200, Stefano Radaelli wrote:
> Enable the EQoS Ethernet controller on the i.MX8MP VAR-SOM with the
> integrated Maxlinear MXL86110 PHY. The PHY is connected to the EQOS
> MDIO bus at address 4.

> +		ethphy0: ethernet-phy@4 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <4>;
> +			at803x,eee-disabled;
> +			eee-broken-1000t;

The commit message says it is a Maxlinear. So at803x vendor properties
are not relevant here.

    Andrew
