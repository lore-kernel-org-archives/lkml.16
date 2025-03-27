Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707BE19B3EE;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090759; cv=none; b=ek7b1NxRQAVZSJxpQKoc1+5p1uEk1f1QPf5VCE1xGvgfCb0Gcs2qqjpfNk4uopTs1qSHTO5o80fM6GynfP8pNvaUvWu4vFKsT+A/gFyHr+94rw/8Gj1cc7pkQeOlLmCtp19O21IwGY+hXra0+QWhJ5nJXXelN/QB3iH5LlnYiR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090759; c=relaxed/simple;
	bh=PzRZADRzEuijueVkCqt3ZlpSUYrgKBPKl6nIf/RYyME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oa0mHrZxh9MmGji8OJL7TJdWQUGpTjx5mWA6aNO/pt0IS/GMubi6uZUFT+AvNCzv0QZVcHbrhc0fNOTUzEmxkuvc7U1oozSgW2fI8dPPxgys5exVW1Y7LnLmce5uGjqVd5zGXNywDCliLGDgv2GdDsfcM9A7MEbzbyPL2CAkWrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzXYDf5W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzXYDf5W"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E59CC4CEE5;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743090759;
	bh=PzRZADRzEuijueVkCqt3ZlpSUYrgKBPKl6nIf/RYyME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bzXYDf5W0vuDYoXNM2nDvVThJh2vj/61892S+bDRQc1Ck0FJGXiBZgpAyQxm1M23e
	 kcwT5DU1LOnkRe2f94HmvzXHL9w3sREdMu9H6aZKTrUYYdkdBtrTaM3hUBDdFu6mkS
	 7+TU/EkanYnBQtLX4p/NSpvfF/xmH/x33xkXbU/6pfAnncOp5wXvJlhQxMXloyMddp
	 MyxF+PTLjZoUH/ynYWehpIB/zFoB6QFzjfV8f8k8ihBIk7zQx/bRaBsNwWQCqoD6Pp
	 UZrZxce2HD0WB8gFtYdsj4k/KEyvpkzE1eBjtRi9zE3iD8VZPfmMe+qqtol46nEyvo
	 FtkRdOqp6sBMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EDAC36013;
	Thu, 27 Mar 2025 15:52:38 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 27 Mar 2025 16:52:37 +0100
Subject: [PATCH v3 2/8] arm64: dts: imx8mp: Add pinctrl config definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-initial_display-v3-2-4e89ea1676ab@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743090757; l=1855;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=z8kax1Z8Rt5R5zrqgQhjYmqWGcylyxJuzA+qptS0r3Y=;
 b=MFpf0P1ysKsaRzFGmcUSr1ybUT56O1owbtlTS0l5JTJH+iNElla6j8L0WeAbV3oNF5nlGGkbz
 3GQKUKXpLwDByV4VwrV/LUIIoj4a2wAbtYmHSvNKftHKcM/Yo+yx3FY
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
register is written in the dts, these values are not obvious. Add defines
which describe the fields of this register which can be or-ed together to
produce readable settings.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
This patch has already been sent in a different group of patches: [1]
It was requested there to submit it along with a user, this series also
includes some users for it.

[1]: https://lore.kernel.org/all/20250218-pinctrl_defines-v2-2-c554cad0e1d2@gocontroll.com/
---
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
index 0fef066471ba607be02d0ab15da5a048a8a213a7..34a6d3090926b8d9d7c96d1b0b01be0ed05cbd27 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
@@ -6,6 +6,33 @@
 #ifndef __DTS_IMX8MP_PINFUNC_H
 #define __DTS_IMX8MP_PINFUNC_H
 
+/* Drive Strength */
+#define MX8MP_DSE_X1 0x0
+#define MX8MP_DSE_X2 0x4
+#define MX8MP_DSE_X4 0x2
+#define MX8MP_DSE_X6 0x6
+
+/* Slew Rate */
+#define MX8MP_FSEL_FAST 0x10
+#define MX8MP_FSEL_SLOW 0x0
+
+/* Open Drain */
+#define MX8MP_ODE_ENABLE 0x20
+#define MX8MP_ODE_DISABLE 0x0
+
+#define MX8MP_PULL_DOWN 0x0
+#define MX8MP_PULL_UP 0x40
+
+/* Hysteresis */
+#define MX8MP_HYS_CMOS 0x0
+#define MX8MP_HYS_SCHMITT 0x80
+
+#define MX8MP_PULL_ENABLE 0x100
+#define MX8MP_PULL_DISABLE 0x0
+
+/* SION force input mode */
+#define MX8MP_SION 0x40000000
+
 /*
  * The pin function ID is a tuple of
  * <mux_reg conf_reg input_reg mux_mode input_val>

-- 
2.49.0


