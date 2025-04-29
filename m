Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46F7253B42
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745950195; cv=none; b=UEuuYatvcxejZh+HV4PsORxNPNihdzh2MkJhnG3AmeYtwDuQ4qDTgMyjtQf3yMEEmNv0G0/tQpLqQuhTCu+QSl/3FzT4XL6Z25Q7RnaYlEtNa6rjKeFlTyk/dKv2NCpV/9r6IZ/0mU9kitGVAzfSB0pbv5eYZNMi1c951HHad08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745950195; c=relaxed/simple;
	bh=5c/GwZGg6YfVlYGBkBCZKwX7PpiLtVcO4mQlYw0R+Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YlWPA10iOMmShM9f9NZGdlOnBCgLFOSLPcAXtfLgOFp4OvoauIzdWicK0vTsoCc0iD7DtcZbu50wM6M5/DqDU0PFOfLr4DMKxJQMb859kHxM0EVNEV7opjZvNcn4p4ZxVH7sNPr6nbjfJzEfiQEPaQOZh8mpmG3CQypahodlbrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iaJcwWmI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iaJcwWmI"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso9291995e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745950191; x=1746554991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq/xrCbSpMl8yUGK/CtcRuYFkY28ZnkmRZXSp/OjKl8=;
        b=iaJcwWmIrWAMWNpMsq5wMcXnIBjvKe8BxMjq02BblNT+eO1Gu2w+9VqVPtA13jRF6J
         wvwgxMCJBAkguOVhyTduMmVApwik4LI7ztjk8ZFGUkwcbCVZ6oYWaelhl54oVH5fSEI/
         k4smSrh9p7UpAtakCmRxCzx2BpZOz2H6g/9X8lrDdWFjYm7cPzjrFLrPqcVMRGnheect
         EaCMQ7K5/cHhFHh/SnC+8C2FBrImDnYYGo0YA1+oYLyBy6wLHApdkX4if0dSAgP4VmAN
         JBmAae0T3jLEvSgtI+QILqCM1osAcq1lVAljGO3ZKN37dwnFMQ3T4Uq1i/S3Pbv126Z2
         y3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745950191; x=1746554991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uq/xrCbSpMl8yUGK/CtcRuYFkY28ZnkmRZXSp/OjKl8=;
        b=HZs0f6NIZpjZnfxKOqJNBSaVZcB2dUC66yihKCZROurP1qoc1ile7ynaVCTRkLN4k5
         Q2SsrYS4Y6+0FOyRLDYLIffb5Hii/I65MrmH+R/CY2FKf9XjR7mYUJCVYhDnhleEwhqo
         fCo41i6E3/HSUX1Zh8gbAimk+8dykvKRq1DFRwpX+/xBnxJv+FL1uyQ9of2OVpuug2FG
         cGW+bU0p0XT34CsQ/blKxkq3BxCnI33ze/iyVLMnaNzenpwoKtpu9ljpR4Yknl4PYJe6
         m0T3BvRS7Kgy6v5JHzjpwA/fhQCL6pRs4xEAw05ohkDuD3aXZ4xiulhL3TNk03HQ/Uzw
         wTpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHlkcKEpCf8Tz77HgT4lNvtHKK1Rvw7fKcddUrrs5MnilwFOD+gOi9yhYUmO0N7C/X5eFjfwG+pvUruF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/l6QU/TseT0ff6OC+o8Si/WgmZQhlQ0pU2o8C1V5xFMex8ORm
	sDD5nRX2h2BcnIzBJR9emvfdILzVMagRCk6ZIPVUPIS9Pc7KTZ/pBYvW9hxmBGP15CGIDBvtBMc
	O
X-Gm-Gg: ASbGncte3RFIRd4N5CgQWxZ119aVTMzKTf8M/Eu+lWlbQCmViuuUBD33dKd586CVAlC
	tgM24+57JDBz8flTBQSgHgNT/ZmwFYQlj46jteuwYRZNujRPm8WeZbu5BkDwQy00Mp72ptdEz5A
	JHGeuLLAOcFvZ7Jfs5yqUdV+mIQM2OgkExv/Rxnv7bkpvfpbzgn5yp4N22X5mWnTdSBCCeKyHqL
	2FtJB/eESQAsdUnxaHjEdzg2z8l8PJ+bz+zkCfvlUk1yk0+sKfdiYvLTbtrJuOMYJclK4oaiTeL
	YWHzwU4VSn5PGtL9Epfgk97WLeKCdAu5NNOZ74JvcP3lZIGNJA==
X-Google-Smtp-Source: AGHT+IF4ruiqqDP8X8kBz07PWrwGmJHtaW7Bjk2i12EiWRq+A8qrj2gI7KFa7bV/OaRdFcxu+zZ3jw==
X-Received: by 2002:a5d:59ac:0:b0:3a0:81c9:3eaf with SMTP id ffacd0b85a97d-3a08f7d186amr101070f8f.13.1745950190928;
        Tue, 29 Apr 2025 11:09:50 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5d52bsm15028818f8f.90.2025.04.29.11.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:09:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] media: qcom: camss: csiphy: Stop spamming logs with version
