Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59D52989B3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365072; cv=none; b=TJdMfK3mFLukReQEB2Nz0AAPJ5GvGuIb9/66OfbvlHV5LSi6FLm+zUfBlPOwOJ+xQUFHzIRO75oZYE4SC0jVZqBzZux3MilbOB7r9TXb1GotZ8G8g7LHrAvhogY0bO4uf1ircVDpTzmRNUQYXA3FV9GXGcuQDhMgba0Kqblw+MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365072; c=relaxed/simple;
	bh=aAkMjJEdeOUJBORC3WJHhBKrNd6RMnYwpWX83qkxdU0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E67LAd73zIXS55W5SMVVPW5Lvtq2Nq+W5QNCiZRoE5qF5vgPvhT/AJ3OJY2jWDdHXsDqWPn0PolLmPkhomvPzeT93etZb9h002sfS96zxLkC9oJ7q8yji7k4DeJN5+jNg/1Vwv3ROMVRLqSfw1inxSla4vmfbFXS40pmqZBTuAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rNvdBvht; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rNvdBvht"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B9ojbZ1538872
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 04:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744365045;
	bh=9OUXsKYr4L8cuuHUPZZv3opOZe1U/R9+5ovmxBvfKK0=;
	h=From:To:CC:Subject:Date;
	b=rNvdBvhtHct0DEJBrhbtzrrcRyvGfUPNa3Q7m4AZ1q1I+B3WqtBNN4CYrFznkmhkT
	 0CdkIuuJMCOHHTUnvvQQWYR6hNT2z49vt3y8OrClasGNqdmJK58d4+DRkFzlJt4iL9
	 6Y4Yz63IW6GmdajvVFPjvyWxvbrN0aeQ7ytT3uwg=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B9oj0C036392
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 04:50:45 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 04:50:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 04:50:45 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B9oiQX104055;
	Fri, 11 Apr 2025 04:50:44 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <nm@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <bjorn.andersson@oss.qualcomm.com>, <krzysztof.kozlowski@linaro.org>,
        <geert+renesas@glider.be>, <lumag@kernel.org>,
        <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <elinor.montmasson@savoirfairelinux.com>, <ebiggers@google.com>,
        <ross.burton@arm.com>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH] arm64: defconfig: Add CDNS_DSI and CDNS_PHY config
Date: Fri, 11 Apr 2025 15:20:43 +0530
Message-ID: <20250411095043.272488-1-j-choudhary@ti.com>
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

Enable configs for cdns-dsi and cdns-dphy. (dsi wrapper for
j721e is enabled by default if cdns-dsi config is enabled)

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
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

