Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683F31917FB
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 21:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745703986; cv=none; b=OIMMlPgsb6YiFLXS2MEFWuWs93HPOUhON0HkidWTUcqoD/GzYsJUEtsGmNf7txUcxr0Evmvr088mA3kshws9DPrRBOJH6KYxO0xbgXrZv29ivUM2XANffH1coJIk+sPQJrBOLijPn0oZJhQCEjpCtOqa3eqrXDTcbgaLER7Yi9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745703986; c=relaxed/simple;
	bh=tZvKFGI1xVfj/cn7rmpLBnwjUJVShZMm6zg5xLH3J4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qHU/8hf4J3q4S2W0r+E/RWr0UnhFCxpMYFi8iRQNTHi/gkHhxqT9EQTsvt+rHYGEPDHWwfdvIvh0QVq/qqWAbv55+4Wlprb4DqMzZljfW9Ar81+ZgiLfm8R9/v7at74aTuVSdb74K0tGgkvour0nfgqTql3E34+2KfbSLUBA09I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=F1AfyJ7r; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="F1AfyJ7r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Xe0udTgs66EroI3SBu3SsayzPACEWPQ7RqmksMkZ3wQ=; b=F1AfyJ7r3ijw+8kRHSGPhTPcxJ
	KlYbNQ4TsPaLtha7RsbjziAwu6TR3dzcqToPd0BMP5HR28y33isW/ySdratC7nux7KKeUn+ZCpzvP
	bN4XFq1suVfYIEpktug47IKhHDlv84beB1tBiH0u6g10r5z4n87xo01Q3Ze/CGUaNZQykqMweKRmQ
	K1ig1/FBvj1vzUVP0+BOsQqXSPEm39ss/Jmv4K/3twQ+4/duvJ0Eqg8Fs7wVUIdL0iF3CfkGvY10e
	eBfNjw3fi/CCQb4FqkKyHyh5rEmhMJ8vl39S8/h5duFuLdv75wdZZxepLsWECklVr6ojyMfAEW02P
	3Dq3CW1g==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLq-0001OR-Dg; Sat, 26 Apr 2025 23:46:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add HDMI support for roc-rk3576-pc
Date: Sat, 26 Apr 2025 23:46:08 +0200
Message-ID: <174570370140.31943.7618466654461334569.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250414183745.1352470-1-heiko@sntech.de>
References: <20250414183745.1352470-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Apr 2025 20:37:45 +0200, Heiko Stuebner wrote:
> Enable HDMI and VOP nodes for the roc-rk3576-pc board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Add HDMI support for roc-rk3576-pc
      commit: 3e62d9160ada511f7828f7cfaf11e57bfb660e19

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
