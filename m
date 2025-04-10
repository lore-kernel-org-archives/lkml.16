Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF29014F9D6;
	Thu, 10 Apr 2025 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296767; cv=none; b=Ao4wJNVRcHlP0at46HZkoXbr5SBa7Swagv9oElBIwz0OkNsHmyh1oWPiaf4V1XwDWFFgM7/bMp10BsDWtRaARt4OxAuIqNAEC2wfHyhf95GwxW5BLXiM5Qnih25LtsE6mfxlqyCKTXXvSpL45R7blE7ZpMptdKVWtrd1HXNddns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296767; c=relaxed/simple;
	bh=l73EoxNnjrJXpo0jliTZjC/NtXboSEruwOeXyFFteMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XoYmTWzZDGroGzgfNsUfckkKurQW3gxmD5wlyvfNWTvaWOD9ytWlr7LvTNEIxdBGZOhwKt6JRASrpo3Nad9NmT+JiMPz6aDOWO4dge5eCzWn1hPpWXsl0m/KyTTzMBw4WuE6G68t6v2S7a+N7LvX2PfVT6GdxBPndZjZCvAnYo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=G77x/r+t; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="G77x/r+t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=oPR5GZSRvxu16rwEBjKkd9y5335azxvaE/olKP0Je3U=; b=G77x/r+tt7d+nYmpy5n/BrYFGY
	TgGYU29oQC1E1hWaWmA+t2MxVNwINUe4ii4xPrwV7p2K27aLClNlJeMqKrErTB4POSvjA3ye5hEIC
	U1UQlKX0Zm1Az4xGoYRkiEyo++bf55XkrLpDu9CZWHoSTvPDyRwTMWFwWno6amILGuvjqXPLqlWP7
	oSlOOJ/gabRLa7qFX92fX1AFEUEk67fmiQA18aZakQC94K4WJYDH5nOHoCxA2u3blrwZ9KQTCYiV0
	nwONvT9uEJSN1jYJY+GX6KT6szb9C3VyaLxPQWvIdfhyevmsUJxPTc+8Q8r8S7VVDd/Z7MD1yHFx0
	EJnIBQag==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2tGj-00012N-2a; Thu, 10 Apr 2025 16:52:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: Drop empty init callback for rk3588 PLL type
Date: Thu, 10 Apr 2025 16:52:29 +0200
Message-ID: <174429674412.910874.4819823369489889838.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250326113556.21039-1-ziyao@disroot.org>
References: <20250326113556.21039-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Mar 2025 11:35:56 +0000, Yao Zi wrote:
> Unlike PLLs in previous geneation of SoCs, PLLs in RK3588 type don't
> require any platform-specific initialization. Drop callback
> rockchip_rk3588_pll_init() that does nothing in fact to clean the
> driver up.
> 
> 

Applied, thanks!

[1/1] clk: rockchip: Drop empty init callback for rk3588 PLL type
      commit: 646bfc52bbe184c0579060c3919e5d70885b0dcc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
