Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DE2289E01
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747276367; cv=none; b=UL6I5MxwSFypygEEe6BSkjNo8iaEfLDK/LF6PG826j/uAOTei11oR3dkTCjpnh4SypJsAhVe6WjLxY819Z2vgvPlStMwPk/tJ0DnDKJIm22X7+Niq9ID3/Kr9B2aK/UtCU959v2u0H6fIEcI1ggMqTupLjd7D6NQxHgYqeJZ8Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747276367; c=relaxed/simple;
	bh=qBVaGRdrBFEzaE+GKQRR3UnCjwA49VZve8qVB5U/bc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDXXHGvgPhxtY5Sn8azv9bLJ7PI+UYNOEt5d90fsyYvR2sMD7AeBRGq/ncGe9bebsO/H3FjbhaHhOc0yO0O2YU/XCPHsCJNr6UpufoTgU85y13NvnafqiGOWN3Yf1AtnQywh0GuDTj5cWZ0+GoZIGjK/K+JiRocyDSEO9hqqMxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8DxQK9KUiVoYInoAA--.15312S3;
	Thu, 15 May 2025 10:32:42 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMCxbsVDUiVo1PnTAA--.19913S4;
	Thu, 15 May 2025 10:32:39 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>
Subject: [PATCH v2 2/3] ipmi: Add Loongson-2K BMC support
Date: Thu, 15 May 2025 10:32:25 +0800
Message-ID: <0963b8274bfe25a21f56da9fcba05830fb43408b.1747276047.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1747276047.git.zhoubinbin@loongson.cn>
References: <cover.1747276047.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxbsVDUiVo1PnTAA--.19913S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3XFyUJF17Ar4rJF4xur18CrX_yoW3tr1xpa
	15K34kCw48tF47K3srJrykuFWrJr93WFy5tFW3X3yfuFW3try0grn2yFy3ZF9rKFyqgF13
	tFZ8Ar43GFW7A3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4ApnDUUUU

This patch adds Loongson-2K BMC IPMI support.

According to the existing design, we use software simulation to
implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.

Also since both host side and BMC side read and write kcs status, I use
fifo pointer to ensure data consistency.

Therefore I made the whole IPMI driver independent.

Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/char/ipmi/Makefile       |   1 +
 drivers/char/ipmi/ipmi_si.h      |   7 +
 drivers/char/ipmi/ipmi_si_intf.c |   3 +
 drivers/char/ipmi/ipmi_si_ls2k.c | 250 +++++++++++++++++++++++++++++++
 4 files changed, 261 insertions(+)
 create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c

diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index e0944547c9d0..5eb3494f5f39 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -8,6 +8,7 @@ ipmi_si-y := ipmi_si_intf.o ipmi_kcs_sm.o ipmi_smic_sm.o ipmi_bt_sm.o \
 	ipmi_si_mem_io.o
 ipmi_si-$(CONFIG_HAS_IOPORT) += ipmi_si_port_io.o
 ipmi_si-$(CONFIG_PCI) += ipmi_si_pci.o
+ipmi_si-$(CONFIG_LOONGARCH) += ipmi_si_ls2k.o
 ipmi_si-$(CONFIG_PARISC) += ipmi_si_parisc.o
 
 obj-$(CONFIG_IPMI_HANDLER) += ipmi_msghandler.o
diff --git a/drivers/char/ipmi/ipmi_si.h b/drivers/char/ipmi/ipmi_si.h
index a7ead2a4c753..71f1d4e1272c 100644
--- a/drivers/char/ipmi/ipmi_si.h
+++ b/drivers/char/ipmi/ipmi_si.h
@@ -93,6 +93,13 @@ void ipmi_si_pci_shutdown(void);
 static inline void ipmi_si_pci_init(void) { }
 static inline void ipmi_si_pci_shutdown(void) { }
 #endif
+#ifdef CONFIG_LOONGARCH
+void ipmi_si_ls2k_init(void);
+void ipmi_si_ls2k_shutdown(void);
+#else
+static inline void ipmi_si_ls2k_init(void) { }
+static inline void ipmi_si_ls2k_shutdown(void) { }
+#endif
 #ifdef CONFIG_PARISC
 void ipmi_si_parisc_init(void);
 void ipmi_si_parisc_shutdown(void);
diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 12b0b77eb1cc..323da77698ea 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -2107,6 +2107,7 @@ static int __init init_ipmi_si(void)
 
 	ipmi_si_pci_init();
 
