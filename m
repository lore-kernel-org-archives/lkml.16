Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9BF1F8BAC
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199430; cv=none; b=cW6V6RfcOxrn4393I86g3ZWPXfMB482hXTLvNW6VNbzZXy0hnvPd06L1dIDnYdorJkU8PLOTiT3RbuZp/rPWM6S7gW30FaadnRA9r2Hir+BWKX3Hx4wocfaNG4Yb+ChyJelGyLFmSNc+uGvVSkU4MoMxNtv1cZkJ6E17Bq4S8y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199430; c=relaxed/simple;
	bh=/vEvK523eJMXfzgCKB1Lqscq2WPGdva0NqfHB9Ag3kU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fXoqL158WNDt5mlArlxCuwmwgfAM+PpIAZgohtQNfUhJ6ZB/boo/TD6Hd7kecx/a3pouV/A5mmdDVvDP7977ZMCS55G+C5If37g46wXBpbIbs5jyeQErWchO/0glLjx1TLpdQdsbnqdjbwz0T9vxJ8ao0PB+d8bNfVplIhECsYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Ys6zS3nvmzRmPt;
	Mon, 10 Feb 2025 22:54:12 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
	by mail.maildlp.com (Postfix) with ESMTPS id 9744414022D;
	Mon, 10 Feb 2025 22:57:03 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 10 Feb 2025 22:57:02 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
	<lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
	<shenjian15@huawei.com>, <shaojijie@huawei.com>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 drm-dp 0/4] Add HPD, getting EDID, colorbar features in DP function
Date: Mon, 10 Feb 2025 22:49:52 +0800
Message-ID: <20250210144959.100551-1-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd500013.china.huawei.com (7.221.188.12)

From: Baihan Li <libaihan@huawei.com>

To support DP HPD, edid printing, and colorbar display features based on
the Hisislcon DP devices. 

---
ChangeLog:
v1 -> v2:
  - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
  - changing all names of dp phy to dp serdes.
  - deleting type conversion, suggested by Dmitry Baryshkov.
  - deleting hibmc_dp_connector_get_modes() and using drm_connector_helper_get_modes(), suggested by Dmitry Baryshkov.
  - add colorbar introduction in commit, suggested by Dmitry Baryshkov.
  - deleting edid decoder and its debugfs, suggested by Dmitry Baryshkov.
  - using debugfs_init() callback, suggested by Dmitry Baryshkov.
  - splittting colorbar and debugfs in different patches, suggested by Dmitry Baryshkov.
  - optimizing the description in commit message, suggested by Dmitry Baryshkov.
  - add mdelay(100) comments, suggested by Dmitry Baryshkov.
  - deleting display enable in hpd event, suggested by Dmitry Baryshkov.
---

 drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   |  16 ++-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  11 +-
 .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |   2 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 103 ++++++++++++++-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  47 +++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  |  92 +++++++++----
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |   5 +
 .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    |  74 +++++++++++
 .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.h    |  36 +++++
 .../drm/hisilicon/hibmc/hibmc_drm_debugfs.c   | 124 ++++++++++++++++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |  88 ++++++++++---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  86 +++++++++---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  21 +++
 14 files changed, 640 insertions(+), 68 deletions(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c

-- 
2.33.0

