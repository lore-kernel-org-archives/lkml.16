Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D18292924;
	Tue, 15 Apr 2025 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715953; cv=none; b=tr36aIh//7cYRqrj/nAwMplNYoCAP04INUEtT/uuUj+aWJdrSFV14Mp2PwlnRgyY3Ey+9aahFZgJz+8JRUnR0rN3KumCNGdeVWKEG+6sw/zLQyvK0XeAiEah2h3wctLyy3o4tjyo7hanJ+fZFseBW8GYriJApKWBWWgEfzRR+Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715953; c=relaxed/simple;
	bh=jB0zI0wZxdJSi8IYU3aUTL4xGXDRqOJumsyVtTazrIY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pot8YEuF6SICmzsKdXSHdeb6GF4Ujm7HYQoVtrHu+ozT0BnUYATGQF/IiJjg4OyCCiMThNDYwrFeLM6zgtSKq+nw3BnT3Jw9A7nvDoSHO5hRXFHSc5GRAigzk3sd5yoazP+wxny4MrX3y8ecQUvlSyz+171om07s4nQ2Rak0fTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OHo9dHaY; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OHo9dHaY"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F7O3eS023839;
	Tue, 15 Apr 2025 13:18:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Ycbk3aBv/tZumbR5nof0LL/gD7Wh9590ItptaqKs1NI=; b=OHo9dHaYqyCIjqUW
	vX1S2j16YP0Fe0JZFkKwzmSjesv/GBjvJ834Smbjpaeq2iwvX7f8ESvfpLtQuWQM
	N5VKyQYgVdrx01qgYBqjbdcrrvK1jftcNEKf6PGSLO9k8BrLWgp9JkatNaVgFM3p
	aUgcBs+VwiK3IS7F8rQco2n7/8VrEibHOq9mBBcvialD0N1cyXfxmuWzsVTYouzg
	mrtFk4lmR7D7drzc1fr3pl3zYBJdqxjxl37mU+ypUsjuv6j03YiNpWtq4Q5hnOie
	eRtBuAYQOJLD/liddON/NVVLdelXrtgXP/10HM2M6H+SxflTYAvk/qfEOvq4Q1GJ
	35DiVw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45ydkmd6cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 13:18:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 63FEC40051;
	Tue, 15 Apr 2025 13:17:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B2D1A9C98ED;
	Tue, 15 Apr 2025 13:17:13 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 13:17:13 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v2 4/6] arm64: dts: st: Use 128kB size for aliased GIC400 register access on stm32mp21 SoCs
Date: Tue, 15 Apr 2025 13:16:52 +0200
Message-ID: <20250415111654.2103767-5-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415111654.2103767-1-christian.bruel@foss.st.com>
References: <20250415111654.2103767-1-christian.bruel@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01

Adjust the size of 8kB GIC regions to 128kB so that each 4kB is mapped
16 times over a 64kB region.
The offset is then adjusted in the irq-gic driver.

see commit 12e14066f4835 ("irqchip/GIC: Add workaround for aliased GIC400")

Fixes: 7a57b1bb1afbf ("arm64: dts: st: introduce stm32mp21 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Suggested-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 52a8209471b8..bf888d60cd4f 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -118,9 +118,9 @@ syscfg: syscon@44230000 {
 		intc: interrupt-controller@4ac10000 {
 			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x0 0x1000>,
-			      <0x4ac20000 0x0 0x2000>,
-			      <0x4ac40000 0x0 0x2000>,
-			      <0x4ac60000 0x0 0x2000>;
+			      <0x4ac20000 0x0 0x20000>,
+			      <0x4ac40000 0x0 0x20000>,
+			      <0x4ac60000 0x0 0x20000>;
 			      #interrupt-cells = <3>;
 			      interrupt-controller;
 		};
-- 
2.34.1

