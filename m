Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FCF3B280
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637834; cv=none; b=fNWVb6ZVHE10jOlSTdQALQNO9MAXKCvMiu5iOnkwF3rNZ5IOItzvntwLN3uhxbm1W+m3R/42Unv1+tfxTlZwM8sztiQakmJYNMYF88/EnGtrVyFWiE6QGpBFk8bwNgTjjGZEQYgUllnjGoH8xiu2yEQ9PTIdmNljJNJEktTW5xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637834; c=relaxed/simple;
	bh=USka3TDKhs7gGZ6XsFbj3JDn+DE/JHdWVzj5QEio0mU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gN2BHzz7v/Hf1iOqqbXCGLKXfxXsVZIYyrR5rv3E1M79F03iXKuw1GAqGqkuZAQEHPBjpGG0Cf4BOVfT5MaW+Sb6DmYlz7ip94+FbcIrQDufQs+QDFfaPmwBELWWh5J/QjdXqmRoImERPm2h+/JldkDGw4+mlQHBMlftzl1w9q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF94315A1;
	Wed, 11 Jun 2025 03:30:11 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08A723F673;
	Wed, 11 Jun 2025 03:30:29 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] coresight: fix indentation error in cscfg_remove_owned_csdev_configs()
Date: Wed, 11 Jun 2025 11:30:25 +0100
Message-Id: <20250611103025.939020-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix wrong indentation in cscfg_remove_owned_csdev_configs()

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506102238.XQfScl5x-lkp@intel.com/
Fixes: 53b9e2659719 ("coresight: holding cscfg_csdev_lock while removing cscfg from csdev")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---

Sorry for my bad forgetting to run checkpatch.pl...

---
 drivers/hwtracing/coresight/coresight-syscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 83dad24e0116..6836b05986e8 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -395,7 +395,7 @@ static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, voi
 	if (list_empty(&csdev->config_csdev_list))
 		return;

-  guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
+	guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);

 	list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
 		if (config_csdev->config_desc->load_owner == load_owner)
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

