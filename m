Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C901DF97F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275225; cv=none; b=so8d5Qi4Bb/UjLKdoMP+PVWlEU6a/zRgslQkk9M5NGZoB4aSmhBrWN3ACcwXJWrVbq346Trd2lpLtmwqMR3jZc9hJg4uFe8mgepfbsFPzbA+Fbdv2bDK+5BxoZx6M7ckw1sq3RcCSd2oWdBLG80hgoFXDHUva4aPrT8vAtN35wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275225; c=relaxed/simple;
	bh=rMvXVYQgqE0m47BFrzOL9SSfENYdk43ArcdqbWGqeSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yv7FsiPYmtcrsTeMruvMIYT1NRLwvt8bT28mge32Vso2skkXfr6dSSNmDm4eG+WSuEGv5nV7M4q/gHZuh9041HOxfzkTj6IOMqRTKJlU8XVuULMyllUKpLrbJEvf+OgeFuzHranxaB6T/EfTwuDyJIWPnzvr80p4ISL/DMwXJaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=yhL4ITJt; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="yhL4ITJt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2uSi0rBX6HJS7l/ixoRnzj1B4Bl35/AdR7/AHqL8734=; b=yhL4ITJtDKiM/Z08hJ0g582CaA
	V+aKPaaMX1AnJ55IN0fFECPh00KiNKjAF5C6nQgmTj+tQhpIIoOdHghXd3/OgtwLe3GoBWjvB+hla
	p80iVC7P1YIqpXgs5OGqBccorpN+pxG8gfk9bAWia0x/XU6HlkjWCh/sW6Zk+m1HP7pAU4R1t1MPV
	nX1kRRcWSCnvTK6fsUMc3Oj4m1BI2p52eaepV/MspllkQvmh1GtkJj0Qqs0pmTzhexnTdAhjrW35q
	loU9ioxkHLEQ9qf+x0RzqldZzmMeiXuZyVP/09SvPOV2in7RJkjo6mqpYFKGXhrEDYTp25w9gJELt
	MkbVFR5w==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2nfG-00036h-JV; Thu, 10 Apr 2025 10:53:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	piotr.oniszczuk@gmail.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Fix interface enable/mux setting of DP1 on rk3588
Date: Thu, 10 Apr 2025 10:53:27 +0200
Message-ID: <174427520239.842175.8681778427919130994.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250312064218.524143-1-andyshrk@163.com>
References: <20250312064218.524143-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Mar 2025 14:42:10 +0800, Andy Yan wrote:
> This is a copy-paste error, which affects DP1 usage.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: Fix interface enable/mux setting of DP1 on rk3588
      commit: 210db264cf87da8908c395b44170f04469009035

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
