Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A3629CB5D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421479; cv=none; b=oRDl8JR96Nak8eFO80UQAGeFquF+BnlhR9A5dC0zOFPU2iFMnjOfl3FoqP5cR+oUm4SG3w9z39hOYFugKROtDQRc3qa/himgAn4m7QorQXzRPYRue/8/7xteHzaDacATshzs5BqheM875Hqu6Etow9pxdn/jCJQqSa7x3OvDYdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421479; c=relaxed/simple;
	bh=EB/45fOdmv1cUL/uDvO8sqH8HNU4eG/Ssc3IFomyEYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QqwKuz39TVb7KNWqBq7mAenyzrVlPBug50kzUmpAsWIRkHwtdDjy2N1PAsre5osOLeHj1HlUpnszmF+4RetZHs2/xPezuqwFjTzgDJXUJtCHQOlXDRicB4qnAdd/2biD5vsUbr/7kSkdFZXVOTV8aZeznk6NFsMAlwv6xVHtmdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7B10153B;
	Wed, 23 Apr 2025 08:17:51 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B0013F66E;
	Wed, 23 Apr 2025 08:17:54 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 6/9] coresight: Avoid enable programming clock duplicately
Date: Wed, 23 Apr 2025 16:17:23 +0100
Message-Id: <20250423151726.372561-7-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423151726.372561-1-leo.yan@arm.com>
References: <20250423151726.372561-1-leo.yan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index b888f6ed59b2..26eb4a61b992 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -476,15 +476,18 @@ static inline bool is_coresight_device(void __iomem *base)
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

