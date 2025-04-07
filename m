Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A0522A1D4;
	Mon,  7 Apr 2025 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010281; cv=none; b=QHPSvA3GnM/K384AvmYjwFoBFmCsBjGGPl1gAXkcB09r2xwxWGzyAZHizbS0fwG0Wnzd8lBv9Q/ReJBSXp4lk25MquTowkbUqm/8ncUDfWR71nBweBLrqj7RvJT7HLbOYM+OW7bzhPUEvdO9tjZE1EwK33glxXuH42/T0/LEWsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010281; c=relaxed/simple;
	bh=iX3zewBTvxovNqMvdbqa5066P6HDtF1rRKFpMZBdFLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YpHCBS2VTdJfshwNYhyB+1TWOqqoDfFF7zGhQiZN+42opLjq2U8adJW0qigi439qc9Udrvl7ov0PWa8aVIBPxceTnzozuaLYBmisluJks+djj4ZG6UB7vnNpd5HkMPgLnpAgm//3ywEkiSyFtadW/LQTGi2osLQnXIFyURkiTJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=CCWFB7Ty; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="CCWFB7Ty"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XrhZLC/gWu44yM/JXNBUfkny0yyqCUz+uaOnp1SH628=; b=CCWFB7TyuHv14vo2yVNtr3NiM3
	l98FtBjdbLBhuyZw1d3gP1gS8Zj7wCAjJrtvIIkjbT+007HCeyhN0EOkX/syQwlDcNqRODgJDlupN
	HiNWcySXh0JgaNhIMyUVMaITuZ7IWDcd1HYI7M9qunRlr2P+uZ/Y+HUL9kGx4gsgL/SA4RqJLyc91
	K5GpqnBDBqXPyvVrKJDnzG3uIUNZTw9t4Kwg64Doj3w7bZ4etbeQAgnpONfh3938Ef2PaVdzSCB33
	r0+UB7bStGsG5EY+ZIpiYfA4c/klYaP3lPHfZiHJR3L8LL9x+1X47PYGjv5al8YEPi45tI9vmLhAf
	KDXi6FkA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1gju-0000tP-Jw; Mon, 07 Apr 2025 09:17:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dsimic@manjaro.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	krzk+dt@kernel.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] arm64: dts: rockchip: aliase sdhci as mmc0 for rk3566 box demo
Date: Mon,  7 Apr 2025 09:17:38 +0200
Message-ID: <174401024398.372530.4282077768159194558.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20241221104920.4193034-1-andyshrk@163.com>
References: <20241221104920.4193034-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 21 Dec 2024 18:49:07 +0800, Andy Yan wrote:
> Follow most others rk356x based boards, and u-boot only use mmc0/1
> as mmc boot targets, so aliase sdhci as mmc0.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: aliase sdhci as mmc0 for rk3566 box demo
      commit: b6490faab67c4436abeddb5c9e1fb0e8791d58ad

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