+	ipmi_si_ls2k_init();
 	ipmi_si_parisc_init();
 
 	/* We prefer devices with interrupts, but in the case of a machine
@@ -2288,6 +2289,8 @@ static void cleanup_ipmi_si(void)
 
 	ipmi_si_pci_shutdown();
 
+	ipmi_si_ls2k_shutdown();
+
 	ipmi_si_parisc_shutdown();
 
 	ipmi_si_platform_shutdown();
diff --git a/drivers/char/ipmi/ipmi_si_ls2k.c b/drivers/char/ipmi/ipmi_si_ls2k.c
new file mode 100644
index 000000000000..cb31bb989fca
--- /dev/null
+++ b/drivers/char/ipmi/ipmi_si_ls2k.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for Loongson-2K BMC IPMI
+ *
+ * Copyright (C) 2024 Loongson Technology Corporation Limited.
+ *
+ * Originally written by Chong Qiao <qiaochong@loongson.cn>
+ * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>
+ */
+
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+#include "ipmi_si.h"
+
+#define LS2K_KCS_STS_OBF	BIT(0)
+#define LS2K_KCS_STS_IBF	BIT(1)
+#define LS2K_KCS_STS_SMS_ATN	BIT(2)
+#define LS2K_KCS_STS_CMD	BIT(3)
+
+#define LS2K_KCS_DATA_MASK	(LS2K_KCS_STS_OBF | LS2K_KCS_STS_IBF | LS2K_KCS_STS_CMD)
+
+/* Read and write fifo pointers for data consistency. */
+struct ls2k_fifo_flag {
+	u8 ibfh;
+	u8 ibft;
+	u8 obfh;
+	u8 obft;
+};
+
+struct ls2k_kcs_reg {
+	u8 status;
+	u8 data_out;
+	s16 data_in;
+	s16 cmd;
+};
+
+struct ls2k_kcs_data {
+	struct ls2k_fifo_flag fifo;
+	struct ls2k_kcs_reg reg;
+	u8 cmd_data;
+	u8 version;
+	u32 write_req;
+	u32 write_ack;
+	u32 reserved[2];
+};
+
+static void ls2k_set_obf(struct ls2k_kcs_data *ik, u8 sts)
+{
+	ik->reg.status = (ik->reg.status & ~LS2K_KCS_STS_OBF) | (sts & BIT(0));
+}
+
+static void ls2k_set_ibf(struct ls2k_kcs_data *ik, u8 sts)
+{
+	ik->reg.status = (ik->reg.status & ~LS2K_KCS_STS_IBF) | ((sts & BIT(0)) << 1);
+}
+
+static u8 ls2k_get_ibf(struct ls2k_kcs_data *ik)
+{
+	return (ik->reg.status >> 1) & BIT(0);
+}
+
+static unsigned char intf_sim_inb_v0(struct ls2k_kcs_data *ik,
+				     unsigned int offset)
+{
+	u32 inb = 0;
+
+	switch (offset & BIT(0)) {
+	case 0:
+		inb = ik->reg.data_out;
+		ls2k_set_obf(ik, 0);
+		break;
+	case 1:
+		inb = ik->reg.status;
+		break;
+	}
+
+	return inb;
+}
+
+static unsigned char intf_sim_inb_v1(struct ls2k_kcs_data *ik,
+				     unsigned int offset)
+{
+	u32 inb = 0;
+	int cmd;
+	bool obf, ibf;
+
+	obf = ik->fifo.obfh != ik->fifo.obft;
+	ibf = ik->fifo.ibfh != ik->fifo.ibft;
+	cmd = ik->cmd_data;
+
+	switch (offset & BIT(0)) {
+	case 0:
+		inb = ik->reg.data_out;
+		ik->fifo.obft = ik->fifo.obfh;
+		break;
+	case 1:
+		inb = ik->reg.status & ~LS2K_KCS_DATA_MASK;
+		inb |= obf | (ibf << 1) | (cmd << 3);
+		break;
+	}
+
+	return inb;
+}
+
+static unsigned char ls2k_mem_inb(const struct si_sm_io *io,
+				  unsigned int offset)
+{
+	struct ls2k_kcs_data *ik = io->addr;
+	int inb = 0;
+
+	if (ik->version == 0)
+		inb = intf_sim_inb_v0(ik, offset);
+	else if (ik->version == 1)
+		inb = intf_sim_inb_v1(ik, offset);
+
+	return inb;
+}
+
+static void intf_sim_outb_v0(struct ls2k_kcs_data *ik, unsigned int offset,
+			     unsigned char val)
+{
+	if (ls2k_get_ibf(ik))
+		return;
+
+	switch (offset & BIT(0)) {
+	case 0:
+		ik->reg.data_in = val;
+		ik->reg.status &= ~LS2K_KCS_STS_CMD;
+		break;
+
+	case 1:
+		ik->reg.cmd = val;
+		ik->reg.status |= LS2K_KCS_STS_CMD;
+		break;
+	}
+
+	ls2k_set_ibf(ik, 1);
+	ik->write_req++;
+}
+
+static void intf_sim_outb_v1(struct ls2k_kcs_data *ik, unsigned int offset,
+			     unsigned char val)
+{
+	if (ik->fifo.ibfh != ik->fifo.ibft)
+		return;
+
+	switch (offset & BIT(0)) {
+	case 0:
+		ik->reg.data_in = val;
+		ik->cmd_data = 0;
+		break;
+
+	case 1:
+		ik->reg.cmd = val;
+		ik->cmd_data = 1;
+		break;
+	}
+
+	ik->fifo.ibfh = !ik->fifo.ibft;
+	ik->write_req++;
+}
+
+static void ls2k_mem_outb(const struct si_sm_io *io, unsigned int offset,
+			  unsigned char val)
+{
+	struct ls2k_kcs_data *ik = io->addr;
+
+	if (ik->version == 0)
+		intf_sim_outb_v0(ik, offset, val);
+	else if (ik->version == 1)
+		intf_sim_outb_v1(ik, offset, val);
+}
+
+static void ls2k_mem_cleanup(struct si_sm_io *io)
+{
+	if (io->addr)
+		iounmap(io->addr);
+}
+
+static int ipmi_ls2k_sim_setup(struct si_sm_io *io)
+{
+	io->addr = ioremap(io->addr_data, io->regspacing);
+	if (!io->addr)
+		return -EIO;
+
+	io->inputb = ls2k_mem_inb;
+	io->outputb = ls2k_mem_outb;
+	io->io_cleanup = ls2k_mem_cleanup;
+
+	return 0;
+}
+
+static int ipmi_ls2k_probe(struct platform_device *pdev)
+{
+	struct si_sm_io io;
+
+	dev_info(&pdev->dev, "probing via ls2k platform");
+	memset(&io, 0, sizeof(io));
+
+	io.addr_source	= SI_PLATFORM;
+	io.si_type	= SI_KCS;
+	io.addr_space	= IPMI_MEM_ADDR_SPACE;
+	io.io_setup	= ipmi_ls2k_sim_setup;
+	io.addr_data	= pdev->resource[0].start;
+	io.regspacing	= pdev->resource[0].end - pdev->resource[0].start + 1;
+	io.regsize	= DEFAULT_REGSIZE;
+	io.regshift	= 0;
+	io.dev		= &pdev->dev;
+	io.irq		= 0;
+	if (io.irq)
+		io.irq_setup = ipmi_std_irq_setup;
+
+	dev_info(&pdev->dev, "%pR regsize %d spacing %d irq %d\n",
+		 &pdev->resource[0], io.regsize, io.regspacing, io.irq);
+
+	return ipmi_si_add_smi(&io);
+}
+
+static void ipmi_ls2k_remove(struct platform_device *pdev)
+{
+	ipmi_si_remove_by_dev(&pdev->dev);
+}
+
+struct platform_driver ipmi_ls2k_platform_driver = {
+	.driver = {
+		.name = "ls2k-ipmi-si",
+	},
+	.probe	= ipmi_ls2k_probe,
+	.remove	= ipmi_ls2k_remove,
+};
+
+static bool platform_registered;
+void ipmi_si_ls2k_init(void)
+{
+	int rv;
+
+	rv = platform_driver_register(&ipmi_ls2k_platform_driver);
+	if (rv)
+		pr_err("Unable to register driver: %d\n", rv);
+	else
+		platform_registered = true;
+}
+
+void ipmi_si_ls2k_shutdown(void)
+{
+	if (platform_registered)
+		platform_driver_unregister(&ipmi_ls2k_platform_driver);
+}
-- 
2.47.1

