Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1F27C85F;
	Tue, 22 Apr 2025 11:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322320; cv=none; b=Bfzg1dJBcoRm27d/PWvJlzMR5FbXiv85F6fyCedsNPOGyXMlSIZXogc0aLJk7Cv1I26KW450tLwPMp520Wo3vfBWSrORrzYglNCOA5k83cjrPk661tNZJT6otLZI2bhMxbzIJnyqQyHsX+LVwpTLceH5PKfgXlgl5FLGInQhHr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322320; c=relaxed/simple;
	bh=q9p7yBjwjPbwj1tXsuv8PKEO2QiIdjgvuTCpqPs2yJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LW++rrwg8g7AB1pI1PFV85euq63lRUGJ73FomIIWaUO3lF02cUWcK8hVMMZAyXle7RcONGzE0mdN1V47w+WfrZThMmyaf8X62oe18bDJWfBc0qsOJUgJwpgSvZXayplXXnU52thmwxlvVh3/V1bviDrl+ODLOSCD+cmwbMIDBqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=RPdD3O+s; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="RPdD3O+s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=eduKEqp989VtzN3pDbGRSZ0xqVFdb4NEGh4iT4GHVrg=; b=RPdD3O+sR+4EnrNmrEOnEEmUMV
	/yKMQq0LSvT22Ew3S6R3GbyVqT7cYb3nD8Rnf3j/IiK2D1FvASRWsycgcxRiLJuacnp/t1w+kLr1Y
	GCSl/B5pvkyVH/G05Rf9xQdznVPNfqOZ38q+6/CoNxo3CzRs6Lck/RNGlVJx6abaliWuDxRoJATXb
	wDRoF027reZTKxbCGVsTHqttErf+jH8qS9LeyRN94b/3zPEKNMPr96CjCndhE/M9c4MrnY62rTtZd
	yy2vumGQ+j+wCNQGIVeTfKKkMgrWEMKl166XPhV6EgEfRr7HC4sBiDsexAT3898T9/y66GXZYm+rq
	RwpZglGQ==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u7C3H-0002kK-AM; Tue, 22 Apr 2025 13:44:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	dianders@chromium.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	boris.brezillon@collabora.com,
	l.stach@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: (subset) [PATCH v8 00/13] Add eDP support for RK3588
Date: Tue, 22 Apr 2025 13:44:23 +0200
Message-ID: <174532226019.263993.6647221833577832330.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310104114.2608063-1-damon.ding@rock-chips.com>
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 10 Mar 2025 18:41:01 +0800, Damon Ding wrote:
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=936932
> 
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
> on RK3399 sapphire excavator board.
> 
> [...]

Applied, thanks!

[12/13] arm64: dts: rockchip: Add eDP0 node for RK3588
        commit: dc79d3d5e7c7b2c177b4a4ca84d20d271fb68da0
[13/13] arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board
        commit: 53862b991e79d8816d5ff54b5954d6a0fe1dcd4c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
