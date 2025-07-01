Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8459B24466E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751362096; cv=none; b=kpUCyR5CG/zmqJEfLyzKS0jjtCEFzsxg6dBMXYXg22rFnWlat8LEIw4bV9cn73bqjQFviz3nz1MliybdThUPRycJtTyqRxZ14aowqEDejBGJWDGcm9k4Ds73RUuWa6UPYfn9gIedB7hhMX9yJCWCvZ9IzcqTkWYuMndkBsUoeiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751362096; c=relaxed/simple;
	bh=ZV+pWbjkBZ+NKsfccI5ZHpNbuT0pzKWjVhkB4BAj6+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qej5Jog8J0R0x7saHHRNOBaDWqA1mtxNHTJvvlhHSeCdj75Lyd/YJy74mJ0fJKZdpfPbJ8zVat5vQWZL1sdsuQA8X4e7o3SnUgRFAmjuKgwUhJYchWDlN6bAd6WpjHG9SU+t2kABcXZU/xZu5DBIWsvKQeBmUHtvlh7APV/F41E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uWXHa-0005vX-8l; Tue, 01 Jul 2025 11:28:06 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uWXHX-006FN7-0b;
	Tue, 01 Jul 2025 11:28:03 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uWXHX-00BdW9-03;
	Tue, 01 Jul 2025 11:28:03 +0200
Date: Tue, 1 Jul 2025 11:28:02 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
	Dan Carpenter <dan.carpenter@linaro.org>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	UNGLinuxDriver@microchip.com, Phil Elwell <phil@raspberrypi.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v1 1/1] net: usb: lan78xx: fix possible NULL
 pointer dereference in lan78xx_phy_init()
Message-ID: <aGOqIlnVGPce8GLT@pengutronix.de>
References: <20250626103731.3986545-1-o.rempel@pengutronix.de>
 <7c9c7be7-af3c-4f40-80b4-5b420ebbfca3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7c9c7be7-af3c-4f40-80b4-5b420ebbfca3@redhat.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Tue, Jul 01, 2025 at 11:15:29AM +0200, Paolo Abeni wrote:
> On 6/26/25 12:37 PM, Oleksij Rempel wrote:
> > If no PHY device is found (e.g., for LAN7801 in fixed-link mode),
> > lan78xx_phy_init() may proceed to dereference a NULL phydev pointer,
> > leading to a crash.
> > 
> > Update the logic to perform MAC configuration first, then check for the presence
> > of a PHY. For the fixed-link case, set up the fixed link and return early,
> > bypassing any code that assumes a valid phydev pointer.
> > 
> > It is safe to move lan78xx_mac_prepare_for_phy() earlier because this function
> > only uses information from dev->interface, which is configured by
> > lan78xx_get_phy() beforehand. The function does not access phydev or any data
> > set up by later steps.
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> 
> Looks good, but this IMHO deserves a Fixes tag - yep, even for net-next!
> 
> Could you please share it?

Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved PHY and MAC management")

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
