Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAE81A8F93;
	Mon,  7 Apr 2025 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015179; cv=none; b=lbyz+iHsrobuuK2Z99HdMt0rlJlpVS4NEFCpW8mNMTqVB1pTXpqrWLrQcuJNDDA357ZWuNrAfmxRJTP/0w9TsMKmXEwKQlKQwo+l8JHbffHOnt5ZTfEzTgMQX1pBIuBA5AamildkFbBzGuugKnRUI1UVJ0pxy8DGaEHANTvo5ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015179; c=relaxed/simple;
	bh=0z/KT8TLIee1h3yP3HPJiOBL7ZOWc8WaVvSDGwnLOdE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y4rbIdeVcpLhJU4bO48mNdM33G2xRAOwknxApyaWgzr/267Fs7lEJciyFHygQM+uKEhJNtOXQnlCdWT/F0lGl67/3CE9RZ2ZfaOlF1Ig5YfpXxMghvzEA2riyRNvqvTlm84v9bYNxztJ0szyBNyAKEuokDycv2yHBtjzA4AWCU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LHYmZFDc; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LHYmZFDc"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378d75g030209;
	Mon, 7 Apr 2025 10:39:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=M4fDmZRN7yquUeZo8bSMP2
	LmovWfrpFiqUhwN/ePUVc=; b=LHYmZFDc7FLDVSArv6RpKwZQLAukYgWXCJIpgv
	errUQg9s9rqoLZJK/t/p/2MPeJQVpXwmiZpphYN4LjeZWJUY+huriQB9Zgc2jC2L
	kvauvSrXFld++hAtUey0VbDCZKd6r54aanX+BRhlm544Lc1P2jlf0g8aKvF72el/
	sn0w/n0cs4Ku7q+dQm2WkacdoJb6CBaBAVPBCoETHHXX4e+8pdU8qlV6yCaPVjzw
	XbWtAUlIau2H2DWh3dEQ9N0JcG3nl/bGWuTvHyFDJc1zHdKeuae9eP3rM6/hh1mP
	vrqYvwn06bHdTyu8wVGZcNGvUaHH9id+iO3/q5sDsmD/1LDQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw6e6hvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 10:39:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6F4164006A;
	Mon,  7 Apr 2025 10:38:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B94F693C4C2;
	Mon,  7 Apr 2025 10:35:41 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 10:35:41 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH 1/2] arm64: dts: st: Adjust interrupt-controller for aarch64
Date: Mon, 7 Apr 2025 10:35:12 +0200
Message-ID: <20250407083513.2072434-1-christian.bruel@foss.st.com>
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

Use gic-400 compatible and remove address-cells = <1>.

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

