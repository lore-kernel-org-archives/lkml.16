Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D470A270ED7;
	Tue, 27 May 2025 13:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748351183; cv=none; b=fyskl5uQueaIP7qpiXaYIWms4i14tmyE9b0/d/tn2FMufw78oyav5l5HkcmkDH5x4hM9m3bBATPTES5tHpwjQwV30lBg/cdaBxzRJmstLMwAOrnf4vEWAYXOEratI7Rl6L0NJA+MWl1bNSSwQn3zVM3M68LaFrptpFQ1K6MofKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748351183; c=relaxed/simple;
	bh=tv9K5m8Gf3M74/9nHJfCmYpKCymBtEP93NKz2W+9dHM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=EaANXUdq7O2GrtrKIaEQYjtgFL35E8xxnRu7ZUrjGZxmjtZYszZutjGDXuH8xYxacPdvYo6SR+tB2mpy9S1cS263Zl1WQL+VzkfqE8b5h9YAcozK2V4m4sriEPYZPRvxElk1oZygRloIl9bdB1HLZuPYSn0rR/a9cx1bhG/4IvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=P/Sh8j3f; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="P/Sh8j3f"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAUYAu012749;
	Tue, 27 May 2025 15:06:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=ZyUHCE5D6jcUxtjUukL1pd
	72/M6NGBITAWNwlrkvHyk=; b=P/Sh8j3fjKcMfz+7vdIvt8wiKxAwLYXJ120DEW
	HbZR1X9Q83e3Ofc4BnNS7eo11Ca0qUWPVwRdvgBxUovTsPwF6Tp5dBLLSUoY7hBM
	gI8yvawBvhLpNlJgzUllJKPCqc4o2g2um8MdFBzOBII5AJJYsgZYOOCTNktDx1UW
	rkD5XGlBUvc+TVpEqF0TinfO242qD2mHbkxey0FcZ24sBYVBGp04ZEAHhs/re30B
	wI9n6iHbPV5ZhQ9HNCXv88Y0UYG336/ft6qdEb8gsEG78veHBTCMUix/7QfJW+2S
	jqXgPrzFRmv2D1VNQJkWgw47LKHGLorv0Zs7GJutYKCCTkZg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4j1qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 15:06:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E707040046;
	Tue, 27 May 2025 15:04:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCB7DAE0792;
	Tue, 27 May 2025 15:03:46 +0200 (CEST)
Received: from localhost (10.48.86.139) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:03:46 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: [PATCH 0/5] Introduce STM32MP157F-DK2 board
Date: Tue, 27 May 2025 15:03:16 +0200
Message-ID: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABS4NWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNz3eKSXGOj3AJDU/M03ZRsI12jRBMLk0QDQ0tz40QloK6CotS0zAq
 widGxtbUAHz6zzmEAAAA=
X-Change-ID: 20250527-stm32mp157f-dk2-2a484a01973a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Etienne Carriere
	<etienne.carriere@foss.st.com>,
        Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>,
        Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01

The main hardware difference with STM32MP157C-DK2 board is the SoC: 'F'
variant embeds a STM32MP157F SoC, which has the same level of features
than a STM32MP157C SoC but A7 clock frequency can reach 800Mhz (instead
of fixed 650Mhz for 'C' variant). That's why
stm32mp15xa/stm32mp15xd/stm32mp15xd dtsi are introduced, pending cpufreq
support.
stm32mp157f-dk2 device tree reuses the existing sketeton for STM32MP15
DKx boards, but it is SCMI-based with I2C4 & PMIC managed by OP-TEE,
like other STM32 MPU boards (STM32MP135F-DK, STM32MP257F-DK/EV1, ...).

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Alexandre Torgue (1):
      ARM: dts: stm32: fullfill diversity with OPP for STM32M15x SOCs

Amelie Delaunay (2):
      ARM: dts: stm32: use 'typec' generic name for stusb1600 on stm32mp15xx-dkx
      ARM: dts: stm32: add stm32mp157f-dk2 board support

Etienne Carriere (1):
      dt-bindings: regulator: Add STM32MP15 SCMI regulator identifiers

Himanshu Bhavani (1):
      dt-bindings: arm: stm32: add STM32MP157F-DK2 board compatible

 .../devicetree/bindings/arm/stm32/stm32.yaml       |   1 +
 arch/arm/boot/dts/st/Makefile                      |   1 +
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts           | 174 ++++++++++++++
 arch/arm/boot/dts/st/stm32mp157x-dk2-scmi.dtsi     | 252 +++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp15xa.dtsi              |   5 +
 arch/arm/boot/dts/st/stm32mp15xc.dtsi              |   4 +-
 arch/arm/boot/dts/st/stm32mp15xd.dtsi              |   5 +
 arch/arm/boot/dts/st/stm32mp15xf.dtsi              |  20 ++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |   2 +-
 .../dt-bindings/regulator/st,stm32mp15-regulator.h |  32 +++
 10 files changed, 494 insertions(+), 2 deletions(-)
---
base-commit: dc392342b7bb14b12f2de96201937cb02be7802f
change-id: 20250527-stm32mp157f-dk2-2a484a01973a

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>

