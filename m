Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042F9216605;
	Wed,  4 Jun 2025 17:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057401; cv=none; b=n9S/vlxpvTJPFrvLeyg5QIVQo14rQREGw+yuYzbqucyhYqr06okpR0FfZCsoOj8hLj/syyeT4H9isHldX3s/8EwIoQZDPVW6u1fBp900sOcOfsbfNJw6N9vL4iiK65EjzZ6r+XVULG7DVu/wir65MSnJkFhxyA//5mtB165cWiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057401; c=relaxed/simple;
	bh=jqI3bnr2y0DT3lT0IjpB2KyKs3IAiXIr+YBxZOeldNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ow8n/Zam8UwJEdljYZ3eZvmASIwmRvJZyo59pUS7sDkp+dIQYE0gbC8b7jXDd2ck9ikZh8PPInQcZ58QVxxE9l1dzfhcyubaPJ8a9l72IFaKjJbweRzkkMvnQ2EQwJ9WeUDD+9IGp2zRuxME46qMVu/q+yT3W3DQMKqnP5mKeQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=5LMJuy8c; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="5LMJuy8c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pbjjAievrk0TRpJw/qD0GOXbcxqQaMhuiUNPc/d2A7k=; b=5LMJuy8czXGhJbnvQhd/7KM5jD
	xTa7+YBTRAVXVqntNCeDTCOV8p8YdzlX479W00i+Zc4rVUj/Ytd2u4EdMhrqVfrKBSYofbfOUA0X9
	dqwY8Jipbbud+Qt2813lGG7FaNXlnpzblFG7oIcsHY/9L+SoNnNIXq1/wzThGSQch2Uo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uMrj3-00EhMP-QE; Wed, 04 Jun 2025 19:16:29 +0200
Date: Wed, 4 Jun 2025 19:16:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	othacehe@gnu.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [v2] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
Message-ID: <92e4de77-07da-4583-bf0f-46891101c327@lunn.ch>
References: <20250604153510.55689-1-stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604153510.55689-1-stefano.radaelli21@gmail.com>

>  &eqos {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_eqos>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
>  	phy-mode = "rgmii";

For this part only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
