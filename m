Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1C3433A6;
	Tue, 22 Apr 2025 11:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322284; cv=none; b=sECR/uUbx8S7WiUaBpMLve/0Q66JhEBDeefhkvKi9TFaorlpn15sFVWpAHw3NrSq0ZEJS8Iz6oAxBPYIHylYQdE8IbYgPRoOO9qxN4n+fi7l6473lHaNa4GXCz28xOFndT0HfSa7lw4zsv+LraJshLDARWaJuS/CeKtAXi5lw+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322284; c=relaxed/simple;
	bh=EdwYZFSFjLIu2qTKO0uo1rUfdkI6jb3DPa92uYe5N9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a4k8bNYlx+u5j8roPVpfQLbDmBH651kYfxWNSh6KzPjfEB5EHY28BsWxCauxGGizbQ/S1RKxwFz6+DZcOMckMOxPzgc8QAuLcf/iwl0v2QiU8QpYTlkb5udiad55nLS8Oni1Ef4XDbwYb1irEF+bszZj3AdCQt3kRpTZnnwsDtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=L2hb+1eX; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="L2hb+1eX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5ivL5Ti0Q3RhIMz3cs6p0pT2tGV00FkMsE3PCGA6DQc=; b=L2hb+1eXc4+jkulhn4CY7JiPMu
	dv9x9FghMf2tSeBqEH85SPHARyjSF9XKCJA8JiXIYah9w0bTIIlvzvyZwZzSM/kwuzasuXY8O/0Dp
	QzP7IrR9igpe+w/YeDWKiXAmU6Ofkm6f7EdEX4jNFtXMqEBDymsAbx4aWmcshTPa4ALGuIUEYY35i
	V4p2YZF6JZZlxfqHXwVFORF/omyAugz7mv+B/0pssUNdlPtyAjZpGU3FoGmQrKyc2k0KAlXWQtDjU
	Cw1K0WD1IP19Go2evvzV3L55EUCxQLU28zARhbgSC+lTZMmrtAdyjpnFElcZMRhRdoBnX1ch6aDyg
	7MLaueIw==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u7C3G-0002kK-9A; Tue, 22 Apr 2025 13:44:34 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Rename hdmi-con to hdmi0-con for Cool Pi CM5 EVB
Date: Tue, 22 Apr 2025 13:44:22 +0200
Message-ID: <174532226020.263993.13170766558495320938.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250419121326.388298-1-andyshrk@163.com>
References: <20250419121326.388298-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 19 Apr 2025 20:13:16 +0800, Andy Yan wrote:
> There are two hdmi connector on Cool Pi CM5 EVB, the current supported
> is hdmi0, assign corresponding index to it. It will be convenient for
> us to add support for another one.
> 
> 

Applied, thanks!

[1/3] arm64: dts: rockchip: Rename hdmi-con to hdmi0-con for Cool Pi CM5 EVB
      commit: 99685162462c2c70f9e2fbe06481a84a5d0220ca
[2/3] arm64: dts: rockchip: Enable HDMI1 on Cool Pi CM5 EVB
      commit: 85e3fd37204a79e0cd3105176081439ddefbd3b2
[3/3] arm64: dts: rockchip: Enable HDMI audio outputs for Cool Pi CM5 EVB
      commit: abfe411af85aa6ecde580b1f75b9c8145b635fa7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
