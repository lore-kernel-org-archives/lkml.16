Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C605F227B95;
	Thu,  8 May 2025 13:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711861; cv=none; b=ICMbmiRGeNDqbWDy82CPCQxy47m9aDfjDvaolsi0qcUv1UzGPXsZPUZno65i+KC1IpXSTRnwG7bEJ/tTq+O/Chtb53tmZfr06IzWwehD8P0gt9HEg3D5Y9smYGrUiYkSsRM+6wjg/KMMTXIZEfFyWwOocVeFixIfFII68tdRc4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711861; c=relaxed/simple;
	bh=Bts29gpmormYMpiiw40dTsk3CPEzuAhREl3fO/a0bhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=agoAE+y9dc9eamv277E99V37ogOI9QW1cRDyHVIsru1wfbR1A3UODzbadYsLbBMU+3rNMswNl8mylGQeAT6SIfqaxgPXnoBLPlM0eMn+2Sgpf5740jNJXNjX5qJKHmq9GI1seMIdl/e6Ktn8c8fcQs2slnFb0AEWmcTnnAfB0Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=hxMsVWH/; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="hxMsVWH/"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 331D1261A8;
	Thu,  8 May 2025 15:44:17 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0ftL8vfHQ2h; Thu,  8 May 2025 15:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746711847; bh=Bts29gpmormYMpiiw40dTsk3CPEzuAhREl3fO/a0bhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hxMsVWH//krLENW0kvD0VXRmaD6pjFu7DQdKBr2VItN8NAhemLQBmCsO95HgCWIkG
	 NJffK94nAyAZHYqwarXoRpgCq764LM4upiyR2yaYJO9061kbTeb4mQD0IzEisDqGat
	 eQ8pqiHFsrWer5GlXjwReNILlRFGA5KKHZTPkaFL9S8lFakQvTLafPCtM33vIMpdC+
	 tU+E2HVFWsbzqyoieLN4++TE4VeSMsTyIe3UMN8620YP7OV/kmdA4vosgaynPpRsSt
	 7pYa7ULEnAkNg5OOcniZ88PCGTtNg9R5wwpagskZ2HnCMKZdn7zf9uHGmiOho9rMDZ
	 WLOX+O957PObw==
From: Yao Zi <ziyao@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: soc: rockchip: Add RK3528 pipe-phy GRF syscon
Date: Thu,  8 May 2025 13:43:29 +0000
Message-ID: <20250508134332.14668-3-ziyao@disroot.org>
In-Reply-To: <20250508134332.14668-2-ziyao@disroot.org>
References: <20250508134332.14668-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for pipe-phy GRF found on RK3528 SoC, which
controls misc settings for the integrated naneng-combphy.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2f61c1b95fea..7e9321999435 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - rockchip,rk3288-sgrf
               - rockchip,rk3528-ioc-grf
+              - rockchip,rk3528-pipe-phy-grf
               - rockchip,rk3528-vo-grf
               - rockchip,rk3528-vpu-grf
               - rockchip,rk3566-pipe-grf
-- 
2.49.0

