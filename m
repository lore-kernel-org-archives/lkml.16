Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3027220688
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746097465; cv=none; b=CqlvdzgHqCDxHV2Rctj/R/ZXCi/chx8L7dMifiwmJeIufannPLbiFpia9+PpiFBbsT/UB3RNl5H/5AlLrQ826l4CAU+OVjlnsqw5vZm4UDEbapQvB9JgjAsltQ+/v0ah6B+E3E9mGj7aPhM7OYIxFHedRsZjIC86Rdp00u9OGCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746097465; c=relaxed/simple;
	bh=BDh8ldY0hMX5qWDLwjxxtXxNSqx/R8LhTwCvNOOawcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mLxTJr++1EKabkesBTyw4TOhYeT+7X+cp9nkmIrWyyH7NQCWsb+YVInffnjk68JkFKS7BMwQwhIwWYcGvUzNboJTZEQeq21YTPAN3WF8Bwn211QmbvpUDVBsfsNwTcogb8LDRLsIlTQiuBYt8nUplrO/EWhwUnfHgzPmx0KRIFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=1caFzCaE; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="1caFzCaE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rDixLVJkJSr18pzCi3I0mc9yi7XCZ3dvASfzpKmBjGA=; b=1caFzCaEIheOlZdhkSdrPr/m/L
	dOyj2gNULahSxTBEWMVYwOnUOlZhUY7mH4bFy6Maw4wC+VvIBvKFYdes6SDWkgM1OgzKYDs9GfGpM
	O4IDJ2lJAWd+I8qU0gXouPgNw36xGfPHAC6XEFyvMhFZeHu0aO14gD0GyhrmiIeYh74kemsNT1Ia/
	0tZz8In13dEW5at2YezKMRL2b//83IBEYlMUyqHRgTXSQLJXzoahcKIstDAfn8FZYlh2f/nkTyCYr
	78oqLz7jpYWpAh8GzMt8zgToj/idx5JjenvQQbCfEKlS/ZI39q2kVmY0GhKb8r7VwP1w2kxvq4V6q
	s99JoitA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uARhj-000890-IR; Thu, 01 May 2025 13:03:47 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: add CONFIG_OF dependency
Date: Thu,  1 May 2025 13:03:44 +0200
Message-ID: <174609741908.389921.4591931319484146397.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250423164422.2793634-1-arnd@kernel.org>
References: <20250423164422.2793634-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Apr 2025 18:44:16 +0200, Arnd Bergmann wrote:
> DRM_DISPLAY_DP_AUX_BUS cannot be selected when CONFIG_OF is disabled:
> 
> WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_AUX_BUS
>   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
>   Selected by [y]:
>   - DRM_ROCKCHIP [=y] && HAS_IOMEM [=y] && DRM [=y] && ROCKCHIP_IOMMU [=y] && ROCKCHIP_ANALOGIX_DP [=y]
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: add CONFIG_OF dependency
      commit: 4f1a965d592a0ca7d4ee2125f54d19ba8292295a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
