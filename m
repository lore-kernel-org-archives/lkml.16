Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF94224169B
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064488; cv=none; b=p/UsTaY1IatrrCnne81OvJPTeg+CU+wWxGCpAtvft1X22lng3UZFL9j/5jOl8D6QIzBQTBk/aexQ42Wsao0UJLhwwdXO+7qZQ3R0uD2Zpxgye9KVsFnCrAfz8jFEmHrILRqJru0n+Wbb16/0GCC2/QeWhj4+8bfcgCMFD69xqN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064488; c=relaxed/simple;
	bh=W85QrcnlA19hf+CBRRkoFTCmf60elDmE7DDtJ6C/mXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jZZhOBVbzD3uD8UXgdrqBxa+p9hdj06WmEgF68s83Cf4QZY7sxV3PP10Ky4N+uMMWGyituUaBIlCiyv510zbpQC429KzSIlA+J8VVfYjVrG9evmqKv7TsIQRxX3QcXSaXbvKbCfasVf6zaAPJIFA8JHYJ/MCtiptgMccyM7byiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A30641F60;
	Mon, 12 May 2025 08:41:15 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 620A93F63F;
	Mon, 12 May 2025 08:41:25 -0700 (PDT)
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
Subject: [PATCH v1 5/5] coresight: Refine error handling for device registration
Date: Mon, 12 May 2025 16:41:08 +0100
Message-Id: <20250512154108.23920-6-leo.yan@arm.com>
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

When error happens in a device registration, the coresight_unregister()
function is invoked for cleanup.  coresight_unregister() includes the
complete flow for unregisteration a CoreSight device, it causes
redundant operations for some errors.

This commit changes to invoke more specific functions for cleanup
resources for each error.  This can allow the cleanup flow in better
granularity.

As a result, the local "registered" variable is not used anymore, remove
it.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 26 ++++++++------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 4fc82206b326..1eb4f6f0fe40 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1297,7 +1297,6 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 {
 	int ret;
 	struct coresight_device *csdev;
-	bool registered = false;
 
 	csdev = kzalloc(sizeof(*csdev), GFP_KERNEL);
 	if (!csdev) {
@@ -1362,27 +1361,23 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	    csdev->type == CORESIGHT_DEV_TYPE_LINKSINK) {
 		ret = etm_perf_add_symlink_sink(csdev);
 
-		if (ret) {
-			device_unregister(&csdev->dev);
+		if (ret)
 			/*
 			 * As with the above, all resources are free'd
 			 * explicitly via coresight_device_release() triggered
 			 * from put_device(), which is in turn called from
 			 * function device_unregister().
 			 */
-			goto out_unlock;
-		}
+			goto out_unregister_device;
 	}
-	/* Device is now registered */
-	registered = true;
 
 	ret = coresight_create_conns_sysfs_group(csdev);
 	if (ret)
-		goto out_unlock;
+		goto out_del_symlink_sink;
 
 	ret = coresight_fixup_orphan_conns(csdev);
 	if (ret)
-		goto out_unlock;
+		goto out_remove_conns;
 
 	mutex_unlock(&coresight_mutex);
 
@@ -1390,15 +1385,14 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 		cti_assoc_ops->add(csdev);
 	return csdev;
 
+out_remove_conns:
+	coresight_remove_conns_sysfs_group(csdev);
+out_del_symlink_sink:
+	etm_perf_del_symlink_sink(csdev);
+out_unregister_device:
+	device_unregister(&csdev->dev);
 out_unlock:
 	mutex_unlock(&coresight_mutex);
-
-	/* Unregister the device if needed */
-	if (registered) {
-		coresight_unregister(csdev);
-		return ERR_PTR(ret);
-	}
-
 err_out:
 	/* Cleanup the connection information */
 	coresight_release_platform_data(NULL, csdev->dev.parent, desc->pdata);
-- 
2.34.1

