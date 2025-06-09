Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3E621B19E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484886; cv=none; b=iKWOFJuC4dOIAXsUk9sQwGNKKA2GB8H8TB/yvK3Ue6HNY6cucyizw31LXXPb8pCkLofmpwfLo/u7GYzRoS0nl6LRHLfH/yrJam+DUsfHhNYkYbdtmycABEKzxHJaKi2wHxMwrhheHAgs7lljupjAr3WeI9H9tv/1bVVArJpCIGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484886; c=relaxed/simple;
	bh=yVcviqXGLX8XXxiv2l48G8MI9BCvDehEgF2Iupn+Bew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bVg6SY+je0evxJ2n12246EMUE+faq01lHdeU1esGEPs/TZvNs2egy6c3wHWd77jAnjx+JDayhEamOEOPU3HBfaZ9YVSLzoAIiqph33QY1pWq5gMd1L+dpJ6h0tcJ1aptxtcxd0IvlJ3t2NRNeghtHLOZcQ21O2b87YsRejZP3js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F9D31515;
	Mon,  9 Jun 2025 09:01:06 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0549C3F673;
	Mon,  9 Jun 2025 09:01:23 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 09 Jun 2025 17:00:40 +0100
Subject: [PATCH v3 6/9] coresight: Avoid enable programming clock
 duplicately
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-arm_cs_fix_clock_v3_public-v3-6-423b3f1f241d@arm.com>
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
In-Reply-To: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749484873; l=1497;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=yVcviqXGLX8XXxiv2l48G8MI9BCvDehEgF2Iupn+Bew=;
 b=7Mj8BicH2mQES5cPM2ECdFxjX0lrMREtg/dUsRZya//fEOsKpYpcuN7O6bIzUWiJMlGOJrlDq
 iGSJgtqOVSGBHU+lCN58Zk0WRydUQVIUczQ0nLZS4B02IrrjWMYZRlh
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The programming clock is enabled by AMBA bus driver before a dynamic
probe.  As a result, a CoreSight driver may redundantly enable the same
clock.

To avoid this, add a check for device type and skip enabling the
programming clock for AMBA devices.  The returned NULL pointer will be
tolerated by the drivers.

Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
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

