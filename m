Received: from mail-m49224.qiye.163.com (mail-m49224.qiye.163.com [45.254.49.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DED7404E;
	Sat,  8 Feb 2025 02:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738980204; cv=none; b=SrL9ioBGnnktxq27vY1Zqv+GE90PEtqMNYqDj/PaO35VGpOl9ok1XhO4asOPIg5kVTjZNN4j/rjLgKyRl8xJrB2PbKAo/cqhCJPKtnlT45+19vmGfj8sszK6SuS7RkxeanAJDUFTaKoeubSjDzY6acEzhNKRf6odzyt8zR4e/DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738980204; c=relaxed/simple;
	bh=s8l3HefDQMaZ/E1dda9TO2+Txx+Xu+RnIBc0/hiweVY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=rJ0cOt+ilHwKeZVj/COpvgP+Ew0gKPwVwHRxy9twPGJsJeP9IJ66tj6mh+M+10GE8hazLagPwRueXaBVucZ8l4kTCA20vPy4/DAl8SCaIEffWtv4iQnkP8tdruUgoe7PZbG6oD/jHyglMNCmrRYrgIZZ7nhMKjVxBNe7+JTpkU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=HxJU5kXP; arc=none smtp.client-ip=45.254.49.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="HxJU5kXP"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a75a6bd3;
	Sat, 8 Feb 2025 09:58:03 +0800 (GMT+08:00)
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
Subject: [PATCH v3 1/2] ARM: dts: rockchip: assigned-clock-parents to SCLK_HDMI_PHY for DCLK_VOP
Date: Sat,  8 Feb 2025 09:57:56 +0800
Message-Id: <20250208015757.27594-2-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250208015757.27594-1-zhangqing@rock-chips.com>
References: <20250208015757.27594-1-zhangqing@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhkeHlZNGBhPSx4YQkMYTk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94e3473a5a03a3kunma75a6bd3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NT46FTo*MDIKOAMzLRc1GTod
	SzAwCh5VSlVKTEhDQkxCQ0NOS0tCVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpLTUk3Bg++
DKIM-Signature:a=rsa-sha256;
	b=HxJU5kXPCmv20Zdv+c8H/IC0fdfKgi92QMqlC2TdyZAlFH9g3d7PgHqURZfRkhf66olBJJLN8xVdT4qWNQKSzpjKGPPfg+Gf/J5fSvIb9p6Z9zZMhECQlCfRQk6Cftp2P1qma1vDjRy3cTdHgcqc3l6gu1y+x5GqseDTRVzrwWE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=AhpGst6hKXGQbjeWSW8bS9c9yfKTvuFhr/lnJ3XcFNU=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

If dclk_vop use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT
we should assign clk parent in DT to make it extra clear
that hdmiphy should be used as dclk_vop parent.

Fixes: 1d34b9757523 ("clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228")
Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 arch/arm/boot/dts/rockchip/rk322x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk322x.dtsi b/arch/arm/boot/dts/rockchip/rk322x.dtsi
index 96421355c274..2eb3c6611e59 100644
--- a/arch/arm/boot/dts/rockchip/rk322x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk322x.dtsi
@@ -667,6 +667,8 @@
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_VOP>, <&cru DCLK_VOP>, <&cru HCLK_VOP>;
 		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+		assigned-clocks = <&cru DCLK_VOP>;
+		assigned-clock-parents = <&cru SCLK_HDMI_PHY>;
 		resets = <&cru SRST_VOP_A>, <&cru SRST_VOP_H>, <&cru SRST_VOP_D>;
 		reset-names = "axi", "ahb", "dclk";
 		iommus = <&vop_mmu>;
-- 
2.17.1

