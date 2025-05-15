Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2883D1F8EFF;
	Thu, 15 May 2025 13:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314870; cv=none; b=P0a0r2hqBCkstP95oMHTlYZ2Mb/Au+CBWSG9yIdSmWCrzwFkzmNKfGADqx4cGqx2i6hX+en7KhBRAqCHlcqNL7wLPg0N4EqtPkZ7UKr6RdUz4MojfoUegrMLz7nj+4IkUESrMcBCWSOsF4XBL8ZZtAmEPtvlKh//QMoT09Ors+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314870; c=relaxed/simple;
	bh=P6Rsl+u4+L2cyHPJnCdS27n5s/M4XNhV8Dla3xUPC0s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C7fxzHJ0sG+0IsqEcLZhAPFFTiuVvfA+fWNEYTJGySjDT6ar+EuECmoXi777EnG/Xbhi7WG949F1SbKSMrMyh8U6kzwbBsyi9rlOK/WJJ3i7vlc53BZojZ7/tbnCFv/G7ks807in9wr3GHOppOkuIMuxo/rliFmgKdeGz0ADPlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=8JIIaksp; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="8JIIaksp"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FD6Ohv014139;
	Thu, 15 May 2025 15:14:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=pLQZAQx7JWYvk7JPinwxnP
	wYo7F6pB4GfYvlOtuM8X8=; b=8JIIaksp9OUdgBZRqHR9/yAioPTzkUg2dWGRQW
	rNFzMWqAeUiwD7CojkXQlE+rENf1XgdOnQLh5P3d3kHsODrk+cTcgXUZEe2DhFEC
	qIPqqPHVT671YsEifYI8wuCVg2hUtGFVmwK/0hWCtFPF46lJ3k/ASRG8ij0wTfyj
	+Cm8q5JD3g9tKQfKoQ4MWidpCr2chf58qzGfN02fd9vtTVVzvdoeYLst1UM/z1RM
	u1/FHQVXDM/RW5KqNyBC6jmnz1bezydXg3UdjIfyUq+JkoSra73TCpI5xHYObnnh
	vo/lVEusH9XnWB8mhG9JMWGSFjSu0Xzw8zM4xfMdtJ8/1nHw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbdw8t72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 15:14:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2018B4005D;
	Thu, 15 May 2025 15:13:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D28BB3B14D;
	Thu, 15 May 2025 15:12:43 +0200 (CEST)
Received: from localhost (10.48.86.182) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 15:12:42 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Marc Zyngier
	<marc.zyngier@arm.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH 1/2] arm64: dts: st: fix timer used for ticks
Date: Thu, 15 May 2025 15:12:39 +0200
Message-ID: <20250515151238.1.I85271ddb811a7cf73532fec90de7281cb24ce260@changeid>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_05,2025-05-14_03,2025-03-28_01

Remove always-on on generic ARM timer as the clock source provided by
STGEN is deactivated in low power mode, STOP1 by example.

Fixes: 5d30d03aaf78 ("arm64: dts: st: introduce stm32mp25 SoCs family")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 8d87865850a7..74c5f85b800f 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -150,7 +150,7 @@ timer {
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
-		always-on;
+		arm,no-tick-in-suspend;
 	};
 
 	soc@0 {
-- 
2.25.1

