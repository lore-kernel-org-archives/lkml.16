Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34C5242927
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337776; cv=none; b=tQFvFkmUc+oMUhuFYSaM7wuXHbxDS8AvkEB0lZE5k3XPHwbevQ2mR06vWgihO3xqFUHcITAdtMhDD60qeqHwnX8p5pq1KoT4B+NW1KNCW1truq1/2Ez/4D3qG/wZV7qp/OgroeCgcUZHgqD+sfMZn6/dHud/2RTZoS4N7FNEbJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337776; c=relaxed/simple;
	bh=UWGhNmEgg6U58d6ixt8pbV8lVM2E/k1Ms9AvRHA/JsA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WkM70FkxG8tD0yms181f45D3pjHWZUoZ/apZBYVhpAVTqNatSK3gA6m/Ojnl2lyU2zXSZFx6Y8Gp6zQjC27qpGgsxeov4mkibRhDNjnZlm1BtzuIB9h7aB5gH03T72jZtGeAr8fl9PK+qlVamGzGiw4E6zfTyASNRAEW7eGSzu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bNL8k1jtvzRk68;
	Thu, 19 Jun 2025 20:51:50 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 2346414011A;
	Thu, 19 Jun 2025 20:56:07 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 20:56:06 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 20:56:06 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <hejunhao3@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [RESEND PATCH v3 6/8] drivers/perf: hisi: Support PMUs with no interrupt
Date: Thu, 19 Jun 2025 20:55:55 +0800
Message-ID: <20250619125557.57372-7-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250619125557.57372-1-yangyicong@huawei.com>
References: <20250619125557.57372-1-yangyicong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemq200018.china.huawei.com (7.202.195.108)

From: Yicong Yang <yangyicong@hisilicon.com>

We'll have PMUs don't have an interrupt to indicate the counter
overflow, but the Uncore PMU core assume all the PMUs have
interrupt. So handle this case in the core. The existing PMUs
won't be affected.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_pmu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index ef058b1dd509..a449651f79c9 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -510,7 +510,9 @@ int hisi_uncore_pmu_online_cpu(unsigned int cpu, struct hlist_node *node)
 			return 0;
 
 		hisi_pmu->on_cpu = cpumask_local_spread(0, dev_to_node(hisi_pmu->dev));
-		WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(hisi_pmu->on_cpu)));
+		if (hisi_pmu->irq > 0)
+			WARN_ON(irq_set_affinity(hisi_pmu->irq,
+						 cpumask_of(hisi_pmu->on_cpu)));
 		return 0;
 	}
 
@@ -525,7 +527,8 @@ int hisi_uncore_pmu_online_cpu(unsigned int cpu, struct hlist_node *node)
 	hisi_pmu->on_cpu = cpu;
 
 	/* Overflow interrupt also should use the same CPU */
-	WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(cpu)));
+	if (hisi_pmu->irq > 0)
+		WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(cpu)));
 
 	return 0;
 }
@@ -560,7 +563,9 @@ int hisi_uncore_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node)
 	perf_pmu_migrate_context(&hisi_pmu->pmu, cpu, target);
 	/* Use this CPU for event counting */
 	hisi_pmu->on_cpu = target;
-	WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(target)));
+
+	if (hisi_pmu->irq > 0)
+		WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(target)));
 
 	return 0;
 }
-- 
2.24.0

