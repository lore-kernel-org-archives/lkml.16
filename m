Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF468208A7
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595325; cv=none; b=G8FeZ0B8GbPEp9gIMBJCHSsAqfKQdz64MgsIbcQc2Cli53Aq0r4S3hgfuk6GM1MNeDpEVKmGVS+LWvHWMDq1cxkB8+uEnAinlWtEzb2ORoJrVP6qlwJInl9Luwo9e7YSrjaxT+YSdC2jprLf01X8h26vWWVMc582pd66V7QW6wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595325; c=relaxed/simple;
	bh=aEeebPTGI6rZxoOmCPnb27JtxTWh0SwSxBRZJWXg3aA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pg9luh54D9D+FwKzYrvkqMysYR2Oj3ZvEeE+FZisOJvjRclrO/5M+344Aj29wGjxMkAMax/JONi6tRGVQ5fTKYnBV0HGLBg+Bnypm4Y2NCFllVU2YjhkfUPdE6/jpsGjcqmYjicHXcIdjq7cU8W2BMCLq64YAleIA8bYXqJzn0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fdwggEnY; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fdwggEnY"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513F87PG2214454
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 09:08:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738595288;
	bh=HqEE3YRbTbE7T+1H+FMsBDpAKDlGN4RiEhakRYvsKYs=;
	h=From:To:CC:Subject:Date;
	b=fdwggEnYMuGDpLyX25DdN2X2/f4rp1PO6ToRqREfCBCR0PJsNDNp7d8iFSftz2yMN
	 3qCWIrqFfz1V3F+mmHl7r0LjkIP4LZdZh8a5fPuO7cVU5r2dVx/zevLPQvXMvHQZ7N
	 59b3VaOsTM+c0/bDRNLBANgWjLQaIr06fPGqafXU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513F87DH050204
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 09:08:07 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 09:08:07 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 09:08:07 -0600
Received: from uda0490681.. ([10.24.69.142])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513F81hC112820;
	Mon, 3 Feb 2025 09:08:02 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <quic_bjorande@quicinc.com>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <ebiggers@google.com>, <ardb@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <nfrayer@baylibre.com>, <glaroque@baylibre.com>, <tglx@linutronix.de>,
        <u-kumar1@ti.com>, <vaishnav.a@ti.com>
Subject: [PATCH v2] arm64: defconfig: Enable TISCI Interrupt Router and Aggregator
Date: Mon, 3 Feb 2025 20:38:01 +0530
Message-ID: <20250203150801.2399555-1-vaishnav.a@ti.com>
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

Fixes: 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
Fixes: b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---

V1 : https://lore.kernel.org/all/20250119182121.3956546-1-vaishnav.a@ti.com/

V1->V2:
	* Add Fixes tag.
	* Add bloat-o-meter summary to commit message.

Previously both of these configs were selected for ARCH_K3 in respective
Kconfigs, but commit b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
and commit 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
in dropped this recently without adding those back in arm64
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

