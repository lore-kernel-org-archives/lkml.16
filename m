Received: from 3.mo576.mail-out.ovh.net (3.mo576.mail-out.ovh.net [188.165.52.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D8D22338
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.52.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748031720; cv=none; b=DYueexsOLYpxh9IvRWr/wfqp+Z6q/N15DGtTRFocxLtkxoOiYRILKQhJGDmQumn+CQO3qeamiyOQrOpxslxXLzA6OYjxrxohBN/+XvKsCb3/oYPcZ9NgLlSz0FNcUQ4AqiTLOUrVL931W5R+S2eRnjnDhpf8R+OAm8QjpqhB71c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748031720; c=relaxed/simple;
	bh=xuueZm23eh49YiSgqxfgFZPFyU4JQVsCTAJLi+OWt98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJceSSv9VLHgci2JEcMNROZtTcp/pfrHe45UvO5BChAPPtkHfYYpneNbKRZRpmZoXFEhEcEhqv0Ndeg5XIa3l/HRO0y4xTGujaSxwi5IRr8NmnvthQiErVWez1UtREnDcQGxPa3KIbW82kouyYi6LBTI1IlrrOuXuaWNXaFSzME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com; spf=pass smtp.mailfrom=armadeus.com; dkim=pass (2048-bit key) header.d=armadeus.com header.i=@armadeus.com header.b=Ao/o+l/x; arc=none smtp.client-ip=188.165.52.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armadeus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armadeus.com header.i=@armadeus.com header.b="Ao/o+l/x"
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.17.147])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4b3q2P11WNz32GR
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 15:34:05 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-fwdt7 (unknown [10.108.54.213])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8C56190E15;
	Fri, 23 May 2025 15:34:02 +0000 (UTC)
Received: from armadeus.com ([37.59.142.106])
	by ghost-submission-5b5ff79f4f-fwdt7 with ESMTPSA
	id 48OmEWqVMGjaMwEAmS5tiw
	(envelope-from <sebastien.szymanski@armadeus.com>); Fri, 23 May 2025 15:34:02 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-106R00618957c2c-41e2-45dd-a874-a02a4f70d8a2,
                    E55FAF7D42BA6FEE76EB3B6A0F061FDB1FCDFC7F) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp:86.243.209.203
Message-ID: <65670a02-e217-4d0f-955d-d13ca0240819@armadeus.com>
Date: Fri, 23 May 2025 17:34:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
To: =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <m3h61u9jy2.fsf@t19.piap.pl>
 <20250509103733.GE28896@pendragon.ideasonboard.com>
 <m3o6vn8np5.fsf@t19.piap.pl>
 <iegnn5xoosqpk52hvipcr73aliwhqtsq6r6ctvt5756bhy6yen@rqcdongb7fdf>
 <m31psg97dy.fsf@t19.piap.pl> <m3plfz7io0.fsf@t19.piap.pl>
