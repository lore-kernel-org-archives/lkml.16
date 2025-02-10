Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A281253F0A;
	Mon, 10 Feb 2025 22:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739226771; cv=none; b=kKS8mAIuWZIl+39bQMa3fviCo2lvvEgtlXOiLTiGvwcaUY4zdBMtzY4Jitbt/C7gj1bRjUbHktsEUw0DIffD+eCSmRKy3nY8qhMyDqOkFfyD5hgXgVrxGKGCpfYf9Vl9SnSpppcuiH3jKXywLGR4npWBQtAKJPr95eXQutUKcNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739226771; c=relaxed/simple;
	bh=w95MJfxzfRGWFOpMQJPgSmIkbW+uGttHTGyC1aMnmdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A41B8BD38eLmTYnJozdrs2BWzHFFRbayWYo7dtNgRbbMOc7KYnI1Od7RWDh2aN6rD/9r31XnFKSdhSrizZXy53hlV31ZxrLkS9T602E8dhZf6sItY+5nqyhaksGxLY69c5uMRBF6NRDFcvOV1MPb8mJ6tgESjfgCIfr7RJ7qWyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=g8JbVn06; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="g8JbVn06"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q4Sl4j7z0914oZOToKd009OuMMVWZTH/qa7XeAPVimQ=; b=g8JbVn06in3CsSgeZfLbC23vca
	H3wAw6hD4sPz61gVFfM5IKTZRQ6LFVtHH/ifww9jx0eJIvrL7sflISIFSUnhhzIyZ/CUo9G8sjj7y
	lBk2Ws8I1AfI5lxp7v0r/0+tsLDLn7iKX9yN+Z3AF3n7e7VxUUR0sQVXPJJ+rgib1rVIrLRWMS0QK
	EtSwIfRDkCYSXFzw2fFYna5prQV96CYA/du9dziDPUCJPSNreNtx9nJA+w8MhWcGoTn0uxmNsDjed
	3bnwB1OBKKraiMjz5hYLh9vFkg+F4gX+66rHv5rOSSIN6GeiDtotIoxNmqUVffOX2wnlcldLqLH8Z
	oXiKlCTQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcKa-0008Cw-TR; Mon, 10 Feb 2025 23:32:44 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: [PATCH v2 6/6] arm64: dts: rockchip: add rk3576 otp node
Date: Mon, 10 Feb 2025 23:32:12 +0100
Message-ID: <20250210223219.1193346-7-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210223219.1193346-1-heiko@sntech.de>
References: <20250210223219.1193346-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the otp node to the rk3576 soc devicetree including the
individual fields we know about.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 4dde954043ef..29b47799849a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1260,6 +1260,45 @@ sdhci: mmc@2a330000 {
 			status = "disabled";
 		};
 
+		otp: otp@2a580000 {
+			compatible = "rockchip,rk3576-otp";
+			reg = <0x0 0x2a580000 0x0 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cru CLK_OTPC_NS>, <&cru PCLK_OTPC_NS>,
+				 <&cru CLK_OTP_PHY_G>;
+			clock-names = "otp", "apb_pclk", "phy";
+			resets = <&cru SRST_OTPC_NS>, <&cru SRST_P_OTPC_NS>;
+			reset-names = "otp", "apb";
+
+			/* Data cells */
+			cpu_code: cpu-code@2 {
+				reg = <0x02 0x2>;
+			};
+			otp_cpu_version: cpu-version@5 {
+				reg = <0x05 0x1>;
+				bits = <3 3>;
+			};
+			otp_id: id@a {
+				reg = <0x0a 0x10>;
+			};
+			cpub_leakage: cpub-leakage@1e {
+				reg = <0x1e 0x1>;
+			};
+			cpul_leakage: cpul-leakage@1f {
+				reg = <0x1f 0x1>;
+			};
+			npu_leakage: npu-leakage@20 {
+				reg = <0x20 0x1>;
+			};
+			gpu_leakage: gpu-leakage@21 {
+				reg = <0x21 0x1>;
+			};
+			log_leakage: log-leakage@22 {
+				reg = <0x22 0x1>;
+			};
+		};
+
 		gic: interrupt-controller@2a701000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0x2a701000 0 0x10000>,
-- 
2.47.2

