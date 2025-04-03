Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF5A24CEFC;
	Thu,  3 Apr 2025 12:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743683434; cv=none; b=O7qjKq2pXDI4TmlxIiHOHTNsO5/71Qi6XnNlFh2uxKN3ZLiPUAys7G9K11uL6GhuvwgAAu8EzQ9UWgH71zvfQh8LL+197W5xKn0zdwNTQZ/f5OBYzQ0cpv7tnJR76TKrGcKOY6VorA8Hs3HvLSq2AW/J+E1x4noS9VEMXo4XHr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743683434; c=relaxed/simple;
	bh=5T1OA4ChThqSNaJTyIFUJ3NJ+R7Nkp6/f3hl+GpY33w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AyqjqWxPhfeYdp8fdxGohrZR0/yAGleCuU1TK5PlfbTg3MJAo3b5r6+7vLm//N19pQPOq6qUn9mayKJ50oXVqW6SW6wcq/FjEhKHZy3BigEvjgZW24WV6bIjXdH5wQf+ugqCX5cAhAISA6HRKqD8FbywoiIVGRQzCAORwa3MRf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=7MZU4EmF; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="7MZU4EmF"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533BPk0D024168;
	Thu, 3 Apr 2025 14:30:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=Von8b2NXYZkvBjVDvYrnhA
	S11Wz/rmPhDLEso1JFGD8=; b=7MZU4EmFiq0v96ExZQ1gVFyPx9cBkUF/xFf3SD
	CMpkWWEXlqYGH6hy5XOBlvYtUmxXNYBz9fRiKON4qj4TrsoCVa/f59cf40HA00xP
	gYbOIx+EhPHxk73lZ80AfWQE8Q4IgjaehUnaMTaVZMIjVWTt2bdV000oXiSDz4Og
	e+FoxM00NzCSMlAJWZBRZvS/MIRlCBkCC3x77kM5nM9wNFpF7uWemvgmsKR/cqjv
	Mhe6olkO439rjpENRsCQ1HSHH9ZncnLEUAipEpHjMVj7yD/1y1PFNJ/F8NKv1ZcX
	Mmw2e2TnJpgYxsYfpjizVWAsec81hpm4w0xaXYdZiMYMveEA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45s2c7eeya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 14:30:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 52ED740048;
	Thu,  3 Apr 2025 14:29:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 303088EEC9C;
	Thu,  3 Apr 2025 14:28:26 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 14:28:25 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <maz@kernel.org>, <tglx@linutronix.de>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH 0/3] Add ST STM32MP2 GICv2 quirk for EOI split mode
Date: Thu, 3 Apr 2025 14:28:02 +0200
Message-ID: <20250403122805.1574086-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01

When using GIC EOI split mode, GICC_DIR fails to deactivate the interrupt,
leading to a WFI freeze. On ST MP2, GIC cpu interface is limitted to 4K,
thus GICC_DIR register is reachable with a 0x10000 remapping

When using GIC EOI split mode, the GICC_DIR fails to deactivate the
interrupt, causing core freeze on WFI. On the ST MP2, the GIC CPU interface
is limited to 4K, so the GICC_DIR register can be accessed remapping the
register to a 0x10000 offset.

Christian Bruel (3):
  dt-bindings: interrupt-controller: arm,gic: Add
    st,stm32mp2-cortex-a7-gic
  irqchip/gic: Use 0x10000 offset to access GICC_DIR
  arm64: dts: st: add st,stm32mp2-cortex-a7-gic in intc node in
    stm32mp251.dtsi

 .../interrupt-controller/arm,gic.yaml         |  1 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  2 +-
 drivers/irqchip/irq-gic.c                     | 47 ++++++++++++++++++-
 3 files changed, 48 insertions(+), 2 deletions(-)

-- 
2.34.1

