Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255F422ACCE
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 06:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738736601; cv=none; b=pN8EyvbrU+dPBNThqXxdarDf7rSI4Sc2uKEkK8ScsuIRVOOGUpDhIZExN2a5oMpVuIHqCq41H2Y1SVANGtNiNOGPEukZYUdJTV8Y3BHO5eUIYOxw6jM4Bo9TpqD19ySYETZXFzvXFc/ceVhDSQv335wOF7MoHIMpSDAeope2K0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738736601; c=relaxed/simple;
	bh=x6xsQBMkxQR+kvu3nVrcsNgeG/vG9ZtmXhYBW27xqRE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QviZiUFJ2zLtwvmnP/XalBz4I8OUgLuY8nybB7rGUVcabAEpWqqCVyIJrkRsI0XzsDS/0YXSElejxvzQAE6S6uu5Iy2unG+tii/BCG0k0SmKe8XC3QfmeTfdydlhjgnVZhSDHpZDmFjdoZLHIX1xmVbv8H7ZS/lz2Ib9ThWB1SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=M6kIYbzB; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M6kIYbzB"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5156MaeQ3300929
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 00:22:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738736556;
	bh=eqKxRAE0hEhB/gkwHUJjHYvFkAhY4M48O0HRCPE2xfU=;
	h=From:To:CC:Subject:Date;
	b=M6kIYbzB80Dul28IF5RJDxDRWcCqB/Jtb29S/cnvoqqeP2fKjEj2abTh9S4wQ/8nL
	 TBnkjtXBptqBcNCNV9BrHaemf/9iSiyroyx21zZPqJoV5wd+GQ/FEjXDFWpEhUfgWw
	 RjJl0vkckD26cbR5AVgWs7AaVBIWvwUNNOYkwjgQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5156Ma8w091493
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 00:22:36 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 00:22:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 00:22:36 -0600
Received: from uda0490681.. ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5156MT6A076445;
	Wed, 5 Feb 2025 00:22:30 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <quic_bjorande@quicinc.com>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <ebiggers@google.com>, <ardb@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <nfrayer@baylibre.com>, <glaroque@baylibre.com>, <tglx@linutronix.de>,
        <u-kumar1@ti.com>, <geert@linux-m68k.org>, <d-gole@ti.com>,
        <vaishnav.a@ti.com>
Subject: [PATCH v3] arm64: defconfig: Enable TISCI Interrupt Router and Aggregator
Date: Wed, 5 Feb 2025 11:52:29 +0530
Message-ID: <20250205062229.3869081-1-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Enable TISCI Interrupt Router and Interrupt Aggregator drivers.
These IPs are found in all TI K3 SoCs like J721E, AM62X and is required
for core functionality like DMA, GPIO Interrupts which is necessary
during boot, thus make them built-in.

bloat-o-meter summary on vmlinux:
	add/remove: 460/1 grow/shrink: 4/0 up/down: 162483/-8 (162475)
	...
	Total: Before=31615984, After=31778459, chg +0.51%

These configs were previously selected for ARCH_K3 in respective Kconfigs
till commit b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
and commit 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
dropped them and few driver configs (TI_K3_UDMA, TI_K3_RINGACC)
dependent on these also got disabled due to this. While re-enabling the
TI_SCI_INT_*_IRQCHIP configs, these configs with missing dependencies
(which are already part of arm64 defconfig) also get re-enabled which
explains the slightly larger size increase from the bloat-o-meter summary.

Fixes: 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
Fixes: b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Tested-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
---

V2 : https://lore.kernel.org/all/20250203150801.2399555-1-vaishnav.a@ti.com/
V1 : https://lore.kernel.org/all/20250119182121.3956546-1-vaishnav.a@ti.com/

V2->V3:
	* Justify in commit message that the patch only restores
	previous behaviour and also the reason for size increase.
	* Collect Dhruva's T-by/R-by.
V1->V2:
	* Add Fixes tag.
	* Add bloat-o-meter summary to commit message.

Previously both of these configs were selected for ARCH_K3 in respective
Kconfigs, but commit b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
and commit 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
dropped this recently without adding those back in arm64
defconfig, this causes boot failure in all TI K3 platforms.

Passing bootlog with configs enabled:
https://gist.github.com/vaishnavachath/03d8d3ce0f22219643c2f4d1dd243fd1

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..1f25423de383 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1551,6 +1551,8 @@ CONFIG_PWM_VISCONTI=m
 CONFIG_SL28CPLD_INTC=y
 CONFIG_QCOM_PDC=y
 CONFIG_QCOM_MPM=y
+CONFIG_TI_SCI_INTR_IRQCHIP=y
+CONFIG_TI_SCI_INTA_IRQCHIP=y
 CONFIG_RESET_GPIO=m
 CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
-- 
2.34.1

