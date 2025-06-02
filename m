Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9110E7485;
	Mon,  2 Jun 2025 12:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748867003; cv=none; b=p8lkkR9brofkYbKWNklBFTJVjBvW/Q/xWr04su7jf1f3K8lf6l+tex02/Pl0chLQdeXX8odg9IlCTOuoO0pusuDCtaTDKohKFQgikI17QsPVkCZXEvgbLRPzIHIlafaH6+nPZSDWe1HjusdR9qOX21C19KLG2R50H8VIfR6AS1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748867003; c=relaxed/simple;
	bh=2ThgpBgeqpHJUxGcK/jtj/p0yTPtOjhukUKaepGKJH0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=gV33AfVRBIZhrQsSxAQdCWcvU5XO2XwBCES2w6ZTheLHmfIbcXbMvGJZIECl9kM1ZE2AAxDpmZsLRCnU93LMCFyPbIcx5tsEA3RcXYbXCc+j/UOEu1kyvifNS0OSx0AePoBy+4pMTqWeNs1HlWals9QDa0WZ/zVwI0R9lC7VVvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=40V5JLvk; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="40V5JLvk"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552AASXL025532;
	Mon, 2 Jun 2025 14:22:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=UT9+9Gn2wSD5nWtQbJ0zo5
	ey2zcYV8DLHJ5SerRYtF8=; b=40V5JLvkvsu7qtwUYaBlWRkgPGY0nbIuYl2zr9
	0AXqtQ9Bq0eJGCf5lzMZArlKH2Zo98rcX9i4N65r5Oho8AnHfvymls1b1P7Nswi+
	oZQS/VoxacEDx/8bj69ryymNa6NlzOT9g4dB2EEZmf+u/cE6Vd237zPBSbgnNgVP
	kpw9qtd2hhZ0a67sZ79vY/rAXLKJLTNLKUqLWcz5AYOdFc3PGnjTzoOfPcGmdUPw
	z5Tt3pfAY8Fkfd54ysImzzuo9YRIioJ1FQ+/HSjlw+Sqmc6ogVZcm8ghJz0mzYtT
	tVtLgZ7vyvjuOBfOZEHn/yFma1vMkyDII74qpGZZ0Li+axjg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46ypw9etr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 14:22:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C906A40058;
	Mon,  2 Jun 2025 14:21:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8CECBB3325E;
	Mon,  2 Jun 2025 14:19:38 +0200 (CEST)
Received: from localhost (10.48.87.146) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 14:19:38 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH v4 0/3] Introduce Clock and Reset Driver for STM32MP21
 Platform
Date: Mon, 2 Jun 2025 14:19:36 +0200
Message-ID: <20250602-upstream_rcc_mp21-v4-0-336b4278136a@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANiWPWgC/33NQQ6CMBCF4auQri2pU2nBlfcwhjTTIl1ASQcbD
 eHuFlaaGJf/S+abhZGL3hE7FwuLLnnyYcxxOhQMezPeHfc2NwMBlahA8MdEc3RmaCNiO0xw5Fb
 UCpy2qFXD8t0UXeefu3m95e49zSG+9hcJtvWfloALLlFrZZSrsnzpAlFJc4lhYJuX5Kdx/GXIb
 KDBxtadkhbEt7Gu6xtEYgOs+AAAAA==
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
	<nicolas.le.bayon@foss.st.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Alok Tiwari <alok.a.tiwari@oracle.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_05,2025-05-30_01,2025-03-28_01

This patchset implements a new driver to manage clock and reset functionalities
for the STM32MP21 platform.

Changes in v4:
- add missing fix : replace double '::' by ':' from dt-bindings documentation of STM32MP21
- Link to v3: https://lore.kernel.org/r/20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com

Changes in v3:
- Fixes dt-bindings documentation
  - drop minItems for access-controllers
  - remove rcc label from example
  - remove double '::' from 'See also::'
- Add patch to report these fixes to STM32MP25
- Fixes typos in RCC drivers (Alock)
- Link to v2: https://lore.kernel.org/r/20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com

Changes in v2:
  - add list item for access-controlers and fix maxItems value from bindings
  - drop STM32MP21_LAST_CLK and STM32MP21_LAST_RESET defines from bindings
  - typo fixes from ALOK TIWARI
  

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
Gabriel Fernandez (3):
      dt-bindings: stm32: add STM32MP21 clocks and reset bindings
      clk: stm32: introduce clocks for STM32MP21 platform
      dt-bindings: stm32: cosmetic fixes for STM32MP25 clock and reset bindings

 .../bindings/clock/st,stm32mp21-rcc.yaml           |  199 +++
 .../bindings/clock/st,stm32mp25-rcc.yaml           |   13 +-
 drivers/clk/stm32/Kconfig                          |    7 +
 drivers/clk/stm32/Makefile                         |    1 +
 drivers/clk/stm32/clk-stm32mp21.c                  | 1586 ++++++++++++++++++++
 drivers/clk/stm32/stm32mp21_rcc.h                  |  651 ++++++++
 include/dt-bindings/clock/st,stm32mp21-rcc.h       |  426 ++++++
 include/dt-bindings/reset/st,stm32mp21-rcc.h       |  138 ++
 8 files changed, 3014 insertions(+), 7 deletions(-)
---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250520-upstream_rcc_mp21-d0862e7dc769

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>

