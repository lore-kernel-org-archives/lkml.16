Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D263221C9E7;
	Wed, 30 Apr 2025 14:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746022192; cv=none; b=YokbQRj6kkAg4c3b1DjrKqkFaWpu9I4CHxdYdKZ3uKFS2hhYPo3eOLvXTsImysChScrIFPRoWJiwJX1j5VsfKiU1JBRFfcbc3NIJAgnbO4vAq4J/pIhB2uL7YqYv+NpILSe0ifDD8wWuNmzuxtZZy6ge/zeaxGaZILAJOSTSQXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746022192; c=relaxed/simple;
	bh=MQNEc5Z/Zwkf9nZQtbp+KnkOdvUloMewnPE90SaDx3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ixf+VzPCXLapkXFyf1AgAi91o+yoSsG36HItqLWF1xWqD5IgQ5+7PP2rKbisxmpkAGC0udo07unqVwF5Zn8TiVaYQg0wOjIhjaRsMRPAqMG+LTdXEWvzppq/zQCOOFJO0kM2rFHe70wGZcbEle14JRE5MuHFLnKEgfeMfqiy3dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ps+TXnJP; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ps+TXnJP"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8A7643A22;
	Wed, 30 Apr 2025 14:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746022188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M0Dltd2GCtB6TRzo+5MXYsHNrsRM9h3Xo2QBnFUq6QA=;
	b=ps+TXnJPPQRwk9kHF4/nPe+XgwPqFp9ruyvbmxCItjA2IC/NDFSwhwLJFMHqV/+n8+wv46
	J1iyMZp4/S+1RvRyA1phAKuRq/UcNskLFDMQzSUSkusaPfHB4+fzfhXr4Ggz/VfaoR/JbH
	ruf2imSgaJKpR7DU4YM+Q11x19l4abioFi5Es7swE9mbFo8EwdKn/rDnmbStPsEJKojgQ7
	m2VHK7hhAWGlbO7qaU9tm5XfIUPrEhqo64NQ9HCVlZAiJWfxQm89YMtzlvnDk6deDlLfJJ
	6Ejz4gt8K6CEMxh9bD2YMnmQEbcD66LZFln+h6ok1n2hPdWx92/VTWPPUAF9vQ==
Date: Wed, 30 Apr 2025 16:09:44 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>
Cc: xypron.glpk@gmx.de, Jason Kridner <jkridner@beagleboard.org>, Deepak
 Khatri <lorforlinux@beagleboard.org>, Dhruva Gole <d-gole@ti.com>, Robert
 Nelson <robertcnelson@beagleboard.org>, Andrew Davis <afd@ti.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, David Gibson <david@gibson.dropbear.id.au>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Pantelis Antoniou
 <pantelis.antoniou@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [Discussion] Global vs Local devicetree overlays for addon
 board + connector setups
Message-ID: <20250430160944.7740d5e9@bootlin.com>
In-Reply-To: <b1990c97-8751-4964-a3e8-9598f4cfac2a@beagleboard.org>
References: <b1990c97-8751-4964-a3e8-9598f4cfac2a@beagleboard.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeiledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteehjeegteduheeivdeuvdethefhgeduvedvfedtudfhjeelgeehveettedviefhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopeighihprhhonhdrghhlphhksehgmhigrdguvgdprhgtphhtthhopehjkhhrihgunhgvrhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehlohhrfhhorhhlihhnuhigsegsvggrghhlvggsohgrrhgurdhor
 hhgpdhrtghpthhtohepugdqghholhgvsehtihdrtghomhdprhgtphhtthhopehrohgsvghrthgtnhgvlhhsohhnsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhg
X-GND-Sasl: herve.codina@bootlin.com

Hi Ayush,

Thanks for this discussion initiative!


On Wed, 30 Apr 2025 17:37:33 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

...

> 1. __symbols__ based approach [3]
> 
> 
> This was originally proposed by Andre Davis [3]. It defines an overlay 
> with just special names in `__symbols__`, which is used along with an 
> overlay for the addon-board, which makes use of the node names defined 
> in the connector `__symbols__` overlay. Please take a look at the 
> original patch series since it provides a working example of how it can 
> be used [3].
> 

The __symbols__ based approach needs 2 overlays to handle the case where
2 connectors (A and B) are present an you want to connect a board described
by a single overlay.

The first overlay applied "adapts" the __symbols__ node for the connector
where the board is connected (for instance connector A) in order to have
the symbols used by the overlay describing the board resolved to the
correct symbols.

I think this open race conditions when the overlay is applied by the kernel
itself. Indeed, we need to perform 2 steps in an atomic way:
  1) Adapt symbols
  2) Applied board overlay

Also, a 3rd step should be added to restore symbols modified to their
original value after the overlay is applied. This should be done to avoid
any symbols collision.

An other negative point is that properties in __symbols__ node are not
described by device-tree bindings.
How can we ensure interoperability between different base board.

The export-symbols node is a node fully described in the DT and it is
a sub-node of a connector node. This connector node has compatible string
and a binding describing its own property and sub-nodes. Among them, the
export-symbols node is described and can be checks by dt_binding_check.

This implies that whatever the base board, for a given connector type
(compatible string) the properties inside the export-symbols node have the
exact same name. Any addon board overlay designed for this connector type
will apply whatever the system where this connector is soldered.

