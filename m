Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53821AA782;
	Mon,  9 Jun 2025 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749470382; cv=none; b=HoBMEq+6f6rgWKncwwmRm+prrD2WCHbgnZpZkERiXOU0m6vAOERHNkZgsJq3NGJYv5KAT6JJKITOIlGhZqifchuD/rYzxLdI2x5CeDzlYwZ9Vp/8wXqu1vSs6lhboRB6OVy2vSBdEW1isQxJGZq40KHIKoHNdvjypOhTy/LrMsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749470382; c=relaxed/simple;
	bh=nRcYijPZLSRyXuUwblns5rumyAR5s6CpxM0gY4SkUug=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N4/M470Hx0ThFg9OfUvLp6E45SUN/NMb/vPWgigwjTGMk6ORfR1AqL2LElooUJchX/V0Mt7TNfr+uZJkxriq+KZ9CPwe7itwG19PJcK5DexhzaUoYstfPD+YoOQG8FgJx+KW4nzvnhH6/16eDQLHQlU8KHp1Hmr1nu5pyZcCbqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tW3C2TkU; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tW3C2TkU"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 559BxQQ1782641;
	Mon, 9 Jun 2025 06:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749470366;
	bh=CT9OzqLKGP3slmO04oTd4+ZqOpXmjF3nDMw40m4fEEI=;
	h=From:To:CC:Subject:Date;
	b=tW3C2TkU8OHhNymxqYVkfkYyjo/sg4nwiGEI2rTWt9vMMb1iWjWcdxeeo3fLQzdyC
	 G5bj9WwvPOfkZ8AYwpn63yE52ScLae7RTJPZr5aKnH7HHdZfu7CsEnwQLsF6KFLYWG
	 ezx0JarxACRJi+7mezAL3QzTbVPnc/GizcGa6PLE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 559BxQ4x060736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 9 Jun 2025 06:59:26 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 06:59:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 06:59:26 -0500
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 559BxM2w1361878;
	Mon, 9 Jun 2025 06:59:22 -0500
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <h-salunke@ti.com>, <danishanwar@ti.com>, <srk@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am69-sk: Add idle-states for remaining SERDES instances
Date: Mon, 9 Jun 2025 17:29:21 +0530
Message-ID: <20250609115921.2380611-1-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

In AM69 SoC there are 4 instances of the 4 lane SERDES. So in
"serdes_ln_ctrl" node there are total 16 entries in "mux-reg-mask"
property. But "idle-states" is defined only for the lanes of first two
SERDES instances. For completeness, set the "idle-states" of lanes of
remaining SERDES instances to a default value of "unused".

Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
---
This patch is based on commit
475c850a7fdd  Add linux-next specific files for 20250606

 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index f28375629739..dcd7eb079766 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -1295,7 +1295,11 @@ &serdes_ln_ctrl {
 	idle-states = <J784S4_SERDES0_LANE0_PCIE1_LANE0>, <J784S4_SERDES0_LANE1_PCIE1_LANE1>,
 		      <J784S4_SERDES0_LANE2_PCIE3_LANE0>, <J784S4_SERDES0_LANE3_USB>,
 			<J784S4_SERDES1_LANE0_PCIE0_LANE0>, <J784S4_SERDES1_LANE1_PCIE0_LANE1>,
-			<J784S4_SERDES1_LANE2_PCIE0_LANE2>, <J784S4_SERDES1_LANE3_PCIE0_LANE3>;
+			<J784S4_SERDES1_LANE2_PCIE0_LANE2>, <J784S4_SERDES1_LANE3_PCIE0_LANE3>,
+			<J784S4_SERDES2_LANE0_IP2_UNUSED>, <J784S4_SERDES2_LANE1_IP2_UNUSED>,
+			<J784S4_SERDES2_LANE2_IP3_UNUSED>, <J784S4_SERDES2_LANE3_IP3_UNUSED>,
+			<J784S4_SERDES4_LANE0_IP3_UNUSED>, <J784S4_SERDES4_LANE1_IP3_UNUSED>,
+			<J784S4_SERDES4_LANE2_IP3_UNUSED>, <J784S4_SERDES4_LANE3_IP4_UNUSED>;
 };
 
 &serdes_wiz0 {
-- 
2.34.1

