Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1848A25C6F9;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722894; cv=none; b=REuvTL2VlFl7kyriFva6ETwPmaod/y5o7+BIRgvIa8+Tj/yPoAdoCZUJOjvolKTe9T/R7RMTWAKLBNOub3HJrO1n1AQO5cVyDj43ER1S5y2WjfFimy0g+tzLeRUitzMBQwl4pB8SXHwGDAs3lNKegd5wkx3zNVIenMmVKR5hoSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722894; c=relaxed/simple;
	bh=xj1/d4nkyU14Uz0z2ygXiCJS8S9VEH7Pg1iUVkAGGlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uHiZoAzuRp8s3kwyR9PzOEROX5ZZenoU5xi80OtyMS3eaDHPsfjuGQoi2aRSTeeLQINgWz5bARr3Qgq6jj3Z5t28M6CXeCWff1EczRi50AEw0s+Wuk3dOFkRc6vQCdURMerUcgAh97Ywm0xiLvTw6rzxkLs9dUZGaoXwBoL3Dq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KilYpwdG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KilYpwdG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 918DBC4CEEF;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747722893;
	bh=xj1/d4nkyU14Uz0z2ygXiCJS8S9VEH7Pg1iUVkAGGlY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KilYpwdG18NBtpo1GQlMo5gyKIVpDIzKGHGuzh6ZcbSFh31+nPdoXJZyc0jE4SAgP
	 nMCtvWhS797w9FvvEtL/oT+zuG35zTmS1PhIhZwXt/dVEsP236LRfz447O3ORmuB0e
	 wuFPqRcILoO+/b6C7JXQImMuYEQCSkNLeosmVExQVGgCCFyqi0B7KF0pcjJoeHfWMU
	 5KP6sG/9VYDR4u/GcZR771ik/pSotk7P/r84fA46rQ6GWqnImR0ulp/vhHw5TU6w6F
	 SP3uApiQNy2DGajiyYqdZwcxEE39Gb1Bs2iaBTYXPnLYHltLu1o1eWvi9zSauzvNoZ
	 gAgPttk0R020A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C917C3ABDD;
	Tue, 20 May 2025 06:34:53 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 20 May 2025 08:34:50 +0200
Subject: [PATCH v7 1/8] dt-bindings: arm: fsl: Add GOcontroll Moduline
 Display
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250520-initial_display-v7-1-a8f0195420aa@gocontroll.com>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
In-Reply-To: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747722892; l=1206;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=7LK5io9tXyJrf5fT7pNPykcX/YAUSsMUIEqjia8Pbmw=;
 b=cIHZnnDGBjVlYMnVnr15Baq4iQ5GbRfwYKNbHYbdVGdz2NiZmnj/8g7K+USmDmACK1Wfw54nU
 9mGdbQk82PJCpaLR0dm6eiTs9UOtXpmvbvshhKjgsbXkThhhe4ws8Hl
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Document the compatible strings for the Moduline Display controller.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a22e49355dd1f932bf3d84cd864b5f..ecde2123ea0fae38ef233929c7ad343812851a58 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1095,6 +1095,7 @@ properties:
               - gateworks,imx8mp-gw74xx   # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw75xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw82xx-2x # i.MX8MP Gateworks Board
+              - gocontroll,moduline-display # GOcontroll Moduline Display controller
               - skov,imx8mp-skov-basic # SKOV i.MX8MP baseboard without frontplate
               - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revb-lt6 # SKOV i.MX8MP climate control with 7” panel

-- 
2.49.0


