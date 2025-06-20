Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9E0231852
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406059; cv=none; b=sEq4weUJM72bNyGFd3fJmMzT2lU6FYiBEolhy1CxZs60GFN1gvaYGb6fUk5PAfDxgWYI2o1UOd1/K1Lh/7qhD656BJ5fVeAz1eZfJq54lDEJ3gehaP8aG/Q2c1MlOI8exXqRCtIG56klzL+rusLL+VCMyD4/dAvv3iGDE3jW14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406059; c=relaxed/simple;
	bh=YsFAt+pplduqYcIYLZMJKZDhw8ICabUPJTIpxUKAMk4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VrVoJtUabhf4EXNqqbID+s628xxyOx0yw7GCwUHj9w7/WzFniwdXz4BhwzllK4lK/ovM2j0uQZiYr60AuWyPDmIElqfD/ntKJ3+0mDqTXo+Un+Eni5fLzGg+gJzRI/LgGJl3WWxVI5HQPIrAb25/bmu+j/vQi9D/MV+nHU1AP+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bNqT84g57z2TSrB;
	Fri, 20 Jun 2025 15:52:44 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 71CBF1A0190;
	Fri, 20 Jun 2025 15:54:15 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 15:54:13 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 15:54:13 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@arm.com>, <leo.yan@arm.com>,
	<anshuman.khandual@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<prime.zeng@hisilicon.com>, <hejunhao3@huawei.com>
Subject: [PATCH v2 0/3] Coresight TMC-ETR some bugfixes and cleanups
Date: Fri, 20 Jun 2025 15:54:09 +0800
Message-ID: <20250620075412.952934-1-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn500004.china.huawei.com (7.202.194.145)

This patchset builds upon Yicong's previous patches [1].

Introducing fix two race issues found by using TMC-ETR and CATU, Two
cleanups found when debugging the issues.

[1] https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-1-yangyicong@huawei.com/

---
Changes in v2:
- Updated the commit of patch2.
- Rebase to v6.16-rc1

Junhao He (1):
  coresight: tmc: refactor the tmc-etr mode setting to avoid race
    conditions

Yicong Yang (2):
  coresight: tmc: Add missing doc of tmc_drvdata::reading
  coresight: tmc: Decouple the perf buffer allocation from sysfs mode

 .../hwtracing/coresight/coresight-tmc-etr.c   | 102 +++++++++---------
 drivers/hwtracing/coresight/coresight-tmc.h   |   1 +
 2 files changed, 53 insertions(+), 50 deletions(-)

-- 
2.33.0

