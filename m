Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E35123E35D
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064484; cv=none; b=cK031+nZOU1I68ygkI3Awzu9iupy3frllXoZWdwLIvLqvGtDSIcgnvi6h5/opvt1ObmIyBh1YXI8yzKTmhhF2Pv3ysIG01uxH72L+E66VnDfXXZ2GspboSSwJEDAlrbuLEBdWbNyMM3oOdYANiU8nDW3BW8rXKuWHK/6wJCQcmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064484; c=relaxed/simple;
	bh=U9+npV2ZSJGfToBj4e6veFVrU4+srf6IpPx003Sm1w0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V0bLSQTF5sgzCdEuUJGhTo9M1Qhx5VXw2dRvvFxgOUl2MMVT3Q2tAQA8ICcUiB6Sra2+uPPcM/gHJH23tHP4Y3KPKEkWKnAKJDLqXkzvBXEr4X2sWB4WPfpXEmSX0iTljwRXUxVQn0v31i79y7UdoYiDlhjY87NFZZr1J1UxIj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C495B150C;
	Mon, 12 May 2025 08:41:10 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 659A33F63F;
	Mon, 12 May 2025 08:41:20 -0700 (PDT)
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
Subject: [PATCH v1 2/5] coresight: Protect unregistration with mutex
Date: Mon, 12 May 2025 16:41:05 +0100
Message-Id: <20250512154108.23920-3-leo.yan@arm.com>
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

The device registration is protected by CoreSight mutex to ensure the
atomic operations when adding a device onto bus.  One the other hand,
the locking is absent when unregister a device.

Use mutex to ensure atomicity on device unregistration.  During
unregistration, unbinding the associated CTI device is not included in
the locking region, as CTI has its own locking mechanism.

Fixes: 8c1d3f79d9ca ("coresight: core: Fix coresight device probe failure issue")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 3e3823d9f991..3eacdcf638df 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1400,14 +1400,17 @@ EXPORT_SYMBOL_GPL(coresight_register);
 
 void coresight_unregister(struct coresight_device *csdev)
 {
-	etm_perf_del_symlink_sink(csdev);
 	/* Remove references of that device in the topology */
 	if (cti_assoc_ops && cti_assoc_ops->remove)
 		cti_assoc_ops->remove(csdev);
+
+	mutex_lock(&coresight_mutex);
+	etm_perf_del_symlink_sink(csdev);
 	coresight_remove_conns(csdev);
 	coresight_clear_default_sink(csdev);
 	coresight_release_platform_data(csdev, csdev->dev.parent, csdev->pdata);
 	device_unregister(&csdev->dev);
+	mutex_unlock(&coresight_mutex);
 }
 EXPORT_SYMBOL_GPL(coresight_unregister);
 
-- 
2.34.1

