Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8152860B8A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745863649; cv=none; b=XpsmSnf6DhX1fvrE3JNFRJI3WZZN4J8DM/mzDHH+GzqluIFFu/qxjTWW8t49dV+aYci1fzSJgm7C/qANABYId8z4lUWDvcSQAvBBuXti1tF9c0/jcexyoGS+IPm0kapuNd71QXObsAFcBVbXZdGKlkW9Kdb+zmMXwuhabincKc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745863649; c=relaxed/simple;
	bh=V9d6oMnJwsV7Qd104fHHzEnvpfyuezW585frER4nR3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfabHwJEj4fAi4XyShGQKx55ln00tz15+YaVMHAX3gwsO4HItgunv2147TWpnoKuUi2gyc/B4NTqo9NJ+qf0GQIzrn+AQw+rFuWpN+xzF27Pu4550GODng/y1wZFV8vyxUsj4bC641AHALX3Ur2iSYtp9tG/+OU6P0M8VQYlEkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1u9Ssk-0005B1-Ds; Mon, 28 Apr 2025 20:07:06 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u9Ssj-0008a2-0L;
	Mon, 28 Apr 2025 20:07:05 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u9Ssi-0093mG-33;
	Mon, 28 Apr 2025 20:07:04 +0200
Date: Mon, 28 Apr 2025 20:07:04 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>, stable@vger.kernel.org,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH net v1 1/2] net: dsa: microchip: let phylink manage PHY
 EEE configuration on KSZ switches
Message-ID: <aA_DyKw8AVPdmu-Y@pengutronix.de>
References: <20250428125119.3414046-1-o.rempel@pengutronix.de>
 <20250428125119.3414046-2-o.rempel@pengutronix.de>
 <4d8a3e79-f454-4e2f-9362-c842354b123a@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4d8a3e79-f454-4e2f-9362-c842354b123a@lunn.ch>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Mon, Apr 28, 2025 at 06:51:19PM +0200, Andrew Lunn wrote:
> > +/**
> > + * ksz_phylink_mac_disable_tx_lpi() - Dummy handler to disable TX LPI
> > + * @config: phylink config structure
> > + *
> > + * For ports with integrated PHYs, LPI is managed internally by hardware.
> 
> Could you expand that.
> 
> Does it mean the hardware will look at the results of the autoneg and
> disable/enable LPI depending on those results?

Yes.

> I also assume this means it is not possible to force LPI on/off, independent
> of autoneg?

Correct. set_eee call in this driver is filtering (tx_lpi == false) to
reflect HW functionality.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
