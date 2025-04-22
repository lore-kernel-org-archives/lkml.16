Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5EE25F97B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321399; cv=none; b=R2IQUWu4Bp3Psn8a56H8OTPSS+iaTjC36dOiDHiTT6bIAngN4QeRMvLbTaT9zxTRP4cE5If2fwo65arM380RG1ZCSizAKLa7NLPUmIfYkixTTwj+azvcNo5s01Cs7lTrmN5AtCZXmC6SJ39E0WeuiJ7cg5v6XbeJmpsa0WCrYgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321399; c=relaxed/simple;
	bh=FjLB0iMYF7hTQsWMg45OZgnD0PlXwpaWW3crZca3r4Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aigwG9+k96mUGmL8hKPUTPy56W7GRt2rIcpZw7ZcRKe7lbf4fzbQZolSF5ZNt9i8UZ0187zyBa+jyuNHZ6X/3mkQvqHwCFldN4EqClyD2bmU7eqckMFb6/NUEnkoS6PVQbUfQMNag8rc1j32jgsrRiFzlTHyyQIJWXUgVezlTTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Zhg3q5Rrvz1d0R7;
	Tue, 22 Apr 2025 19:28:55 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 611751400CD;
	Tue, 22 Apr 2025 19:29:53 +0800 (CST)
Received: from localhost.huawei.com (10.90.30.45) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 22 Apr 2025 19:29:52 +0800
From: Qinxin Xia <xiaqinxin@huawei.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <yangyicong@huawei.com>,
	<wangzhou1@hisilicon.com>
CC: <linuxarm@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <xiaqinxin@huawei.com>
Subject: [PATCH] iommu/arm-smmu-v3: Fix incorrect return in arm_smmu_attach_dev
Date: Tue, 22 Apr 2025 19:29:51 +0800
Message-ID: <20250422112951.2027969-1-xiaqinxin@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemj200003.china.huawei.com (7.202.194.15)

An error is introduced in commit '48e7b8e284e5'. When the smmu
does not match with domain,an error code is not returned.
An example of an error scenario: In vfio_iommu_type1_attach_group,
vfio will try to match an existing compatible domain. During this process,
iommu invokes the attach_dev interface.The mismatched dev and domain
does not return an error code as expected.
As a result, an exception occurs when the vfio operates the smmu.

Fixes: 48e7b8e284e5 ("iommu/arm-smmu-v3: Remove arm_smmu_domain_finalise() during attach")
Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 358072b4e293..cb2698325809 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2932,7 +2932,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	smmu = master->smmu;
 
 	if (smmu_domain->smmu != smmu)
-		return ret;
+		return -EINVAL;
 
 	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
 		cdptr = arm_smmu_alloc_cd_ptr(master, IOMMU_NO_PASID);
-- 
2.33.0