Date: Tue, 29 Apr 2025 20:08:31 +0200
Message-ID: <20250429180828.950219-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4129; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=5c/GwZGg6YfVlYGBkBCZKwX7PpiLtVcO4mQlYw0R+Yw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoERWhC8iFUeQq7gTWXqi7rueBD/nq8VUxg+SFS
 j6KI5AwgWCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBEVoQAKCRDBN2bmhouD
 13DmD/9Yl/jXVFoF0eFwjIpMunLzVnW4YlDFQLgzjXWIywBX8pk2aZ1ouyFIJiqPl81pvGI5WjG
 q0T9/NfNmdvYBTht280OPepdYpOrwVNZCc1/vKuiL6eI/wt3lz2PoUvJsjBqlcWwbRwxHD41KgC
 xVTc9R0EHFFJNiaTBMwFoij+EBtxsrXRIkp7rUjJgzWd4+QDWIuUrszIPI+vbf1j3vVFQ0QOdr1
 8tUgsTdaPtY8ZnyDI3S7eAr51p27M59pmOYdun6xqFgUXrhFEEWdgVUhDaBxDYMWCwN5EFR8hyx
 eG0eitZe07kA1SejXLokzVfDHtDM7hwHJlV+j7aqk0ycTpp+DJfrGUCWxOXJYDvZj6ik5BMcUX2
 BCVMDv2ABuQlrriRvtoyYRo7zT8WKis/egecVYKs60INFI2+tytk5AOmmQ1rj/5H+bqQst05VOP
 V0EcHuv0F680g7jpFD43pHatGXVDFL+Fj0eBICB5iYVylFDFau+Zgus1+Q0tMuCmmea6fGLTVEe
 s4p8SaDHdZuJJwg6+ijoOrjrKZkwdyO9VO2YXMEsGtCzqeNFfuGfLkyFQP9m1kT3ddwUQZ4n1sF
 mAtlwKfEFqee1hWqFzp7w+3qMHDjAC4la1uePxJMefJzRJC4rjzDGVINFeuQDiUi8u5hGZCYfpq rGWi02WnCeKfuFQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Camss drivers spam kernel dmesg with 64 useless messages during boot:

  qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
  qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0

All of these messages are the same, so it makes no sense to print same
information 32 times.

The driver does not use read version at all, so if it was needed for any
real debugging purpose it would be provided via debugfs interface.
However even then printing this is pointless, because version of
hardware block is deducible from the compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../qcom/camss/camss-csiphy-2ph-1-0.c         | 10 ---------
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 22 -------------------
 .../media/platform/qcom/camss/camss-csiphy.c  |  2 --
 3 files changed, 34 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
index 9d67e7fa6366..09d3b21e222f 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
@@ -40,15 +40,6 @@ static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
 	return lane_mask;
 }
 
-static void csiphy_hw_version_read(struct csiphy_device *csiphy,
-				   struct device *dev)
-{
-	u8 hw_version = readl_relaxed(csiphy->base +
-				      CAMSS_CSI_PHY_HW_VERSION);
-
-	dev_dbg(dev, "CSIPHY HW Version = 0x%02x\n", hw_version);
-}
-
 /*
  * csiphy_reset - Perform software reset on CSIPHY module
  * @csiphy: CSIPHY device
@@ -187,7 +178,6 @@ static int csiphy_init(struct csiphy_device *csiphy)
 
 const struct csiphy_hw_ops csiphy_ops_2ph_1_0 = {
 	.get_lane_mask = csiphy_get_lane_mask,
-	.hw_version_read = csiphy_hw_version_read,
 	.reset = csiphy_reset,
 	.lanes_enable = csiphy_lanes_enable,
 	.lanes_disable = csiphy_lanes_disable,
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index f732a76de93e..bc605931278b 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -541,27 +541,6 @@ csiphy_lane_regs lane_regs_x1e80100[] = {
 	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
 };
 
-static void csiphy_hw_version_read(struct csiphy_device *csiphy,
-				   struct device *dev)
-{
-	struct csiphy_device_regs *regs = csiphy->regs;
-	u32 hw_version;
-
-	writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID, csiphy->base +
-	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
-
-	hw_version = readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 12));
-	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 13)) << 8;
-	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 14)) << 16;
-	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 15)) << 24;
-
-	dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
-}
-
 /*
  * csiphy_reset - Perform software reset on CSIPHY module
  * @csiphy: CSIPHY device
@@ -858,7 +837,6 @@ static int csiphy_init(struct csiphy_device *csiphy)
 
 const struct csiphy_hw_ops csiphy_ops_3ph_1_0 = {
 	.get_lane_mask = csiphy_get_lane_mask,
-	.hw_version_read = csiphy_hw_version_read,
 	.reset = csiphy_reset,
 	.lanes_enable = csiphy_lanes_enable,
 	.lanes_disable = csiphy_lanes_disable,
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index c622efcc92ff..111c3a52a6d1 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -243,8 +243,6 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 		enable_irq(csiphy->irq);
 
 		csiphy->res->hw_ops->reset(csiphy);
-
-		csiphy->res->hw_ops->hw_version_read(csiphy, dev);
 	} else {
 		disable_irq(csiphy->irq);
 
-- 
2.45.2

