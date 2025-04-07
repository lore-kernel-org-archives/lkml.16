Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CD1253B70;
	Mon,  7 Apr 2025 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032587; cv=none; b=tmwq4MeBabexL3U5u5pyo5hcwXpkPR8RUD0CC4XiU7qhYV0JImTUyCPRzo/pASX0OagXTXtd8aS/CTiouU3KpQCjB4GOxkhoyYVSGwHM3HZkNmeVouXv2I+9gHxUCv8+FaBB+MSu4SL0pB5PsUWmxk85LvHMaWP+on8LAXFLXw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032587; c=relaxed/simple;
	bh=pNCuaRq20ihRDPIs6gWBbwsMGTzuOJxHjP1yYRN8ZiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RHaXZ3px5L6QtqGkFY09+iHLZoaKjSyIe66Am2gA3H3D/QNe6Lc7y36WKoHIj8MCB1E+BfoAt08vV8Y/FeXR0DoIulO0qPi4IVl210/dZzWKiTL51OrUFTB33wPepfmw8TcSBRMAyJtMGAEZpEJfZxVLn+wshZq5/sSsVZUuLPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=WDb2CwGD; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="WDb2CwGD"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537CPsvl008739;
	Mon, 7 Apr 2025 15:29:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	WwkG1pZIiujSvSdNAeNRVIU4m+oKTZ5N+BMPOnssFpU=; b=WDb2CwGDoGtAzSr2
	Pl0f0frt8o3g+L9Pxy3wWWPy+rR728r403TKUNm8eu8h8BdzDzlmsMqYhucSP6oa
	l5+ArHeR0FPGhYDd67F7BalVgzW9aPcZC2N1xF/M/yXcIWd2WeP/ow7J/o70NArB
	YNofjsYdv0oReFDT307Bex0vqe0m3DRAid0ufl4aguSk0dAdmjsEoR+DZpnpwrBn
	hUEc5M7Csxe1EiYTffp6qQyyMUDTRTOS/Jmp6qH0WSNH2OKIP4WI5hbxpkTSHr1W
	ZB9SAdjpIa9h61ssUcJRIVk9lpwwRz5I3g+EGscceByzztWZrN5zef3sp1/99ho9
	jzWc9w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw2gqwyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 15:29:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D521E40059;
	Mon,  7 Apr 2025 15:28:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D11B9400D0;
	Mon,  7 Apr 2025 15:27:46 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 15:27:46 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 7 Apr 2025 15:27:38 +0200
Subject: [PATCH v8 7/7] arm64: defconfig: Enable STM32 Octo Memory Manager
 and OcstoSPI driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250407-upstream_ospi_v6-v8-7-7b7716c1c1f6@foss.st.com>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
In-Reply-To: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01

Enable STM32 OctoSPI driver.
Enable STM32 Octo Memory Manager (OMM) driver which is needed
for OSPI usage on STM32MP257F-EV1 board.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index bde1287ad9a7a1341162b817873eb651bb310d52..3674d9138bae6deba19c0d13586aa6e1de6750c5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -580,6 +580,7 @@ CONFIG_SPI_QUP=y
 CONFIG_SPI_QCOM_GENI=m
 CONFIG_SPI_S3C64XX=y
 CONFIG_SPI_SH_MSIOF=m
+CONFIG_SPI_STM32_OSPI=m
 CONFIG_SPI_SUN6I=y
 CONFIG_SPI_TEGRA210_QUAD=m
 CONFIG_SPI_TEGRA114=m
@@ -1518,6 +1519,7 @@ CONFIG_EXTCON_USB_GPIO=y
 CONFIG_EXTCON_USBC_CROS_EC=y
 CONFIG_FSL_IFC=y
 CONFIG_RENESAS_RPCIF=m
+CONFIG_STM32_OMM=m
 CONFIG_IIO=y
 CONFIG_EXYNOS_ADC=y
 CONFIG_IMX8QXP_ADC=m

-- 
2.25.1

