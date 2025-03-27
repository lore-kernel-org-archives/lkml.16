Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70774190692;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090759; cv=none; b=GR9dyjFpB5Bs+t4ZMbeqrYA2jLb4SDjfsK1wYCAm3osnASQK5KUzfQi/Gb5JpImUTTLgHF0h9V9seugdcNilJf3g/6wbj/1qfE4BYsXaDl1/N/ytAXUunSHN+TGnNPcpsTHQiiU4KxjfE4peq/Te/RLVW4FixgVArkQU7951EKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090759; c=relaxed/simple;
	bh=xj1/d4nkyU14Uz0z2ygXiCJS8S9VEH7Pg1iUVkAGGlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgyCMEm6KDIsM1P++VqtG/rmcxqiLjYIblHzWlItTGddbdIZVBVOgQmQp0Ch5qK1e8LoECErbY7IsD3ijRGDPcKgJxehO1f2ThAHH9uGBmaEPk99scwyKwSdHlY6i3koqH/XoUNlS5xzQkwPxcKFO8vcy6ZR8t9B9K3+kJrqq0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWCIJNeR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWCIJNeR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F383AC4CEE8;
	Thu, 27 Mar 2025 15:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743090759;
	bh=xj1/d4nkyU14Uz0z2ygXiCJS8S9VEH7Pg1iUVkAGGlY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KWCIJNeR6lDuePraK3O1cPSaZLP7G7Knsk7m4Ltov64ZE/K/A5MY0Cvhyx1sLKTTW
	 HDufXnKWVsJcp9/4A67eSlf0kOy2BAwLU7Exa+7qDANTxZ1ajjEkZdZHPD+8AuoYG1
	 EwPHlFXw+iCriiuwsUirwiQe7VICG8jZG/AmBNfBs7A+vavftTon5z80o7+lBb6LbN
	 QnNNHG6mLPnV8jyBg6+5dY6Av4nbw3vXmiuDjEP5BbyOLGMyKymIsn1Ii2Z5vIq9/t
	 C99tPZWjH+cnkvx/0G7EmIQPjmtZn61ApFQukGpqSOK6KhBCNzgwE9BNRJSH5U0BQF
	 0S9/gZs+Rv9QQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEE8C36010;
	Thu, 27 Mar 2025 15:52:38 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 27 Mar 2025 16:52:36 +0100
Subject: [PATCH v3 1/8] dt-bindings: arm: fsl: Add GOcontroll Moduline
 Display
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250327-initial_display-v3-1-4e89ea1676ab@gocontroll.com>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
In-Reply-To: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743090757; l=1206;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=7LK5io9tXyJrf5fT7pNPykcX/YAUSsMUIEqjia8Pbmw=;
 b=Ci9zEyHGluWtFXDpsIS5IxH7Uq6QR2lofbpjZgcJjYhQfKRKhDKVnPBOMXIS0Y82m2RTYDjOl
 a0oz/fkDTq6AhV5Ddbc2sBre0Do9g/0XdYegz2yqWBIqwmlZIa7JnGt
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


