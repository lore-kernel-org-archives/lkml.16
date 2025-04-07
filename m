Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF39215760
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744045258; cv=none; b=IBNfnLK7xECDC0kRTyLVsYpckeY26BXcwZZkFOA1UZmHF05O1jo5z6M82+5kWiY8lt47rFNXM9r9rnmuoxi2JT+3XQ9kIA9S61jgmQ0DwlOKIxryRj3eOBOx6MuPzPInYeHBluGmjtRaZ86Fp3ch/RREdP1YB3dqjl2VNOu9lZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744045258; c=relaxed/simple;
	bh=8EEyvQc+5pIBnE2p/7oYhHwo0mC7KQRRPdeL6ZI6qiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpQAj6788TDffSia/B3yjRPi6y8nrWxm9/rZYcQwBxN7bZCDP9y/c9q29RfJ+1f6iVQJQXMcUFNxNQ72gGXRglbLswnJI3VbkBo7fQtUDBKDI6BJn2J8V5TGJJHbHRNnGDNZw8AwXgYwmuDwRXJnAyswbo+Wvms0LKpvP3pxsh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X97KDpLR; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X97KDpLR"
Message-ID: <1aec6dab-ed03-4ca3-8cd1-9cfbb807be10@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744045243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLDAmjclRasSVpfEYONAaYZO702FQiJJq0bMQnxY2As=;
	b=X97KDpLRfMghEYf9sxoBxmw793lbUNyIZX2MhCZr0epog6FScf9fPv/rbXMCRI4WlxGsF1
	ACaKep6rqwnu785TYkn30Pqnpl9BJRWA+kOGZfrTVeDuXFPVxZz98GZ//C62FkDo4bfBee
	qs640GM1x6TnhIGk7qK8bfPHB7/TZxI=
Date: Mon, 7 Apr 2025 13:00:34 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC net-next PATCH 00/13] Add PCS core support
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <CA+_ehUyAo7fMTe_P0ws_9zrcbLEWVwBXDKbezcKVkvDUUNg0rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/7/25 12:46, Christian Marangi (Ansuel) wrote:
> Il giorno lun 7 apr 2025 alle ore 18:33 Sean Anderson
> <sean.anderson@linux.dev> ha scritto:
>>
>> On 4/7/25 12:27, Kory Maincent wrote:
>> > On Thu,  3 Apr 2025 14:18:54 -0400
>> > Sean Anderson <sean.anderson@linux.dev> wrote:
>> >
>> >> This series adds support for creating PCSs as devices on a bus with a
>> >> driver (patch 3). As initial users,
>> >>
>> >> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
>> >> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
>> >> - The Cadence MACB driver is converted to support external PCSs (namely
>> >>   the Xilinx PCS) (patches 9-10).
>> >>
>> >> The last few patches add device links for pcs-handle to improve boot times,
>> >> and add compatibles for all Lynx PCSs.
>> >>
>> >> Care has been taken to ensure backwards-compatibility. The main source
>> >> of this is that many PCS devices lack compatibles and get detected as
>> >> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
>> >> the devicetree to add appropriate compatibles.
>> >
>> > I don't dive into your patch series and I don't know if you have heard about it
>> > but Christian Marangi is currently working on fwnode for PCS:
>> > https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com
>> >
>> > Maybe you should sync with him!
>>
>> I saw that series and made some comments. He is CC'd on this one.
>>
>> I think this approach has two advantages:
>>
>> - It completely solves the problem of the PCS being unregistered while the netdev
>>   (or whatever) is up
>> - I have designed the interface to make it easy to convert existing
>>   drivers that may not be able to use the "standard" probing process
>>   (because they have to support other devicetree structures for
>>   backwards-compatibility).
>>
> 
> I notice this and it's my fault for taking too long to post v2 of the PCS patch.
> There was also this idea of entering the wrapper hell but I scrapped that early
> as I really feel it's a workaround to the current problem present for
> PCS handling.

It's no workaround. The fundamental problem is that drivers can become
unbound at any time, and we cannot make consumers drop their references.
Every subsystem must deal with this reality, or suffer from
user-after-free bugs. See [1-3] for discussion of this problem in
relation to PCSs and PHYs, and [4] for more discussion of my approach.

[1] https://lore.kernel.org/netdev/YV7Kp2k8VvN7J0fY@shell.armlinux.org.uk/
[2] https://lore.kernel.org/netdev/20220816163701.1578850-1-sean.anderson@seco.com/
[3] https://lore.kernel.org/netdev/9747f8ef-66b3-0870-cbc0-c1783896b30d@seco.com/
[3] https://lpc.events/event/17/contributions/1627/

> And the real problem IMHO is that currently PCS handling is fragile and with too
> many assumptions. With Daniel we also discussed backwards-compatibility.
> (mainly needed for mt7621 and mt7986 (for mediatek side those are the 2
> that slipped in before it was correctly complained that things were
> taking a bad path)
> 
> We feel v2 permits correct support of old implementations.
> The ""legacy"" implementation pose the assumption that PCS is never removed
> (unless the MAC driver is removed)
> That fits v2 where a MAC has to initially provide a list of PCS to
> phylink instance.

And what happens when the driver is unbound from the device and suddenly
a PCS on that list is free'd memory but is in active use by a netdev?

> With this implementation, a MAC can manually parse whatever PCS node structure
> is in place and fill the PCS.
> 
> As really the "late" removal/addition of a PCS can only be supported with fwnode
> implementation as dedicated PCS driver will make use of that.

I agree that a "cells" approach would require this, but

- There are no in-tree examples of where this is necessary
- I think this would be easy to add when necessary

> I honestly hope we can skip having to enter the wrapper hell.

Unfortunately, this is required by the kernel driver model :l

> Anyway I also see you made REALLY GOOD documentation.

Thanks. One of my peeves is subsystems that have zero docs...

> Would be ideal to
> collaborate for that. Anyway it's up to net maintainers on what path to follow.
> 
> Just my 2 cent on the PCS topic.

--Sean
