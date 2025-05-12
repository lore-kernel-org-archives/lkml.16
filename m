Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D664A23CEFF
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064482; cv=none; b=W0VeHnurFKF7B/ugZf4l/HX9smi77AHXu4u3Dh7Pu7BOsP92Wh+SPmjGNaVQ0MuMXSYkYbX9+YthIvXME8trz4Gh5Ti10dqz5qvpWx6MHe8veyC0FBR5nxzHnwNZfMELBN6Vy5xMn3EwiHLhROYP7kx01I+3cRlFAGKowtv7rYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064482; c=relaxed/simple;
	bh=7HshrWMoiyCidCuH2WyX5aZW74+zXsXRhkjU1Mdj/ZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OdmtDjXAJ4X7OyGizsEFn3hTkp8U8J8iHVwltUsnKv6zPt+L54HhFIE1fYn7NDEYP2CKj3SCoKqI+DthQd0zHAIabH70oFwBIYZ5CPDGN9ctDybXh8EZ/gY0ufC2HI25JdFEWVJcs6Z01GrH6t1Gx3BkBUwPPRDDexBQLnYf0lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22D811F60;
	Mon, 12 May 2025 08:41:09 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B8B443F63F;
	Mon, 12 May 2025 08:41:18 -0700 (PDT)
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
Subject: [PATCH v1 1/5] coresight: Correct sink ID map allocation failure handling
Date: Mon, 12 May 2025 16:41:04 +0100
Message-Id: <20250512154108.23920-2-leo.yan@arm.com>
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

When registering a CoreSight device, it first increase the reference
counter for the associated device and then allocates sink ID map.  The
problem happens when the sink ID map allocation fails - the flow misses
decreasing the device's reference counter.  As a result, the device can
never be properly cleaned up after the memory allocation failure.

To fix the issue, the allocation of the sink ID map is moved before
increasing the reference counter.  With this change, if sink ID map
allocation fails, the function can exit without holding a reference to
the device.  Afterwords, any subsequent failures will invoke
coresight_device_release() to release the device's resource, including
decrementing the reference counter.

Fixes: 5ad628a76176 ("coresight: Use per-sink trace ID maps for Perf sessions")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 5632bcb8feb6..3e3823d9f991 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1318,12 +1318,6 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	csdev->dev.parent = desc->dev;
 	csdev->dev.release = coresight_device_release;
 	csdev->dev.bus = &coresight_bustype;
-	/*
-	 * Hold the reference to our parent device. This will be
-	 * dropped only in coresight_device_release().
-	 */
-	csdev->dev.fwnode = fwnode_handle_get(dev_fwnode(desc->dev));
-	dev_set_name(&csdev->dev, "%s", desc->name);
 
 	if (csdev->type == CORESIGHT_DEV_TYPE_SINK ||
 	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
@@ -1335,6 +1329,14 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 			goto err_out;
 		}
 	}
+
+	/*
+	 * Hold the reference to our parent device. This will be
+	 * dropped only in coresight_device_release().
+	 */
+	csdev->dev.fwnode = fwnode_handle_get(dev_fwnode(desc->dev));
+	dev_set_name(&csdev->dev, "%s", desc->name);
+
 	/*
 	 * Make sure the device registration and the connection fixup
 	 * are synchronised, so that we don't see uninitialised devices
-- 
2.34.1

