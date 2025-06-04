Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD90B42A87;
	Wed,  4 Jun 2025 19:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749063825; cv=none; b=GCW8Dk//E+SFTunynjjvmUF6h1n3ORWTuRfktZC0Px77fnvi49jlfv5semJ/nL3+sxF5CGR76IY4xacHbAV8wfI5Kd2ki/gXEV8caIKnXDYuRuRGfzDLx3yNWtK2BhoJUpBpHAFD/v2VfylS3ySDeM9zneUNtF2amR/V+uWl8Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749063825; c=relaxed/simple;
	bh=SSj0a4S8JWpcVi82OUcXIiFFPHSMfq7dSD4fpm8a/0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QBFBDWrmVTdFm2o1qqESf5fdTe2y6junWs++khuKxGZRxnKscxE6Nlqa0s6vyZObXCsQDb4CT4iEFqfXJlsqB2Q1V/3wR6W30fYLCahQy+eYVTJI318dZCYXwVuNJ1Rneq2COZi+j/GQZAZf0lbniNmugN0uxOBhAJSgEpxGdtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EP8diKj9; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EP8diKj9"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 554J3MYI897878;
	Wed, 4 Jun 2025 14:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749063802;
	bh=Hu/CStfhLTfYqP6nHqBde5DQUaGmbLCwbgur7Xid0WE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EP8diKj9O6TG7m21CFVcddkbSdMEEynTIAk75cyWBVwnEkK8Bu4IEati/nSY5uuYU
	 VP7LqqjsUXfEGdJhuqTZfILUJSmzdEAe84j+i/fPeSqRm0S4cUEygEXxdnCllx6E+E
	 qUnwysfBt7BdNxJxpkDRzV3IzZoWVlrWWSrDYhWQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 554J3Mdx566029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 4 Jun 2025 14:03:22 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Jun 2025 14:03:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Jun 2025 14:03:21 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 554J3LR42513033;
	Wed, 4 Jun 2025 14:03:21 -0500
Message-ID: <967bc855-76f3-4598-853c-d65ce142995d@ti.com>
Date: Wed, 4 Jun 2025 14:03:20 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Discussion] Global vs Local devicetree overlays for addon board
 + connector setups
To: Ayush Singh <ayush@beagleboard.org>, <xypron.glpk@gmx.de>,
        Jason Kridner
	<jkridner@beagleboard.org>,
        Deepak Khatri <lorforlinux@beagleboard.org>,
        Dhruva Gole <d-gole@ti.com>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Pantelis Antoniou
	<pantelis.antoniou@gmail.com>,
        Herve Codina <herve.codina@bootlin.com>
CC: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <b1990c97-8751-4964-a3e8-9598f4cfac2a@beagleboard.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <b1990c97-8751-4964-a3e8-9598f4cfac2a@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/30/25 7:07 AM, Ayush Singh wrote:
> Hello everyone,
> 
> 
> This mailing thread is dedicated to discussing what approach should be taken regarding overlays for addon board + connector setups. It is loosely a continuation of [0], so feel free to go through it.
> 
> 
> Introduction
> *************
> 
> To provide a background, the goal is to have a common way to support setups involving addon board + connector. Some examples are as follows:
> 
> - MikroBUS [1]
> 
> - PocketBeagle 2 [2]: After discussion in [0], it seems that even board headers should be treated as a addon board + connector problem.
> 
> 
> There are 2 main approaches currently floating around. They serve as examples of Global and Local approaches. However, the main discussion topic is global vs local rather than the specific approaches.
> 

This is far too reductive, local vs global is only a minor detail as part
of a couple proposed solutions to a much larger topic. There are much more
fundamental issues around add-on boards to be worked out before we get to
this level of detail.

> 
> 1. __symbols__ based approach [3]
> 
> 
> This was originally proposed by Andre Davis [3]. It defines an overlay with just special names in `__symbols__`, which is used along with an overlay for the addon-board, which makes use of the node names defined in the connector `__symbols__` overlay. Please take a look at the original patch series since it provides a working example of how it can be used [3].
> 
> 
> It has a few nice benefits such as it works pretty well with existing infrastructure, and does not need much in the way of new functionality. However, for this discussion thread, I want to consolidate the discussion regarding how this approach directly adds the devices to the appropriate nodes, Eg. An SPI device in addon board will be added to the appropriate SPI controller, etc. This means the changes are made to the global tree.
> 

This is how devices are already added, if you add a SPI device you
put it under the SPI controller. There is no "global tree", there
is just one device tree to represent the device, and it has a well
established ways of hierarchically representing devices.

> 
> 2. export-symbols based approach [4]
> 
> 
> This approach was originally proposed by Herve Codina [5]. It defines a special node (local to the connector) say `export-symbols`. This node takes precedence over global `__symbols__`, and thus is used to define standard names for nodes used in addon board overlay. Please look at [4] to get a more in-depth explanation.
> 
> 
> The main difference here is that all the addon board overlay changes are isolated to the connector node in the devicetree. Eg: an I2C device in addon board will be added to the connector node (as defined in i2c bus extension patch series [6]). This means the changes are made to the connector node and not the global tree.
> 
> 
> This approach needs extra plumbing (like i2c bus extension [6], something similar for SPI, etc) to make the whole approach work. Only GPIO and PWM with Nexus node can use this approach right now.
> 

This is the more fundamental issue: do you want to work within the existing
device tree framework, or do you want to make something new. `export-symbols`
is only the tip of the iceberg of new things that will be needed.

This "extra plumbing" is bus extensions in DT for every wired bus type.
Countless new Nexus nodes, connector definitions, pinmuxing, and bindings
for the same. And then changes to DT overlay tooling including all the
infrastructure that uses overlays in many external projects, which IMHO is
the largest issue here.

