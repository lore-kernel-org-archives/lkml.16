Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C39825C71C;
	Wed, 21 May 2025 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831260; cv=none; b=Y+xX5dsmmWqrNU5itYFFp0p6FkoQR9bY87nvPkaGGmSdkxbUSowML2xeVD76cXkMZO5fohPq6ovgZrMawNsU4z7mOvaDMobn0yAU9TGlzeLhtJvK6VC36NR273/lS6S8z9iLmUAODTZ0SH0OL0sihBixrB3AzWXm6oXKwCXv+MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831260; c=relaxed/simple;
	bh=kaVJnznSCl+3XxRcg71q/s62KWhVEaDtGGU3XbMey1M=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=lyNXHwYSWRlq0lEc1aQoIZB8Vleq4NpOkG248My6lQjh+VDDIYKlRcQbJ25wxFQ/nRoPyNZDVuA1qpcEWnKEh5Xk9wxUe6QzaO6fcMh8WTF8VCZ89S/oXkpz0lOGIzfcJzWzeOfM5x0QcwVE6I1TAH1t7IDmwQGNBPzL555R2ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=qWTxxILR; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="qWTxxILR"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LBZixL023351;
	Wed, 21 May 2025 14:40:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=YAurZhITL/W1gNO4Qx2jNL
	y6BWLNhxB2Zemmn6C9FOU=; b=qWTxxILRjEdWm0xqkbJd/OFZWBcJ5CDChUI130
	oHmS5YYPBclY5vOa/tyvXQ6JaAc0ef9GoDBheNGVbGohO8lJHnE2JtPSp41aA18M
	jhL3rtvl317fOFLVwkvkW7ah8NhlnKrB21Jp3KBlpS0eulqTLmAt/lp8vrUR7L88
	r5rMi2NiEPpuxuR3+drek/sIos2luUunT/Z9RYv1f3rSIOhL4J7k+erUpOems8Wt
	6877NnFewSZ5Urx2LMSNfGpUlzsNVc49DF7gvMDUEWktwrUu7sAwMNOCEYgUd5jC
	/8UZoU8PjtMhdWYGgn7Gh83QqpZar+KbnoUFwMcI72W5RAXw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwf4440b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:40:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5A79740048;
	Wed, 21 May 2025 14:39:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 37E80CAA543;
	Wed, 21 May 2025 14:38:51 +0200 (CEST)
Received: from localhost (10.252.1.130) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 14:38:50 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: [PATCH v3 0/3] Introduce Clock and Reset Driver for STM32MP21
 Platform
Date: Wed, 21 May 2025 14:38:48 +0200
Message-ID: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFjJLWgC/32NQQ7CIBBFr9LMWhqcBlBX3sM0DaFTy6KlYZBoG
 u4u9gAu30v++zswRU8Mt2aHSNmzD2uF7tSAm+36JOHHyoASlVQoxWvjFMkuQ3RuWDY8i1FeNJI
 ZndFXqLst0uTfR/PRV549pxA/x0XGn/1Xyyik6Jwx2mpStXyfAnPLqXVhgb6U8gVc1YDctAAAA
 A==
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
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01

This patchset implements a new driver to manage clock and reset functionalities
for the STM32MP21 platform.

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

