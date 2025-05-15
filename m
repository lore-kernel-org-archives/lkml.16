Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143892222CB;
	Thu, 15 May 2025 12:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313463; cv=none; b=qKc5sYCyfzQlDaKf5pQjxwPr3y6usLICV0a39VF017r5+jI7k3v25f4RIyu492hAzQH1eJYI70RnYRRbUuBL0vXLH2ZfXGvAZseuy8ochzJMgiihlAA6vO47IAG/fRtDkPbJ+P47y4lFcIJdzsaR0xLRAgbh1xgDmBKH5KGr+ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313463; c=relaxed/simple;
	bh=F8W/3V6XabSLzxAT8Z3MNAqD3PxeKTMsocXCNNqLo8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e7psh7XhnpjB/+npDpoSQzndw1xaX9ALmYV4JTLzJJPD7in5/s66B9ZiYN5V1XW7UCrZPrzp1VQ6Dg3kcxnTCt8zTP8XcciH/qcN+7klhE+ydxjTY1NhOYDfQs8aD1Hz8xV5/iyq1vNyOM0sDHM3mmPhTO/gjIsnNxwp5hhexAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=BmvkpP6e; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="BmvkpP6e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Lo8tkKW23+9WMFJ5yoTSmuGd48aBjFyaRNNWMBrBWOQ=; b=BmvkpP6eIxfLKtQ9w3Uake6ka9
	/9CqizimXLWD3ytdX1PUn4ITl/TGBlhGsWxTcUSzRGijga8WzU+mLIpOc3Z95TFsWEleyRh+fqqm2
	VyNDWFGDoJ4DROR58cEpf1SEgCOP57kAbGhxX71ycOzcJaoweOmHEkJ/XfcEEgEvXluS3sGGIl/f8
	5H3ijB5QiJZEa70fSDY2qI+ixApiYZCNQRi7vWmMiuw40RO3hQwdfBFF5Kmxsy9DhdzbZNRAeyCMI
	2pY+duacKFQbAaQ1Zdyh+9WTu0U0gX2rm5gacCFnQ7EOIK18b1AKNMTUzCyFuW2ndhjhjJ03dOI/r
	2ALerG/Q==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFY37-0004ph-Ic; Thu, 15 May 2025 14:50:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] usb-phy support for the old rk3036 soc
Date: Thu, 15 May 2025 14:50:41 +0200
Message-ID: <174731343058.2524804.7975318323595517347.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503201512.991277-1-heiko@sntech.de>
References: <20250503201512.991277-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 03 May 2025 22:15:09 +0200, Heiko Stuebner wrote:
> While trying to resurrect the rk3036 board in my boardfarm, I also
> implemented the up to now missing usb2phy support.
> 
> The implementation is quite similar to the rk3128, except the not-
> supported charger-detection, so its addition was quite simple.
> 
> 
> [...]

Applied, thanks!

[3/3] ARM: dts: rockchip: add rk3036 usb2phy nodes and enable them on kylin
      commit: 9e010737dd434e3eee1fa75938abea0dc2fab8e2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
