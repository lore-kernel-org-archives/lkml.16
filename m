Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0BA21171C;
	Tue, 15 Apr 2025 06:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744700068; cv=none; b=G4p/LwXnj26VPWTlbdPLpCw8ycayVLSwL1FdgLPg/OX9OPSC8R1gmbTOkWmG2YjaY/ELlkcq0oOq22F7WDmlap8GsNkzOU9s3W/gjrUPpGP3rNYiGwQEqPoUZCCRWLlQDlfx1gJ5do+saykQ62+GGSWbGsNdf1fNlLcaBPzk3jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744700068; c=relaxed/simple;
	bh=xj1/d4nkyU14Uz0z2ygXiCJS8S9VEH7Pg1iUVkAGGlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GCwlYqDpK4UvbrgMDGpnPIDo7/TC6ZuK7t+E436mr+/NVrNoCqaunVabzGSwnz3+yqM+Dr2ozGRFyhFBn0Bfn2kWyUXXhazEk5QsM9HfWNnXPVwCJLPDO/zkkpAyaycgzk8X1L0aAaU3wZ1CYA+FoArYD7EnlyQcfAxKk3Ag/0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcA0pFHS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcA0pFHS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E37C5C4CEEB;
	Tue, 15 Apr 2025 06:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744700068;
	bh=xj1/d4nkyU14Uz0z2ygXiCJS8S9VEH7Pg1iUVkAGGlY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PcA0pFHS3ONR5KsMUsVVXJUR3F7Xsr6rf7BUYP868zzzuhGcLFTkCwS8WJn8c7q0+
	 xe8heMLwm1V4aMpJrVc6PMbC8SHt/+Lx71R0dzVixQEtv6+tyDWGx1azlSzD/C1Oej
	 Dl0tFTD3oMQNf7+PNrkjRbGE+oVzyc5IUE77m0GcMGzUH7XvshsEdXFpUUE6++5PN+
	 KZaJRCR+h0eueUfaD+yVvWq+4bttJL+qH43AS/S1InxcXWBhX13eLA5NYMvnqC1/dJ
	 7DVk9sFZfvdi9UDuEQY1w1LUqjPy9NctweMbHL80LeQcUyBoJ0E2veWiW9//mt94Qk
	 rq+pE490OoZnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DB6C369B9;
	Tue, 15 Apr 2025 06:54:27 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 15 Apr 2025 08:54:24 +0200
Subject: [PATCH v5 1/8] dt-bindings: arm: fsl: Add GOcontroll Moduline
 Display
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250415-initial_display-v5-1-f309f8d71499@gocontroll.com>
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
In-Reply-To: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744700066; l=1206;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=7LK5io9tXyJrf5fT7pNPykcX/YAUSsMUIEqjia8Pbmw=;
 b=ACiLF+8gGRCfbw7wNIsrQyjR31okP/EFz6jYkJhE9Irn3cvQ0nAW0nJATvJXFrWurXbpc/JAl
 MyI6Aj/fSxtDNEBweBCOLj1WEOkryULUPMxyZeOP9GXUKTLJEjEm6tj
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


