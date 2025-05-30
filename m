Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D033022A4E6
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599425; cv=none; b=VZ6MmJlMpIrKui5I0D6AJhV8omIIlx9L4H+uGVe//u1TKjZCxjJip+ktibjy+zpDcecEWyCCzOFrV8mrQ95GIMi8IGciGNiSAqOmKOY64gn1pLnjR0sZgQYcBWPQxTwYYuPn6hKWmDLuh8x4PyxG9GZGV0Env2+IuIPmo5cjWQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599425; c=relaxed/simple;
	bh=tZMFnfr5FTgThpkXirHvIlPX9G3+M0LvNYwfd6iY5zU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KdlWuZCBtsNqHYxTtk57XhSkEKecCAMkrdzCg8U6EE9rvArJNaWQpHL0TtE/oZrBZ4fD7ZkPw4P4msJPCSD3K9AV88htV3cIkt/Lbns2kdE07OdlrtMxhSgPWVul9IlqVeJTrmJQlIezwdoHKNBsezCpR8MdyEthpjLKwv3OXN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4b7zLb1fYhz1fy91;
	Fri, 30 May 2025 18:02:31 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id D0E85140113;
	Fri, 30 May 2025 18:03:35 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:35 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:34 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
	<lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
	<shaojijie@huawei.com>, <jani.nikula@linux.intel.com>,
	<dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH drm-dp 00/10] Fix hibmc driver bugs
Date: Fri, 30 May 2025 17:54:22 +0800
Message-ID: <20250530095432.1206966-1-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100007.china.huawei.com (7.202.195.175)

From: Baihan Li <libaihan@huawei.com>

There are some bugfix for hibmc-drm driver.

Baihan Li (10):
  drm/hisilicon/hibmc: fix the i2c device resource leak when vdac init
    failed
  drm/hisilicon/hibmc: fix dp probabilistical detect errors after HPD
    irq
  drm/hisilicon/hibmc: fix irq_request()'s irq name variable is local
  drm/hisilicon/hibmc: fix the hibmc loaded failed bug
  drm/hisilicon/hibmc: fix rare monitors cannot display problem
  drm/hisilicon/hibmc: add dp mode valid check
  drm/hisilicon/hibmc: add dp encoder modeset
  drm/hisilicon/hibmc: fix DP no showing after HPD with VGA connected
  drm/hisilicon/hibmc: fix HPD no showing with VGA para of GRUB
  drm/hisilicon/hibmc: fix no showing problem with loading hibmc
    manually

 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |   4 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  22 ++--
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |   8 ++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  |  33 +++--
 .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    |  12 --
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 115 ++++++++++++++++--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  14 +--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   1 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |   5 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |  37 +++++-
 10 files changed, 198 insertions(+), 53 deletions(-)

-- 
2.33.0

