Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF47F20A5C0;
	Mon,  3 Feb 2025 15:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738598212; cv=none; b=D0Hpn1LX7wcYp4Smo2rurdwD29O55dz2Di6xGI4eG7hUVuA9uZutNz0lNXbfJIHdgN8Lomn8OhdsgBcygSiUo9vHmmzqJEaEg46IyQ+D1fZdDFH06xC0pnG//jnQTJeVuMl2UjHDxteTfddKKWXcvYNd2G/yKeu0PY1uq1g7PIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738598212; c=relaxed/simple;
	bh=0sFrFzymMl09zUXKvnhlgi3Q41XTmrK4WB/jdOpAVtk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jOOl4h9dzvr1rsYsaRO8wwCTkF+J638RmVk9r0xdY5nR9s5f5D2AoSb4TYe+adfwme/V6P8Z8DO4LcB9nCgGvnf3+7TsPWHbAvL8hvKNpmVFZcwZ27AprdhVJBGpEF7oeaRhfDqj1ua4QdsLKtGtvg9QHysMNT4XHnrzoe3aH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mJk7tTzD; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mJk7tTzD"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D6134429D;
	Mon,  3 Feb 2025 15:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738598202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tMBSA0Upt0iWcWNJa/KoKNpe46eJc1eQwBVOZ/c9pa4=;
	b=mJk7tTzD5p1/KsRJo5NYRYupbAphhwab+KDnoBVsu4F1TqNKfScnCpG00DHs8LnlF5tEKa
	NrHLC5TUjJwn/Zmf9VJcrpIvOuaLrwYZxKDljGf3aUEg+qJRJpOfb0gTtjftW8sQQisyCX
	W4lcA2ez1zhh9+CnpBhfALHBHI/1bPaVfHz3XQPFHm2Zp4tqlBTTLcJ46CjTC21Yz5CaPs
	/zmB3We8WAQ6lLNYYs1smcMhCC9S5T3gYnCfJPYQ5qb9YC22kE6iPA1QdsBj2HLtI9Yo48
	4jBAcHdwdnY/492edQzfvbxvRvy0zdL5csDYx2ItvVf/wwmSIZK9Kzl1FhLofw==
Date: Mon, 3 Feb 2025 16:56:38 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel
 Maintenance <kernel-list@raspberrypi.com>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 0/4] Add support for errors recovery in the TI
 SN65DSI83 bridge driver
Message-ID: <20250203165638.6db36f7c@bootlin.com>
In-Reply-To: <20250203145824.155869-1-herve.codina@bootlin.com>
References: <20250203145824.155869-1-herve.codina@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejiedvieekkedtjeekffejveelhedtfeehtefgudfhffffiedvfedvhfeiheeujeenucffohhmrghinhepudegqdhrtgdurdhmhidpkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopegrlhgvgigrnhguvghrrdhsthgvihhnsegvfidrthhqqdhgrhhouhhprdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlr
 dhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Hi all,

Oops, this series doesn't apply on top of v6.14-rc1. My bad, sorry about
that.

Please ignore this series. I will send soon a new iteration fixed.

Apologies,
Hervé

On Mon,  3 Feb 2025 15:58:19 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi,
> 
> Usually the TI SN65DSI83 recovers from error by itself but during ESD
> tests, we have some cases where the TI SN65DSI83 didn't recover.
> 
> In order to handle those cases, this series adds support for a recovery
> mechanism.
> 
> Compare to the previous iteration, this v4 series:
>   - rebase on top of v6.14-rc1
>   - disable/re-enable irq in the failure detection and reset process
>   - Split the patch moving reset_pipe() from VC4 to a new helper
>   - Rename the new helper to drm_atomic_helper_reset_crtc()
>   - Remove state duplication and use bridge.encoder->crtc
> 
> Best regards,
> Hervé Codina
> 
> Changes v3 -> v4
>   v3: https://lore.kernel.org/lkml/20250108101907.410456-1-herve.codina@bootlin.com/
> 
>   - Patch 1:
>     No changes
> 
>   - Patch 2 and 3 (patch 2 in v3):
>     Rename the helper to drm_atomic_helper_reset_crtc()
>     Split the patch available in v3 in two patches.
> 
>   - Patch 4 (patch 3 in v3):
>     Take into account commit d2b8c6d549570 ("drm/bridge: ti-sn65dsi83:
>     Add ti,lvds-vod-swing optional properties"), available in v6.14-rc1.
>     Disable irq when a fault is detected and re-enable it after the pipe
>     reset.
>     Remove state duplication and use bridge.encoder->crtc directly
> 
> Changes v2 -> v3
>   v2: https://lore.kernel.org/lkml/20241217143216.658461-1-herve.codina@bootlin.com/
> 
>   - Patch 1:
>     No changes
> 
>   - Patch 2 (new in v3)
>     Move reset_pipe() from VC4 HDMI driver to a new atomic helper
> 
>   - Patch 3
>     Use the new drm_atomic_helper_reset_pipe()
> 
>   Patch removed in v3
>     - Patch 2 in v2
>       No more needed
> 
> Changes v1 -> v2
>   v1: https://lore.kernel.org/lkml/20241024095539.1637280-1-herve.codina@bootlin.com/
> 
>   - Patch 1:
>     Add 'Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>'
>     Add 'Acked-by: Conor Dooley <conor.dooley@microchip.com>'
> 
>   - Patch 2 (new patch in v2)
>     Introduce drm_atomic_helper_disable_connector()
> 
>   - Patch 3 (patch 2 in v1)
>     Reset the output path instead of the full pipeline.
>     Update and add more information related to the bridge in commit log.
> 
> Herve Codina (4):
>   dt-bindings: display: bridge: sn65dsi83: Add interrupt
>   drm/atomic-helper: Introduce drm_atomic_helper_reset_crtc()
>   drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
>   drm: bridge: ti-sn65dsi83: Add error recovery mechanism
> 
>  .../bindings/display/bridge/ti,sn65dsi83.yaml |   3 +
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 131 ++++++++++++++++++
>  drivers/gpu/drm/drm_atomic_helper.c           |  41 ++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.c                |  30 +---
>  include/drm/drm_atomic_helper.h               |   2 +
>  5 files changed, 178 insertions(+), 29 deletions(-)
> 

