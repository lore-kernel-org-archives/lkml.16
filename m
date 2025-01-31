Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118B2A935;
	Fri, 31 Jan 2025 17:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738344939; cv=none; b=Ayl/hOG9gu5jTPEKk5UZm4HNYsRVaf9GE5o9kvqgqfZ0LTYXKCvIc7WxHzocDMvXY2AFkCiRgc37oLsTy+C9VExdmqiwfiycmlqKabe5iyy62Dx1UlMQJDDE0S6XDbewzWJZCr0DA++oDw7Wv2ijrfnB9pPv51HCcaxu+CuN4k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738344939; c=relaxed/simple;
	bh=rW/B4c2sktY5pFvCmp9zGsQDBPR2h/vT8lB1yr2iSH4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=spO0NM+DwU4S4xlxfwhRmcyBRk2umkoMkrbGOWPsIgs5Y6CMACDzetDyPktCy8Lo+wU7uv1+GPEnq67vaNr3zQSZDJPgToJvHaPiyT3x0GvKE/wocq8BeWUCZP1BlH54miyjvtpqbT1qPfuzErUyzP6JcOBpwa0Ey3hZ0iZRvXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wq68nPlM; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wq68nPlM"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50VHZFQY2570155
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 11:35:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738344916;
	bh=Xjkl3LwHhuNZADTBKn5p4bEX9MlgLUjUqR1mFpJOXTQ=;
	h=From:To:CC:Subject:Date;
	b=wq68nPlM4i31ObmHT4NGapHViMt/hhLqArlIWfDGZVhsl0/uAI4m1nHJqUO53284I
	 LijKQ6i0tcrCgnoKmp/BvhZGEuq32dY1+c9QSp09p7V94i7S8HOdJ6Nb+tFEQ/74ke
	 Hkc0l0NSPjFR8FI2Wlz0s/di2NyYXYyjjTRpUqRI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50VHZFjp028756
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Jan 2025 11:35:15 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 Jan 2025 11:35:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 Jan 2025 11:35:15 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50VHZFtS070396;
	Fri, 31 Jan 2025 11:35:15 -0600
From: Nishanth Menon <nm@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>, Nishanth Menon <nm@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am625-beagleplay: Reserve 128MiB of global CMA
Date: Fri, 31 Jan 2025 11:35:08 -0600
Message-ID: <20250131173508.1338842-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

In the same lines of commit 9e8560556f9c ("arm64: dts: ti:
k3-am62x-sk-common: Reserve 128MiB of global CMA"), reserve global CMA
pool for:

LCD Display: 16MiB, HDMI (1080p): 16MiB, GPU: 16MiB, CSI2 1 1080p
sensor: 32MiB with a 32MiB set for other peripherals and a 16MiB
buffer.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 75c80290b12a..a5469f2712f0 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -65,6 +65,14 @@ ramoops: ramoops@9ca00000 {
 			pmsg-size = <0x8000>;
 		};
 
+		/* global cma region */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00 0x8000000>;
+			linux,cma-default;
+		};
+
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			no-map;
-- 
2.47.0

