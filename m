Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7008C22B594;
	Thu, 17 Apr 2025 10:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744884850; cv=none; b=JO00QvkiaJZCrDuo0moK0QP4XQMkfEi3i7wH++onEwPt/e9rBJOdcdXUvgl+jyEPwsVFkC/eFZXkYZ0ev7QXZRyuaqJgoMLatwVUHg5aIrHMCmRCSxIOjZ9icq9tfU7YR5LZKTQL5oAiDS9Z9wEOyTD+whvMa7Y6wqN0oKAUyGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744884850; c=relaxed/simple;
	bh=6Ng+hdOoNno07pilCVpRF8PT7c6ejjDq52moQll8qjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kN4lsEVg0nHuslYuWDuAkl+hEqwDxa9FjzSsZhST6YfZeQzu/2L2laj+OMVrTGx3IHpr1Inp6ShNsSlJNXrrlu4cjSyJcj6TdqisAs/OXMN8g/K4DkychRDQ87dm+QguvGJJQq9aESY006SFglDj29Ll+CnKetGi9C7UJKtwJoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDM3rGhe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDM3rGhe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6893C4CEE7;
	Thu, 17 Apr 2025 10:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744884849;
	bh=6Ng+hdOoNno07pilCVpRF8PT7c6ejjDq52moQll8qjg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MDM3rGheKEd7ZBQQ+GFUj2mQHHr9IYfKvyriw3gNogHemj5n3Pfbjt1iKPIxQTb9x
	 ukfiSndhUn1LasmsqJ0uC43sR3RZgtHLWWsGvtNhnQpzJHs1820bOS+HUhl03uo2OW
	 u82JytCmf+fHDlceGq2JHJiDyvtbLqE0KoovMbvJWlS/YpesfmbYS4Hnj+PQtZj8GR
	 g91/ErVKiyg1SbjnMdMtCmfrgcVs76/AXG2zx8WJN0Q7IrhJ0yiShQlompY1htquAV
	 deBEYOSOIdfwWkcxSHq7elrSLEWmBprfNLmYfhUIDhoRQzAueKaQzQFUPz5ccIRO8x
	 FcDwZLnrksj+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B41C369CC;
	Thu, 17 Apr 2025 10:14:09 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 17 Apr 2025 12:14:03 +0200
Subject: [PATCH v6 2/8] arm64: dts: imx8mp: Add pinctrl config definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-initial_display-v6-2-3c6f6d24c7af@gocontroll.com>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
In-Reply-To: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744884848; l=2170;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=mrxqwhYhMzGSTJWlhyHKyT15kZQ0Bh3K/pqX9Brfdms=;
 b=Duiy2FJpf/467KoOQuvL2ZRGwF3ccD7XSuco07NCbofgNjQSHqDt0ApsBjczMoS0J1GMuriWm
 coGJkzMWtGPA2lFHwjzBO6RCeR5Dv/BDgyJe564/qeUh1yZWlfo1xsb
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
This patch has already been sent in a different group of patches: [1]
It was requested there to submit it along with a user, this series also
includes some users for it.

[1]: https://lore.kernel.org/all/20250218-pinctrl_defines-v2-2-c554cad0e1d2@gocontroll.com/
---
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
index 0fef066471ba607be02d0ab15da5a048a8a213a7..19a23d148246f4fb990050a9d06d20b6e769f254 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
@@ -6,6 +6,39 @@
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
+/* long defaults */
+#define MX8MP_USDHC_DATA_DEFAULT (MX8MP_FSEL_FAST | MX8MP_PULL_UP | \
+								  MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+#define MX8MP_I2C_DEFAULT (MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | \
+						   MX8MP_PULL_ENABLE | MX8MP_SION)
+
 /*
  * The pin function ID is a tuple of
  * <mux_reg conf_reg input_reg mux_mode input_val>

-- 
2.49.0


