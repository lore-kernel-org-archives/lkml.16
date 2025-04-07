Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC6D221554
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744047664; cv=none; b=bXyD4MwbleNi3jsqLM/krX8BbqbW5cOXBJyf+oLr/GJwjEGlQZXgzOjfy1dAcFPkkHddgvqWqgSoDNv/y4RjLom9xx1U9KQpbiWlBj++a/m99xCBGFP3TbLRh/qP28tau+KQgHy41o6eU8Qrde/97AqetOKcctRc5Ir0rRuQOCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744047664; c=relaxed/simple;
	bh=4dpy4CCXBZ160IpiheubjMEcEqckuALRGNKKOE3oDQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BAxrD8YlFo2PTsy1qIH7SWx9ix+yGyziXnEAO9CnRg+ex0e1riul4rATTj0u2wrRsBFd7O4JFQ3rgp0nwJA126QdERnJKCCQ5JiT0SWLSFujjw7+qwDZ1DANhatpqRLkAqFF5V0mVFiDUYGsd0dWOv530EFmKK4FwlqagtRcw50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DK9a5CGf; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DK9a5CGf"
Message-ID: <ed5990bd-e671-4f96-bec8-543de3b48712@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744047656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=++KpZ5uwY1Janf+N2PmBTtktOp7tWbX3i2J7W2ip/E4=;
	b=DK9a5CGfgWrjLUaQxeq3ptm/moAts7IV3ci0gsTJzHJivLe+sJaFymatq0QIC6jWTCNwMu
	Q99N888ii24jACU37tbV8TN2AH/EV9OfsoMU0BFj8NRJZh5cUxFBUwwkPmdN5RROHGw35w
	0Rl++5YUu0v1A2j5dPo8wVs5LvznUIk=
Date: Mon, 7 Apr 2025 13:40:45 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC net-next PATCH 00/13] Add PCS core support
To: Daniel Golle <daniel@makrotopia.org>,
 "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 upstream@airoha.com, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Joyce Ooi <joyce.ooi@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Li Yang <leoyang.li@nxp.com>, Madalin Bucur <madalin.bucur@nxp.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@amd.com>,
 Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Robert Hancock <robert.hancock@calian.com>,
 Saravana Kannan <saravanak@google.com>, Shawn Guo <shawnguo@kernel.org>,
 UNGLinuxDriver@microchip.com, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Wei Fang <wei.fang@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linuxppc-dev@lists.ozlabs.org
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250407182738.498d96b0@kmaincent-XPS-13-7390>
 <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
 <CA+_ehUyAo7fMTe_P0ws_9zrcbLEWVwBXDKbezcKVkvDUUNg0rg@mail.gmail.com>
 <1aec6dab-ed03-4ca3-8cd1-9cfbb807be10@linux.dev>
 <CA+_ehUzeMBFrDEb7Abn3UO3S7VVjMiKc+2o=p5RGjPDkfLPVtQ@mail.gmail.com>
 <Z_QKl-4563l05WB3@makrotopia.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <Z_QKl-4563l05WB3@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/7/25 13:25, Daniel Golle wrote:
> On Mon, Apr 07, 2025 at 07:21:38PM +0200, Christian Marangi (Ansuel) wrote:
>> Il giorno lun 7 apr 2025 alle ore 19:00 Sean Anderson
>> > I agree that a "cells" approach would require this, but
>> >
>> > - There are no in-tree examples of where this is necessary
>> > - I think this would be easy to add when necessary
>> >
>> 
>> There are no in-tree cause only now we are starting to support
>> complex configuration with multiple PCS placed outside the MAC.
>> 
>> I feel it's better to define a standard API for them now before
>> we permit even more MAC driver to implement custom property
>> and have to address tons of workaround for compatibility.
> 
> Qualcomm's PCS driver will require offering multiple phylink_pcs by a
> single device/of_node. So while it's true that there is currently no
> in-tree user for that, that very user is already knocking on our doors.
> 
> See
> https://patchwork.kernel.org/project/netdevbpf/list/?series=931658&state=*

OK, but I still think this is quite easy to add.

--Sean
