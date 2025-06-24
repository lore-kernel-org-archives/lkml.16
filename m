Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50511E104E;
	Tue, 24 Jun 2025 03:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750736279; cv=none; b=efm0liNjjyELPSiqFedZ+Vk1z8qWZ2RW9wzKd0JCqtYtFki5rEc9TOucIdAVCkcPNTsHmguQZujumnftQKWa7+/CVodG7IHZWRi1yCTHbnDRiUtAFJurR0xYi2pFWFJ5dRLxJVQ5++kVzWBIm6g/mLCEoznVK8+H3IcnqgLk81E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750736279; c=relaxed/simple;
	bh=utj6oBPEshKFYwO2HO/ggqVFO3Kb+yCOYzljkrGuNps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9Y/soAZ5zmHnImgyN1MPMSbJvEtKSE5VKX3MiJw2Ba+O1fytd/K0+vBAHwsn1xKQStgilAg+4PYuExKBC45Vo0xAW8VjjgqS3i1782hGdGE6tnLNELowXwmDToRx1aF3786dgEfgWN6uSOWgf35PyzP89ZAZjguFHJLLpFabek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=cj8iFtp0; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="cj8iFtp0"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2DC3025C70;
	Tue, 24 Jun 2025 05:37:55 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heJSJyhvlytP; Tue, 24 Jun 2025 05:37:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750736274; bh=utj6oBPEshKFYwO2HO/ggqVFO3Kb+yCOYzljkrGuNps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cj8iFtp0URBtjAOERfABgOSKtzq7oUscHvrpNVl1OEAHDQzVlT4hv5XFUyRrtQMmf
	 NJDR0n5Kem4lZ7zenOubi0l1yNiqrheS+ddPtbOSrdGHzmEThlYV+KOpxrF15I8pQ5
	 BTGxqDkFuxYZ8uuW5hRwciECaIDG1qcyQm5e4KYkyFpVU98Y/5/AkXpMm4zxDDtBIN
	 AUcdUP8zdi/pY/E0p6osVmEyflJDChaSSSrcX/SsTtklOq8U2gtHj23qWb4soxVl/x
	 /ing0fQl16HAHj3zWelZ80GPR2RdcGgF/oJCPPm7gf6YVrOyyhNLotDCgGz4ZFoIxT
	 zoz7nZN827cQA==
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
Subject: [PATCH v4 1/6] dt-bindings: soc: rockchip: Add RK3528 pipe-phy GRF syscon
Date: Tue, 24 Jun 2025 03:37:28 +0000
Message-ID: <20250624033733.50197-2-ziyao@disroot.org>
In-Reply-To: <20250624033733.50197-1-ziyao@disroot.org>
References: <20250624033733.50197-1-ziyao@disroot.org>
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
index ccdcc889ba8e..8ddd963838f5 100644
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

