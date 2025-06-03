Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C9A2820B8;
	Tue,  3 Jun 2025 09:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748941493; cv=none; b=cA2n/JWTW9lyR/WGR43hwmpRKpKH7JEdD+VCuIOXVmvaxHE0KtDDROZuBAak7ef5AuUyqffbQqbDzT3Wj1bDv7DQyYHvBCsCczhDKcbZldKpjLBtQNcNL0ASRx8SUOjdqx6whgfNS7NW9Lt4BEJRIsloUD1rK8VTkFVOzpR/7hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748941493; c=relaxed/simple;
	bh=qt+M5XgqWECPNuBkw2Vzu4qw9LBP+iXn23nvNjWO/cQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=V3DrybS2IGWARd1WSzm+rA1NOzfYL4se9eSTjCwqUYzP1NJIgxSkcN5Eb4cdPw6UZWS/skmdgA43RmgF6KxU3JL5OIaXk77vS/diWaTa/8rpxrXhPy2oVbkOllKzJ/4Jay5AixXv6XfyvoM49vU6QiL4dMRCs4/ckziJIpdOSaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gx+kAeC7; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gx+kAeC7"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5538FhQG008818;
	Tue, 3 Jun 2025 11:04:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	wAhv0XiRtdUUQ20wZA0jdltTE2ZjXS2Zk11kSw/Om+A=; b=gx+kAeC7q/qhy6lr
	Ehw6Ri4QppYe0aVe4ig+vq7OEL7FZ3uOcLQHmcopEjtk+LzG76ldBJRw+bwlq/A0
	5W2Geo5aXfZ/gN8U4yhT+GebpNxGu7W/MhMb/mLZVvYFOtSjkNscsdW40OVVMoSz
	2pPvZLUlN8ODx2zqxHNBStXPqw72vzE8dgLyG2uwioBIBynMnW2otzBib0IIEfpN
	lQToQFS2UlS0EMrRh97AMPr5zXvP9uYTnw+ZiAt/N8fsFbZKlrt28Xi3yLypa1jj
	NbTA9fgnwEbD/VsWDP/apHLYcHc+i3cS52ik44/gF+HiMwSRd/ZFosD7W99TWRIX
	bLS60w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g93ayhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:04:26 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 096D14007F;
	Tue,  3 Jun 2025 11:03:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B8916CEED4;
	Tue,  3 Jun 2025 11:02:34 +0200 (CEST)
Received: from localhost (10.48.87.237) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 11:02:34 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 3 Jun 2025 11:02:10 +0200
Subject: [PATCH v2 4/7] ARM: dts: stm32: use internal regulators bindings
 for MP15 scmi variants
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250603-stm32mp157f-dk2-v2-4-5be0854a9299@foss.st.com>
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
	<himanshu.bhavani@siliconsignals.io>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01

Use the SCMI voltage domain bindings for internal regulators on stm32mp15.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
index dc3b09f2f2af21e991cac60dc8b5a09e7fc0d8be..2f3c42a11379655a97393d91cbf28c22c5bdf539 100644
--- a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
@@ -4,6 +4,8 @@
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
 
+#include <dt-bindings/regulator/st,stm32mp15-regulator.h>
+
 / {
 	firmware {
 		optee: optee {
@@ -35,21 +37,21 @@ scmi_reguls: regulators {
 					#size-cells = <0>;
 
 					scmi_reg11: regulator@0 {
-						reg = <0>;
+						reg = <VOLTD_SCMI_REG11>;
 						regulator-name = "reg11";
 						regulator-min-microvolt = <1100000>;
 						regulator-max-microvolt = <1100000>;
 					};
 
 					scmi_reg18: regulator@1 {
-						reg = <1>;
+						reg = <VOLTD_SCMI_REG18>;
 						regulator-name = "reg18";
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
 					};
 
 					scmi_usb33: regulator@2 {
-						reg = <2>;
+						reg = <VOLTD_SCMI_USB33>;
 						regulator-name = "usb33";
 						regulator-min-microvolt = <3300000>;
 						regulator-max-microvolt = <3300000>;

-- 
2.25.1