Content-Language: en-US
From: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Autocrypt: addr=sebastien.szymanski@armadeus.com; keydata=
 xsBNBFNfZLEBCACv1lqSePHJNpRgcnER+3emy+Arjz84zFax3XkogjY/e3ZneihIgWrVKe5M
 ql16pX4KTkzNgMUKz4bG/XwT3kjcrXshxFLlg7KrHMl287C+W+QOUjnjVeRi/su+SPmjz8VD
 yr11h+ZkVLAWhS+uQJ93jy1NwG8M4t1kBLAVHHD5Vw4FJ+3ouaVYIp1X1Cr8bVKQw33Q1aTd
 ro0kMBb96B9vNu7ciJZ3gvlaBzUEKOgNnq9KaywuLnqrqr4HUIn5JuxZjCjJzt9kTAKcTfp2
 cJM8qpp+2FF5qtbkse9fZ6M64qozgOPr9Tk4Amf9fZEUQ6UNw14mmBZuXSzoHe75gI7TABEB
 AAHNN1PDqWJhc3RpZW4gU1pZTUFOU0tJIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
 LmNvbT7CwJAEEwEIADoCGyMHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgBYhBJwGygpYm/1C
 /GCmwbCaKeiBMmTiBQJdhIHLAAoJELCaKeiBMmTixXIH/2W3kbzRG0UF81jtRRnp0H83rjDT
 v0H+8fgFMRL/7HCJ1QPArkfRJlM2wlJkN+ChP09CCarYfUEHfRCHlTb7At6Yyrz1jziD7ZwX
 8IWHYRXnZkY5eZc5DsiUgq6JH49kt+GPzK8UVP9MTa6zkBpPCUf7LzZ4pD3FihdkT52BU3gI
 d9P49fSI0TYySlb/VKn815aOhvwEr7+Dh3mZUjSh7saofbRmVUOr7p+R3MvvGI19/IJZjeOE
 ZWliODDOt6HnBOtoGSXMcNIFF6snH52D5N5gY88njZjTwhgGGUBix1bsgf/EY0v4R5itZBXB
 B/Ze4Tm++YHaB75hZK6PQu/YRv7OwE0EU19ksQEIALo7jhXddrXBTRu5SAjelV53jyHBJTX/
 vN4nL/VbbW/saca+NJjDSxx5DBmotZbQdWIyZiSIjU/xnTREvtDrl6ZeSsKWd7ZqiuiY4fSR
 zwuQp9rd0yqRuxesrWeyJB1zCSdEvLyKASERt+nxkOA+IzJ4y1qLtvnWr+SL1AXgTMw+Tkyw
 KIDCRWHTIYas11ldGj82gOIpYeXnapeNLHfT4EQwg0NeWYHynJxAQWiX5aPlw0uSpAQSsBXQ
 FIe3fpoveMSnXK+PG2BBOzexYv7r4S70a6sF9sgTTPpfKqUaqqC+u1+bUX6alTAKhGKJywaF
 6ViqLlgY8PfwohSyAlqlTRMAEQEAAcLAdgQYAQgAIAIbDBYhBJwGygpYm/1C/GCmwbCaKeiB
 MmTiBQJdhIHSAAoJELCaKeiBMmTitU8IAK7NQM3fEwaF5XaKtepYWsVka44CD8A9e4r7NVK9
 ugirKvXirIxBSDmN/Db862NmVpITsZ6ERNSNZLm/7k55N+TexKYiFZeU7G92TEfAM6qPElvx
 DLEcrkNMq9r08YZeUloacsq31AL5fK4LW+xdvXudkdiKRMJsdTpmff3x5kIziGOHjwFP9wve
 ZgEH52gpbRsP8Whx/Z2lNX/BBRmFM8OnEXFsjjqDzYThdxTq85wGPpkgvvUGyPNRD7TpbB1C
 pajOUUkPxgj5LKt77HD1afeZNudWhgcdkbtT5PMQTT0WY6wvMEj9S1+bGPeXRGWLYB7gHQ+L
 JNoSD7Kz6Y9qnKo=
In-Reply-To: <m3plfz7io0.fsf@t19.piap.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10767262288169724891
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdelvdefucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpedtgeehtdduledtudevveekveevveefffdthedtieekgeeukeevtdffieegteekhfenucfkphepuddvjedrtddrtddruddpkeeirddvgeefrddvtdelrddvtdefpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=l5StDh65JnrKX3boH0CcwErYPyl25P8m60tElznRk+w=;
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1748014445; v=1;
 b=Ao/o+l/xZNPvZ518fBJ3ik06H2HDn2vcsaVQP3ik/XBaVb+Lui0D/KE2wImz5uiJNwNrxw0M
 S1LgXSY9mR6CRVVcIjAFCEGjTMzGCcM2UYtZ24n5zxfOSb8SoijOv6oXeEe2Y+rPR1Lh7SDDJdw
 dQv2g4aaCzcYgaR0TYd71WMTiyS82u7088wPo5S2srNBjiGXRnpA6cZMjbRrYOWTipejim1yq6W
 yNF/BVQQ4RSnt7l88AK4X9k4Et8yExKTMYYxYDotP2JtEHILBRV0o8FUgQNCdh6YseCAIpUVlka
 sxhfqDHidl2AaGy3SbWD/j18CE7rBjjAj2HM1lu7ZazbA==

Hello,

On 5/23/25 11:58 AM, Krzysztof Hałasa wrote:
> Now, what do we do with it?
> Is anybody able to verify the CSIC version register value on i.MX8MM?
> Something like devmem read32 0x32E50000 (or 0x32E40000 for CSI1) WHILE
> RUNNING CAPTURE on that very CSI would do the trick (using your
> favorite instance of devmem/devmem2/etc). Alternatively one could add
> a debug printk to the csic module.

On i.MX8MM mipi_csi is at 32e30000. NXP kernel (6.12.3) with ov5640 camera:

# devmem 0x32E30000 32
0x03060301

Regards,

-- 
Sébastien Szymanski, Armadeus Systems
Software engineer
