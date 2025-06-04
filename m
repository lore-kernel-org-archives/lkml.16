Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A9A1ACEAF;
	Wed,  4 Jun 2025 12:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749038460; cv=none; b=dCFWhSqBlRrDNN0bR2pcPhJh/sUBjfN9bvVMXFpwFzn44cjOiyiHN0cVijkEqnPuUBpGIUfWl71Nsmi7RWGMgYQPPj/tCo1Zfa+dEzIKyYByiUpT44Df/Gps8H+JBEtcUAUooyDFqVZLxtIxXJnn/Vtid0agZVpq8janc6vPaKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749038460; c=relaxed/simple;
	bh=mUFesVRf3dClQ3cxTGHcZsZj8luMfnTT92hQXVDRfq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddqBRSDvWjeQmUUY3H4JT7vqcauJ4Ia8OdwE802WnEXiulVjayN7rKLSa0V/oGxhhb12mrcTnagp13C6WIdDyk8DahW3ZuNb1XwJCD1UArEYQQ7xHog7Lv+sHvi6feCNGCsxFu97ERXVco15OpVHRYEU/L/0YFtlGfbuAWK91j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=xRjnYFbi; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xRjnYFbi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=waKYFNIYf4LrJ42FOyiZV+jusnWxW7j8zewA7/spaT0=; b=xRjnYFbiM4mwUIe/PxOIVrTZj5
	asr9kZnkbk7H9VDjzpjU3n4TP0fwjdA+YMIKqSrPV2h+yxSf1LTP8bP4bYSjYqqGr4bRzEsQC2pUS
	4mXAMtQGi6d9mkurCGQxZgaXBKRO2tS+PEmY1dVNLm3gTIo1cggd2NJtv4uo/P++Pn94=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uMmnf-00Eg4w-Ap; Wed, 04 Jun 2025 14:00:55 +0200
Date: Wed, 4 Jun 2025 14:00:55 +0200
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
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
Message-ID: <d5f891d7-d24a-4f85-b59d-313b925c4495@lunn.ch>
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
 <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch>
 <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>


61;8001;1cOn Wed, Jun 04, 2025 at 09:37:39AM +0200, Stefano Radaelli wrote:
> Hi Andrew,
> 
> I double-checked with our hardware team, and it turns out that all required
> RGMII delays are already handled by the hardware on the SOM (trace
> tuning + PHY config).

What do you mean by PHY config?

The four RGMII modes you can use with phy-mode are purely about the
PCB. If you have the PHY strapped to add delays, what does not count
for PCB, and if you are not careful, future software could reconfigure
it.

	Andrew
