Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760B33C17;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577642; cv=none; b=SOuOGOKmx7iXG3qapLXoCiCparCwiTP+FdnhgNDSnyE6BxhSSEcKMQPMH9S+ccrDmqgJu9L0AgG2AQ4vPh26oAvixV8+1OTvmR8Yoax9DyBA/bCfuA5k8SHxuMb+DMPkB0DsFk4h/CEPzAcmFHaYsXtvPv5k65sxxShXd2sAWEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577642; c=relaxed/simple;
	bh=xj1/d4nkyU14Uz0z2ygXiCJS8S9VEH7Pg1iUVkAGGlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IHon3uJNfJ/bLRYb14aSP74wifns7hLqMh4lGSJGhBizQXZRrRH5b3tYuqKjZm9tyOPdqTwVEi+qrK3fvKzUuw+f3mOnUxG3nngZNtIE8KCjX0G8TRpYG8gw1XzrSZuoj4Bx5xPmjRVJ5c4T7kYfr5bqfBCMDn/fruKVW1X94Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gG9B1CfV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gG9B1CfV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03012C4CEE5;
	Wed,  2 Apr 2025 07:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577642;
	bh=xj1/d4nkyU14Uz0z2ygXiCJS8S9VEH7Pg1iUVkAGGlY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gG9B1CfVFllvDuBJWe8V1nJOgdTIR/tsbizq7MFPIho7I+7xEY1ytXgpeNPL4aLue
	 M2h27z2W+F5tBmFL9xVkfRyfXG+D+bE6m2J8apSYW6xb0FYZ7hgYzYnw9x7khvD6Z4
	 IyUxVpjxz597sgLO5NlEBvYXhpBxCy5SrbvZHbGiqDUXSQ0gyN5pHjqBr0uDDtRlnG
	 EJCUa7lL7EtwhB03CSPQvQRkVxQDRrblqYJmSfak9J6PX9eYjLML1dNWsi4PrDzusf
	 2YYKoXIDVb5G9WOU3PHoatGnBgxuiS3TNkaa/nb46Nc3PpNOvSCy11HQtXytuSJM0O
	 hTt8ziRiatjkg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27A5C36014;
	Wed,  2 Apr 2025 07:07:21 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 02 Apr 2025 09:07:04 +0200
Subject: [PATCH v4 1/9] dt-bindings: arm: fsl: Add GOcontroll Moduline
 Display
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250402-initial_display-v4-1-9f898838a864@gocontroll.com>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
In-Reply-To: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743577640; l=1206;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=7LK5io9tXyJrf5fT7pNPykcX/YAUSsMUIEqjia8Pbmw=;
 b=gune+2JEcYkR1VqNaOFoyYIz2P6K+I3j+1CGd3MWq3dAhDzOEm+MUvrWVL9TrJi7wd+fIJPFq
 /OWWSw4VBY/CB2iKDmR7zlq7IPSJ834t0EKzAnLjveyzwgC+/LUsHdT
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


