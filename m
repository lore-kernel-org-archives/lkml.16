Received: from mail-m49230.qiye.163.com (mail-m49230.qiye.163.com [45.254.49.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BAF51C5A;
	Sat,  8 Feb 2025 02:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738980199; cv=none; b=bSVtys0nyQ2rzsGl+6aLmQQKlahXQMnWlWrkp1RiGxxEaup6U6TLDAjowGe2t20+Ymdu4ODQEldET8yUpw96/W6gKozmw4QgUMiZe9hRryygpModxp8VkY00DRLQW9Wap3pMIV6DVad1p79/CHlkIjfL/CKKLe9gstNsHzVVwWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738980199; c=relaxed/simple;
	bh=8GF6YKI9AWbpPELpurdoUFOUVSq0wrthPYGfFTBMiHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ZbOqqh4ctnl6aYriR17OsKvzLo3NfFN7BT8n69uO6qqKX9v6/N/FKBom9wvss5XDJvzTaW9V4amCTq2Fp5oYyr0CasAogunAzTSjyq4dcBbABGRRGdFkTZvD7cCHc2JuS9R0SwWY6FvySHufn9SnwoSeBVUkAEquBSoLpwYCVgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=XBoyJNpf; arc=none smtp.client-ip=45.254.49.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="XBoyJNpf"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a75a6bde;
	Sat, 8 Feb 2025 09:58:05 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: jonas@kwiboo.se,
	kever.yang@rock-chips.com,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] arm64: dts: rockchip: Increase VOP clk rate on RK3328
Date: Sat,  8 Feb 2025 09:57:57 +0800
Message-Id: <20250208015757.27594-3-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250208015757.27594-1-zhangqing@rock-chips.com>
References: <20250208015757.27594-1-zhangqing@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkxNHVZDQ05DGRkaHRlPHx9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94e347403c03a3kunma75a6bde
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCI6Qgw5KjIQQwNOFxUSGS06
	ODVPCklVSlVKTEhDQkxCQ0NNSUxOVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpOT0o3Bg++
DKIM-Signature:a=rsa-sha256;
	b=XBoyJNpfysrNkHeYlKIJtZfd3lX2RtFrsvjTR6b+hw5/uS9bB9Jwi8i3bedCDBc4vKJcGq5FcYV/MEiY/YZhz+x/2Em3VwmzDgwCGJFIgwiXUj59qOvZiR6JoKbSa3zzhWacFBGCokE6cH/l96f1pXaZtTSgUIuapdkDBXLC564=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=2CAH1dcXEz2+VFXon/oNdlFEefOj5kJXA/0Z8pEycdA=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The VOP on RK3328 needs to run at a higher rate in order to produce
a proper 3840x2160 signal.
Change to use 300MHz for VIO clk and 400MHz for VOP clk.

Fixes: 0f2ddb128fa2 ("arm64: dts: rockchip: Increase VOP clk rate on RK3328")

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 7d992c3c01ce..0c905f411e92 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -842,7 +842,8 @@
 			<&cru ACLK_BUS_PRE>, <&cru HCLK_BUS_PRE>,
 			<&cru PCLK_BUS_PRE>, <&cru ACLK_PERI_PRE>,
 			<&cru HCLK_PERI>, <&cru PCLK_PERI>,
-			<&cru SCLK_RTC32K>;
+			<&cru SCLK_RTC32K>, <&cru ACLK_VIO_PRE>,
+			<&cru ACLK_VOP_PRE>;
 		assigned-clock-parents =
 			<&cru HDMIPHY>, <&cru PLL_APLL>,
 			<&cru PLL_GPLL>, <&xin24m>,
@@ -852,8 +853,8 @@
 			<0>, <24000000>,
 			<24000000>, <24000000>,
 			<15000000>, <15000000>,
-			<300000000>, <100000000>,
-			<400000000>, <100000000>,
+			<100000000>, <100000000>,
+			<100000000>, <100000000>,
 			<50000000>, <100000000>,
 			<100000000>, <100000000>,
 			<50000000>, <50000000>,
@@ -863,7 +864,8 @@
 			<150000000>, <75000000>,
 			<75000000>, <150000000>,
 			<75000000>, <75000000>,
-			<32768>;
+			<32768>, <300000000>,
+			<400000000>;
 	};
 
 	usb2phy_grf: syscon@ff450000 {
-- 
2.17.1

