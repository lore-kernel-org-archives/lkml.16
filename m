Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B21217673
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828202; cv=none; b=clwWBNipvxYXCwT77XZ5UFJahBqJ/Sb4xzGJB1gChYSxG/CDa3Q4YgGN2+OAykW5033x2h80GUbNyrQsjFlH8qus3122kglNuQ7EYOlELTgMaVSKp5wKivJ3d5d5dpPbO/4QeKt1Sc5Ux/vp7MtTprEYSDduhfpOZwsLb1PRvHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828202; c=relaxed/simple;
	bh=VUmzKwxqymgjrVvJrNyATgkctlHUGe1zx9vEwiXNAaY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QcgNAMvdXqFXlKQSMdvZ7fcqE1cW81kwrznG55U1eyXMIBfbLAGj0g7QtXP68YKsccQsr9cd/Xcw3nu16w2D2HYQH5zWJ+ns9z/bazBVw5kRjC08dZqYRvYR/955tpK4JtLwQySi/+yjNaNJdFM0CeUvMY69tykcFUHBZTRYGSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=C8fRAjiD; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C8fRAjiD"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53GITWmk424417
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 13:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744828173;
	bh=ohGWWpD116snjUxSs4ZCD48LRlSx0GG5NLOulK124xU=;
	h=From:To:CC:Subject:Date;
	b=C8fRAjiDtw0rsM7nktmmuDvBZqdNc3MgfEumLAKf9J8MSRqVaH5r6pWloqooghK85
	 Tsa1p53Bl2yyvojzvlIhg7CHuujxuVn7KYfvBzfvusUT25Btjy6xuX77KURx5r3KVg
	 lSfnSidvUOXzz3X+aO7coe/geLvVZKhOEKo4pgvI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53GITWak054757
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 13:29:32 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 13:29:32 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 13:29:32 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53GITVlq086303;
	Wed, 16 Apr 2025 13:29:32 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <nm@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <bjorn.andersson@oss.qualcomm.com>, <krzysztof.kozlowski@linaro.org>,
        <geert+renesas@glider.be>, <lumag@kernel.org>,
        <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <elinor.montmasson@savoirfairelinux.com>, <ebiggers@google.com>,
        <ross.burton@arm.com>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v2] arm64: defconfig: Add CDNS_DSI and CDNS_PHY config
Date: Wed, 16 Apr 2025 23:59:30 +0530
Message-ID: <20250416182930.32132-1-j-choudhary@ti.com>
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

Enable configs for cdns-dsi and cdns-dphy drivers required for DSI
display on the following TI platforms:
J721E-EVM, J721E-BeagleBone-AI64, J721S2-EVM, AM68-SK, J722S-EVM,
BeagleY-AI, AM62P5-SK, J784S4-EVM and J742S2-EVM

The dsi wrapper driver used by all the above mentioned platforms,
cdns-dsi-j721e is enabled by default if cdns-dsi config is enabled.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

Changelog v1->v2:
- Change commit message to add the platforms that needs cadence dsi
  and dphy driver enabled.

Link to v1 patch:
<https://lore.kernel.org/linux-arm-kernel/20250411095043.272488-1-j-choudhary@ti.com/>

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5c85e5da152f..4c0eb2711bbe 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -938,6 +938,7 @@ CONFIG_DRM_TI_SN65DSI86=m
 CONFIG_DRM_ANALOGIX_ANX7625=m
 CONFIG_DRM_I2C_ADV7511=m
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
+CONFIG_DRM_CDNS_DSI=m
 CONFIG_DRM_CDNS_MHDP8546=m
 CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=m
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
@@ -1579,6 +1580,7 @@ CONFIG_PHY_CAN_TRANSCEIVER=m
 CONFIG_PHY_NXP_PTN3222=m
 CONFIG_PHY_SUN4I_USB=y
 CONFIG_PHY_CADENCE_TORRENT=m
+CONFIG_PHY_CADENCE_DPHY=m
 CONFIG_PHY_CADENCE_DPHY_RX=m
 CONFIG_PHY_CADENCE_SIERRA=m
 CONFIG_PHY_CADENCE_SALVO=m
-- 
2.34.1

