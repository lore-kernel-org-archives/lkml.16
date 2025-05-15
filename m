Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A4241C71;
	Thu, 15 May 2025 19:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335829; cv=none; b=RNscuyKEkdrWPdd+/farrOzdO5kXvg9MLp5zV16r7+o7R1BWFhuewKK7W/1owCUAqzdBw4AWGO4lvcffNxjbapuq0K8MkGsl3L/k0t8Zw9tLZ/DL03Q5E9UVQTXHzz/cLqZO0e4A9xB68Vt5tH0mq32lZGAE1cXHCaB/TjHXQEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335829; c=relaxed/simple;
	bh=wxBvm7OjfjWBkUe12EQIdiIJxHTDH+GmSbrrMwMgyEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKul9QMaBNzLtVz8c+2D3Jyqd8acwu9fKxmy2YEBneTZR/rwZQ+1f+0dxzFCftHNIx5D6gBvs/g0fFzU95T1CNkTAHuGnTZ8I0f8T2T7GndNkcwc9L8X1ZeGg68vHwSYiqmB19+zHjBZRcRivs9tqPbEdYQqMduWc2OcxOL2xew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=RVxxMZt/; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="RVxxMZt/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cI8chkTB8kM0EB9Q7GfinvEJJgvxV0jTW4zjn2FeB5I=; b=RVxxMZt/qb8VyfOzrOLrAm/lQY
	UHgiY6PJi36KePgYpSh6sPNPWyd4WpLJtIU+S5+z4J4UuzSeGRI0v0GAU0AEAlypv8JIVUgnvpeFA
	pITISUsEaO4uyioygRhf93/+T2lja8lQjD5y3wtQs4baBZ1rYPNZipfM85MviNgRnGkw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uFdrl-00Ch66-OW; Thu, 15 May 2025 21:03:37 +0200
Date: Thu, 15 May 2025 21:03:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Xu Liang <lxu@maxlinear.com>
Subject: Re: [PATCH] net: phy: add driver for MaxLinear MxL86110 PHY
Message-ID: <63727423-9d19-40d1-b8d3-7c292529b16f@lunn.ch>
References: <20250515184836.97605-1-stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515184836.97605-1-stefano.radaelli21@gmail.com>

	> +static void mxl86110_get_wol(struct phy_device *phydev, struct ethtool_wolinfo *wol)
> +{
> +	int value;
> +
> +	wol->supported = WAKE_MAGIC;
> +	wol->wolopts = 0;
> +	value = mxl86110_locked_read_extended_reg(phydev, MXL86110_EXT_WOL_CFG_REG);


> +static int mxl86110_led_hw_control_set(struct phy_device *phydev, u8 index,
> +				       unsigned long rules)
..

> +	ret = mxl86110_locked_write_extended_reg(phydev, MXL86110_LED0_CFG_REG + index, val);

Why are these two special and use the _locked_ variant, when all the
others don't?

Please think about locking, when can unlocked versions be used? When
should they not be used?

Are you testing this with CONFIG_PROVE_LOCKING enabled?

Please also take a read of:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
https://docs.kernel.org/process/submitting-patches.html

    Andrew

---
pw-bot: cr


