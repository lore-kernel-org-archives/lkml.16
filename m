Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5EE36C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655898; cv=none; b=mZ7golr7BTSaOjdWjaeP28XykrIStsfRiSRGIx7eh2bTOU+i1DY0u1DW+/ew/kBCOc4lT2pwxgmvRmezJUjLEoBPdbTLfKYN3HlLMCzXa/0BdD7eYmfaXIvi1qCc4sf2TTXo0HSBAgkwa02tJJTauNcIL3LWd+ITWQH9t1BVHJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655898; c=relaxed/simple;
	bh=r+iF3izejEPWqub3xdXanhY9VniaYErf76Hvzp52sm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SjPUMNPwP4S8JdHCf0PZorgH5yQ9OTcx9SC8t+nlMsviP6kvAea3zvjFc0YICPhDRVDPC+Bjvwrb7SyaUJaG6RZm9OeJBI12PA/QQFjNjjDhAnOVzsH3xjmI2XCo4wmUM5mOP8mkbjtQtVD1G+LkXWmcaqlrDFnE3aObCvMtxLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=cn7+C1QM; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="cn7+C1QM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=IW26hhDBDO/5nhHJsjCd5C+mJJ7oXEkd6pqmTxSFoSo=; b=cn7+C1QMnlYQiLauPpu1bCkvT8
	rxeTVFsbpTj78EfGta10MmZKCUZWIVZxCL+DApimzG6F0AtY9W9Dq69sUcpA/vDdVzqx/VTg4kfbY
	udvnXyU5Ja8Ezzsryok+e8SMOXdzi+JWWHhea+gEZzvCpNFlnr2oevOwo7lhkQuJKORDVy5O71FUc
	3hpMs6pdxX4SoqnnUkripXBHUMh+AqzrigAWHc3w5ipW/ktIq+65KdIDA3r7td5hmM/UHyIyRKxkr
	vrdk/r2NSkgstIWBL7ojhU1aOUjBgTa0u5aNR3AmqdQW2kK0lL0bb4Lc2DpOcACYnW+7RSKt4JmSn
	lJJSJAtg==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u4Ogz-0000dZ-Lu; Mon, 14 Apr 2025 20:38:01 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Add HDMI support for roc-rk3576-pc
Date: Mon, 14 Apr 2025 20:37:45 +0200
Message-ID: <20250414183745.1352470-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable HDMI and VOP nodes for the roc-rk3576-pc board.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../arm64/boot/dts/rockchip/rk3576-roc-pc.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
index 612b7bb0b7493..d4e437ea6cd86 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include <dt-bindings/usb/pd.h>
 #include "rk3576.dtsi"
 
@@ -54,6 +55,17 @@ button-recovery {
 		};
 	};
 
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	vbus5v0_typec: regulator-vbus5v0-typec {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -258,6 +270,26 @@ &eth0m0_rgmii_bus
 	status = "okay";
 };
 
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi>;
+	};
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdptxphy {
+	status = "okay";
+};
+
 &mdio0 {
 	status = "okay";
 
@@ -734,3 +766,18 @@ &uart6 {
 	pinctrl-0 = <&uart6m3_xfer>;
 	status = "okay";
 };
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi_in_vp0>;
+	};
+};
-- 
2.47.2

