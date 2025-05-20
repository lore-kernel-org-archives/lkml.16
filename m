Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4EBCA5A;
	Tue, 20 May 2025 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755069; cv=none; b=Au+mng4zE4psOliJKhZAuktJS3oNLm1BwvCLxdLkz+3cjBmbpNcn2CczDwbTOh0Hddf+QAi1RFsNX7pGG0fEdK9BZC8Fx/XdE8YkvIDVOpHFLuyOFRfgUktuPr35Rl/C0hOH00BFEUQlFcoFRuYyvzDj7hUBjB5b2CqmWd/MyEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755069; c=relaxed/simple;
	bh=GrbZGLItfP6Nd2xeSeZXNEfkQXPcthdv00SmcvOiYQE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=PWDwMl5D9cCjbTYxmdcvAJ/nleFTCNOjmlsEZdax12GKckYwvV3W/Azwi1VsV61KNJINZ5x9dB+DeqNdRyD1V7yades9+Pc3XsZxA/q+KLq53PONRpAfUEfr6v230MIsxVd7nE0ar0YvQB6dmYg79v8WcgQQH2Ck75wd9sTuL5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=rGXxvaOm; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="rGXxvaOm"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KFMZ9h014091;
	Tue, 20 May 2025 17:30:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=lk7D3+J+dO4N7nuT17NijQ
	wiCNmJdFyl56IfBFqF/xU=; b=rGXxvaOmKPW1GVxiuQOJhoM9eawEJGXYy7DL5y
	YrIkMQEaN0lHTPvIO00NJkS7B+UtAYqrNLwar4UOjhwFX32Q0LSNRpgsFK0tcOXu
	xMdoKf8yt0Uty1Bbe3M4noqBdNL1Ua2h2VqUunKQ5E9c9AHSWFTJYH76h/ArIMRu
	ovsRrUvA4KkTXgPb68KGlj1Gl64c7vWmUHjqCNPoVkHf28A9vVvMLHdMebATxVl4
	KqznOGAyJOCZhaAF+kJfvrQkb/HNk33TiCYJnJa48bzM5ZpgeLkT7TqYiWUMMzIt
	RWLD5VZUBb9Sxs6T/54bOYCoBJwaxw2qj40iPFtdkQcSUNfA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46phbgnnk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 17:30:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1585F40047;
	Tue, 20 May 2025 17:29:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A3FD8B23C3F;
	Tue, 20 May 2025 17:28:54 +0200 (CEST)
Received: from localhost (10.48.87.146) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 17:28:54 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH v2 0/2] Introduce Clock and Reset Driver for STM32MP21
 Platform
Date: Tue, 20 May 2025 17:28:36 +0200
Message-ID: <20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKSfLGgC/x3MTQqAIBBA4avErBNsIPu5SoSITjWLSsaKILp70
 vJbvPdAImFK0BcPCF2ceN8ysCzAL26bSXHIBtRY6xq1OmM6hNxqxXu7RqxU0K1BaoJvTAe5i0I
 T3/9zGN/3A8Snj0hjAAAA
X-Change-ID: 20250520-upstream_rcc_mp21-d0862e7dc769
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Nicolas Le Bayon
	<nicolas.le.bayon@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01

This patchset implements a new driver to manage clock and reset functionalities
for the STM32MP21 platform.

Changes in v2:
  - add list item for access-controlers and fix maxItems value from bindings
  - drop STM32MP21_LAST_CLK and STM32MP21_LAST_RESET defines from bindings
  - typo fixes from ALOK TIWARI
  

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Gabriel Fernandez (2):
      dt-bindings: stm32: add STM32MP21 clocks and reset bindings
      clk: stm32: introduce clocks for STM32MP21 platform

 .../bindings/clock/st,stm32mp21-rcc.yaml           |  204 +++
 drivers/clk/stm32/Kconfig                          |    7 +
 drivers/clk/stm32/Makefile                         |    1 +
 drivers/clk/stm32/clk-stm32mp21.c                  | 1586 ++++++++++++++++++++
 drivers/clk/stm32/stm32mp21_rcc.h                  |  651 ++++++++
 include/dt-bindings/clock/st,stm32mp21-rcc.h       |  426 ++++++
 include/dt-bindings/reset/st,stm32mp21-rcc.h       |  138 ++
 7 files changed, 3013 insertions(+)
---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250520-upstream_rcc_mp21-d0862e7dc769

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>

