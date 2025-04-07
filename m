Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867882288C6;
	Mon,  7 Apr 2025 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015431; cv=none; b=dVYjCt67T8ypwV9R+hOPxGRviTfPI68wqAwdjBoy5q1uY7X44+la0U0KT81oj6WkbV17uoVe/VztR3w1oLJLMLVdFu2T87gST+AbOGKFf6av3JHxW9C/QGLgaFKfb9ebCS4NFkvvyb3N+YoxunAqv6ARTUtEIa99i0puzfAubHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015431; c=relaxed/simple;
	bh=kEckOfrEWsqXD2S7772yk8sNKNQawrIaDjHndqd1fGA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TOr/PF24D7wI4413mQO1YOKIq5bKKUHLMM/bu7hN8kxyNTiI90n3z82BTKCGjgQzRiCT9gSqe6o9CheaXTWy2v/371iPh1hulxvIFi/n0zSnt042G6ppPModjpIn8kaeYOTllecIEGfu00dfWhm64ihFCQvpoWHa1L6OqQbOyqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=vi3oUl21; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="vi3oUl21"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378gYlc002911;
	Mon, 7 Apr 2025 10:43:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=6RdxceKp9Lb4XLCzxtNYg/
	LbxWBXXVQzDxc1SNn9Pe4=; b=vi3oUl21AXCwqUmFSXejzo/bu1DxyNXCAnZyec
	c5eSZCJdTmw8e8y21BICEZnAnYPo4A2KIqtmUnwKcU6TJgitos03ukcCcO1hLtEH
	XYyKRn2uFxIXIfr8qis48dW1l8l9Jpj+uhzQY2sG5Rlh0xpEqZatz6xU2ZXnT270
	Rj0qpDhDXzRqrkGljafZDAZuStcIUChIk9f2FBI2gYt2FQx0QWXK/BumyOiIlBNB
	LG+HYA/IODK4VG682X5PhvGqJvfcNu5XH2Xl1XncSVyTQXWSlRX/MXWQiQ2Q/fqL
	9MGHBsgeGA5w0SR3NTYR6Gf6sx42jqzoqKV5WnuvP02pBNGw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw5fxrny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 10:43:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BECB54014B;
	Mon,  7 Apr 2025 10:41:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53FD093D7CB;
	Mon,  7 Apr 2025 10:40:33 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 10:40:33 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH 2/2] arm64: dts: st: Use 128kB size for aliased GIC400 register access
Date: Mon, 7 Apr 2025 10:40:28 +0200
Message-ID: <20250407084028.2072504-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01

Adjust the size of 8kB GIC regions to 128kB so that each 4kB is mapped
to 64kB. The offset is then adjusted in the irq-gic driver.

see commit 12e14066f4835 ("irqchip/GIC: Add workaround for aliased GIC400")

Fixes: 5d30d03aaf785 ("arm64: dts: st: introduce stm32mp25 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 379e290313dc..87110f91e489 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -119,9 +119,9 @@ intc: interrupt-controller@4ac00000 {
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x0 0x4ac10000 0x0 0x1000>,
-		      <0x0 0x4ac20000 0x0 0x2000>,
-		      <0x0 0x4ac40000 0x0 0x2000>,
-		      <0x0 0x4ac60000 0x0 0x2000>;
+		      <0x0 0x4ac20000 0x0 0x20000>,
+		      <0x0 0x4ac40000 0x0 0x20000>,
+		      <0x0 0x4ac60000 0x0 0x20000>;
 	};
 
 	psci {
-- 
2.34.1

