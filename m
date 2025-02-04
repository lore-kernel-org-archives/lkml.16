Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1019B20E305
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674744; cv=none; b=k+qLuuYx3cGZtQfQ705hBaGfvqB0RDqZ7tIrWIW3JgzjcOabZgQgF045mNI8krWlyuFzIFbZBnQzmib9Z7v9LD61CSmYGMgme2ifYHyFfOYsxD4WDWvewZWgch7UdwpCr9Z8M2pt1FyI7Qs/HrU8osPRbGsSLClzKt9+MuoPNZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674744; c=relaxed/simple;
	bh=gadZOmSjQCQ0eLyEE3pemhP+YjUiPSdK2nzFOc+OUeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVvBSaCN1SjZIKXDC9Mbnwv75Iu8EPEoYfAX6kSuAAOIun/CXmsyi3gWlGCiW8rr1gunoEsM1hs2w5nfMM1AHgElyVL0lKz456Pw/K/btZlEXz2TmXBUTqxycjdnuPNHkDIAjsrzpu3DmxN4NME/r5xzbsxOgOF4tbH3hgbjCr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X67EUT3y; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X67EUT3y"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE3FD442EF;
	Tue,  4 Feb 2025 13:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738674729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KaFv2tN02EO//W/KYhr5syZIZ2CdJNLTZ/Qhdjy6z+k=;
	b=X67EUT3yj7Zn/TpSMV04LSsWxrD1EdzGyRGsNWIr2sjph/K5nAOmQMXTvjVP7Ze7D+9TjL
	9zlD9AWkEdTGb/O3aiyaqovCbWN2/3VOnYvMyoVC+ZS1D7mIS+QGapbfzPyGBbB8Tjmjaf
	UvTjS+ADTGbMNjdVYrl/zbUIcEPJXgEOz9CwzqK/2GsYejVWNfAUWntVVRWVwAQXNO5KEY
	+2fajdlQ5agr0yi8dqiFYfXu6sP0/klnK8zi08gRBCL7NU3IiOmxCwGJHk7CJ6+k4VcpUx
	JNQDsFXe0XPVz2p6k4EKe1PfvDKLd0ZO7Fz5fgcedzrUuEZjhD7WJLukyx9cXQ==
Date: Tue, 4 Feb 2025 14:12:07 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] DRM: small improvements
Message-ID: <Z6ISJ_zWeFK9LoQJ@louis-chauvet-laptop>
Mail-Followup-To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250204-drm-small-improvements-v4-0-d6bbc92f12f1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-drm-small-improvements-v4-0-d6bbc92f12f1@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefggeegieduuddvvddtueeiffeiffdtiefhvdfggfetheduveejudfgtdffkefhvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsu
 hhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehlihhnrghrohdrohhrghdprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehlihhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com

On 04/02/25 - 09:51, Luca Ceresoli wrote:
> This series brings small improvements to the DRM documentation and logging.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied on drm-misc-next, thanks.

Louis Chauvet

> ---
> Changes in v4:
> - Removed pathches 3 and 4 because the added warning has false positives
>   when cleaning up a connector in the init error path
> - Updated acked-by tags
> - Link to v3: https://lore.kernel.org/r/20241111-drm-small-improvements-v3-0-a9f576111b41@bootlin.com
> 
> Changes in v3:
> - patch 3: various fixes suggested by Jani Nikula and kernel test robot
> - Updated reviewed-by tags
> - Link to v2: https://lore.kernel.org/r/20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com
> 
> Changes in v2:
> - Added patches 3 and 4
> - Updated reviewed-by tags
> - Link to v1: https://lore.kernel.org/r/20241018-drm-small-improvements-v1-0-cc316e1a98c9@bootlin.com
> 
> ---
> Luca Ceresoli (2):
>       drm/drm_mode_object: fix typo in kerneldoc
>       drm/atomic-helper: improve CRTC enabled/connectors mismatch logging message
> 
>  drivers/gpu/drm/drm_atomic_helper.c | 5 +++--
>  include/drm/drm_mode_object.h       | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20241018-drm-small-improvements-1d104cc10280
> 
> Best regards,
> -- 
> Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
