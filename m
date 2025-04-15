Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA9C296D3A;
	Tue, 15 Apr 2025 11:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716014; cv=none; b=WzzwGcCs320qrqxCzgypCJ1tQ+z5fUewv+rrzx+3WpLbwEi+jUrd8nkILgRZ0ti8iItmLLfR/VdLCDI6l+goKn3gPBc/AwzKOqnJp/15yfw1/SN2+qb7oOzyC3igJaW7aBFQxoUklM3+KnlYjg7o8pBv0ePGztKAculpMzIY6dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716014; c=relaxed/simple;
	bh=F5xspGtU2T3JO1IV90LK0FegIoZaggE6NoeKUCZWxw4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HyKrigReZAYV3uE9nG2oTMU6sGAQcOhadixkQwjF/R2YwMutDURtuIzfggiFQJVMNwBHm44dIGgAK16SFczN782peK33dt2lEk/7E7mlDxYssa8P7wxjkPVl+9VTKkbfQJ89RcVa7mhA3vCKxwN927ZN6vbwxdRAI/TbpDEmoAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=6Ah1WE3C; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="6Ah1WE3C"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F7IDHD027359;
	Tue, 15 Apr 2025 13:19:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	UWCsC7zGtGSkyIZL2K8l+kCFL+HE0y5JNWj8lXy9FMc=; b=6Ah1WE3C5VLMXvZb
	N4LbRY8XNpnOrskAWag239poEQdgCaicdZiPdgkVrJVkXtbIeTq6sNj+4p0sBSfx
	x1VHGJGSVLxaefEysbf1X6R4A3mwqE/QTP7iDgVl2Z3O06j24wkMca64jloDVmdw
	1G1+oXseFpG0NcrFvV0Vjb5dRp6uWkIa4ULO5zKzFKIwK3XBcX3foA2y0enZtRBS
	urNU7J74Lt3y02uAZ4KSjJC7t5HJFT082YrZub+PXWWxHcH+kK8aUlE9DZXq7OrI
	PBz8otGYazh4buETkRIO7G7iEKB7K7dckRiez1dOI9Pf+QiKVs6qv+i3x8Ilf2kx
	8MnQng==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46034n29bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 13:19:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C0FBB40044;
	Tue, 15 Apr 2025 13:18:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35A339D260B;
	Tue, 15 Apr 2025 13:18:20 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 13:18:19 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v2 6/6] arm64: dts: st: Use 128kB size for aliased GIC400 register access on stm32mp23 SoCs
Date: Tue, 15 Apr 2025 13:16:54 +0200
Message-ID: <20250415111654.2103767-7-christian.bruel@foss.st.com>
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

Adjust the size of 8kB GIC regions to 128kB so that each 4kB is mapped 16
times over a 64kB region.
The offset is then adjusted in the irq-gic driver.

see commit 12e14066f4835 ("irqchip/GIC: Add workaround for aliased GIC400")

Fixes: e9b03ef21386e ("arm64: dts: st: introduce stm32mp23 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Suggested-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 3f73cf1d443d..75697acd1345 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -1203,9 +1203,9 @@ exti2: interrupt-controller@46230000 {
 		intc: interrupt-controller@4ac10000 {
 			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x1000>,
-			      <0x4ac20000 0x2000>,
-			      <0x4ac40000 0x2000>,
-			      <0x4ac60000 0x2000>;
+			      <0x4ac20000 0x20000>,
+			      <0x4ac40000 0x20000>,
+			      <0x4ac60000 0x20000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 		};
-- 
2.34.1

