Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE7D15C15F;
	Thu, 24 Apr 2025 14:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745505052; cv=none; b=jD36Ycwr3gkQK6asoYrvxbCxlgx6IcrTjwPbo8F67nhkWgY9qqp4MI2GPAklei5ue/7tjhs+mS/8DijMdO14AoaaPpd8pjCf7Fn995QckXyxV9cPwmk7odcM02wE2Wc+aWxNHiKq5ojlnZITQba3Gutt3AT/LiO7t0Roe1l6ZBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745505052; c=relaxed/simple;
	bh=ZFc4orxBfXaOKJwAgG5MmhnmivFZu74kaL+MgA9Ew0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+H/vLK5eTZeJFsMjrk8JCpR/pE+RmIyrTgWk0N/IpBtcD/V+bpQBs5v/wl0D90oVzeIAAj26vmpTyOxnqf0OpvUwOk0FzEQ1vNfQHLfNdr9HNBti64U7oFGIxoTtI2I7PaEgO9d6mGBs9wQbMtX+kfGqdZyPt8ew5L7/grc0D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=rGwUIeZk; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="rGwUIeZk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=owGFFqZxx5YPM9OVVa3CXcYpxABz6/DpdMCwx9oKsR8=; b=rGwUIeZko9Zpb2DLhEAxXKIy6L
	gs3XBlK13qYez6Du8tw5y8i0dFxb6spPl+Ak7NkzrOXq2GMgI3FigXs/9XI8SQp3FsV/QkSb29lJ0
	26xxeDxcxh6asjozvSqObmgQ5h1kabG2SwXC0PA6EwaFyu9W8Z80DQuel0mQBe6v/evA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u7xb6-00ATNY-GD; Thu, 24 Apr 2025 16:30:40 +0200
Date: Thu, 24 Apr 2025 16:30:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	UNGLinuxDriver@microchip.com, Simon Horman <horms@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v1 3/4] net: phy: Don't report advertised EEE
 modes if EEE is disabled
Message-ID: <07bd8b38-c49c-481b-b08b-fff78b9ffe98@lunn.ch>
References: <20250424130222.3959457-1-o.rempel@pengutronix.de>
 <20250424130222.3959457-4-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424130222.3959457-4-o.rempel@pengutronix.de>

On Thu, Apr 24, 2025 at 03:02:21PM +0200, Oleksij Rempel wrote:
> Currently, `ethtool --show-eee` reports "Advertised EEE link modes" even when
> EEE is disabled, which can be misleading. For example:
> 
>   EEE settings for lan1:
>           EEE status: disabled
>           Tx LPI: disabled
>           Supported EEE link modes:  100baseT/Full
>                                      1000baseT/Full
>           Advertised EEE link modes:  100baseT/Full
>                                       1000baseT/Full
>           Link partner advertised EEE link modes:  Not reported

What is the behaviour for normal link mode advertisement? If i turn
autoneg off, do the advertised link modes disappear? Do they reappear
when i turn autoneg back on again?

I would expect EEE to follow what the normal link modes do. Assuming
the Read/modify/write does not break this.

	Andrew
