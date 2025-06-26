Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40D9218AB0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926730; cv=none; b=J5/PA20FwXjj5xlkQeCRk6GK0I2qC5uz5BaCOICTHHP618y590udMHA+mJi8LFvLbMHq6qx1frbFqKdN0KikHPPbRxk+sShxu67uVxYEE7NXQ8WsKt68AfpoG+7IN/lQDyHScbpAwK4D4y1H/h1dU+A5J3hMnyvQJfSNlw8NZNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926730; c=relaxed/simple;
	bh=uP/rFDx8e9z3sNXc4VRTDpBmgU3yeg67Y/han+fosNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qj4qJPwihCuNPgpKz5FV5vFXzFY41AiX3w2nIMBqmuvCPB2/L2VERVpLqRoxl9Zxr04MafPyB/MpS8kA1l8vL4viC7zLQzJ0zRylgHaW7qEgJBsTJ/kCLE4MWNxccUPyxqpaGXdDeTNZzJM/e+fhpkiPIiaQDeHjzCyK5V0W/wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1uUi1Y-0000AH-3U; Thu, 26 Jun 2025 10:32:00 +0200
Message-ID: <f2647407-3de0-4afd-bc79-5b58e13f10aa@pengutronix.de>
Date: Thu, 26 Jun 2025 10:33:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: fec: allow disable coalescing
To: Andrew Lunn <andrew@lunn.ch>, Wei Fang <wei.fang@nxp.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20250625-fec_deactivate_coalescing-v1-1-57a1e41a45d3@pengutronix.de>
 <PAXPR04MB8510C17E1980D456FD9F094F887AA@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <d60808b3-eb20-40ab-b952-d9cd8d8d68a7@lunn.ch>
Content-Language: en-US
From: Jonas Rebmann <jre@pengutronix.de>
In-Reply-To: <d60808b3-eb20-40ab-b952-d9cd8d8d68a7@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hi Andrew,

On 2025-06-26 10:12, Andrew Lunn wrote:
> On Thu, Jun 26, 2025 at 02:36:37AM +0000, Wei Fang wrote:
>>>
>>> -       /* Must be greater than zero to avoid unpredictable behavior */
>>> -       if (!fep->rx_time_itr || !fep->rx_pkts_itr ||
>>> -           !fep->tx_time_itr || !fep->tx_pkts_itr)
>>> -               return;
> 
> Hi Wei
> 
> When i see a comment like this being removed, i wounder if there is
> any danger of side effects? Do you know what is being done here is
> actually safe, for all the different versions of the FEC which support
> coalescence?

For reference, this comment is taken in plain from section 11.6.4.1.16.3
in the i.MX 8M Plus Applications Processor Reference Manual (and is the
same for the 6UL).

I was also worried about this so I made sure that in any case where
either of those is zero, the coalescing enable bit (FEC_ITR_EN) is
explicitly disabled.

fec_enet_itr_coal_set is only ever called if FEC_QUIRK_HAS_COALESCE is
set and for those models, we expect disabling coalescing via FEC_ITR_EN
-- and consequently also setting the parameters to zero -- to be
unproblematic. This is also the reset default.

Regards,
Jonas

-- 
Pengutronix e.K.                           | Jonas Rebmann               |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
