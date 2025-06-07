Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEBE7263A;
	Sat,  7 Jun 2025 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749304948; cv=none; b=TIh7oGsBlTq7iBGqgAFSrtnIf8lKPzW2wYX2X809P4VJrfF2RByZ9xVEhuATuBGP8OL9cEKElYmEdgRz5zBEfDlc9ztY2vsiiF0YwJ/woR4aFcLX6TuJKy4yb+8F9uE8P+P2LibIqXEvXQCRoEfmyKkx0HA+QURtPb+aV3j8Bd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749304948; c=relaxed/simple;
	bh=Js/SiiQooYlSosZnV3VF1wWKE7+xDogFYUha997403U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucY/MYk2ikeXDG+vCZGDfDN3/WeIqYL9rBjSjU0jNQzF92Naru/kBXfDvcIqb56AtvssMCreTXUPozwP+4CJPbRziOdBSbrqixMNa1fhIKM504KVrdsg1EpKUya09nyScAYCYsA7emwuKcCWSHXaWQlKjN9QDDKBvc41uVlSkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=NoCcWuO1; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="NoCcWuO1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pW4ufJnjhCm2nfmy5TzCJDpC5ocrOYDlcNa8ozTUrAk=; b=NoCcWuO1Iwq/roSORLQBdqkptQ
	WsL1CM2l/4XgYHuVyRbefbHrsroBxrmcuEKZzJ5pU0vVmCi5UXgBx6psui7k08wLlRYDvRrkwUAsQ
	dO+dAYqPrAIZofmnXtKVsAHPcm3unj+UiL5wW+ELV2oleH2Smng6kpVnji3rKBzzGArE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uNu7g-00F11P-By; Sat, 07 Jun 2025 16:02:12 +0200
Date: Sat, 7 Jun 2025 16:02:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/10] ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL
 SoM
Message-ID: <60bc2857-d3d6-4309-a24b-e41cd37c6991@lunn.ch>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
 <20250607093342.2248695-3-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607093342.2248695-3-dario.binacchi@amarulasolutions.com>

> +&fec1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_phy_reset>;
> +	phy-mode = "rmii";
> +	phy-handle = <&ethphy0>;
> +	local-mac-address = [00 04 9F 01 1B B9];

00:04:9f is Freescale Semiconductor. Since you are not Freescale, are
you actually allowed to use this MAC address?

If you look around, you find most boards use 00 00 00 00 00 00 as a
place holder, and the bootloader puts in the real per device MAC
address.

	Andrew
