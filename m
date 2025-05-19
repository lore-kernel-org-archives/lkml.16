Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B0228850B;
	Mon, 19 May 2025 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671426; cv=none; b=Vi/fCWQq/8sv6kWW6Zp94HG9axeYBywoUyv+5pSQHNrnZ/77x8HZHDb7lN/ktP74eN71pUB7hTBqcBkC4yl5eQhW4rKNI29Pyqks7LqJb+U4KK/hd7OhneyDqEuRD1pmdx3ZAZXB8PwD5keUnmnE1nRr4U55t4cY+M3NSqEvzM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671426; c=relaxed/simple;
	bh=8sxquyspdPCwkWa3NM8zDtB7/EjrEfYBjRyNdR/FFIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D+PP6NhV0CDOGIodgn/Vaikk22zm94sq9SGJMuRSW3C3EqAlPLYOKg22SDCj70u8qqR4LCErW9tGc5RICrVQe8g65KYWmcpesjNr4F6IwBqChcCVsMrS+h9NMhokJl+1J0RD75zDRq94hTnmW0Towws1W8L93hA1OLcmP5VllSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fNaeEESm; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fNaeEESm"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 29C9E20E0F;
	Mon, 19 May 2025 18:17:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlFv5rkmXtdO; Mon, 19 May 2025 18:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747671420; bh=8sxquyspdPCwkWa3NM8zDtB7/EjrEfYBjRyNdR/FFIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fNaeEESmJ15QCe+enopFn6vJ6+3BkIj1kJ/9PDK4HMQKFn7Lhq8zUsPzs4KPrbM0c
	 nNsVGjaHuSVcKsGfYhHCKtdw7Bni+Xq1je2qzpXDCt1TzMSOcr6LLcrhT8k3u2ItN5
	 6//OHPa/qRxJ3UBZcKJVxtqDw9Z4TqQe0BXLPVJzcMofDXMgWvcZhQHbrwuI13p7dw
	 JEWrU/Cn8a/aTpJP1c0I0Z/lEyUqfjYz0M2RJjTilzRvVW/1/pm7lxWVRrvzgtaiq0
	 jtMZTZAw6PTcPdEilrBdF8R7q7w9ePtJWN452sDJxe/XlhMQIFBwlJwFNP+pZ/bsy5
	 ZMP6RuVNnTF9w==
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
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/5] dt-bindings: soc: rockchip: Add RK3528 pipe-phy GRF syscon
Date: Mon, 19 May 2025 16:16:07 +0000
Message-ID: <20250519161612.14261-2-ziyao@disroot.org>
In-Reply-To: <20250519161612.14261-1-ziyao@disroot.org>
References: <20250519161612.14261-1-ziyao@disroot.org>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 8cbf5b6772dd..268f72b047d8 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - rockchip,rk3288-sgrf
               - rockchip,rk3528-ioc-grf
+              - rockchip,rk3528-pipe-phy-grf
               - rockchip,rk3528-vo-grf
               - rockchip,rk3528-vpu-grf
               - rockchip,rk3562-ioc-grf
-- 
2.49.0

