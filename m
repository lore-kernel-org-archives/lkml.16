Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94EA2DCF68
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536645; cv=none; b=iq9xlenTzco5EQP3GWyGhVKOUtlGDaF/FcwzgUYLTZOWklaNLG2ibiz/6ibCczI77rBD6fYyyJFcdERN7uiouWZknjYDpn7cg3lN/C5X0lKmV8x3rFdIG9jxddIc/fYi+Kruvgc+Szj2hrXXNAQB6cdKrTpRfKHCaltgQQlCdXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536645; c=relaxed/simple;
	bh=c5big+j1eLYqTd9f91QD21CM2Uu+ovktIk2We9V9Kms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUCtpqnTmw5lhL+vmLJUscyjUCnjBECNrxJBwarxWiT2vv++K6fneJatgCbhgkrpMgYuhU8kRZcx8TDC5KzjoY5O0l0OZxP9W85AblNu2UG0FxkqSfkt5fhU0rXuVrfcqemOgDFIGsiGYHUfSYPAe/ukczrcspcxh9cUgk32m/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uXGgb-0007Za-5y; Thu, 03 Jul 2025 11:56:57 +0200
Message-ID: <8db56c73-191e-48ec-9a28-cbb0da9a8a80@pengutronix.de>
Date: Thu, 3 Jul 2025 11:56:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] imx8mp: add support for the IMX AIPSTZ bridge
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <3615415b-7ebd-45e5-8d7b-8a1b26ac7130@pengutronix.de>
 <10ef8a9a-6d23-4fb9-933f-71ab493d21c7@gmail.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <10ef8a9a-6d23-4fb9-933f-71ab493d21c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hello Laurentiu,

On 7/3/25 10:51, Laurentiu Mihalcea wrote:
> 
> 
> On 7/3/2025 11:11 AM, Ahmad Fatoum wrote:
>> Hello Laurentiu,
>>
>> On 10.06.25 18:01, Laurentiu Mihalcea wrote:
>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>
>>> The AIPSTZ bridge offers some security-related configurations which can
>>> be used to restrict master access to certain peripherals on the bridge.
>>>
>>> Normally, this could be done from a secure environment such as ATF before
>>> Linux boots but the configuration of AIPSTZ5 is lost each time the power
>>> domain is powered off and then powered on. Because of this, it has to be
>>> configured each time the power domain is turned on and before any master
>>> tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).
>> Sorry if this has been asked before, but I hoped the cover letter or patch
>> 3/6 would explain if it were.
>>
>> What is the default configuration for the AIPSTZ before this series?
> 
> the default configuration is the reset configuration since AIPSTZ registers go
> back to their reset values during domain power cycling.
> 
>> I assume the SAIs under AIPS5 can be accessed by SDMA already, so why was
>> changing the AIPSTZ settings needed for the DSP to work?
> 
> AFAIK SDMA transactions to peripherals don't go through AIPS5. They use SPBA, which
> is why SDMA works even w/o this series. As for the DSP: transactions to peripherals go
> through AIPS5. With the reset configuration, the DSP is not allowed to access said peripherals,
> which is why this series was needed.

I see. Thanks for tackling this issue and your explanation.

Cheers,
Ahmad

> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

