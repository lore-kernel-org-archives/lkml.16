Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9C8241662
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064486; cv=none; b=hw4tqYv9QvdmSQUOTFWRUwg5TN0Tp6LfRjKnw4YATE1Od4pFQyuarZsYvffciO4jMXoAmAWrZ6bbg/yJ2y4fywaBopzXz5NC5fOMvC5sS225puWySWD3sVJaCLiH+FUy4Kg46F/qJIf97+f2jqyP45ALoVqknJBHAmlnKC6Iyys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064486; c=relaxed/simple;
	bh=FiCPmeaAoNGdtHP+OviKtayovI7tXtqJ2SXShK4Zxzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pdQHjvcyZALaoJs0yJHViBCy8IMt3pEls0X4bwc/EQJIqTA1c+qu/TKfWGkRgcm7cKcXNAVHwpUylgIOmr4y+esIEIjRjVDqP50T5A2zBXOzSNpayovx5SnU8lQDA6ts+uvfVAgS+1iU4nsu73aj0bcxbOG6XN8rZcJcpqzwG+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F0E4150C;
	Mon, 12 May 2025 08:41:14 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B54DD3F63F;
	Mon, 12 May 2025 08:41:23 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 4/5] coresight: Separate failure and success flows
Date: Mon, 12 May 2025 16:41:07 +0100
Message-Id: <20250512154108.23920-5-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512154108.23920-1-leo.yan@arm.com>
References: <20250512154108.23920-1-leo.yan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For a success registration, it releases mutex, then binds associated CTI
device, and returns a device pointer.

As a result, it separates flows between the success case and the failure
flow, any code after the tag 'out_unlock' is only used for failure
handling.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 4f51ce152ac7..4fc82206b326 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1377,17 +1377,21 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	registered = true;
 
 	ret = coresight_create_conns_sysfs_group(csdev);
-	if (!ret)
-		ret = coresight_fixup_orphan_conns(csdev);
+	if (ret)
+		goto out_unlock;
+
+	ret = coresight_fixup_orphan_conns(csdev);
+	if (ret)
+		goto out_unlock;
+
+	mutex_unlock(&coresight_mutex);
+
+	if (cti_assoc_ops && cti_assoc_ops->add)
+		cti_assoc_ops->add(csdev);
+	return csdev;
 
 out_unlock:
 	mutex_unlock(&coresight_mutex);
-	/* Success */
-	if (!ret) {
-		if (cti_assoc_ops && cti_assoc_ops->add)
-			cti_assoc_ops->add(csdev);
-		return csdev;
-	}
 
 	/* Unregister the device if needed */
 	if (registered) {
-- 
2.34.1

