Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A7A2749D2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798603; cv=none; b=ks7o8KCQcs+sRWQBxE0ycEGqJhs8hhjD11NwdgBAJRlnYMALqEhpGsu7kBC5L4r+l8LMdmjCBCvLmQ3FJtcVAb2dyA1hILKtvohc53beVjrEY2i4LXBkUlSeVOhQwJFy0er0S6Xi16cJSwTCP6tx7vlLkVN5FWfYiiKCvGN2FXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798603; c=relaxed/simple;
	bh=DAxtrUD4U64w71vIRuaBfbo83NHdECNtIGlG5nzYr64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=HggxJHu5Zh8LIYsYLzTBohXJ7WUuF2Ti7SBZDOAGgGh/gjm2UiCwMBk0KKTEbhZjwFnfXscp/guLOsYPsE8i/TtRsoGMuAoUCm3KxmfH9dmOnnaRIngfbix5HzltCihRxktzTfMF4OMQbmRf6i+oIrE5gy/FNCTLSMlHSOi3LoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TQkNvvAv; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TQkNvvAv"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250613070959epoutp040ca636b4f9ef3154d31cc783d06dab86~IiI5I6Xbw2221522215epoutp04R
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:09:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250613070959epoutp040ca636b4f9ef3154d31cc783d06dab86~IiI5I6Xbw2221522215epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749798599;
	bh=svO7ll9UKcZGcNfSWfhT3p5yZRChtYXewAZzfhfwV3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TQkNvvAvBcGJ9cGdED3YdRo59NY2aXSuZUZcVnCmMZWupbxrA0vI9itteZmcCgHdM
	 /2LEabwVLt3cHlw2QCXaz0cfQf15JsCSMKuQ2Wri2qIpQlRWirRzNPYji7ihkMpR7O
	 9D1k/7vOkjJpquW4v527Ng8VziDw7yWA6dAZJxlk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250613070959epcas5p33ebd9b65689a5bae2d39bdf50c130ade~IiI4k37Yg1235912359epcas5p3A;
	Fri, 13 Jun 2025 07:09:59 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.179]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bJVs13Fpgz6B9mK; Fri, 13 Jun
	2025 07:09:57 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250613055043epcas5p2437abc65042529a2012a6ca80559ac80~IhDrqT3d-0491704917epcas5p2Q;
	Fri, 13 Jun 2025 05:50:43 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055040epsmtip115c503777d2f161a8c24f72d273c3f09~IhDo8yKXL0400204002epsmtip1K;
	Fri, 13 Jun 2025 05:50:40 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v3 2/9] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
Date: Fri, 13 Jun 2025 11:26:06 +0530
Message-Id: <20250613055613.866909-3-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613055613.866909-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613055043epcas5p2437abc65042529a2012a6ca80559ac80
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055043epcas5p2437abc65042529a2012a6ca80559ac80
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
	<CGME20250613055043epcas5p2437abc65042529a2012a6ca80559ac80@epcas5p2.samsung.com>

This SoC has a single USB 3.1 DRD combo phy that supports both
UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD HS phy controllers
those only support the UTMI+ (HS) interface.

Support only UTMI+ port for this SoC which is very similar to what
the existing Exynos850 supports.

The combo phy support is out of scope of this commit.

Add required change in phy driver to support HS phy for this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 917a76d584f0..15965b4c6f78 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -2025,6 +2025,28 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
+	.init		= exynos850_usbdrd_phy_init,
+	.exit		= exynos850_usbdrd_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_UTMI,
+		.phy_init	= exynos850_usbdrd_utmi_init,
+	},
+};
+
+static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy = {
+	.phy_cfg		= phy_cfg_exynosautov920,
+	.phy_ops		= &exynosautov920_usbdrd_phy_ops,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+};
+
 static const struct exynos5_usbdrd_phy_config phy_cfg_gs101[] = {
 	{
 		.id		= EXYNOS5_DRDPHY_UTMI,
@@ -2228,6 +2250,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos850-usbdrd-phy",
 		.data = &exynos850_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynosautov920-usbdrd-phy",
+		.data = &exynosautov920_usbdrd_phy
 	},
 	{ },
 };
-- 
2.34.1

