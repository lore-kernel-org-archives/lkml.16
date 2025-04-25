Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B3C2F32
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745556123; cv=none; b=u4b85eA0FGdlEXdgNfXYqELwDvxzuoQCIElQrCQg4NPB+H1U0lLwfTVX+XqCn/07407yZbsC9Uem8MThtprlbhMiG1xJVCGAns0+2ry7iDFobdVSDdSl7N95gbVfMYmq0HZrYUM8MHx92hTQv6HOULNTREObkljqrAPoLvZtu7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745556123; c=relaxed/simple;
	bh=GHg/nZKaHUUoUcWdi+gZrUwaJ9LdrR9A845gLOkRuEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwNV3/XTaepT7EPoE59njQ1cKA54tz6inqCb25ZeFO8i+t4QP65Kv93HdP4x7CNK7Gu8lhGi3xpxW3a+GsR0YrGDa4neKmqXoXwd8FP8id0zog5qP1PrNHkBmaTa/FglRxVxP4KSz+cdlXkSDOlOg6N9Zz90nPQ9RsLX3dQoCK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1u8Ask-0006qF-Id; Fri, 25 Apr 2025 06:41:46 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u8Asi-001zNt-1z;
	Fri, 25 Apr 2025 06:41:44 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u8Asi-0037N4-1W;
	Fri, 25 Apr 2025 06:41:44 +0200
Date: Fri, 25 Apr 2025 06:41:44 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Woojung Huh <woojung.huh@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	UNGLinuxDriver@microchip.com, Simon Horman <horms@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v1 4/4] net: phy: Always read EEE LPA in
 genphy_c45_ethtool_get_eee()
Message-ID: <aAsSiB1yIKNZeyXs@pengutronix.de>
References: <20250424130222.3959457-1-o.rempel@pengutronix.de>
 <20250424130222.3959457-5-o.rempel@pengutronix.de>
 <aAo5keWOAVWxj9_o@shell.armlinux.org.uk>
 <8f0d5725-04b7-4e15-897d-1fd5e540dacb@lunn.ch>
 <aApO59e6I6uLaw2P@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aApO59e6I6uLaw2P@shell.armlinux.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Thu, Apr 24, 2025 at 03:47:03PM +0100, Russell King (Oracle) wrote:
> On Thu, Apr 24, 2025 at 04:34:27PM +0200, Andrew Lunn wrote:
> > On Thu, Apr 24, 2025 at 02:16:01PM +0100, Russell King (Oracle) wrote:
> > > However, I've no objection to reading the LPA EEE state and
> > > reporting it.
> > 
> > What happens with normal link mode LPA when autoneg is disabled? I
> > guess they are not reported because the PHY is not even listening for
> > the autoneg pulses. We could be inconsistent between normal LPA and
> > LPA EEE, but is that a good idea?
> 
> With autoneg state, that controls whether the various pages get
> exchanged or not - which includes the EEE capabilties. This is the
> big hammer for anything that is negotiated.
> 
> With EEE, as long as autoneg in the main config is true, the PHY will
> exchange the EEE capability pages if it supports them. Our eee_enabled
> is purely just a software switch, there's nothing that corresponds to it
> in hardware, unlike autoneg which has a bit in BMCR.
> 
> We implement eee_enabled by clearing the advertisement in the hardware
> but accepting (and remembering) the advertisement from userspace
> unmodified.
> 
> The two things are entirely different in hardware.
> 
> Since:
> 
>  ethtool --set-eee eee off
> 
> Will use ETHTOOL_GEEE, modify eee_enabled to be false (via
> do_generic_set), and then use ETHTOOL_SEEE to write it back, the
> old advertisement will be passed back to the kernel in this case.
> 
> If we don't preserve the advertisement, then:
> 
>  ethtool --set-eee eee off
> 
> will clear the advertisement, and then:
> 
>  ethtool --set-eee eee on
> 
> will set eee_enabled true but we'll have an empty advertisement. Not
> ideal.
> 
> If we think about forcing it for an empty advertisement to e.g. fully
> populated, then:
> 
>  ethtool --set-eee eee on advertise 0
> 
> will surprisingly not end up with an empty advertisement.
> 
> So, I don't think it's realistic to come up with a way that --set-eee
> behaves the same way as -s because of the way ethtool has been
> implemented.

Thank you for the detailed explanation. I completely forgot that
"advertising_eee" is part of a read-modify-write cycle in the ethtool flow.
That makes sense now. In this case, I agree - there's nothing much I can
do code-wise. In this case, the only thing I can do is document this
behavior on both the kernel and ethtool sides to avoid confusion for
others.

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
