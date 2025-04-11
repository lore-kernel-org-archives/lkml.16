Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269E0283684
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357036; cv=none; b=Xtjjx1J4d7rV+fiD7jilR3h9rziGPPeqNpZ8Tc8p1uMOYx+SyXgMoN0QFXLXPWhYW7m7EQyz3iIOwP6KF+j9oMEIbnBHM7b6Nl97pIKACnuk8e1X6Dyz+hDy0BmSWVaVnen+gEVolh4/3zjPcuhrDETwQZWfdUKpDJXHQFXvrPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357036; c=relaxed/simple;
	bh=3Ds+I64o3wm/v6dh94Mn+eiddrweREBbYMgtu/Gp4og=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Faf0tUUF/KEe0hwtHaZosPUvcSrWxp/8R47tsO7np+hX1/dLEdVNDg9N7v3S9lHcgJ1BQWNACTon9R/f/+t/wdd/zWZp9BRuNlOUf14xjIvE5i7bOqu0m54gAa8p151C6lGtAfWv8S48dVY7wpOGb+NRnmjdczXFyG68iKxAoB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZYpMS2KX8z2Cdg1;
	Fri, 11 Apr 2025 15:33:40 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 5A5591A0188;
	Fri, 11 Apr 2025 15:37:04 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 11 Apr
 2025 15:37:03 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <jassisinghbrar@gmail.com>, <afd@ti.com>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-kernel@vger.kernel.org>, <yuehaibing@huawei.com>
Subject: [PATCH -next] mailbox: mchp-ipc-sbi: Fix COMPILE_TEST build error
Date: Fri, 11 Apr 2025 15:57:47 +0800
Message-ID: <20250411075747.3716565-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemf500002.china.huawei.com (7.185.36.57)

If COMPILE_TEST is y but RISCV_SBI is n, build fails:

drivers/mailbox/mailbox-mchp-ipc-sbi.c: In function ‘mchp_ipc_sbi_chan_send’:
drivers/mailbox/mailbox-mchp-ipc-sbi.c:119:23: error: storage size of ‘ret’ isn’t known
	struct sbiret ret;
	              ^~~
  CC      drivers/nvmem/lpc18xx_otp.o
drivers/mailbox/mailbox-mchp-ipc-sbi.c:121:15: error: implicit declaration of function ‘sbi_ecall’ [-Werror=implicit-function-declaration]
	ret = sbi_ecall(SBI_EXT_MICROCHIP_TECHNOLOGY, command, channel,
	      ^~~~~~~~~

move COMPILE_TEST to ARCH_MICROCHIP dependency as other drivers.

Fixes: e4b1d67e7141 ("mailbox: add Microchip IPC support")
Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/mailbox/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ed52db272f4d..e8445cda7c61 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -191,8 +191,8 @@ config POLARFIRE_SOC_MAILBOX
 
 config MCHP_SBI_IPC_MBOX
 	tristate "Microchip Inter-processor Communication (IPC) SBI driver"
-	depends on RISCV_SBI || COMPILE_TEST
-	depends on ARCH_MICROCHIP
+	depends on RISCV_SBI
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	help
 	  Mailbox implementation for Microchip devices with an
 	  Inter-process communication (IPC) controller.
-- 
2.34.1

