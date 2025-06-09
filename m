Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FBA255E4E;
	Mon,  9 Jun 2025 11:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467478; cv=none; b=DeILwISFaVhYWKEw6j9vvShzX1vjv3DvlannVOCLpYVD0RHuDW0/JUYtMxdCFpgMYXXxagjv9suxGMSE/JQFROv2MlZLu9xU9Of4rfjKQdjqEnywrj4qnz+Gas0Mz4nYspG9MwZr7Ut9ys8SH01q0CG4HxCPBGJwCc3eEn7cFlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467478; c=relaxed/simple;
	bh=2HYhwoOhKt75va0EWw0LYFrIVbslkLkVS6cFPbTav2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MV2Y/gVwNp8p0qOUlqMMw/7SpsIiyRMJYCJ2qAs1BEcLK8Qdu9sXTq4B/oIvtbBQCFahOfXFPzCRWWzTE2/vZnk/+JYhlUKZXlVIQZhMH9C7/X1IaggFOgC3ACI+VPzHPe0gW2sR/KKNFJtwri3IgnxNomP4sLMlI4hE66qU6cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=LsanE9Q4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="LsanE9Q4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Jkdk2cmI+tf4XuI/p/OZj8CiZ22SFvFvvlSth/i8zEM=; b=LsanE9Q4OYhoH+jUUcTCuVKoUH
	ei9Y2ysD6pK2AjAMQP51Nd6bF2U+JZkxErJGAtmAoJYmoJ1Xyg4r3DoDazi3jPm283q5UNXI+c01K
	tb4Y7Yq8Z8LkfG7H7AXBJijXAQaF9copDxDokSHEw3Ins6QebA8Te32DdZheI5SuZ5eu0/hLqLnNo
	NX5TBHuoVEW7cbKTu28ZVohSFsyqRD6m0/MzzEin4jx9cRLENVd+YjEFwrTrAH4wsLiQMMawr9ieR
	5NbOqkdeNuArjkAJeRX0bkfgI8lv6CK7uQpcQeMB3BjMfsrBw+GawVPlD4r0efFpWv1YBXgnIYXaJ
	/Wh+VWVQ==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOaPD-0006VT-FW; Mon, 09 Jun 2025 13:11:07 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	John Clark <inindev@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] [PATCH v5 0/3] Add device tree support for Luckfox Omni3576 and Core3576
Date: Mon,  9 Jun 2025 13:11:03 +0200
Message-ID: <174946744890.771907.15442191334944143359.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250516002713.145026-1-inindev@gmail.com>
References: <20250516002713.145026-1-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 15 May 2025 20:27:10 -0400, John Clark wrote:
> This series adds device tree support for the Luckfox Omni3576 Carrier
> Board with the Core3576 Module, powered by the Rockchip RK3576 SoC
> (four Cortex-A72 cores, four Cortex-A53 cores, Mali-G52 MC3 GPU). It
> enables essential functionality for booting Linux and basic connectivity,
> with plans for future support of peripherals like WiFi, MIPI-DSI, HDMI,
> and Ethernet.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Add luckfox prefix
      commit: a6fed060c79971d528285e3e2fa5fbaf30abf30d
[2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
      commit: cae568ff88fd8f25d51e120c2de30b094fd5ad02
[3/3] arm64: dts: rockchip: Add Luckfox Omni3576 Board support
      commit: f244d596ebb34b819a5414f8f7d37180ab833233

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
