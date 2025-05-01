Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39FC155A4E
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 12:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102589; cv=none; b=tM3MWJ105nj11px2gg7W71T2ejHztaBSXe3xVgbWhnrB/WMDzcv8lma837+FLAupIGZhXO79AIz6xUR1w33vx4HadTWxXIEqKNCz85hfnEbihJ5+s0UpXr/bFrI8VRlpemslcvUYbKErtMMIkx+IxIlnVlLvomhYGB+ONkRJDlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102589; c=relaxed/simple;
	bh=4xCRMisnHYG+rKe2zqaB+fT8Zsy5tgW+HFQAhsYb4aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FXsyQ65dZ9PN4K5EyTObU456jvIjutM+2EQW/0Hxd74UadBgJjRkcSrSmL64KAfg1+fZplj74E0mX5QV06AUHfKzLDrDwgjchicf5AvFBlB22REyHsS4tBhUppqRRnk4uZ5FKnJ14tyIs+TaqFUZimu8xjLOg+Tme+Iao7fsoIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Rs9xhcaZ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Rs9xhcaZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4xCRMisnHYG+rKe2zqaB+fT8Zsy5tgW+HFQAhsYb4aQ=; b=Rs9xhcaZnyE3EgO5NsWtKg+rGr
	HKneR3rv8W3Uu7rGQsCInI4mFx9Sex1+GQBO6NdgpG2QzURqWKxrcH7gxzewqBOKr0wQMBRKxOAMW
	suttM7urgjvAu+BXm2VBlVrWlj0lcZjnImryubfeJ87vJVH+fzJ0G/4E/V7mHz9iSnEHD1CNVWA9t
	0ldZ7u4k0EqBJq7Z8oZMNmUwtrZBoj70PzKeukMKVMhG3MN8R8FlZaHFEOGVDF4Bg3Ve1iCn61+oK
	JkgXMWYqT3XhDUHKXStoA+lSyfECRy6+mm2cXCDLDpiGlCJPNusI7qyEt85sDqogKH9C87O6JvxLz
	nfPVGqKw==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uAT2s-00012o-CU; Thu, 01 May 2025 14:29:42 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: vkoul@kernel.org, kishon@kernel.org, cristian.ciocaltea@collabora.com,
 andy.yan@rock-chips.com, Algea Cao <algea.cao@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Algea Cao <algea.cao@rock-chips.com>
Subject:
 Re: [PATCH v2] phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output 50.25MHz
 error
Date: Thu, 01 May 2025 14:29:41 +0200
Message-ID: <23932150.6Emhk5qWAg@diego>
In-Reply-To: <20250427095124.3354439-1-algea.cao@rock-chips.com>
References: <20250427095124.3354439-1-algea.cao@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Sonntag, 27. April 2025, 11:51:24 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Algea Cao:
> When using HDMI PLL frequency division coefficient at 50.25MHz
> that is calculated by rk_hdptx_phy_clk_pll_calc(), it fails to
> get PHY LANE lock. Although the calculated values are within the
> allowable range of PHY PLL configuration.
>=20
> In order to fix the PHY LANE lock error and provide the expected
> 50.25MHz output, manually compute the required PHY PLL frequency
> division coefficient and add it to ropll_tmds_cfg configuration
> table.
>=20
> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>


