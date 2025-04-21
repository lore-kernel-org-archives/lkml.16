Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0158B19F12D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 20:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745266290; cv=none; b=T4qoQ+goZjwLAdhFqJtlY2k6vcRc+Ml9cTV/9m9q9AoRBU3NFyPpAUWJWlmakeVbX3J8NJ7SYl/zP1+X0O/U8f7fFnyLsOhZtfEi4T3Ll5AWDn2idzK/dZBm584GYL9jEIGtsAfqdjCkqwAkk2qjR2R1T0C/RcDaZqWp0WWVFNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745266290; c=relaxed/simple;
	bh=DIR9uRSfnCXoUn2XTytjl4qamEMfuLYfC6sM/232VwU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R/rz6/+4wWD3ehQFIsJ9+JSPDL5/1cclA3WzXW5JCjHqb/SZ/Xti79L9i6m7MGhBoiX0qe7awdV+lY/GT2oumKwpXLtIKhPP3QVahs/9EBjRUcxR98KJ/qyJsmNZfCxhvBg5Juxk+izlzvzFfooBjRqnC1lvLJkmMt4HSbFfupM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZyPVERNz; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZyPVERNz"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LKAuxM995915
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 15:10:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745266256;
	bh=lAfZiqKSWhX8157fzjfmS1p8uv8d5TT2GTALmg3z73Q=;
	h=From:To:CC:Subject:Date;
	b=ZyPVERNzJJOtDfVpuBNX0Wq7W7oqRdqdzauTppwN1dAR0n0x+X7P2MY8qg3QwY0Ce
	 Jkjz+kG0t2K/0LmRdKfdugLPJyX9gAIB/Bx8uGB7qkihnrwpSrYWB6PEKY+LwJHvVm
	 0e8FSHii2NG066nbCuDXItux8O5ek9X88VRhNHWU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LKAucN020393
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 15:10:56 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 15:10:55 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 15:10:55 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LKAtGA067946;
	Mon, 21 Apr 2025 15:10:55 -0500
From: Judith Mendez <jm@ti.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: Judith Mendez <jm@ti.com>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: [PATCH] arm64: defconfig: Enable hwspinlock and eQEP for K3
Date: Mon, 21 Apr 2025 15:10:55 -0500
Message-ID: <20250421201055.3889680-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Enable CONFIG_HWSPINLOCK_OMAP to allow usage of these devices
across K3 SoC's. Also enable CONFIG_TI_EQEP which is enabled by
default on am64x SK board.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9e16b494ab0e2..1f7b97ff46a7e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1415,6 +1415,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
 CONFIG_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_OMAP=m
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
@@ -1676,6 +1677,7 @@ CONFIG_INTERCONNECT_QCOM_SM8650=y
 CONFIG_INTERCONNECT_QCOM_SM8750=y
 CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
+CONFIG_TI_EQEP=m
 CONFIG_RZ_MTU3_CNT=m
 CONFIG_HTE=y
 CONFIG_HTE_TEGRA194=y
-- 
2.49.0

