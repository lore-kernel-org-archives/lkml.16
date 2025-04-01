Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01561EB184;
	Tue,  1 Apr 2025 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498330; cv=none; b=nlRgZCsim5frT1RdDAWPfnNs9M2e3A+b/Mmq1oJmUqa8laLVgiJRBJQL9qzoFsGAcu/yoxGlU/3AubitXMcJufwv7xhWInYcGsv5qr1BgFEhHByQ/KtTzaOHKGHWxVKld2mrDWN8fHElaQpMxjqMlogV8nL9MU0hfpHtbANX1IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498330; c=relaxed/simple;
	bh=kujLJZpEFTcaDk3oZb3VS1iYOlY1gYHAvXCI0pY2Ft0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KWXbJp4ME18RYEPKj5x4vgilPRHohSRuMlm2du4JBxxixx1OEB6A7PvHosJxaBCxIOvQkhTiVEv8NRv2N9w61QO3/HCgVDMGFVBALFoimYWTasf0Fw3JQjXs1LzAIiTt3l7GuPqAtxaaXhppG8ChR/ei6WShV7442nDuRsL13b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:430:ae31:3177:4f09:da96])
	by smtp.qiye.163.com (Hmail) with ESMTP id 104ddcf67;
	Tue, 1 Apr 2025 17:00:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] arm64: dts: rockchip: rk3588: Move SHMEM memory to reserved memory
Date: Tue,  1 Apr 2025 17:00:09 +0800
Message-Id: <20250401090009.733771-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401090009.733771-1-amadeus@jmu.edu.cn>
References: <20250401090009.733771-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0xOVhkZTEJLHU1DSUNKQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQU9IS0EaHkhKQUhKTExBTx1LQkEfGkJNWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a95f0946ef703a2kunm104ddcf67
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OBw6Vhw*DjJJKQoeAxkiNEI0
	F04wChlVSlVKTE9IT0JDS0pOTE5MVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBT0hLQRoeSEpBSEpMTEFPHUtCQR8aQk1ZV1kIAVlBSUtISDcG

0x0 to 0xf0000000 are SDRAM memory areas where 0x10f000 is located.
So move the SHMEM memory of arm_scmi to the reserved memory node.

Fixes: c9211fa2602b ("arm64: dts: rockchip: Add base DT for rk3588 SoC")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 1e18ad93ba0e..c52af310c706 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -439,16 +439,15 @@ xin32k: clock-2 {
 		#clock-cells = <0>;
 	};
 
-	pmu_sram: sram@10f000 {
-		compatible = "mmio-sram";
-		reg = <0x0 0x0010f000 0x0 0x100>;
-		ranges = <0 0x0 0x0010f000 0x100>;
-		#address-cells = <1>;
-		#size-cells = <1>;
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
 
-		scmi_shmem: sram@0 {
+		scmi_shmem: shmem@10f000 {
 			compatible = "arm,scmi-shmem";
-			reg = <0x0 0x100>;
+			reg = <0x0 0x0010f000 0x0 0x100>;
+			no-map;
 		};
 	};
 
-- 
2.25.1

