Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B8E24B28;
	Wed,  4 Jun 2025 01:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748999963; cv=none; b=FJv0B14xHo8ezICHSA5oEwu0PlLSH+T5Q2TKaCLNXX6olbB0OXwyW+bfj2skvav0tL3GWFsx7TNCV9XMeWX66Rwb3kSHmXWvQGVtH0guFSF3WZzdQ9cEXyCA0wrdQEMTNMUqm9bmqJ3M/Ufuf36o/+pYnrEXl4OkhswzmZf5x1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748999963; c=relaxed/simple;
	bh=Uz/tKlzamn1bSwTcY1giPQqucrt+BFjHlMAD8LPN+9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJs+tZMTg1wjJRGgr6QZnUS7snTb4A6tP8fUY8wJXucCh9Rk/pLdMuVOMSsK1nbtk35OX9kvm2Stmt+28lGsxbR4N49kps3XypSE9r6jUrG4MqJOCpkTzuIfNz57on+DQ3bHi7ozRJSjGW4JY/L9F5P7BvY8sD6/UDmggHmMpVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=oo6Jqa1c; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="oo6Jqa1c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cV9SrJmogHgdqp4OM5LO/TrDDsTxFCLEWXVRiXEZlrs=; b=oo6Jqa1ctxJH/SN3B9yqYBwcf7
	1zJIYbwtwEdRmedulYru49ATTBeL+amP1rXxOnfVdMvusb3xfjHLQCwOEmqoUBVGc2tZHpy0FsYBM
	3lqUC5fS5ofiKGm8PYwgPrcVJAJ+uWTvhJEfmA59cfE12A0TkqvN3J8w7lHotpHKoUGI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uMcmi-00EdFl-Rg; Wed, 04 Jun 2025 03:19:16 +0200
Date: Wed, 4 Jun 2025 03:19:16 +0200
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
Message-ID: <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch>
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603221416.74523-1-stefano.radaelli21@gmail.com>

>  &eqos {
> @@ -39,6 +26,7 @@ &eqos {
>  	pinctrl-0 = <&pinctrl_eqos>;
>  	phy-mode = "rgmii";

I know this is not in the scope of what you are trying to do, but this
is probably wrong:

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

	Andrew
