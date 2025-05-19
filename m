Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC9F27A454;
	Mon, 19 May 2025 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747664627; cv=none; b=FnxG/kJ7BudVc2rP69F6x8PZ81IQJgRl7RCC3ZzdH+yrDSuZ4kh4RoyyapeX5IQde36+IdsfYXRGwB1aInOOUUiOxQ59CaPvOAIWg+4mDJ51wiAGu0pXQcSD/nblGga7q4TmGJiNdy/3PsVdXEdlKU/8FnOLj4w+VI5K8Rh/ya4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747664627; c=relaxed/simple;
	bh=Blbrri6FH8wJOanj0tKlT5U4dzLL7W3O7m2XAuWui5g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E9KYlpygyJ2DAp0bROgA5ZKr1GFzKSpbzmM3hpHIHPsbR9pLzl/PqoQRenjzbxrabGN10+sIbwzfTKTFQ/hM2Z7G4hbbGIeZF1F9cd0+n2nVkWrxhrSG5ah7LcbamU7SuA8HT5MAiPEEoci3hFuG0bVQl8UYCIAr82Bn43AOz+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=x5OpPA0v; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="x5OpPA0v"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JCfTQA010338;
	Mon, 19 May 2025 16:23:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=ZEsf6U6LhGvfr6fOo1/rnn
	Uoo/IxdJBuUdf2Ks4ZstQ=; b=x5OpPA0vvNufgpc/a9J8chov4oyj5yH+7cUyUV
	fpBfsCwB/xaFZKGSmsfxE+XP2BgamD56aL2lJgphsikSCUrx4/izthCyUnStpNsh
	jFhMs8nmSOAtcGhw67d1hWqbk/0PWgbGE5H7WGhp52pNFg36y3OsBV6N6s69JIY2
	wU7g/FKNXmi76J0EPR9V9ka8dc1ZLF1S50VCL01vx7mmJZdpuuskVeabd3dMXUEe
	T3KFqdoNRtRSnSkAs6BEjskghH/0+wI4hHFKcvxvGnxTw6PFbWvjPPM9Wr5oAuIT
	CuQePYPRxOx5eQLYM6vbaNK3uMN+ZywiX5oVI1ujPy8n5Vtw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfka0c9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 16:23:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2285240046;
	Mon, 19 May 2025 16:22:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3460DABD0EC;
	Mon, 19 May 2025 16:21:13 +0200 (CEST)
Received: from localhost (10.48.87.146) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 16:21:12 +0200
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] Introduce Clock and Reset Driver for STM32MP21 Platform
Date: Mon, 19 May 2025 16:20:55 +0200
Message-ID: <20250519142057.260549-1-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.25.1
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
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

This patchset implements a new driver to manage clock and reset functionalities
for the STM32MP21 platform.


Gabriel Fernandez (2):
  dt-bindings: stm32: add STM32MP21 clocks and reset bindings
  clk: stm32: introduce clocks for STM32MP21 platform

 .../bindings/clock/st,stm32mp21-rcc.yaml      |  200 +++
 drivers/clk/stm32/Kconfig                     |    7 +
 drivers/clk/stm32/Makefile                    |    1 +
 drivers/clk/stm32/clk-stm32mp21.c             | 1583 +++++++++++++++++
 drivers/clk/stm32/stm32mp21_rcc.h             |  651 +++++++
 include/dt-bindings/clock/st,stm32mp21-rcc.h  |  428 +++++
 include/dt-bindings/reset/st,stm32mp21-rcc.h  |  140 ++
 7 files changed, 3010 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
 create mode 100644 drivers/clk/stm32/clk-stm32mp21.c
 create mode 100644 drivers/clk/stm32/stm32mp21_rcc.h
 create mode 100644 include/dt-bindings/clock/st,stm32mp21-rcc.h
 create mode 100644 include/dt-bindings/reset/st,stm32mp21-rcc.h


base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
-- 
2.25.1