> 
> It has a few nice benefits such as it works pretty well with existing 
> infrastructure, and does not need much in the way of new functionality. 

With existing infrastructure in the kernel, it leads to memory leaks if you
add or change a property in an existing node.

In other word, each time you update a symbol in the __symbols__ node, you
have a memory leak.

> However, for this discussion thread, I want to consolidate the 
> discussion regarding how this approach directly adds the devices to the 
> appropriate nodes, Eg. An SPI device in addon board will be added to the 
> appropriate SPI controller, etc. This means the changes are made to the 
> global tree.
> 
> 

...

> 
> Basic Requirements
> 
> *********************
> 
> 
> Here are some basic functionality that the chosen approach can do for it 
> to be viable for the connector + addon board setups:
> 
> 
> 1. Dynamic device addition/removal from userspace
> 
> 
> A lot of connectors + addon board setups do not have any dynamic 
> discovery addition. This is compounded when talking about treating the 
> whole header in SBCs like PocketBeagle 2 as a connector, since people 
> would want to wire LEDs and stuff to individual pins. So a mechanism 
> using sysfs or configfs is required

request_firmware() or the firmware upload feature (CONFIG_FW_UPLOAD) could
also be used if the connector is seen as a specific device and has a driver.
  https://elixir.bootlin.com/linux/v6.15-rc3/source/Documentation/driver-api/firmware/fw_upload.rst

> 
> 
> 2. Dynamic device addition/removal by driver using EEPROM or something else
> 
> 
> Some setups (MikroBUS boards with 1-wire EEPROM, Beagle capes) have 
> EEPROMs that contain board information which can be used to detect which 
> overlay should be applied.
> 
> 
> Main Discussion
> 
> *****************
> 
> The main topic I wish to discuss if global devicetree overlays are okay 
> for addon-board setups. Let me outline some reasons for I prefer the 
> local devicetree overlays approach:
> 
> 
> 1. Addon board removal on multiple connector setups
> 
> 
> Say connector A added an I2C device to the controller, then connector B 
> added an I2C device to the same controller. I am not sure how well 
> removing overlays out-of-order works.
> 
> 
> 2. Who owns the device
> 
> 
> Say there are 2 connectors A and B. Both connectors share an I2C 
> controller. Let both connectors have the same device attached. In case 
> of `__symbols__` based approach, both connectors would technically be 
> successful in applying the overlays, rather than one of the overlays 
> failing.
> 
> 
> 3. How to register the newly added devices
> 
> 
> I am a bit unsure about this one since I will have to check if the 
> kernel tries to register new devices automatically after applying the 
> overlay. For local setups, I was using `devm_of_platform_populate` on 
> the connector device.

It depends on the bus the device is added.
when an overlay is applied by the kernel, OF_RECONFIG_* events are
triggered. Some buses handle them:

	$ git grep OF_RECONFIG_CHANGE
	drivers/bus/imx-weim.c: case OF_RECONFIG_CHANGE_ADD:
	drivers/bus/imx-weim.c: case OF_RECONFIG_CHANGE_REMOVE:
	drivers/gpio/gpiolib-of.c:      case OF_RECONFIG_CHANGE_ADD:
	drivers/gpio/gpiolib-of.c:      case OF_RECONFIG_CHANGE_REMOVE:
	drivers/i2c/i2c-core-of.c:      case OF_RECONFIG_CHANGE_ADD:
	drivers/i2c/i2c-core-of.c:      case OF_RECONFIG_CHANGE_REMOVE:
	drivers/of/dynamic.c: * Return: OF_RECONFIG_CHANGE_REMOVE on device going from enabled to
	drivers/of/dynamic.c: * disabled, OF_RECONFIG_CHANGE_ADD on device going from disabled to
	drivers/of/dynamic.c:   return new_state ? OF_RECONFIG_CHANGE_ADD : OF_RECONFIG_CHANGE_REMOVE;
	drivers/of/platform.c:  case OF_RECONFIG_CHANGE_ADD:
	drivers/of/platform.c:  case OF_RECONFIG_CHANGE_REMOVE:
	drivers/spi/spi.c:      case OF_RECONFIG_CHANGE_ADD:
	drivers/spi/spi.c:      case OF_RECONFIG_CHANGE_REMOVE:
	include/linux/of.h:     OF_RECONFIG_CHANGE_ADD,
	include/linux/of.h:     OF_RECONFIG_CHANGE_REMOVE,

> 
> 
> 4. Security
> 
> 
> I think local modification is more secure than global tree modification. 
> A completely local solution should be as secure from devicetree 
> perspective as USB. But I am not an expert.
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
> I2C bus extension is needed for I2C devices to work, something similar 
> for SPI. At least ADC, PWM and GPIO should be covered with just nexus nodes.

I wouldn't say 'a lot'.
I already did the work for I2C bus extension [0] and the implementation was
not so complex.

[0] https://lore.kernel.org/all/20250401081041.114333-1-herve.codina@bootlin.com/

> 
> 
> Closing Thoughts
> 
> ******************
> 
> 
> I would really like to reach consensus regarding weather the addon-board 
> overlays should be global or local. This will help to give a direction 
> regarding what should be improved, and hopefully make future development 
> move faster. Once a bit of consensus has been reached, we can discuss 
> specific implementations.
> 


Again, thanks again for initiating this discussion.
Hope this will help to move forward on this topic!

Best regards,
Hervé
