Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC30F23AB86
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634395; cv=none; b=mYEXmO/ktSNYmYYI3mFjQ8c4E6JuLGl6NY4Tst/ERsBafwKCxuJ59gHM7EDc4QWFpTXLZjoZwnnTK59a/cuNfqpMnmBQ2XVLpZ3K1nN+qFTlL3WgUHU+C7TdQcgPQahK/TKEydclsbNnEUIto1RxUZqnFrE9boxSnepctwIoOvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634395; c=relaxed/simple;
	bh=+/deiJiyPaujj2ucDeIqYv3+YUrINLcsJWzlVr5U2CA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pNvcx+2AH0yYssPvxifar/z9oPPYF7KFW04LQ6h+cPFnx6Gahg5s1j8XeHgMzxfTfKbmk8wPgUXFm2743fpWDWlzQxa5U7tHToYstd1IKD0VWakZ9wkLlH8ulvFWwwp4FRKKX1RpG3KpxZ5CtEji7JPdcwBllFXVj1EZYjy4gl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8321B1596;
	Wed, 11 Jun 2025 02:32:52 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C89E3F59E;
	Wed, 11 Jun 2025 02:33:10 -0700 (PDT)
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
Subject: [PATCH] coresight: fix indentation error in cscfg_remove_owned_csdev_configs()
Date: Wed, 11 Jun 2025 10:33:08 +0100
Message-Id: <20250611093308.926875-1-yeoreum.yun@arm.com>
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
Fixes: 53b9e2659719 ("coresight: holding cscfg_csdev_lock while removing cscfg from csdev ")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
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

