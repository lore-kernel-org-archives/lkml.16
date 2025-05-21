Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3357A29B23A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747859994; cv=none; b=WisTfq0elpt2W+KaENNFDYA3ak2ZgT2AqaRwdPzWPfC26mvurygPiiBJMaVQBdegL4v9s3k4IsUppkQNqDgjTxoZ333IkUjxNYqG+8/SVhrCndpzusu35eGtfNFDbX7nHF0CANAP6pOfIS4ibg10AStUdwpHQPWw6qOSpOl4nak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747859994; c=relaxed/simple;
	bh=hWUF0Rmj/9yF+2TSHrisMjKZCsHHAIi1HKG4bsw7dt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ulXKfICIn51m0Q3KhnUe3ZYE4DhUAx2mU4IHeBW7AYLJnbMMjM+ptWsWLpx8cTUEvtw5MKAEErLXPDcku+xkUCmRlLffuAx3BjJJfKxRj3IDHoIApvSIW+AiQI0YJrr3ZGs3oTHPf7AKqkUho2yANVVnRKBSiXtchRpZFsFvWnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uHqDo-0008EG-1p; Wed, 21 May 2025 22:39:28 +0200
Message-ID: <3ba28773-61ec-4e1e-949d-e8285525d1d2@pengutronix.de>
Date: Wed, 21 May 2025 22:39:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM module
To: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>,
 Shawn Guo <shawnguo2@yeah.net>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
 <20250417-initial_display-v6-3-3c6f6d24c7af@gocontroll.com>
 <aB26FRq/Ets5fiRK@dragon>
 <PA4PR04MB7630F5874577DA12FCBE1537C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
 <aB3DuZMBIwsFXrVz@dragon>
 <PA4PR04MB76309AE2C6E2C774DF8FAE29C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <PA4PR04MB76309AE2C6E2C774DF8FAE29C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Dear Device Tree Maintainers,
Dear Maud and Shawn,

On 09.05.25 11:03, Maud Spierings | GOcontroll wrote:
> On 5/9/25 10:58, Shawn Guo wrote:
>>>>> +KA-RO TX8P COM MODULE
>>>>> +M:	Maud Spierings <maudspierings@gocontroll.com>
>>>>> +L:	imx@lists.linux.dev
>>>>> +S:	Maintained
>>>>> +F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
>>>>> +
>>>>
>>>> I'm not fond of such changes, as MAINTAINERS file could be bloated
>>>> quickly by individual DTS.
>>>
>>> Is there some way you would prefer to see it? I don't really know of a better
>>> way.
>>
>> There was some discussion about getting ./scripts/get_maintainer.pl pick
>> up the Author: field (in DTS header area).  But I'm not sure where it
>> ended.
> 
> I feel like that would be wrong in this situation too, it would pull in
> Lothar Wassmann, who has nothing to do with me upstreaming this. I have
> seen him around on the mailing list but given that Ka-Ro are not
> upstreaming these themselves, I feel it would be weird to pull him into
> this.

We can add multiple authors. Authors not wishing to receive mail can always
remove their name or blackhole their mail address via the mailmap.

I am not leaning strongly in favor of either way, but I am bothered a little
by b4 nagging me about adding MAINTAINERS entry for device trees that I've
added. It would be nice to have a guideline here.

If the current guideline is not to add MAINTAINERS for device tree, then
this patch that has generated no feedback so far could use some attention:

https://lore.kernel.org/all/20250113-b4-dts-mainainers-check-v1-1-794ed5749a94@pengutronix.de/

Cheers,
Ahmad

> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
