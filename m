Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C887B136672
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804224; cv=none; b=MNCU7Pa4RsGY2Pn7PvKDXCyuAYVyXye18Um4+9Q1kBaPp0F+YfhI9AG+6vD4QQr5K9X3ZgyKVJxHfdi0IJp0VEtrkrIwzAvGJPvlUQu61iK0akBrUSrGyT2uycd9hHf68AERnmeZ7CNOYUXHQXJhBdeg5KitdqynyzYkSfDwORc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804224; c=relaxed/simple;
	bh=eTJS0fq08hkN+Ld0FhSP2cc226T0ey4xQHYNifqulV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qfZTB5eJOnlI7r4TNFiTXUAEwwGFurn2jXVtJjN+svhwP/lulR0hUZ7aG6ilWwd/ZOXBsAsuWTRMNVM+2646B/gxS0mOzkQkXeKLWXgNbCQBc1TW4qXigRyeJiPz/hVuBFtxUGKDTUmhlRLzBSH4APe+Ltf3rw6uzFp7bTuHKXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=SN5O5y33; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="SN5O5y33"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=VRcNlZIROkbG0sCWrxKhEWE7NClVs/KiomSYUNRRAb0=; b=SN5O5y33zakZ19sb4IaG/Y8vdy
	tqV/b9FihN9G8n5yVs6/5n4mIsj5z1cBM5hPU8uCGzwV6mE3YKlSwAeoBXkJlITg7E2fFjObBZJ1+
	UoS9LoOs+j0QpYnOcjDcyQCDLiCfCv9iqDsDC8zK6to7GUkWP9CDMAxrZsPCbtLPf8UhZmP7dqxBU
	rN4jYixde5chFIxAZLu3tWFeoQngUIGUPuh4w4VmKfrW10hAUytalukjDsL4TQl8TM0Ufluh+RyNo
	FiEo6tgQLzGM+AmIBggPT1vbzBJb73Ki4MZ9GWg8ZitNSsxR6U/lhwfz/AX1YgdSEt9HElK4LhEmD
	lLzGwNoA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDPZc-0007v0-VF; Fri, 09 May 2025 17:23:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: drop wrong spdif clock from edp1 on rk3588
Date: Fri,  9 May 2025 17:23:29 +0200
Message-ID: <20250509152329.2004073-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As described, the analogix-dp controller on rk3588 only supports 2 clocks
and the edp0 node handles that correctly.

The edp1 node on the other hand seems to have a dangling 3rd clock called
spdif, that probably only exists in the vendor-tree.

As that is not handled at all, remove it for now so that we adhere to the
binding.

Fixes: a481bb0b1ad9 ("arm64: dts: rockchip: Add eDP1 dt node for rk3588")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index 9d81d3b9444e..90414486e466 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -255,8 +255,8 @@ hdmi1_out: port@1 {
 	edp1: edp@fded0000 {
 		compatible = "rockchip,rk3588-edp";
 		reg = <0x0 0xfded0000 0x0 0x1000>;
-		clocks = <&cru CLK_EDP1_24M>, <&cru PCLK_EDP1>, <&cru CLK_EDP1_200M>;
-		clock-names = "dp", "pclk", "spdif";
+		clocks = <&cru CLK_EDP1_24M>, <&cru PCLK_EDP1>;
+		clock-names = "dp", "pclk";
 		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH 0>;
 		phys = <&hdptxphy1>;
 		phy-names = "dp";
-- 
2.47.2

