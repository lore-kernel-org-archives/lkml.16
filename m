Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202A91F3FC3
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433592; cv=none; b=Ov+OHzmGaFVqtiXu0yB871wifcgFPBSNTv5KK8WI+AmbqI6plrFD5NSzoJnnv9/4ztPPt/DEFusJwrftHgAl2+1Jsf1zRC5hj+TGfxw2AiS8c5mGU44CKTW/WF1yQOFBhof72yCZRXOX59UkozpIdr/law5LlRL9wt5UtQJ3grI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433592; c=relaxed/simple;
	bh=z1SvM46L+xrhbg9nFj07gbhtosZG21c9G2bsCHhv7a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oa/0WdyPLQfO7FmcFTY9MnVs9GAvf4tOfJddvEuWvIZ5t4nwDHCWnjSnkW4iF325+fztvU1lYdahotV3a8fPwaiQZx2oxfJ2IEl4NmU1J4q2yLii9pZmhSMH/m+z0Kg9WyZdDHSY0ZxG9JcLO291blVkNSBB8TTP8jN+e5Xd30k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=hYanNWuJ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="hYanNWuJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=tcKn5fgFgJYMW14/UIgbAr3xvSOFZE4UOmlwvYcTvq4=; b=hYanNWuJ8wYGOLPdj9w8MvI97U
	oFD0l/S82Fcl3Z/UiZBTtWBsv4YWaMxg+ql4Y6YjO8Rc3IqJAMZ9DzV/nT0iEUeD7IMeOiOw2JHlM
	CeL822WY4z/f4dhXzJdGnZJq8Yn89ynJTdhJh9nNBAqwu1gSs7V7ReMRWSN2taw/n5wJbsrpBe6TR
	2KOsSLARZYWYua0MGVr0rMqJDEy2A3L6ARnnTcZoDps5vMYpCPEEpr09tKA+Z/f4wukjdkgG+spmJ
	W4x8yG1CnMdUIlaJUQ41ugJCHyBq4gP4/+ZyOthDip1b7DCQ6WDfh6DZNkCc4/MU+Sv0YLNuI1xMw
	BYoJDPjA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBr9h-0001Ho-3f; Mon, 05 May 2025 10:26:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Some graphics enablement for the ancient rk3066 marsboard
Date: Mon,  5 May 2025 10:26:17 +0200
Message-ID: <174643357078.1204535.9408600816388349176.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503201043.990933-1-heiko@sntech.de>
References: <20250503201043.990933-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 03 May 2025 22:10:41 +0200, Heiko Stuebner wrote:
> Enable both the hdmi output as well as the Mali400-gpu.
> 
> Did this to test a patch converting the rk3066-hdmi to a bridge driver,
> for future improvements, so it'll be nice to keep this around too.
> 
> Heiko Stuebner (2):
>   ARM: dts: rockchip: enable hdmi on rk3066 marsboard
>   ARM: dts: rockchip: enable Mali gpu on rk3066 marsboard
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: rockchip: enable hdmi on rk3066 marsboard
      commit: cb2a6738f33c3a9da7d1c0afa9ea5e9d78282eaa
[2/2] ARM: dts: rockchip: enable Mali gpu on rk3066 marsboard
      commit: c895c32bf1ce90839fc525c5d23cbf867ebe519a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
