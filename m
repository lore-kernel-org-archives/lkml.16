Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DEF188733;
	Fri,  7 Feb 2025 07:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738913140; cv=none; b=Z5AfDl59ntAZGi8HnEwjOVHIUZciEgr/ErM/HPa9kv5Mkmo3heQhvCnSJEeGsyXuiFPULVPGo2bndtKCm4X6HDbGyQXXrfDj+io1KW65/LehNqdqh66yknxJWocWKkXIzvxy7D8dTMs/jUT6t1CgAqOjcfDziwwyMUf5YhbBOHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738913140; c=relaxed/simple;
	bh=RH1nZRu6/rvTiYwNWNvLjiMC9XfUG3eG9OzimREUwgU=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=YoQCrBV2LvRSe8oamQWo5soDI2UJvyFa6P/HYmtfDw6BGMGqvVjVjjb6iDis8XhJiyYVsd161gE3JM2Mw97L8MGB7pwheVdRJEhgi6xTeRmgyiJi9cwnuraDUZG3Ob7LoIX7/a2f+Egso+PgIdBfFj4RD6J4azzzQOGdAWpxfLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMnApV3N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMnApV3N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCD1C4CED1;
	Fri,  7 Feb 2025 07:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738913139;
	bh=RH1nZRu6/rvTiYwNWNvLjiMC9XfUG3eG9OzimREUwgU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=MMnApV3NXZZMPZW3IGvqiDxdnVD7McmJuXaD2J2CFRVEEz1U5oOJ/73tGE0Vj18mw
	 zA/YpQwJ20DYSsFFAdCpYuwRoh7owAExbbrSdecSTLrPijpZKy6hv7tRsFmhEQWouw
	 7dhP3TgkVAGEQo5SYnGIG6xLpAOJKPUaWYNGapPzfSypfh0VeAtIT+jjhCcmE18NfJ
	 R3VxW3NSXWK9L7LMptQauHv+P7c3n9d/gKQWa6EMt1u3y9ABEKWoP5jk59cK8badPw
	 TbDrW4kCQmk9GcCGX90m4/yPY5oPEkElu7bKkv281t6Gmk5U1NCfSdiaMtNJ8llbi3
	 pJcVrGGRDj97Q==
Message-ID: <9dd0d7d40b9e178650c9c70a6a496568@kernel.org>
Date: Fri, 07 Feb 2025 07:25:37 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 04/26] drm/bridge: panel: drm_panel_bridge_remove:
 warn when called on non-panel bridge
In-Reply-To: <20250206-hotplug-drm-bridge-v6-4-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-4-9d6f2c9c3058@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Boris
 Brezillon" <bbrezillon@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Claudiu
 Beznea" <claudiu.beznea@tuxon.dev>, "Daniel Thompson" <danielt@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Fabio
 Estevam" <festevam@gmail.com>, =?utf-8?b?SGVydsOpIENvZGluYQ==?= <herve.codina@bootlin.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <quic_jesszhan@quicinc.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Paul
 Kocialkowski" <contact@paulk.fr>, "Paul Kocialkowski" <paul.kocialkowski@bootlin.com>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sam
 Ravnborg" <sam@ravnborg.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Will
 Deacon" <will@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Thu, 6 Feb 2025 19:14:19 +0100, Luca Ceresoli wrote:
> This function is for panel_bridge instances only. The silent return when
> invoked on other bridges might hide actual errors, so avoid them to go
> unnoticed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
