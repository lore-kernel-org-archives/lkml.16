Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84092918C4;
	Tue, 15 Apr 2025 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715949; cv=none; b=EpFi/ep9lek/Tga2i7XrUYd4D74cRaXK2sbbhHVf/h05UXee/FrlIa0IJNroOQV8hMDR43nitxfNF4QwPiLn6bJRI5c/s/sFAePG3k2JsbbQXraankkZKvb2g3o4Os9kZLT2Ez1ufXdgbODfCXtuTfccIwKWbRrptdtdknBnT9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715949; c=relaxed/simple;
	bh=fAJjD9g5Mbj+d90QQj63P0XrYLU2v8teMCnRMWEUwcQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJ+IYbDPjVBVmVcjGrAD/F8HtQFLgjl0F47EKESfaXmTmkt74/f1BWsQk1mjlDFFOfKaTSKaTeAit3i17MIyvLuL4UeH8yvSd6Y6iv8zoxNnIqe5KItyhryJVr/VGb1XilgsNvcPbXvBSy6JipD3F8uzRaANn10suCqEsc9aZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=BxDqc0p7; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="BxDqc0p7"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F71kTW023855;
	Tue, 15 Apr 2025 13:18:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	sTq6oqa0W17RerLeCeX/2kdjqybIyKb7o89qLL6b+Gs=; b=BxDqc0p7Y8Cgvqva
	0/YkgRFVf9WJQmQaWfZbi2O+uMkxU7EgWhmjlK0kYmAOvSOnqNKcYK/S0iHxhWUL
	4mdJeZ4A7hkIgsYwiDsLfaAS74reXfVRaudY8pzSkSCYOqyADrizohlSb/z74I1t
	a1zxynlICl/nOWdUlrEnOnWN4pcatjcF3gQDmW3oLumHBFAsRCZVSeZxQ6qQw6WK
	FVe6cjj5Emq1qcrXsqSgog7KV+yiBWaTxjL4tgoE3mqMge40x/7MNAFjAUvllQmU
	9AilCMqn8yuek2HkZMZIollTvdHNF/gyzx77ybHNYRuHF9eTAnGe0xWIv8+wiO8g
	gaf/pA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45ydkmd6cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 13:18:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id ABC7C40047;
	Tue, 15 Apr 2025 13:17:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F28B09C25C2;
	Tue, 15 Apr 2025 13:17:09 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 13:17:09 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v2 1/6] arm64: dts: st: Adjust interrupt-controller for stm32mp25 SoCs
Date: Tue, 15 Apr 2025 13:16:49 +0200
Message-ID: <20250415111654.2103767-2-christian.bruel@foss.st.com>
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

Use gic-400 compatible and remove address-cells = <1> on aarch64

Fixes: 5d30d03aaf785 ("arm64: dts: st: introduce stm32mp25 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index f3c6cdfd7008..379e290313dc 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -115,9 +115,8 @@ scmi_vdda18adc: regulator@7 {
 	};
 
 	intc: interrupt-controller@4ac00000 {
-		compatible = "arm,cortex-a7-gic";
+		compatible = "arm,gic-400";
 		#interrupt-cells = <3>;
-		#address-cells = <1>;
 		interrupt-controller;
 		reg = <0x0 0x4ac10000 0x0 0x1000>,
 		      <0x0 0x4ac20000 0x0 0x2000>,
-- 
2.34.1

