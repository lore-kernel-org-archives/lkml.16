Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEFF202F7B;
	Tue,  1 Apr 2025 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510255; cv=none; b=brAlgXymKKICT9U5I7n9kqyiCD1L7zT/Dv71e2R1R8pnO2e8dgpl+0gQtnbbogiL9M/UQJJHN+GqIokXZnNh1ZU3/5v2gww9oL/3m7bjjibeX7ooqEIrg9o614+NH8oUWI02EPthEgqQIMC1vhziixOPP5XFrh8K5NLz8YUmSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510255; c=relaxed/simple;
	bh=pNCuaRq20ihRDPIs6gWBbwsMGTzuOJxHjP1yYRN8ZiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cKpdWgAn/MxLZ3YRV3w9sHut6eEnOhCuW7Gyf6gFK5jv/SPKklaUh0oT4e5lGJBfwujZxQNbfxb5BiY6vVKkVtgE5FYUTlcP9gPQ8DRwIkwdC1x7kbWhbdaCzeVGG+r9aJJHDSsTUYbjWMpwdskALXrtBXDwEH06vu/I2ctbRK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oL+88cSn; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oL+88cSn"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531A8miQ018903;
	Tue, 1 Apr 2025 14:23:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	WwkG1pZIiujSvSdNAeNRVIU4m+oKTZ5N+BMPOnssFpU=; b=oL+88cSnKOPYVrGD
	x5nzIlrdh0OMMWcDZA0t+Zq6C8sOTF0NkhgjvTarBTg/7401jpbL9Xo3qJTmb0c6
	smYj0K12uw3BTtlzUPCek9IWMMQsv9PY/CfIov+uL6mcoN+m84aGDmDPHw8hqBz2
	h+gqWm+myRI0N9+zoSMribMXRuhkVLURnn9uL+aJ8HFsk76/rynuaKUFLrMhnBS5
	e9OgmO0AAXPwOiKxb0N4pKb32Ph6spvF+Z94oSTMmeN7lJ+5mcyoNbVDnimli3wB
	QzWwq1BDXoneAliY6+qexORC4KhvVowH33PSQD5YJzW2pJkluWJckB+ZpXirTaeR
	iEsFsw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p75q5k17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 14:23:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F299C40062;
	Tue,  1 Apr 2025 14:22:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E9558A0454;
	Tue,  1 Apr 2025 14:21:53 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 14:21:52 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 1 Apr 2025 14:21:51 +0200
Subject: [PATCH v7 7/7] arm64: defconfig: Enable STM32 Octo Memory Manager
 and OcstoSPI driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250401-upstream_ospi_v6-v7-7-0ef28513ed81@foss.st.com>
References: <20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com>
In-Reply-To: <20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com>
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
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01

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

