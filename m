Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ED42853E3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749026211; cv=none; b=M409jG34nkYNVsHskYkSazRHEKDuoO1FBBadOx2uqufYluuWKmlL0nB97MhO6OPinsJHz/OOWvj94VmC6+ayah7A28QHnt+YPKS6muqogmYMPe5y0NoPd2HLVso2NuplDjq7Di57/v6nexlmw56Gl9B+ELDT1pIJwTqELIy7pS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749026211; c=relaxed/simple;
	bh=+smY9GzeWHhgC2GFdJxz0JEiurmnnj5OUspz/Qv3mE4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HOfCYXyIq5gcwj3ACvBmvMcZ2uY4vtYhubfuFlgwUyquESMnm6qFEYd56Qg0MuyoncxNJKCzMLSoaFCEOzv+vSR9K9/PGhSUssQqeZVqUwqirbZd72zCZFuw5Hu0AUC2Vnc9kDLpvfgWxQS3Lk1byOToJJBXCrnaiKfaivni6kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bC18Y0XPvz1R7PM;
	Wed,  4 Jun 2025 16:34:21 +0800 (CST)
Received: from dggpemf100018.china.huawei.com (unknown [7.185.36.183])
	by mail.maildlp.com (Postfix) with ESMTPS id 80B6C1A0188;
	Wed,  4 Jun 2025 16:36:39 +0800 (CST)
Received: from huawei.com (10.67.174.51) by dggpemf100018.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Jun
 2025 16:36:38 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<peterz@infradead.org>, <sohil.mehta@intel.com>, <rui.zhang@intel.com>,
	<arnd@arndb.de>, <yuntao.wang@linux.dev>, <linux-kernel@vger.kernel.org>
CC: <zouyipeng@huawei.com>
Subject: [BUG REPORT] x86/apic: CPU Hang in x86 VM During Kdump
Date: Wed, 4 Jun 2025 08:33:19 +0000
Message-ID: <20250604083319.144500-1-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf100018.china.huawei.com (7.185.36.183)

Recently, A issue has been reported that CPU hang in x86 VM.

The CPU halted during Kdump likely due to IPI issues when one CPU was
rebooting and another was in Kdump:

CPU0			  CPU2
========================  ======================
reboot			  Panic
machine shutdown	  Kdump
			  machine shutdown
stop other cpus
			  stop other cpus
...			  ...
local_irq_disable	  local_irq_disable
send_IPIs(REBOOT)	  [critical regions]
[critical regions]	  1) send_IPIs(REBOOT)
			  wait timeout
			  2) send_IPIs(NMI);
Halt,NMI context
			  3) lapic_shutdown [IPI is pending]
			  ...
			  second kernel start
			  4) init_bsp_APIC [IPI is pending]
			  ...
			  local irq enable
			  Halt, IPI context

In simple terms, when the Kdump jump to the second kernel, the IPI that
was pending in the first kernel remains and is responded to by the
second kernel.

I was thinking maybe we need mask IPI in clear_local_APIC() to solve this
problem. In that way, it will clear the pending IPI in both 3) and 4).

I can't seem to find a solution in the SDM manual. I want to ask if this
approach is feasible, or if there are other ways to fix the issue.

Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
---
 arch/x86/kernel/apic/apic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index d73ba5a7b623..68c41d579303 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1117,6 +1117,8 @@ void clear_local_APIC(void)
 	}
 #endif
 
+	// Mask IPI here
+
 	/*
 	 * Clean APIC state for other OSs:
 	 */
-- 
2.34.1

