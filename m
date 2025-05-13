Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73CB2BF3C7
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747155996; cv=none; b=N+46HNh22HY86boyFp9x98u6xeDhxZKwVw6JlaHdnXPZBUVtZypWwOHw0N17WJwVzoaQNPp32tx6ps/uxiFANrsYX0bm2H8ht8vbk2l/rbZFIc/gmXbB4BwaueLneW2zZJjVTidJqm0FNDjSnTvc1MgnN48PiOXztmOxDjnn9+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747155996; c=relaxed/simple;
	bh=Kvzt8Q+3EVm2cEOaL4tKi3rZKtf27n+D+3HuyTaHyq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HqtFMGsnFGpkdpnTyAFaYAb7GEszhRCVmV9htDjXKL5pES5DZEQFparmAHih0+dW0oBlMHtV8i3YlGqz2kOXKHeW4tOx1ptR+k5X9IibIDFQtTVJ4DF8lbzLM198awdjiMA6Xb0aEnrj3vVqypyqoWbwuZUTNntDtkvhRS0XyU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 097CC1E4D;
	Tue, 13 May 2025 10:06:23 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 528523F63F;
	Tue, 13 May 2025 10:06:32 -0700 (PDT)
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
Subject: [PATCH v5 2/3] coresight: holding cscfg_csdev_lock while removing cscfg from csdev
Date: Tue, 13 May 2025 18:06:21 +0100
Message-Id: <20250513170622.3071637-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513170622.3071637-2-yeoreum.yun@arm.com>
References: <20250513170622.3071637-1-yeoreum.yun@arm.com>
 <20250513170622.3071637-2-yeoreum.yun@arm.com>
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

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Fixes: 02bd588e12df ("coresight: configuration: Update API to permit dynamic load/unload")
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index a70c1454b410..5d194b9269f5 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -391,14 +391,17 @@ static void cscfg_owner_put(struct cscfg_load_owner_info *owner_info)
 static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, void *load_owner)
 {
 	struct cscfg_config_csdev *config_csdev, *tmp;
+	unsigned long flags;
 
 	if (list_empty(&csdev->config_csdev_list))
 		return;
 
+	raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
 	list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
 		if (config_csdev->config_desc->load_owner == load_owner)
 			list_del(&config_csdev->node);
 	}
+	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
 }
 
 static void cscfg_remove_owned_csdev_features(struct coresight_device *csdev, void *load_owner)
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

