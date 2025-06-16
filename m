Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5BC1DDC23
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070022; cv=none; b=dyPIiNQgPHLAk8LChCv3F8CI4oOhZ0VWrHkFOSIdUBUWDa2ix8qJfSK8Zp3FSxOLdSxUP10tPVol71NmHoj1TPioU7a+nX6YeuvimHUq0+130HtbW6LV2dsGc2DEJF1Fl12cEodCqnTiTTEOaxde1Y0qVo6MDcE4DHkXN6ua3+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070022; c=relaxed/simple;
	bh=ufd4BryHTluBiYyQKtFjlL0I0zEHkeAF1c8bUuRe3m4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GGAdUzIxWdWMf7nFSPuDLKvlcopf+1xPjIW5iwnXTkS+QCS56r0dXtvCOeGmgdH/wi0GkBwtpD+3K8fNiTDd1xAZAGLdwjyrMU4rjSmcRrMLNKmJjeSFmQOZncGXCZxCnOzhRTgb48hUwSx0fConeV4aWNWgXHR9otAdt+hL95s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZTFwGXi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZTFwGXi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D19C4CEEA;
	Mon, 16 Jun 2025 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750070021;
	bh=ufd4BryHTluBiYyQKtFjlL0I0zEHkeAF1c8bUuRe3m4=;
	h=From:To:Cc:Subject:Date:From;
	b=CZTFwGXiFT/z73efaMumqXar2SrI4awgM1WNw7X45RhRInIDZHv+kQwrzRP81+DZ1
	 dWFV1X5VvGr65Cxr2V1rRRDiJxP1Ux77jKlvGD3t7/vBt0C16cSnCq5xQCsq2g6BPL
	 nNCJ9Alion89eTsRcrP3GjR16YzeEwS/CdJwHO7g8KOh4l2XYfTSO1OS9YAmFqxNMY
	 jzF4UyVeTLUjqRStqa1mFb7yJdSBXSHtiFMjaBLPGw4YGyoakUyIIAAYS8NsDUPj2y
	 AMK7vge7AZR2ZPrD0c5CAQtp5deZ+QfKRKm2bU45KzN3gcIRj8eqqKTJX5zoweAoYt
	 uRdA0v3rSBOmQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uR79l-000000008VV-3Bl9;
	Mon, 16 Jun 2025 12:33:38 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] arm64: defconfig: fix renamed Qualcomm EUSB2 PHY symbol
Date: Mon, 16 Jun 2025 12:32:52 +0200
Message-ID: <20250616103252.32642-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm Synopsis EUSB2 PHY driver was recently renamed along with
its Kconfig symbol but the defconfig was never updated (which breaks USB
on a number of Qualcomm platforms).

Fixes: 8d3b5f637546 ("phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory")
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8c54aaea7866..6b5958fb46bc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1573,6 +1573,7 @@ CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_RESET_TI_SCI=y
+CONFIG_PHY_SNPS_EUSB2=m
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_CAN_TRANSCEIVER=m
 CONFIG_PHY_NXP_PTN3222=m
@@ -1597,7 +1598,6 @@ CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
-CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
 CONFIG_PHY_QCOM_USB_HS=m
-- 
2.49.0

