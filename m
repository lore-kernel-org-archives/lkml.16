Received: from mail-m3271.qiye.163.com (mail-m3271.qiye.163.com [220.197.32.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F56D266B56
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422822; cv=none; b=WZ7TxIwXavTNqeCsaBtOiU/zYxmRUbtHzF07z/Loh3Ee+cNqIW9IC11BZSbxdYsOY3ZC3vQCA+0BEdT61UW3xIKNDyzmDmDg77mzit30UOqwpidNtJTsgynjXgZ012eZ/00jt032UupC5rG+Fofe35zvw9Xo/LziFkpWbQi+uBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422822; c=relaxed/simple;
	bh=dPh4CWO9LoE1FnUVpv9+BowNSpqjjHQ638GZin7PRLA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H+m/bfZg5aLdsy46ftsd6GBcBXQWK8hxkJetqLKB7rMOil2Han6+Nh/TDiVVyT44PFZEPojaa3RUPhcaY/roF/lgT+ar92zvophGL532pr1Gevtg2qTDcnZMEXg+WZaNQGDiNPonS1mBVQOevCPGeBL6SU4zoUvOc/e7GOQpMpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=HyRd/gYM; arc=none smtp.client-ip=220.197.32.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="HyRd/gYM"
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b15a650;
	Wed, 28 May 2025 16:55:03 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Eric Biggers <ebiggers@google.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>,
	Ge Gordon <gordon.ge@bst.ai>
Subject: [PATCH v1 8/9] arm64: defconfig: enable BST C1200 DWCMSHC SDHCI controller
Date: Wed, 28 May 2025 16:55:02 +0800
Message-Id: <20250528085502.481476-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGk4ZVk9NSU8fHxofQ0hIQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a97161a2dbf09cckunm84ffe6dd397f07
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PTo6Cjo6IzE#UUgcEANDAw8B
	C0wwFBlVSlVKTE9DT0lJTktOSUhMVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUlLQ0g3Bg++
DKIM-Signature:a=rsa-sha256;
	b=HyRd/gYMuD9hDyqYu2NK1/3JLjy1jI4EpX2O95sBuVnp+0VXrj4r/VY7A9hPhfszpdW5pPk/8GaHNTlkF0U8ykTKoAkoyQ4rdjxjRw73QhchL4O/uPFZoMY+NJO+CVBXMydxot8VxDFWP0MQNBGemGq+o59N8oqyQ/ck5c08qLk=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=h1wNZIxAqWJkI8Bzz88+kjjGoUH05jFKvXNWe1iLpcg=;
	h=date:mime-version:subject:message-id:from;

Enable the BST C1200 DWCMSHC SDHCI controller driver
(CONFIG_MMC_SDHCI_BST)
in the ARM64 defconfig to support eMMC/SD card access on Black Sesame
Technologies C1200 series SoCs.

This driver provides hardware-specific implementation for the Synopsys
DesignWare Mobile Storage Host Controller integrated in BST SoCs.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9f072028fb72..81c2b698e37b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1172,6 +1172,7 @@ CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SDHCI_ESDHC_IMX=y
 CONFIG_MMC_SDHCI_TEGRA=y
 CONFIG_MMC_SDHCI_F_SDH30=y
+CONFIG_MMC_SDHCI_BST=y
 CONFIG_MMC_MESON_GX=y
 CONFIG_MMC_SDHCI_MSM=y
 CONFIG_MMC_SPI=y
-- 
2.25.1

