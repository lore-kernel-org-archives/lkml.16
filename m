Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723F022A7E1;
	Thu,  6 Feb 2025 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738839998; cv=none; b=ucrHXoaCltAPObEL8V5SmQMTBXCIvMIJzKyJWI2e4V9uBeeyFIbKce6nnVp4s/fyKGnNGUWtrQ64pPpwZH0vg4+dlGcCJd3bPpANRqs3yRwSN88hO7skIEhBfUxLOpVRtqIBYLUowbRco3eNnY6c9hp7Ku6eeeVlVBb0KLQg5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738839998; c=relaxed/simple;
	bh=424z3xeVy+hYuz4Bf4HOp0gRG11/ictunEFrBSj3B4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TjpRQEWg8kWBPF1df9yBRGvEgHZWYxqCFEX+FmiJYtlO+WYErSycdZDhuMvC0g5OSsUn8Zk874ieQr8IarGXxtb2ddnkX37RUW8zgmhvCA/O2mkSJmQa5vsQVWlOo6/o9Yx4oMvOzc9TrbzCXFs24mp6+Nz3glZb9dGBtPvJGbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=rSB9tvAR; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="rSB9tvAR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BWU+tBeptG5VXeLCoxZwXjDE7C354LH6yguqmZtkpdM=; b=rSB9tvARdrfa7BAdYcz4C7dS4j
	CI8hb2yV7C71BHBTL2D11wLUFi6Ijl70RQbIK4qqNJ1htZlpLHIZ2ZFHYcV6e0ZisApVIQuoMj5Od
	VErVjBcFatKQeyu4ln/5BXkqq+QOSib3kqGgzfihVXfzA9WUH3y8Qg2KVX04tA2S+M1nU/mE7CTYa
	USfWbNVK6e8VpBGXvg2hb/agC4cS66fXxkPtp7s42G4KoM5akCnnCcQWF2wk9IcmkYLvXzAKzpnfu
	aH+XMYRuXL/UpCzqipVbSIpD7lrj69MJ3jJB7u3b9b5j+tUUD7LS19znpksN2pJy/9OVA+IYh7GqT
	uHfUxHgA==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tfziG-0008NO-VZ; Thu, 06 Feb 2025 12:06:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v7 0/2] Fix label name of hdptxphy for RK3588
Date: Thu,  6 Feb 2025 12:06:18 +0100
Message-ID: <173883997040.679546.15610550275588618608.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250206030330.680424-1-damon.ding@rock-chips.com>
References: <20250206030330.680424-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Feb 2025 11:03:28 +0800, Damon Ding wrote:
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=927102
> 
> The hdptxphy is a combo transmit-PHY for HDMI2.1 TMDS Link, FRL Link, DP
> and eDP Link. Therefore, it is better to name it hdptxphy0 other than
> hdptxphy_hdmi0, which will be referenced by both hdmi0 and edp0 nodes.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: Fix label name of hdptxphy for RK3588
      commit: 2efdb041019fd6c58abefba3eb6fdc4d659e576c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
