Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40B874059
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750385222; cv=none; b=XYUa9wHMBZTOSNiIFp06lMipCU/TgxsfX5yJ7h6mA2Ilo6cjxnrJlfEUSOhYi327RjzuFN0IvKTcss8OpVaxlIuqkzq/JHMPpGpsZNNRjNKVJC1a6ujQiBvGGw1qYmPCZA6Nkf4gH8tI7GwyBjpcCr9cD5pAVE3ARlBmqfH/LYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750385222; c=relaxed/simple;
	bh=XSg9qU078yqZglExY8CcdMafbOGnKGxVjojhbG8A2Ak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j9pa2PxNjR8bCu8AId/P13t+Xx/vAKg6TiedYHrS5wWNakHAYxCAW9SXMe/WYE1UWkQOzs+6rVgVa00DkIMJV2BWFqra1znnhpt2FjdvYMLpnyu3eYjcXB818O4gGPk+k+kqfIxQCxhiMbTdDUnpUbDjt2ci5n/BlAciSKx1D+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.149])
	by gateway (Coremail) with SMTP id _____8BxnnM5wlRoXCMaAQ--.24059S3;
	Fri, 20 Jun 2025 10:06:49 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.149])
	by front1 (Coremail) with SMTP id qMiowMCx7MQuwlRodNIhAQ--.36930S2;
	Fri, 20 Jun 2025 10:06:39 +0800 (CST)
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
	jeffbai@aosc.io,
	kexybiscuit@aosc.io,
	wangyao@lemote.com,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v5 0/3] LoongArch: Add Loongson-2K BMC support
Date: Fri, 20 Jun 2025 10:06:26 +0800
Message-ID: <cover.1750301674.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx7MQuwlRodNIhAQ--.36930S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJF13CF1fuw1DKFW3Kw1kXrc_yoWrWr4rpa
	15CFsxCr4DKFW7JrZ3Z34xuFWavas5Ja4rKr17A345ZF4UCa40yrWrKa45XFy7AF4kGry2
	qrs3Jr4Ska45Z3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1q6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUFwIDUUUUU

Hi all:

This patch set introduces the Loongson-2K BMC.

It is a PCIe device present on servers similar to the Loongson-3 CPUs.
And it is a multifunctional device (MFD), such as display as a sub-function
of it.

For IPMI, according to the existing design, we use software simulation to
implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.

Also since both host side and BMC side read and write kcs status, we use
fifo pointer to ensure data consistency.

For the display, based on simpledrm, the resolution is read from a fixed
position in the BMC since the hardware does not support auto-detection
of the resolution. Of course, we will try to support multiple
resolutions later, through a vbios-like approach.

Especially, for the BMC reset function, since the display will be
disconnected when BMC reset, we made a special treatment of re-push.

Based on this, I will present it in four patches:
patch-1: BMC device PCI resource allocation.
patch-2: BMC reset function support
patch-3: IPMI implementation

Thanks.

-------
V5:
- Rebase on linux-ipmi/for-next branch.
- Rebase on linux-mfd/for-mfd-next branch.
Patch (1/3):
 - Rename ls2kbmc-mfd.c to ls2k-bmc-core.c;
 - Rename MFD_LS2K_BMC to MFD_LS2K_BMC_CORE and update its help text.
Patch (3/3):
 - Add an IPMI_LS2K config in the IPMI section that enables the IPMI
   interface and selects MFD_LS2K_BMC_CORE.

Link to V4:
https://lore.kernel.org/all/cover.1749731531.git.zhoubinbin@loongson.cn/

V4:
- Add Reviewed-by tag;
- Change the order of the patches.
Patch (1/3):
  - Fix build warning by lkp: Kconfig tristate -> bool
    - https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp@intel.com/
 - Update commit message;
 - Move MFD_LS2K_BMC after MFD_INTEL_M10_BMC_PMCI in Kconfig and
   Makefile.
Patch (2/3):
  - Remove unnecessary newlines;
  - Rename ls2k_bmc_check_pcie_connected() to
    ls2k_bmc_pcie_is_connected();
  - Update comment message.
Patch (3/3):
  - Remove unnecessary newlines.

Link to V3:
https://lore.kernel.org/all/cover.1748505446.git.zhoubinbin@loongson.cn/

V3:
Patch (1/3):
 - Drop "MFD" in title and comment;
 - Fromatting code;
 - Add clearer comments.
Patch (2/3):
 - Rebase linux-ipmi/next tree;
 - Use readx()/writex() to read and write IPMI data instead of structure
   pointer references;
 - CONFIG_LOONGARCH -> MFD_LS2K_BMC;
 - Drop unused output.
Patch (3/3):
 - Inline the ls2k_bmc_gpio_reset_handler() function to ls2k_bmc_pdata_initial();
 - Add clearer comments.
 - Use proper multi-line commentary as per the Coding Style documentation;
 - Define all magic numbers.

Link to V2:
https://lore.kernel.org/all/cover.1747276047.git.zhoubinbin@loongson.cn/

V2:
- Drop ls2kdrm, use simpledrm instead.
Patch (1/3):
 - Use DEFINE_RES_MEM_NAMED/MFD_CELL_RES simplified code;
 - Add resolution fetching due to replacing the original display
   solution with simpledrm; 
 - Add aperture_remove_conflicting_devices() to avoid efifb
   conflict with simpledrm.
Patch (3/3):
 - This part of the function, moved from the original ls2kdrm to mfd;
 - Use set_console to implement the Re-push display function.

Link to V1:
https://lore.kernel.org/all/cover.1735550269.git.zhoubinbin@loongson.cn/

Binbin Zhou (3):
  mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
  mfd: ls2kbmc: Add Loongson-2K BMC reset function support
  ipmi: Add Loongson-2K BMC support

 drivers/char/ipmi/Kconfig        |   7 +
 drivers/char/ipmi/Makefile       |   1 +
 drivers/char/ipmi/ipmi_si.h      |   7 +
 drivers/char/ipmi/ipmi_si_intf.c |   4 +
 drivers/char/ipmi/ipmi_si_ls2k.c | 189 ++++++++++++
 drivers/mfd/Kconfig              |  11 +
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/ls2k-bmc-core.c      | 485 +++++++++++++++++++++++++++++++
 8 files changed, 706 insertions(+)
 create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
 create mode 100644 drivers/mfd/ls2k-bmc-core.c


base-commit: 8ffcb7560b4a15faf821df95e3ab532b2b020f8c
-- 
2.47.1

