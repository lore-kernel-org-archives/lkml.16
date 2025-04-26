Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC911C549F;
	Sat, 26 Apr 2025 21:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745703989; cv=none; b=nyx3kgeTzbdzkD1Yema1+kUhmo6V3m/EGhNf6gBkDlNsWb/CfU1nTyKnLmNkx7JxqxSw6j0chlZ5A5zzUSagNZD9F25TKLs4FPJuX71yRupahEEPKcebapEEovYop+7P946I5vOGlxUhyfDwRysxcQj3oTinO4PwVyCRMHIpKa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745703989; c=relaxed/simple;
	bh=Ucqzgki7rXVaFgmOS9fr/vsC6l1Nmm46Df6AfU9HuCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OXohjbjrfv6OB67DL1Qm/L9UQWzPot5C1U/9OzBctnaAvRr6noBKi5Qftjxre01lUb9/wZkyHM51iPHFXIRwiqqN9A9Jg4IU43DdPDKUCu53LbHY3hSxczOEYdxW3ZDyekK1v7l+Ux9Tb+N30CQ2FRmX2DnJS0M/7Wgk8N01OpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=eLMEsN4I; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="eLMEsN4I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GEghm9KEzi4KEAVXKXRCeAyZ2hXh9Vd2xugtHnvbzp0=; b=eLMEsN4IxoTROZ4eRKiSlhdbEM
	U8OW5wX3coXicFzzeQE3UIJ3nE+ArgFtZyr5n6nIw993Ls0tapsHTuhc52xnFvk04E1jRXKaUKOlo
	c8LeNfEzLoTnUIWp4R0d2szx9/fLTnMX9W5NazIA7J8Hsf5KfhgqNOKnlSl99Y4w9ttzBNED5acnT
	UbSnV8x3c+lXxoyhszE8s/viNhlKpx9HyGledDNObqLFUTrgaIpYR/ydNSV6gnrt3LGWGck+sZBfn
	eUBuKuKaj9kLIaenSWPA7G0nY2LfDl6702gsCq5a1FLxlf0ylGbWQvwiHnONVFHmVAWkrUJnyJDZs
	/vO9S+sQ==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLp-0001OR-I3; Sat, 26 Apr 2025 23:46:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Add eDP1 dt node for rk3588
Date: Sat, 26 Apr 2025 23:46:06 +0200
Message-ID: <174570370112.31943.2977804072806541531.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250426071554.1305042-1-andyshrk@163.com>
References: <20250426071554.1305042-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 26 Apr 2025 15:15:40 +0800, Andy Yan wrote:
> Add eDP1 dt node for RK3588 SoC
> 
> 

Applied, thanks!

[1/2] arm64: dts: rockchip: Add eDP1 dt node for rk3588
      commit: abef2de3db010c79c584b8bffdb40f779fb7cb6b
[2/2] arm64: dts: rockchip: Enable eDP display for Cool Pi GenBook
      commit: 26cdcf6898894e0c27049841b924dab7c5bfe055

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
