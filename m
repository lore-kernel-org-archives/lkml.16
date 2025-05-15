Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5F729713D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747292093; cv=none; b=s8hnMxzj/GADqf3q8UHHPMb936wvy19QqS3d7J29jCJACNm3LUCsGMztu3mnDYP1BEc4RjNg3jBTSbSmiJjdsjWLkgvJQxBhLatsv9MA7SfdWNH0mcK1VXIQlSD0YXk+aAlcqHWTp+QPi2qRW0xieDGrMy+uw1xZ1wzW5/rf1Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747292093; c=relaxed/simple;
	bh=QBWw7BibD8RrHJXfAtvVn9utmmSQ0jmMRsDe9k560I0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M5+mWQpcNLJhtFnTbguOI7dUOpjpZsYL+5WXT9tCFWI5r2BjmK8fHOW1RE7BbaAliIl7x1VgANHFvO+GzHnNMFlsaw+gT+ZQ1hO386QMPTCIHYiKDKBPPdTpuolINhN1bNjPXjNhTfxpC8d8200PpL006so1v2zvkMKyY2qsqfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZygsQ5DqKztR6Q;
	Thu, 15 May 2025 14:53:30 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 84A2B140276;
	Thu, 15 May 2025 14:54:47 +0800 (CST)
Received: from kwepemq500001.china.huawei.com (7.202.195.224) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 15 May 2025 14:54:47 +0800
Received: from 228-1616.huawei.com (10.67.246.68) by
 kwepemq500001.china.huawei.com (7.202.195.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 15 May 2025 14:54:46 +0800
From: Nianyao Tang <tangnianyao@huawei.com>
To: <maz@kernel.org>, <tglx@linutronix.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <guoyang2@huawei.com>, <wangwudi@hisilicon.com>, <tangnianyao@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH v3] irqchip/gic-v4.1: Use local 4_1 ITS to generate VSGI
Date: Thu, 15 May 2025 14:53:59 +0000
Message-ID: <20250515145359.2795959-1-tangnianyao@huawei.com>
X-Mailer: git-send-email 2.30.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemq500001.china.huawei.com (7.202.195.224)

On multi-node GICv4.1 system, VSGI senders always use one certain 4_1 ITS,
because find_4_1_its return the first its_node in list, regardless of
which node the VSGI sender is on. This brings guest vsgi performance drop
when VM is not running on the same node as this returned ITS.

On a 2-socket environment, each with one ITS and 32 cpu, GICv4.1 enabled,
4U8G guest, 4 vcpu is running on same socket.
When VM on socket0, kvm-unit-tests ipi_hw result is 850ns.
When VM on socket1, it is 750ns. The reason is VSGI sender always
use the last reported ITS(that on socket1) to inject VSGI. The access
from cpu to other-socket ITS will cost 100ns more compared to cpu to
local ITS.

By using a local ITS, we can get 12% reduction in IPI latency.

Modify find_4_1_its to first return per-cpu local_4_1_its, which is
init when inherit the VPE table from the ITS or from another CPU.
If fail to find local 4_1 ITS, return any 4_1 ITS like before.

Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
Suggested-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v3-its.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 0115ad6c8259..1b1d32f746b4 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -125,6 +125,8 @@ struct its_node {
 	int			vlpi_redist_offset;
 };
 
+static DEFINE_PER_CPU(struct its_node *, local_4_1_its);
+
 #define is_v4(its)		(!!((its)->typer & GITS_TYPER_VLPIS))
 #define is_v4_1(its)		(!!((its)->typer & GITS_TYPER_VMAPP))
 #define device_ids(its)		(FIELD_GET(GITS_TYPER_DEVBITS, (its)->typer) + 1)
@@ -2778,6 +2780,8 @@ static u64 inherit_vpe_l1_table_from_its(void)
 		}
 		val |= FIELD_PREP(GICR_VPROPBASER_4_1_SIZE, GITS_BASER_NR_PAGES(baser) - 1);
 
+		*this_cpu_ptr(&local_4_1_its) = its;
+
 		return val;
 	}
 
@@ -2815,6 +2819,8 @@ static u64 inherit_vpe_l1_table_from_rd(cpumask_t **mask)
 		gic_data_rdist()->vpe_l1_base = gic_data_rdist_cpu(cpu)->vpe_l1_base;
 		*mask = gic_data_rdist_cpu(cpu)->vpe_table_mask;
 
+		*this_cpu_ptr(&local_4_1_its) = *per_cpu_ptr(&local_4_1_its, cpu);
+
 		return val;
 	}
 
@@ -4180,8 +4186,9 @@ static struct irq_chip its_vpe_irq_chip = {
 
 static struct its_node *find_4_1_its(void)
 {
-	static struct its_node *its = NULL;
+	struct its_node *its;
 
+	its = *this_cpu_ptr(&local_4_1_its);
 	if (!its) {
 		list_for_each_entry(its, &its_nodes, entry) {
 			if (is_v4_1(its))
-- 
2.30.0

