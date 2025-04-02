Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF8B23315D;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577642; cv=none; b=pEdCaQrJ6C/RdOgudpyI3tUMcJyvei5kFJuteCQV7RsRSQo1SuIkcoIiOp3wNchBzo5t0rMzEwZHeELw1kWUvYQe6TwTAP7cPOP/3/JxpUAKTu3w5mBbDkR60cl/XtKvAdCpmCFQNunAOwX7y7BwEqDvINSCuAlWGo/MJRmWY6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577642; c=relaxed/simple;
	bh=4IGWq8kONdx8Xhp5mZ3r2W3pZwmJWa0C5jGrABb7mW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NobtDHdVUBCYHW8gY7iBsAfbKczhG2uKD2oJzkq+VPu95/r49K52efaCszGqiGEwPZYqrxwnrq+brWth9idw0NtdKHRyVRmtrFtgf8TCyDzy1Mw3VC90ovBoUMCi7hoVc1789uEwNR3CcWkbx7L1S2vFnvxjPM5G1DCvpT9VB6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/O3E6mh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/O3E6mh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CD24C4CEED;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577642;
	bh=4IGWq8kONdx8Xhp5mZ3r2W3pZwmJWa0C5jGrABb7mW4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e/O3E6mhp8oO/Whi3xEfGWjfINj0VVWR6e4dyBthDZK8g1xxzbzn1ArffFD95wqBz
	 Lh7oZJV6JMFmgwitevdLz6W9es9LYg3xhHJaJ9Hx7e/is7mvv1lVaBWWP82vqTvpTP
	 JO0YlhwXeQRq8aEnCOHxBJsE+oJXXc1B9OEDprJ1vMZ8TlPJ6vvYPQnCgzIIvkLDeX
	 8soBim5zvmzKE/1Y6N9jeJ3lU1y5p9NaZnfTsROIh7ZnsWuv/FyvCvPIdSaISbNnL+
	 zmbCDGmBElyUEDLGBISTuERqixX4taQ0BmbEiJrIdi2bK+jtnyukzTNjp7E4nyKryF
	 a9HqhzRTVEzrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85145C28B20;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 02 Apr 2025 09:07:12 +0200
Subject: [PATCH v4 9/9] arm64: dts: Add Moduline Display boards to Makefile
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-initial_display-v4-9-9f898838a864@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743577640; l=1452;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=DJFfIfqgbp2F9LatQLx7SmTKtl83KZxKW6du5QHFG4A=;
 b=cbWzSnDPRBr6SF0lOfGsuCU7LN31OqgF6hAzRq2l87Li8zvGVzMru0KBDKDLoTk6lJ6pcKcKy
 KcRSnLuEavVDtTFtFBq9aZTwAtJr18VtCPlBa3VhTsduAw3FFmLjfD2
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Add the new Moduline Display boards to the Makefile to allow building
them.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b6d3fe26d621234ab84353165d20af9d2536f839..fea25c7f997cda9aef73cd643f0f0279ee0bfffe 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -214,6 +214,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
+imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
+	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
+imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
+	imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb

-- 
2.49.0


