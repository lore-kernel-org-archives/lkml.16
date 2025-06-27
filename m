Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB4F2D9EC1
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025151; cv=none; b=auEaYFe+KRyqtjK2iTCfp3pXzK17Bfsu7c8ceh+RjrqgZ7EBDMzOdG/J8hufvGd1jH4tLhapfT1F9UGnjmF5pvS4gteN2RzVu48UXnP5qeAdhxhf5inqMCGzHu5dY7WWXUTSss9TpP6Y714Kko4E7X92+FwOz+5Vc1VlOJd7nMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025151; c=relaxed/simple;
	bh=cuazPSya7V6vGGtK1ePheZ6n35wrfk3eIkvkqRNyloA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mAR69Dywr+QydivknKQIPxezE6orfCKtaClON0CHNEb5COpg1WIvpAE6/18T22Es5z/jEq7WSzclV/46PMDf5+rj2vZPhxPIv2hL0Lrj5aNPJ6Zyw90odL4WLE2JA7RFTD0s2v65667K61GKSXUeX2JC6zeduubwNi66nxCdwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60C921A00;
	Fri, 27 Jun 2025 04:52:12 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D7B13F58B;
	Fri, 27 Jun 2025 04:52:27 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 27 Jun 2025 12:51:52 +0100
Subject: [PATCH v4 06/10] coresight: Avoid enable programming clock
 duplicately
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-arm_cs_fix_clock_v4-v4-6-0ce0009c38f8@arm.com>
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
In-Reply-To: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751025136; l=1557;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=cuazPSya7V6vGGtK1ePheZ6n35wrfk3eIkvkqRNyloA=;
 b=VCkFsX6m41Kv+mHJlteDC2dQpF4mV74yWGfghjzC7StyXEkSS56z1DpTX5/ag0AklGtAuTOmI
 +X7XVN1Z6UHCNhT/SIfT5JLEcXAe7UFXMo9UMVcVGQSvI+lsIRTmWrd
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The programming clock is enabled by AMBA bus driver before a dynamic
probe.  As a result, a CoreSight driver may redundantly enable the same
clock.

To avoid this, add a check for device type and skip enabling the
programming clock for AMBA devices.  The returned NULL pointer will be
tolerated by the drivers.

Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 include/linux/coresight.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index dd2b4cc7a2b70cf060a3207548fe80e3824c489f..9afa1f76c78a3347e54d94fe9a9ebed72e3fff8e 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -480,15 +480,18 @@ static inline bool is_coresight_device(void __iomem *base)
  * Returns:
  *
  * clk   - Clock is found and enabled
+ * NULL  - Clock is not needed as it is managed by the AMBA bus driver
  * ERROR - Clock is found but failed to enable
  */
 static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
 {
-	struct clk *pclk;
+	struct clk *pclk = NULL;
 
-	pclk = devm_clk_get_enabled(dev, "apb_pclk");
-	if (IS_ERR(pclk))
-		pclk = devm_clk_get_enabled(dev, "apb");
+	if (!dev_is_amba(dev)) {
+		pclk = devm_clk_get_enabled(dev, "apb_pclk");
+		if (IS_ERR(pclk))
+			pclk = devm_clk_get_enabled(dev, "apb");
+	}
 
 	return pclk;
 }

-- 
2.34.1

