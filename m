Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044E12882BF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620904; cv=none; b=hBKU3pX2+OiNwqnvfj4SKLf1xSYgI/Srf00JEOg6oIwskLJHX6P2igfjSPXdrOvTVtJ9BY+/vOelY2IAeV8RkJ0tDrTONGZIBIcMojiJRYqalDngR1x9ZDEc9kjtAiffE2XQFaRCrQAS7oCohTg1OXmBLS0HqaOukk2PfpeK7ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620904; c=relaxed/simple;
	bh=HCJ1JhHK2fE04lwNglZ4+F99ZO4+HoM5uxWQBbcNcLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wx6+0uvdrsuCtb5ykADkRxJMXLQoGrTfOGtFLa88F8DpCBrqR2EFTSUg2KBGwBQSNHutzkeJk3dmIEkJOajA246GCxdzWnDVK8fL/bTbroyCEHAL6rwGMab+5qxyZY5uhn70jt/qxiqQoIGWhjfImfe5h3wC48gLOb4e3vCmBAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.149])
	by gateway (Coremail) with SMTP id _____8AxGHEdnWdovFAiAQ--.12035S3;
	Fri, 04 Jul 2025 17:21:33 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.149])
	by front1 (Coremail) with SMTP id qMiowJAxT+YTnWdobxoJAA--.53746S2;
	Fri, 04 Jul 2025 17:21:25 +0800 (CST)
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
Subject: [PATCH v7 0/3] LoongArch: Add Loongson-2K BMC support
Date: Fri,  4 Jul 2025 17:21:10 +0800
Message-ID: <cover.1751617911.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxT+YTnWdobxoJAA--.53746S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJF13CF1fuw1DKFW3Kw1kXrc_yoWrKr1Dpa
	15urs8Crn8KF17J393Cw1fuFyYqa95Ja4Sgr17Aw15uF4UCa4jyrWrKa13XFyUAF4kKryI
	qrsayr1fKa45Z3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Gii3UUUUU==

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
patch-1: BMC basic function support, such as display with simpledrm;
patch-2: BMC reset function support;
patch-3: IPMI implementation.

Thanks.

-------
V7:
Patch (1/3):
  - Fix build warning by lkp: Add depend on ACPI_GENERIC_GSI
    - https://lore.kernel.org/all/202507021011.sDAHGinj-lkp@intel.com/

Link to V6:
https://lore.kernel.org/all/cover.1750939357.git.zhoubinbin@loongson.cn/

V6:
- Add Acked-by tag from Corey, thanks;
Patch (1/3):
  - Fix build warning by lkp: Add depend on PCI
    - https://lore.kernel.org/all/202506210204.LVZc2VG2-lkp@intel.com/
    - https://lore.kernel.org/all/202506210231.ZWWNhofU-lkp@intel.com/
    - https://lore.kernel.org/all/202506210652.ipUFDU5B-lkp@intel.com/
    - https://lore.kernel.org/all/202506210343.XCHkzorp-lkp@intel.com/

Link to V5:
https://lore.kernel.org/all/cover.1750301674.git.zhoubinbin@loongson.cn/

V5:
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

 MAINTAINERS                      |   7 +
 drivers/char/ipmi/Kconfig        |   7 +
 drivers/char/ipmi/Makefile       |   1 +
 drivers/char/ipmi/ipmi_si.h      |   7 +
 drivers/char/ipmi/ipmi_si_intf.c |   4 +
 drivers/char/ipmi/ipmi_si_ls2k.c | 189 ++++++++++++
 drivers/mfd/Kconfig              |  13 +
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/ls2k-bmc-core.c      | 484 +++++++++++++++++++++++++++++++
 9 files changed, 714 insertions(+)
 create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
 create mode 100644 drivers/mfd/ls2k-bmc-core.c


base-commit: 2e8185c0f214d45cdbc20ee4e6796c561ba66c55
-- 
2.47.1

