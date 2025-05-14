Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0D827A44E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239606; cv=none; b=oP+oE7BL5ZV7Sw/G5wMaf98umJQWaVGAiNqqdkaDeGV6cvmoQMT104ruozISWWjKOkjEi7NREC3cH9n+4VRlMRCVc3YcdnK+w9Q1kum+5XEA5ammjGNEIPJSCo6VFTD7e6pt4+6MB6+Jd1IHfv5LrWbf6gnO7lN6+SD0IPziTz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239606; c=relaxed/simple;
	bh=GjB0bfqhUj1DgxPVr876GZC1RBk/GArqU8FS0b8NG7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wz0sKU+AV54FQe42zXI1L4I3Tl+jwBFaIN6J9SQr3VmXG7RPWHAnxtyQ9enizcTsRWW6jicyLfiKFlc1VwcXe8l4m8XZsbdKut3DMmp905EpGWQFVI/ofugB91gX4mZSP1IJECTeUaefOJ7AQKDQX/BvQQ72p8pWJKhAGuXxZhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66E5A150C;
	Wed, 14 May 2025 09:19:52 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5191A3F63F;
	Wed, 14 May 2025 09:20:02 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v6 2/3] coresight: holding cscfg_csdev_lock while removing cscfg from csdev
Date: Wed, 14 May 2025 17:19:50 +0100
Message-Id: <20250514161951.3427590-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514161951.3427590-1-yeoreum.yun@arm.com>
References: <20250514161951.3427590-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There'll be possible race scenario for coresight config:

CPU0                                          CPU1
(perf enable)                                 load module
                                              cscfg_load_config_sets()
                                              activate config. // sysfs
                                              (sys_active_cnt == 1)
...
cscfg_csdev_enable_active_config()
  lock(csdev->cscfg_csdev_lock)
                                              deactivate config // sysfs
                                              (sys_activec_cnt == 0)
                                              cscfg_unload_config_sets()
  <iterating config_csdev_list>               cscfg_remove_owned_csdev_configs()
  // here load config activate by CPU1
  unlock(csdev->cscfg_csdev_lock)

iterating config_csdev_list could be raced with config_csdev_list's
entry delete.

To resolve this race , hold csdev->cscfg_csdev_lock() while
cscfg_remove_owned_csdev_configs()

Fixes: 02bd588e12df ("coresight: configuration: Update API to permit dynamic load/unload")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index a70c1454b410..23017612f2ea 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -395,6 +395,8 @@ static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, voi
 	if (list_empty(&csdev->config_csdev_list))
 		return;
 
+  guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
+
 	list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
 		if (config_csdev->config_desc->load_owner == load_owner)
 			list_del(&config_csdev->node);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

