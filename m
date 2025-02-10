Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E7922FF46;
	Mon, 10 Feb 2025 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739194869; cv=none; b=a07kPEHxylAFwW0SN/6FDY6nG35+ezaoXbCHPVYwzsUEfIapDDIv1KXMA6VkFsNEUmKP6WHro+T4/FwxvPWgwHPmwBOOA42vRt1CfAYh7GRGQYzSresF/KjxOlkxPmWF/nYFx7vqYOmh+CUyZYUcNZXFzZKJJMF0ixDYfz3rJo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739194869; c=relaxed/simple;
	bh=AFjHQoTaIvtANhU1liah60ozR1dUibI/E3nIVdzWrGs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XN3YMoy9qs/cyX6P8xGRkUK+fYpZmcapInSocuela+a4/ffiSUYp8W3lFFnlLzmi7pao/C+XKdNbLWcAE96uK3hR/JCxrzhFI4/RpKsFWh2lQCs2m6mXFX2FxznLkHpjsZAYyzCrh3imMTl/CbArV8+66xIsaWvz45a7dU5KhGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nO5FdiJ+; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nO5FdiJ+"
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id DD2635827C9;
	Mon, 10 Feb 2025 13:29:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9215F4444B;
	Mon, 10 Feb 2025 13:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739194188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1GF2t3R1YAxOaP/I6N9EoSBBP5RdZCf7+8UhwSbU9Uo=;
	b=nO5FdiJ+j7KQHbJp1aky5COAJFt7gP2C+Qedw+ueIULuhDoIYq1CA8FNaLOmzbZyEVZW7y
	oAYmY/yHyZ0BHimFRhSlqfDK2NCS/0lxEVQaZqNI5Y7k/FwiqTsVUOxuKs77lW1WCgBT/a
	WFW2vqbZdEag8zfI6t1dstqschrKBVSyMgTtG1phsGEGsNsiIVRpf6kc7Y6LUv6aleDXqh
	ZbaYfOU0lHjQiEnDQcKs6H4hX41J0bzgKEvWJjZIOQqOWFZCJYA3czVdkvML95Ozz6Wa8x
	1B7hR1msLRWYufscJicTWBbPOrK5ixCZN5Ezt6aa/FGli1bnOcnFl7Eh3MKGMw==
Date: Mon, 10 Feb 2025 14:29:43 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel
 Maintenance <kernel-list@raspberrypi.com>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 4/4] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <20250210142943.478c3066@bootlin.com>
In-Reply-To: <6136272.lOV4Wx5bFT@steina-w>
References: <20250203161607.223731-1-herve.codina@bootlin.com>
	<8756830.T7Z3S40VBb@steina-w>
	<20250207190816.2002d313@bootlin.com>
	<6136272.lOV4Wx5bFT@steina-w>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfeljedtfedtjeevffegtddutdeghfettdduhfeuhfdttdffieeuiefgvdfhvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopegrlhgvgigrnhguvghrrdhsthgvihhnsegvfidrthhqqdhgrhhouhhprdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Hi Alexander,

On Mon, 10 Feb 2025 11:42:09 +0100
Alexander Stein <alexander.stein@ew.tq-group.com> wrote:

> Hi Herve,
> 
> Am Freitag, 7. Februar 2025, 19:08:16 CET schrieb Herve Codina:
> > Hi Alexander,
> > 
> > On Thu, 06 Feb 2025 16:39:09 +0100
> > Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
> >   
> > > Hi Herve,
> > > 
> > > Am Donnerstag, 6. Februar 2025, 16:20:48 CET schrieb Herve Codina:  
> > > > Hi Alexander,
> > > > 
> > > > On Thu, 06 Feb 2025 15:38:42 +0100
> > > > Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
> > > > 
> > > > ...    
> > > > > With interrupt configured I got the following stack trace upon
> > > > > reboot/poweroff:
> > > > > 
> > > > > [   91.317264] sn65dsi83 2-002d: reset the pipe
> > > > > [   91.344093] Unable to handle ke
> > > > > ** replaying previous printk message **
> > > > > [   91.344093] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000    
> > > > ...
> > > > 
> > > > Ouch :(
> > > > 
> > > > One question to help me investigating:
> > > > Do you have the issue at init/probe or when you start to display graphics?    
> > > 
> > > This is during shutdown/poweroff. I assume that regmap_reg() in
> > > sn65dsi83_handle_errors() fails and because of that reset_work is scheduled.
> > >   
> > 
> > Found the issue.
> > 
> > Can you give me following information so that I can validate what I
> > understood:
> >   - Is your interrupt line connected directly to the SoC?  
> 
> No, unfortunately not. It's connected to a GPIO expander, which in turn
> delivers an IRQ to the SoC. In between the bridge and the expander is a
> buffer for voltage switch (1V8 -> 3V3).
> 
> >   - Is there any pullup/pulldown on your interrupt line?  
> 
> As far a I can tell, there is no pullup/pulldown on the IRQ line to
> the buffer.
> 
> >   - In your devicetree what is the configuration used for this interrupt in
> >     terms of level or edge.  
> 
> As this line is connected to an expander (pca9555) only edge triggered
> interrupts are supported.
> 
> > Anyway, I will send a fix in the next iteration.  
> 

Thanks for all those details.

I've just sent a new iteration:
  https://lore.kernel.org/all/20250210132620.42263-1-herve.codina@bootlin.com/

Can you test it on your side?

Best regards,
Hervé
