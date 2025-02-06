Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632BE23642A;
	Thu,  6 Feb 2025 15:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738855262; cv=none; b=t9IIjpb2JQJFs3cCcm3Sm3jxz6YeUK7V2loza3l3dpjLKs91xecjV3fPitmzCG1FtdUD2GYo4wgeUAwQzm8GPNuEJVFXhwlJQ8LFXicyaijJTCLZ8FSVLp154y7ANmJuOIvGMPxDSnWTUBcausfhymSPs6zhjxRT176dLMff5hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738855262; c=relaxed/simple;
	bh=zRn3KoOa7IRcxocAJ2vrK9GPThGuoBaz7gPUixeN06o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LWmVcT28Ll4ApmMuCT/iUxCahrQ/oV1daNkx8c1EICQ0jy1pTTqiFMt6KJwr6eTmsNniE5w6lRaasla1TXZLOQPFGP9YPUXusvY2MUiIkz4WUBDAMEY4ovac3ntgox1VhG4Gyp6LeRYN2+ENLPF0UM4xyZKzv9zDlxgIjIMVOO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oW8nTiJh; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oW8nTiJh"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A325E44273;
	Thu,  6 Feb 2025 15:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738855252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YeCsnrKozW+jD4dro64DNaKKFt/Ebupy7eycXyiOkJQ=;
	b=oW8nTiJhBjjdEHbhhMgejcQQeOc4PWIu1KYYLGOI5+7qsJWElCruy9O/VxFiGvonMs/aRm
	Q+0+WlRJxz2zOdYXbHPQW6aGQKisAptuMQXairavgw5ws1vDR6FQRduGA//rH7IGuG3e6R
	gbG4s+Pnb6xYU5t3H7Mu07gZvbxEEqqTiXDpc4nWuGx/RmMaagb8V8mLDppT780ZMI3Wj+
	3+A6IxRHU5hJk58yH/n7p0FzR3kIIiog1OXXzUmuxcEEgEWcZreMQZvdKv6JZTlM+6dXM1
	tOqE/tzys3p1B6fO0vzeATyukW2uHmcRmDFwvjlyZBLrUEPH8+CSk1XKo99FXg==
Date: Thu, 6 Feb 2025 16:20:48 +0100
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
Message-ID: <20250206162048.1f159ba6@bootlin.com>
In-Reply-To: <3605739.aeNJFYEL58@steina-w>
References: <20250203161607.223731-1-herve.codina@bootlin.com>
	<20250203161607.223731-5-herve.codina@bootlin.com>
	<3605739.aeNJFYEL58@steina-w>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhtvghinhesvgifrdhtqhdqghhrohhuphdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtt
 hhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Alexander,

On Thu, 06 Feb 2025 15:38:42 +0100
Alexander Stein <alexander.stein@ew.tq-group.com> wrote:

...
> With interrupt configured I got the following stack trace upon
> reboot/poweroff:
> 
> [   91.317264] sn65dsi83 2-002d: reset the pipe
> [   91.344093] Unable to handle ke
> ** replaying previous printk message **
> [   91.344093] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
...

Ouch :(

One question to help me investigating:
Do you have the issue at init/probe or when you start to display graphics?

Best regards,
Hervé
