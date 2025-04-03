Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B741F8720;
	Thu,  3 Apr 2025 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681813; cv=none; b=U//p/JPexnJ/Wt8eaqmuYEXJ4+GE0TAxWQQF/YeyKpGl910XUYHeTblSv7k0qERboiThGiwIZmP74mgzxjOFLxJa/lTivfnKILUqFPSjlbxnIk8+Mld0nsvj7TLD2EGAolKK6b63i3Kd84YeAVnBGZoIUJ87FtXlltgZBf31VU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681813; c=relaxed/simple;
	bh=SmFSfMH1zuOCKlMXXMjeBT+fbXqopLDp2knFLkKUL58=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JFFUE+TlZxkd2GFH+D2et6eMHKXExj5KiryWfelF2N7Yge1o7/nCsxUfS8g3Thcso0s3ciJi+YjrTIMatRS7LDGnAZY/teJpSxLoXbwOT25bttwZT7np2U6dKEhVeSYOlDzFXPOd4THkH1UaWriTYg1tThcRvMdUBtrADCGaDZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LGGkfrci; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LGGkfrci"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533BhN17024322;
	Thu, 3 Apr 2025 14:02:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	d2tu0ByRnyxdayf0QkwM6OVmQDJiDkXd1NnW9iA9mLs=; b=LGGkfrciWfSBxuxh
	AnfnOhrmx1GA9eTwjyf6POlitH39xejGNnW6rlxxnwy78JYyeTDyfYuwcdg0Fo0E
	xdZC7AF2WoGecpgpS5gChMQw0y3l469cYFsq0Uq+Jofbz2zOTz6qDLPyp5EvBdrF
	JI8N6Fp8JsVOnUO1skz524pcegRBnNW3ErdVxl0SH3x3/YnrwP0nfnb0NJNzhwrg
	gdCU2rEFmKkylY5e0lMDNgesTeCM/BfwcQaWCwoh6zT8Sx8CAjsyHpEmdkMhVYR3
	a51BVmot7phHiA/ZYHu4Ew/33pQF+AVq+Y+RMaS6xKFbsnEaWzZWAtkeUSlst9jB
	cXuTLg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45s2c7ea4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 14:02:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9A63A40085;
	Thu,  3 Apr 2025 14:01:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 77EAF8E3165;
	Thu,  3 Apr 2025 14:00:13 +0200 (CEST)
Received: from localhost (10.48.87.151) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 14:00:13 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: <fabrice.gasnier@foss.st.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Olivier Moysan <olivier.moysan@foss.st.com>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ARM: dts: stm32: add vrefint support to adc on stm32mp13
Date: Thu, 3 Apr 2025 13:59:54 +0200
Message-ID: <20250403115954.1061528-3-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403115954.1061528-1-olivier.moysan@foss.st.com>
References: <20250403115954.1061528-1-olivier.moysan@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01

Set STM32 ADC1&2 as consumers of BSEC, to retrieve vrefint calibration
data on STM32MP13x SoCs.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 2 ++
 arch/arm/boot/dts/st/stm32mp133.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 3cc5623d52ca..492bcf586361 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1066,6 +1066,8 @@ adc2: adc@0 {
 					interrupts = <0>;
 					dmas = <&dmamux1 10 0x400 0x80000001>;
 					dma-names = "rx";
+					nvmem-cells = <&vrefint>;
+					nvmem-cell-names = "vrefint";
 					status = "disabled";
 
 					channel@13 {
diff --git a/arch/arm/boot/dts/st/stm32mp133.dtsi b/arch/arm/boot/dts/st/stm32mp133.dtsi
index 73e470019ce4..e48838374f0d 100644
--- a/arch/arm/boot/dts/st/stm32mp133.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp133.dtsi
@@ -60,6 +60,8 @@ adc1: adc@0 {
 			interrupts = <0>;
 			dmas = <&dmamux1 9 0x400 0x80000001>;
 			dma-names = "rx";
+			nvmem-cells = <&vrefint>;
+			nvmem-cell-names = "vrefint";
 			status = "disabled";
 
 			channel@18 {
-- 
2.25.1

