Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1202218592;
	Fri, 25 Apr 2025 22:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618973; cv=none; b=ai2s4t4xn6GMrggoVzI3uU4en3Krlwf7caLMefbVhEXN9q+5xX2LiuXzuHIVeQb1x4IqjhhIvyB8PHuzeX7IQHK0IYXz1txRiforSd9n+6tsjHnMFtCi5FapU51fCnQMap+s5bje18HVodLOasot8atPi7zX8iKB4CyipMFQhF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618973; c=relaxed/simple;
	bh=xlnD3QHWa+7MUgoy3f5aIfPeC6qtSBgmxlA3LctdjjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ec+6kD/2o6ZgGO+Wua9PsWeTFNqfui/KkZkdbaPZNeknpEbRoOYzRTcVeGt/e74VAWafDd0MWLUMEHP8LXTHrINeYHgSE25ogsiJ4X2vWiczryzwXN7Sfq0mzd3dEycTwzTgaBAiZwM/EdPAM+SmZS2X24OOcyGdxpwX8UesQeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=R2A0oH31; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="R2A0oH31"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=U33urWJ0nbHUSj4/Ei55DnraHJ93Xd3t00xN2jKFwUw=; b=R2A0oH31L8HOyJJ3pZ3Q+UUzRc
	o8mEE4btAzk82MmSOlVcj24R+jgnLh+OsOAczxgLLgS7G3hElozLwNVypRWDYOepIbpoVJYYpl+LF
	afGJodDUn06LsKLeAysAE0DoQVb269hnPe18BDB6CbXe1pT0+m5eOJ81KEBdzwIb6gFoOffAhiPeu
	KUnwTRFJuKDYHk42LkkmxZsEWzULaSispPBUoLgj9Szq1ggFQvwQamvith2pRqh8E0cfSxpxyfVmu
	evz/qWNUPvxPBnP/IKu7+r7HYvCLQ7LVaFIi7Nz0dAkZj5B97TD25ozt98qv8jDXvXg0BjQ/+Pu2p
	xi4wANtQ==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8REO-0008Uk-72; Sat, 26 Apr 2025 00:09:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org,
	Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: Re: (subset) [PATCH RESEND v2 0/6] RK3576 OTP support
Date: Sat, 26 Apr 2025 00:09:02 +0200
Message-ID: <174561877790.431677.17884049982561107688.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210224510.1194963-1-heiko@sntech.de>
References: <20250210224510.1194963-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 10 Feb 2025 23:45:04 +0100, Heiko Stuebner wrote:
> This enables OTP support in the nvmem driver for rk3576.
> 
> I expect to pick the clock patch (patch1) and the arm64-dts patch (patch6)
> myself, after the nvmem-driver and -binding patches have been applied
> (patches 2-5).
> 
> But kept them together for people wanting to try this series.
> 
> [...]

Applied, thanks!

[1/6] clk: rockchip: rk3576: define clk_otp_phy_g
      commit: d934a93bbcccd551c142206b8129903d18126261

While the original nvmem applied message [0] listed the clock patch,
it was in fact not applied there - probable for being a clock patch.

So I've done that now, hopefully as fix for 6.15 to make the
nvmem work in this timeframe.


[0] https://lore.kernel.org/linux-arm-kernel/173978599692.25901.15315285566342669137.b4-ty@linaro.org/

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
