Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A79A2580C4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745591230; cv=none; b=OIpRwUzV0xorNw4A1I8DRJkZGE12Q1sIYBl/95UCS8SVoHxJRw5FbIyHUjmbDO+iPUTWjgxHIPB2J3/+eEuPuNX60j4I5ogD9KpITFg7HQuhTNOx7HcR1YIrWtqLWBUJvaMqz2MpJqVyZF1jSQuCBYtKX2fhKjhnTHPCVTmESHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745591230; c=relaxed/simple;
	bh=gBGXrVI7ueDDIu+0nPuAkCAvCLRx4Ti6j1kMRRwMhts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLlzhq/kNPuZwR9a2uVp0ioU25Lzo8nDwaySBLR2KTczssqswgtwWeUnHvQhDftjZUKyDwJQ0V5mAARjLO06ndF2Ph79twkzeCQtRHBGn5+ltg/m7Tt7GdbVAzfvCJpLZxzjIb8abqT18T1pD533dEV1IuTQO0bapKPixl8xr54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1u8K0k-0002NG-L2; Fri, 25 Apr 2025 16:26:38 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u8K0j-0023kt-0s;
	Fri, 25 Apr 2025 16:26:37 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u8K0j-003Hu3-0W;
	Fri, 25 Apr 2025 16:26:37 +0200
Date: Fri, 25 Apr 2025 16:26:37 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH net-next v2 1/1] net: dsa: microchip: Remove ineffective
 checks from ksz_set_mac_eee()
Message-ID: <aAubnUSDpwtfuCrm@pengutronix.de>
References: <20250425110845.482652-1-o.rempel@pengutronix.de>
 <aAuRAadDStfwfS1U@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aAuRAadDStfwfS1U@shell.armlinux.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Fri, Apr 25, 2025 at 02:41:21PM +0100, Russell King (Oracle) wrote:
> On Fri, Apr 25, 2025 at 01:08:45PM +0200, Oleksij Rempel wrote:
> > KSZ switches handle EEE internally via PHY advertisement and do not
> > support MAC-level configuration. The ksz_set_mac_eee() handler previously
> > rejected Tx LPI disable and timer changes, but provided no real control.
> 
> Err what?
> 
> ksz does not set phylink_config->eee_enabled_default, so the default
> state in phylink is eee_enabled = false, tx_lpi_enabled = false. It
> doesn't set the default LPI timer, so tx_lpi_timer = 0.
> 
> As the driver does not implement the ability to change the LPI timer
> enable nor the timer value, this seemed reasonable as the values are
> not reported (being reported as zeros) and thus prevents modification
> thereof.
> 
> Why do you want to allow people to change parameters that have no
> effect?

The original ksz_get_mac_eee() used to report tx_lpi_enabled = true,
which correctly reflected the internal EEE/LPI activity of the hardware.

After commit [0945a7b44220 ("net: dsa: ksz: remove setting of tx_lpi
parameters")], ksz_get_mac_eee() was removed, and now tx_lpi_enabled defaults
to false via the phylink fallback.

This leads to two problems:

- Userspace is unable to disable EEE cleanly (ethtool --set-eee lan1 eee off
  fails with -EINVAL).

- At the same time, userspace sees tx_lpi_enabled = false, which does not match
  hardware behavior (EEE/LPI is active).

At the moment, keeping the old validation checks blocks userspace from
disabling EEE at all.

But removing all validation risks accepting nonsensical parameter combinations.

Right now, I am not fully sure what the best way forward is.
 
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
