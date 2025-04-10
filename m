Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C02B26B94F;
	Thu, 10 Apr 2025 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279796; cv=none; b=S4ZrrxdvpcSceHOP5E7hOZeWWwP9RhKR5FUwlMXryup/8qlvvHrcK7+NJ1R+muoh081XgVS3l63osC9jS5cImFvuQEKJg5CKmsVmYGMBNADqdqwzv+H4vFfWeVhGvrbgqdvfXKMI87H65teRxGInDs3XXh6D/59VzWVxJeo/6Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279796; c=relaxed/simple;
	bh=0z/KT8TLIee1h3yP3HPJiOBL7ZOWc8WaVvSDGwnLOdE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q9YxEBovbBHcN2PuRmIJFJBy6D6wM7tTV1h93XTyrrgj9WN60azD7K0iTNt3GB28aom0RMuCBbEaQv9BYjyu1FrgvLYcZZPMHvNhvAS1wDZsbFIpV4v7mvu3Ew+k4LJQsipAO273J/S94uIs0zroqw2akR5OjGrSKeSLJ7+FjWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Rw36P3kN; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Rw36P3kN"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A9VdUO019218;
	Thu, 10 Apr 2025 12:09:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=M4fDmZRN7yquUeZo8bSMP2
	LmovWfrpFiqUhwN/ePUVc=; b=Rw36P3kNlirCU28Pm6pzZAWogbk44Rv/+DqRGt
	aYCfjH0IuScHFPkASc3gYpUQBn5Yxbi1GLOuoZqHJ/ZiacCoN3UccSbN+C78ebnB
	tO1SySX1YvYUwdaqciJvufCIJ6nFofrMRlQUgXB/nSjZRrBfp0RU+o5pgTB37S+x
	Nx4BrzHLj5uCjrjiWzVK16a8cOEMVsJTkjPEuJaVm54oW1rW8m028J6kf6WnbfwY
	AyjPurNxsyqF9peYOtZAfW5ZYxZmks3gIN6/q8XcqMg7AJoVaGLPhSSY6ds62rfe
	Uluzz5sRmE3QvmURzLNITYYKO/aw2thxJsh4qkCysJKWWY1g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw6eq0y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 12:09:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9298840045;
	Thu, 10 Apr 2025 12:08:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 368899BC031;
	Thu, 10 Apr 2025 12:08:14 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 12:08:13 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v1 1/2] arm64: dts: st: Adjust interrupt-controller for aarch64
Date: Thu, 10 Apr 2025 12:07:57 +0200
Message-ID: <20250410100758.1057170-1-christian.bruel@foss.st.com>
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
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01

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

