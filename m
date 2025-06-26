Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5554E1891A9
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750933126; cv=none; b=Uhk/laaurMY4Vv3xjDrAgzb935wtTe2J1RSFChL2eNBUHwbpkB5Ih0n0fki3/nueaDbEqhDIwfn/fThYqcFCwEvAsRKci3QtA7n8i5jcnP9NyITYsSwjYk/SCCx/aNMGxIPwFm5qzOfmhPdgZzPeNeC2V5jW8QP0XfQTy0HCQNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750933126; c=relaxed/simple;
	bh=CGKx2EBTVnGnZ/Rsc5Qxm6HBGZtC8OudMU3a2sjLxUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOrHd7xhQCsu/7GKUrxGokT7r7qfaYqw8TWrJ11F4bzBUE0Rr2MY3en1olh72AOz/Eokv5OUQYfQ1yCnBn9ZwNQXatiq8trv701h+CVfmEu0+2RXRakQb67kz68EkfjxretE1y4HZ6NWqSld6Qc9teY0RloNy4HjbLfoOcGbXTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uUjgc-0003YM-Rf; Thu, 26 Jun 2025 12:18:30 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uUjgb-005Qny-19;
	Thu, 26 Jun 2025 12:18:29 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uUjgb-001XrH-0k;
	Thu, 26 Jun 2025 12:18:29 +0200
Date: Thu, 26 Jun 2025 12:18:29 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Woojung Huh <woojung.huh@microchip.com>,
	Simon Horman <horms@kernel.org>,
	Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	netdev@vger.kernel.org, Phil Elwell <phil@raspberrypi.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>, kernel@pengutronix.de,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH net-next v1 1/1] net: usb: lan78xx: fix WARN in
 __netif_napi_del_locked on disconnect
Message-ID: <aF0edQRJAXSps5CV@pengutronix.de>
References: <20250620085144.1858723-1-o.rempel@pengutronix.de>
 <20250623165537.53558fdb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623165537.53558fdb@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Mon, Jun 23, 2025 at 04:55:37PM -0700, Jakub Kicinski wrote:
> On Fri, 20 Jun 2025 10:51:44 +0200 Oleksij Rempel wrote:
> > A WARN may be triggered in __netif_napi_del_locked() during USB device
> > disconnect:
> > 
> >   WARNING: CPU: 0 PID: 11 at net/core/dev.c:7417 __netif_napi_del_locked+0x2b4/0x350
> > 
> > This occurs because NAPI remains enabled when the device is unplugged and
> > teardown begins. While `napi_disable()` was previously called in the
> > `lan78xx_stop()` path, that function is not invoked on disconnect. Instead,
> > when using PHYLINK, the `mac_link_down()` callback is guaranteed to run
> > during disconnect, making it the correct place to disable NAPI.
> > 
> > Similarly, move `napi_enable()` to `mac_link_up()` to pair the lifecycle
> > with actual MAC state.
> 
> Stopping and starting NAPI on link events is pretty unusual.
> The problem is the disconnect handling, unregistering netdev
> removes the NAPIs automatically, I think all you need is to
> remove the explicit netif_napi_del() in lan78xx_disconnect().
> Core will call _stop (which disables the NAPI), and then
> it will del the NAPI.

ack.

> > This patch is intended for `net-next` since the issue existed before the
> > PHYLINK migration, but is more naturally and cleanly addressed now that
> > PHYLINK manages link state transitions.
> 
> And repost that for net, please.. :)

It will be not compatible with the PHYlink migration patch in the
net-next. Should i wait until PHYlink patch goes to the net and then
send different patch variants for stable before PHYlink migration and
after?

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
