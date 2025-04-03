Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0743E2E62BB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713510; cv=none; b=f1kQiUvLvJf7ZbHLqIw+ZMOHwo7zHoMFb1k/uJHfoAdc0dsC4FHWyyQT6h9NCUyaEHmG0SFKsrGuhQ+1moW1o608c00CMzKXxPt0C5dO+2UbHOzWLNSBqbWhUquePxO/u51XocAaR4MdCq+L+RaMJWRtnKVr28Z4sqKhfm3mozY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713510; c=relaxed/simple;
	bh=qR0BN8zygPj833XKcZhKGDt/M7Fne6j13JD9702Jrqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sp7a7dTQ9PrVuJ6IglWXyzR23z65XE5K371mlVfRyZl2POTJUMwCGN9SB6FVn7IAZTx6cYrf0GgYN64TcE0lj6+W/Q66dEie7NdR1+MzQC01NCwBgWJE3u8NJpGpss2XN3sHuZEZp4PJxi9/mI9GGud9rwfeMeZ2ExQ+GQxetkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cMkY1rnL; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cMkY1rnL"
Message-ID: <528bb5d2-e0ce-4125-b11b-8b873230b0fc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743713505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jqnZi9xNGdDH/jnXjuRYKr/qyvU7hVYZoGPox9WqvZQ=;
	b=cMkY1rnLjoCSutN0LnPrIIbeiylbgHUF5siqjvtpqrEHhbFlfd8tJGNtFZasaXQ/yxzbhW
	rkY68sQU1f29x398O13gAAraIgukeEYGwwK/Dl+zcdHn8UgLAL9iQK0jEE8/veZde+0LEZ
	BTBjSb6S0sqhRd2HfKeRKtiYSgY0NEk=
Date: Thu, 3 Apr 2025 16:51:39 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC net-next PATCH 07/13] net: pcs: Add Xilinx PCS driver
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>, upstream@airoha.com,
 Heiner Kallweit <hkallweit1@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Robert Hancock <robert.hancock@calian.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250403181907.1947517-8-sean.anderson@linux.dev>
 <Z-7vIbvtjIGS5hzr@shell.armlinux.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <Z-7vIbvtjIGS5hzr@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/3/25 16:27, Russell King (Oracle) wrote:
> On Thu, Apr 03, 2025 at 02:19:01PM -0400, Sean Anderson wrote:
>> +static int xilinx_pcs_validate(struct phylink_pcs *pcs,
>> +			       unsigned long *supported,
>> +			       const struct phylink_link_state *state)
>> +{
>> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(xilinx_supported) = { 0 };
>> +
>> +	phylink_set_port_modes(xilinx_supported);
>> +	phylink_set(xilinx_supported, Autoneg);
>> +	phylink_set(xilinx_supported, Pause);
>> +	phylink_set(xilinx_supported, Asym_Pause);
>> +	switch (state->interface) {
>> +	case PHY_INTERFACE_MODE_SGMII:
>> +		/* Half duplex not supported */
>> +		phylink_set(xilinx_supported, 10baseT_Full);
>> +		phylink_set(xilinx_supported, 100baseT_Full);
>> +		phylink_set(xilinx_supported, 1000baseT_Full);
>> +		break;
>> +	case PHY_INTERFACE_MODE_1000BASEX:
>> +		phylink_set(xilinx_supported, 1000baseX_Full);
>> +		break;
>> +	case PHY_INTERFACE_MODE_2500BASEX:
>> +		phylink_set(xilinx_supported, 2500baseX_Full);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	linkmode_and(supported, supported, xilinx_supported);
>> +	return 0;
> 
> You can not assume that an interface mode implies any particular media.
> For example, you can not assume that just because you have SGMII, that
> the only supported media is BaseT. This has been a fundamental principle
> in phylink's validation since day one.
> 
> Phylink documentation for the pcs_validate() callback states:
> 
>  * Validate the interface mode, and advertising's autoneg bit, removing any
>  * media ethtool link modes that would not be supportable from the supported
>  * mask. Phylink will propagate the changes to the advertising mask. See the
>  * &struct phylink_mac_ops validate() method.
> 
> and if we look at the MAC ops validate (before it was removed):
> 
> - * Clear bits in the @supported and @state->advertising masks that
> - * are not supportable by the MAC.
> - *
> - * Note that the PHY may be able to transform from one connection
> - * technology to another, so, eg, don't clear 1000BaseX just
> - * because the MAC is unable to BaseX mode. This is more about
> - * clearing unsupported speeds and duplex settings. The port modes
> - * should not be cleared; phylink_set_port_modes() will help with this.
> 
> PHYs can and do take SGMII and provide both BaseT and BaseX or BaseR
> connections. A PCS that is not directly media facing can not dictate
> the link modes.
> 

OK, how about this:

static int xilinx_pcs_validate(struct phylink_pcs *pcs,
			       unsigned long *supported,
			       const struct phylink_link_state *state)
{
	__ETHTOOL_DECLARE_LINK_MODE_MASK(xilinx_supported) = { 0 };
	unsigned long caps = phy_caps_from_interface(state->interface);

	phylink_set_port_modes(xilinx_supported);
	phylink_set(xilinx_supported, Autoneg);
	phylink_set(xilinx_supported, Pause);
	phylink_set(xilinx_supported, Asym_Pause);
	/* Half duplex not supported */
	caps &= ~(LINK_CAPA_10HD | LINK_CAPA_100HD | LINK_CAPA_1000HD);
	phy_caps_linkmodes(caps, xilinx_supported);
	linkmode_and(supported, supported, xilinx_supported);
	return 0;
}

--Sean
