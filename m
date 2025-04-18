Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BE02E40B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744956293; cv=none; b=NHkIBHefeIIsQW0hzodNQig3cENxeRpnKhv0R79fau7q4j8Rje1NNvGHFLQ151QQX8BN3dEQSnI8BLukt6guj19uwhetH0CvwGIGR34Y2U7yENb3GJUr4Hlptlm6lhXrBv7jlBd4dh7ATfKyHIB1Monzpe+DXI4z7STV1vWHzm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744956293; c=relaxed/simple;
	bh=cSQCWRfgdq3OP9f5MqnKxRf1AfrLpnJcP0Y3uUqvtcM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nZ2GRo9waVvgDbGSaaMXps3GwNmsSMTv1X4zM7nbf1HlGmMnYJrAG3IPizkh9YtUQsS8RJzFQ418/wz611UQ77O1DSVMAl/Gx5MYwyXcM8Vks+luzbySTDdPrbuWjf49mmuFaiAIapiRzYic2rrdzvjEnSYmEbFa4cdKkWBVUBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Zf43M0W1SzsSnx;
	Fri, 18 Apr 2025 14:04:31 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id AA2BD140294;
	Fri, 18 Apr 2025 14:04:41 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Apr 2025 14:04:41 +0800
Received: from localhost.localdomain (10.90.30.45) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Apr 2025 14:04:40 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@arm.com>,
	<anshuman.khandual@arm.com>, <mike.leach@linaro.org>, <leo.yan@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<hejunhao3@huawei.com>
Subject: [PATCH 0/4] Coresight TMC-ETR some bugfixes and cleanups
Date: Fri, 18 Apr 2025 13:58:16 +0800
Message-ID: <20250418055820.3689408-1-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.30.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemn500004.china.huawei.com (7.202.194.145)

This patchset builds upon Yicong's previous patches [1].

Introducing fix two race issues found by using TMC-ETR and CATU, Two
cleanups found when debugging the issues.

[1] https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-1-yangyicong@huawei.com/

Junhao He (2):
  coresight: catu: add locking to catu enable/disable functions
  coresight: tmc: refactor the tmc-etr mode setting

Yicong Yang (2):
  coresight: tmc: Add missing doc of tmc_drvdata::reading
  coresight: tmc-etr: Decouple the perf buffer allocation from sysfs
    mode

 drivers/hwtracing/coresight/coresight-catu.c  |   6 +
 drivers/hwtracing/coresight/coresight-catu.h  |   1 +
 .../hwtracing/coresight/coresight-tmc-etr.c   | 106 +++++++++---------
 drivers/hwtracing/coresight/coresight-tmc.h   |   1 +
 4 files changed, 64 insertions(+), 50 deletions(-)

-- 
2.33.0

