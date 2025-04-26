Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6E21C3BE2;
	Sat, 26 Apr 2025 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745703988; cv=none; b=Aq6mSrsvjXcdGZKI32+S3UfjMp3rkLzCyWH020aUEj1FMPlGQuyzimDQmXjP+70GAQJu96cJ5JQbbwS2MQO6GGQol1aqfda3DCpzHJcrXHNiqy6FrJb5p2zs5Pwsj5WBjgYw8Uumrfa2vtMoMaw1PSyzmZDJD4/eL/ZzawDWBXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745703988; c=relaxed/simple;
	bh=J8h86/12IPiidVEXvsbB+qEPf5663lCxTnKk8rXApOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWnh9OjwNCOIuy9qU3aHNCkt+UFYSt2uyjv5KJxUrj+XTEBYN4Yqx2+ZiedDYOzd7NNQlPJyqauyap+Qi2p4k4IkrAlEevnFXAN7lCTeIbj8Kfgk8H+FrdsZ/xPE/wLefNUQmM9EDBWk4enXYThnmvbLvCwAncWhe55H++WFoaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Buawh5+b; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Buawh5+b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=JE2UPcOj432rz3CwaH1lESlLqaPq8YS2nPPAFqBdtDc=; b=Buawh5+bOuQGVZTBEWc5m0nIzj
	3y+TjDkxOU1dKe2cJlqNg7LgJZ7qz7Y12dLQruqMKvigAALjI5eFwcGwLUoyppncpd7CZaxJdAsqf
	3A2oRWpDhWjVerWODWu/OSogyg69L3aFUH4qkoHzLzDpORbBWx4h/ChDThm1JaSlAGzq+OT3wFOUp
	8yOLlW/Xt45pAd1gXF+OrGzyZyqA2cFreAtZWG0jPv6oQ3ittZ2pFGVrhWN7ZfKl6dzU24kSPVMyJ
	VFW2r28PQ0T3Atl/rVIWfIzb7681twsHwYrhSlJvLsoaaboi6S+HjZrRvUj3hszyiZRqbOBxMPtXX
	LVevX+nw==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLp-0001OR-5u; Sat, 26 Apr 2025 23:46:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] clk: rockchip: rk3568: Add PLL rate for 33.3MHz
Date: Sat, 26 Apr 2025 23:46:05 +0200
Message-ID: <174570370121.31943.11182147025111665944.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318181930.1178256-1-anarsoul@gmail.com>
References: <20250318181930.1178256-1-anarsoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Mar 2025 11:18:51 -0700, Vasily Khoruzhick wrote:
> Add PLL rate for 33.3 MHz to allow BTT HDMI5 screen to run at its native
> mode of 800x480
> 
> 

Applied, thanks!

[1/1] clk: rockchip: rk3568: Add PLL rate for 33.3MHz
      commit: 3cb09de48f652abd662b436b23f914d3eb66f1fd

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
