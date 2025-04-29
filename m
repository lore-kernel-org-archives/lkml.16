Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A115C22A7EA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917325; cv=none; b=pfMRI1NpynC8Tp+wV1T/MJsk7biTnMwWqQZmntKSBR/0as71pXQnebWZuuZh9iTX4cxxcKEmLbQD8JOCRiLdlusU/PylSbdq3y+tJWoTcHO8x3kUCsAG9sgGfJskQQOlPg8KmrMzb8SD210y2gzfh2ZUCqzA6JJup//EAFxAaGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917325; c=relaxed/simple;
	bh=oNXzkfNQzmJC63PmCHxiMrgawnbadC7dxmj8/uKNLqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QSnXNYDBHVlgKKJw9y8ictVu4oN1PMMLxcpb6cc5Oedc0pPywXQ5LR0vrqJNm8Jc3i1L54Xt29n9JUnsm2SkpNir5VpDYkbNk77v5ALRWw2fNp9SbEiQ1Ysrxdr26H7Kp8HtjYnFfXni/3gnBKtofGRSa+e+wKLXs2z2gtT363A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=AqbgmLMC; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=QVG5KA7G reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="AqbgmLMC";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="QVG5KA7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745917322; x=1777453322;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CBp3gVMZ4Xj6VTie2AOZTRZv6GCiRK4KbGKItk9J0Z8=;
  b=AqbgmLMCOuV0AwUJ1EReyfBli7tfkOH9DTx/R0DYrR2/SXCFeT15CH/x
   YQ7clZll7HeaSQpL/pGCeuTWkGRLnI5Gi4O13Tuf+fFkIuNW/i02I+eB3
   H4VsG6sonuaKrZPfpBHVFheGd/gcEtUf8J+rrvIWjL1MTVZwWsFo9PH7m
   BHB08eGRAuAOPt/6kLHCBabxZ6pBG/8DMbK81Pkr3LL3Mx7jbINK0nWMO
   lzx9B7HeRJSUZg5WDtimXRmbM26E7pv5wRnj1pbGFTAU+mb6RX2lokS60
   h2FBUgpe1CMsMWwlwqb5Xa7uXler9hTnGDYCVFphmQ8nFAF+N4XZ+w+uT
   w==;
X-CSE-ConnectionGUID: ZLcJNe8HTUCCTWKIMfa8IA==
X-CSE-MsgGUID: g9xvr/rwSxKr+0AA76UsgA==
X-IronPort-AV: E=Sophos;i="6.15,248,1739833200"; 
   d="scan'208";a="43777057"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Apr 2025 11:01:59 +0200
X-CheckPoint: {68109587-28-7141A0B0-E6EDEC14}
X-MAIL-CPID: C8E3A0A56DD49BCC6676081E6626B4CF_3
X-Control-Analysis: str=0001.0A006396.68109586.007C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBE26160E21;
	Tue, 29 Apr 2025 11:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745917315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CBp3gVMZ4Xj6VTie2AOZTRZv6GCiRK4KbGKItk9J0Z8=;
	b=QVG5KA7GT2JDq9rzTqFcSeoi5lLbmx0CMc8+weH7zqGrzO50CqIJDaJPA8RDdlqMDmELy/
	iO/ayZbZ6X+nzEl7k5urOsDN58yAYvBMT0nE5sg+cIU+2V5sgSQ1qGQLg/VOC6o46tbFD6
	vgaEhmJHOpwZjCb0+9Grk0qUYtiAfmajw3QPrzERMURMMAHoDJ1Ovb/KT2Z6It/vMgFQ+Y
	ZscvQUrZpAItjhSb/mXdV7zcGDBtJ3ZBLHlyfqs8fVcXisaONqB2KLiHlMI77hxL915riE
	VI9/4PJHKozuLBGj+RF1QaTP7ZklxKaxq7xRDTjyawtsfotJE70groQwdcvDfA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] phy: freescale: imx8m-pcie: Simplify with dev_err_probe()
Date: Tue, 29 Apr 2025 11:01:52 +0200
Message-ID: <20250429090152.1094243-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Error handling in probe() can be a bit simpler with dev_err_probe().


Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index 7355d9921b646..68fcc8114d750 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -238,24 +238,21 @@ static int imx8_pcie_phy_probe(struct platform_device *pdev)
 		imx8_phy->clkreq_unused = false;
 
 	imx8_phy->clk = devm_clk_get(dev, "ref");
-	if (IS_ERR(imx8_phy->clk)) {
-		dev_err(dev, "failed to get imx pcie phy clock\n");
-		return PTR_ERR(imx8_phy->clk);
-	}
+	if (IS_ERR(imx8_phy->clk))
+		return dev_err_probe(dev, PTR_ERR(imx8_phy->clk),
+				     "failed to get imx pcie phy clock\n");
 
 	/* Grab GPR config register range */
 	imx8_phy->iomuxc_gpr =
 		 syscon_regmap_lookup_by_compatible(imx8_phy->drvdata->gpr);
-	if (IS_ERR(imx8_phy->iomuxc_gpr)) {
-		dev_err(dev, "unable to find iomuxc registers\n");
-		return PTR_ERR(imx8_phy->iomuxc_gpr);
-	}
+	if (IS_ERR(imx8_phy->iomuxc_gpr))
+		return dev_err_probe(dev, PTR_ERR(imx8_phy->iomuxc_gpr),
+				     "unable to find iomuxc registers\n");
 
 	imx8_phy->reset = devm_reset_control_get_exclusive(dev, "pciephy");
-	if (IS_ERR(imx8_phy->reset)) {
-		dev_err(dev, "Failed to get PCIEPHY reset control\n");
-		return PTR_ERR(imx8_phy->reset);
-	}
+	if (IS_ERR(imx8_phy->reset))
+		return dev_err_probe(dev, PTR_ERR(imx8_phy->reset),
+				     "Failed to get PCIEPHY reset control\n");
 
 	if (imx8_phy->drvdata->variant == IMX8MP) {
 		imx8_phy->perst =
-- 
2.43.0