My core point here is this, imagine you take a BeagleBone and plug in
a cape. This statically combined device in your hand can be completely
described using existing DT today. For any solution we come up with for
doing this dynamically, the resulting DT should look the same as if
it was done for the combined device by hand ahead of time. The combined
Beagle+cape device is exactly the same device no matter what time you
plug in the cape. So why should the DT that describes this combined
device be different in the two cases?

> 
> Basic Requirements
> 
> *********************
> 
> 
> Here are some basic functionality that the chosen approach can do for it to be viable for the connector + addon board setups:
> 
> 
> 1. Dynamic device addition/removal from userspace
> 

I'm going to suggest we ignore the removal part. Not because it is too
difficult to solve, but because it is impossible to solve.

A huge amount of drivers and devices do not actually allow for removal.

The reason is because there is no need, hot-pluggable busses are the
exception, not the rule. The rare cases like USB are built to handle
this both in hardware and software. None of the connectors we have
talked about are actually hot-pluggable! I2C, SPI, etc.. none of
these are hot-pluggable. Even if you get away with yanking the cape
off a BeagleBone while it is running once or twice, it is violating
the electrical specifications and you will eventually break something.

If we don't focus on the (non-valid) removal part, so many other parts
solutions become viable again. Right now we have no good way to even
*add* an add-on board, even statically, so let's not let "perfect" be
the enemy of good..

> 
> A lot of connectors + addon board setups do not have any dynamic discovery addition. This is compounded when talking about treating the whole header in SBCs like PocketBeagle 2 as a connector, since people would want to wire LEDs and stuff to individual pins. So a mechanism using sysfs or configfs is required
> 
> 
> 2. Dynamic device addition/removal by driver using EEPROM or something else
> 
> 
> Some setups (MikroBUS boards with 1-wire EEPROM, Beagle capes) have EEPROMs that contain board information which can be used to detect which overlay should be applied.
> 
> 
> Main Discussion
> 
> *****************
> 
> The main topic I wish to discuss if global devicetree overlays are okay for addon-board setups. Let me outline some reasons for I prefer the local devicetree overlays approach:
> 
> 
> 1. Addon board removal on multiple connector setups
> 
> 
> Say connector A added an I2C device to the controller, then connector B added an I2C device to the same controller. I am not sure how well removing overlays out-of-order works.
> 

I don't follow here. Multiple of the same I2C device are still identifiable
even on the same controller. Their IDs give them away, and even if not, this
would be trivially solved with a little bit of meta-data tracking in the
driver model layer.

> 
> 2. Who owns the device
> 
> 
> Say there are 2 connectors A and B. Both connectors share an I2C controller. Let both connectors have the same device attached. In case of `__symbols__` based approach, both connectors would technically be successful in applying the overlays, rather than one of the overlays failing.
> 

How does the connector solution help here? Seems the `__symbols__` way would make
it easier to detect as both devices would need added to the same controller node,
which would be the point to detect such conflicts. Were each connector would have
no way to communicate that the resource is double-booked.

> 
> 3. How to register the newly added devices
> 
> 
> I am a bit unsure about this one since I will have to check if the kernel tries to register new devices automatically after applying the overlay. For local setups, I was using `devm_of_platform_populate` on the connector device.
> 

Easy to solve for either method, we can always re-run the device registration loop
after applying an overlay if it doesn't already.

> 
> 4. Security
> 
> 
> I think local modification is more secure than global tree modification. A completely local solution should be as secure from devicetree perspective as USB. But I am not an expert.
> 
> 
> Drawbacks of local setups
> 
> ***************************
> 
> 
> 1. Needs a lot of surrounding work.
> 
> 
> I2C bus extension is needed for I2C devices to work, something similar for SPI. At least ADC, PWM and GPIO should be covered with just nexus nodes.
> 
> 
> Closing Thoughts
> 
> ******************
> 
> 
> I would really like to reach consensus regarding weather the addon-board overlays should be global or local. This will help to give a direction regarding what should be improved, and hopefully make future development move faster. Once a bit of consensus has been reached, we can discuss specific implementations.
> 


There is one big benefit of evil vendor trees: you can test things out like
this before sending things upstream. You are working with the Beagle folks,
and that has to be the most perfect testing ground for add-on board overlay
solutions.

So I would suggest you take the solution you like the most and implement it
in the Beagle ecosystem. Try it out and find the pros and cons first hand,
see if it can even work in the first place.

Asking everyone to all reach a consensus on the "right" solution by
talking it out is not going to happen here. This has been an open issue
for way too long for it to be that easy :)

Andrew

> 
> [0]: https://lore.kernel.org/linux-devicetree/d42100cb-eaa0-487f-aaaa-6d8f87bc0705@beagleboard.org/T/#m09b2ebe28b6202b2a926970150caf718eff6d9ac
> 
> [1]: https://www.mikroe.com/mikrobus
> 
> [2]: https://www.beagleboard.org/boards/pocketbeagle-2
> 
> [3]: https://lore.kernel.org/lkml/20240702164403.29067-1-afd@ti.com/
> 
> [4]: https://lore.kernel.org/devicetree-spec/dbe566ea-447f-4f91-a0b2-f464374955f4@beagleboard.org/T/#m591e737b48ebe96aafa39d87652e07eef99dff90
> 
> [5]: https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/
> 
> [6]: https://lore.kernel.org/devicetree-spec/20250401081041.114333-1-herve.codina@bootlin.com/T/#t
> 
> 
> 
> Best Regards,
> 
> Ayush Singh
> 
