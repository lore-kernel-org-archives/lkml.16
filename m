Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FFD27FB2F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751872193; cv=none; b=Zqk0PFFDqqEDLEJOubLt1JWXAZXF3kgGn7eSwqx6LpErU/Hjpu8wlYOfHizUHcvmr5ogqnFD64KIW0daoKlXMB+HG7GNh6JIF/r3zm0ZeHhHJwS8z7Qw3u4/zIAq37g4zHL4GBF1uKtNweif08KWIkmjbciIKFuDVZnk1/kYS0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751872193; c=relaxed/simple;
	bh=yyxiVpTfZw3Fe/y9AhHGBqO9dJPXCajS1YdbCe03G4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLDxbw01Spp7MFYi1V9j2ay+p970vETYSMwqAf+ZV1VE+wrTph7Obfvi9gk56R5OFl2TSjPRBrUHYG0pojaDTFTAJLSQqruZ0T3ZD1E1Una/vjgb8cXSYbsN89IQtBlKfEa9YxRsscNfB+ZiNddjSwawVZd3yECbp2fVFQBrl1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uYfyR-0001vP-B3; Mon, 07 Jul 2025 09:09:11 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uYfyP-007D3A-0u;
	Mon, 07 Jul 2025 09:09:09 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uYfyP-005oRo-0Z;
	Mon, 07 Jul 2025 09:09:09 +0200
Date: Mon, 7 Jul 2025 09:09:09 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: qiang.zhang@linux.dev
Cc: Jun Miao <jun.miao@intel.com>, sbhatta@marvell.com, kuba@kernel.org,
	oneukum@suse.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [bug report] [PATCH v6] net: usb: Convert tasklet API to new
 bottom half workqueue mechanism
Message-ID: <aGtylalCTaWwqhQk@pengutronix.de>
References: <20250618173923.950510-1-jun.miao@intel.com>
 <aGgD_Lp0i-ZU2xkt@pengutronix.de>
 <74395e33b2175fdb2745211c4ca41e5b2358d80d@linux.dev>
 <c2e597d2101b588d19a5028b8ae73a33c5240e32@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c2e597d2101b588d19a5028b8ae73a33c5240e32@linux.dev>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hello, Zqiang

On Sat, Jul 05, 2025 at 06:41:20AM +0000, qiang.zhang@linux.dev wrote:
> > Hello, Oleksij
> > 
> > Please try follow patch base on Jun Miao's patchs:
> > 
> 
> Sorry, please ignore previous, try it:
> 
> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
> index 9564478a79cc..6a3cca104af9 100644
> --- a/drivers/net/usb/usbnet.c
> +++ b/drivers/net/usb/usbnet.c
> @@ -861,14 +861,14 @@ int usbnet_stop (struct net_device *net)
>         /* deferred work (timer, softirq, task) must also stop */
>         dev->flags = 0;
>         timer_delete_sync(&dev->delay);
> -       disable_work_sync(&dev->bh_work);
> +       cancel_work_sync(&dev->bh_work);
>         cancel_work_sync(&dev->kevent);
>  
>         /* We have cyclic dependencies. Those calls are needed
>          * to break a cycle. We cannot fall into the gaps because
>          * we have a flag
>          */
> -       disable_work_sync(&dev->bh_work);
> +       cancel_work_sync(&dev->bh_work);
>         timer_delete_sync(&dev->delay);
>         cancel_work_sync(&dev->kevent);

It seems to work now, thank you!
Tested on LAN9512 and ASIX AX88772B.

You can add my:
Reported-by: Oleksij Rempel <o.rempel@pengutronix.de>
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
