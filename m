Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A874F280CD3;
	Tue,  3 Jun 2025 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748941479; cv=none; b=aJ2pTnHQmmoPX2wC7gfY5YFCVUjU5jruHaHiorTPBodVjugCjfjhTQWwu+Yj5thyNsh/x0/+Hy9YTm6ZSVU2bcI+MgWbJGl3/FdRtlzmhDrQ1y1q1lfkqsqepdCwBpAh/Nj2Q3MmhZTl1JHsih52Po1j8JOL2BXLwCb2fGR6LHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748941479; c=relaxed/simple;
	bh=WGv52SAscOf6vNRhBEsny5G+x1jsUl0UjA96ZV9Bp/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QFFDI1STm6s9IyNS+X+MBIM2KLGKxzD1OubmoCVDHug+LQzGETBMUcE30KyvwInayXM31sP6QNs18OD+5iZBozD88SZNHP4zWgvyXGTGJXrEiOPtrAA+oOCYyoNdoYOLHIrYd6ydCeZaECg9/ruiz8HJMr5+YkkdjZ9HPEmsiCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=EBOTaBcL; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="EBOTaBcL"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55391A10026370;
	Tue, 3 Jun 2025 11:04:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xzfpWiiOdOJHKBYFuiykWUHiGsTQOXtq5xjJlt+HUXo=; b=EBOTaBcLeSJxZCU1
	28PcgxMHwyOnXFdGxSfcqMVQLjHfJG/6NTo1w3uNmc07qAguGaFreqibYtrbCN0a
	rtXqnST/bLyjwNyOzWYsnpIe0rzFK/jkdoeFQ1pRy9kS4Y7eJJTrX02XMlOMWJUF
	VQzt/Wx1w3O4XlhAvmzCayW+GzJNIy+2RDf7hc74ks+sB7NzgLqt23NVpQFw63Kf
	LYh7dqwKCmzFuruqqD8rY8Pytki1U7Tw0cgIyCSRok+TaK8jcpv/YMf+KfbEXoFA
	akyi//3e7y7dj+AG2zNaX2Y+1rEn5YWo+Z3uqVdf6hk6zFcVNAGopKTC19vF4yxy
	gFzcLg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g8stuu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:04:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B5C6A4006D;
	Tue,  3 Jun 2025 11:02:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1DA675C79C0;
	Tue,  3 Jun 2025 11:02:35 +0200 (CEST)
Received: from localhost (10.48.87.237) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 11:02:34 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 3 Jun 2025 11:02:11 +0200
Subject: [PATCH v2 5/7] ARM: dts: stm32: optee async notif interrupt for
 MP15 scmi variants
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250603-stm32mp157f-dk2-v2-5-5be0854a9299@foss.st.com>
References: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
In-Reply-To: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>,
        Etienne Carriere
	<etienne.carriere@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01

From: Etienne Carriere <etienne.carriere@foss.st.com>

Define the interrupt used by OP-TEE async notif on stm32mp15 scmi based
platforms.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
index 2f3c42a11379655a97393d91cbf28c22c5bdf539..98552fe45d4e088f749275cf35278de7b45b6c86 100644
--- a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
@@ -11,6 +11,8 @@ firmware {
 		optee: optee {
 			compatible = "linaro,optee-tz";
 			method = "smc";
+			interrupt-parent = <&intc>;
+			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 		};
 
 		scmi: scmi {

-- 
2.25.1

