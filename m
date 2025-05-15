Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA401581F0
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747276365; cv=none; b=alwmUz4A9zHC9UQzpBPtws/b6uqVWCFEUxFZUqMwU+0gU2V9G6Akzvf30xu7oYlTOAFCnOcJgD5bWqQ8Xan+KjYPvIBkUeBupE2zwzJNxEI3BTaepx3z6NiTHvaD2TgIn93VSfPGqfSU57ademdQQv5jbxubNYR1Dj5EmbJ8EFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747276365; c=relaxed/simple;
	bh=f5iIoPfhro2GvnQllYlD5RXq+JMRu0k9+RzyAIoY1Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=muQJQY3dFC2PziD55K9cT3hwKIq+dvKyd8uPDC7AT0+chAZcihxFesFdq1i8F2yoecTaS0w1oGvyh4IyJmPbc+AvXMCJq8xAS4JxssxYboOW2zgho/h1ZHO+MXklGEAUGlsH3Diye/3pojE1XOFBsF0zTVa2I2QMwKE3z4mGK3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8Bx22pHUiVoT4noAA--.15507S3;
	Thu, 15 May 2025 10:32:39 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMCxbsVDUiVo1PnTAA--.19913S2;
	Thu, 15 May 2025 10:32:36 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 0/3] LoongArch: Add Loongson-2K0500 BMC support
Date: Thu, 15 May 2025 10:32:23 +0800
Message-ID: <cover.1747276047.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxbsVDUiVo1PnTAA--.19913S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WryxJw4rGw17GrykZw1UArc_yoW8KrW7pa
	15uFZ8ur4DJFW7CrZ3Xw4xuFW3Zas5Xa4rKr13Jw15WrWYkry0yry3tFy5WFy7AF15Jry2
	q3s8Ar1xGFyUAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4ApnDUUUU

Hi all:

This patch set introduces the Loongson-2K0500 BMC.

It is a PCIe device present on servers similar to the Loongson-3C6000.
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
patch-2: IPMI implementation
patch-3: display, based on simpledrm
patch-4: BMC reboot support

Thanks.

-------
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
  mfd: ls2kbmc: Introduce Loongson-2K BMC MFD Core driver
  ipmi: Add Loongson-2K BMC support
  mfd: ls2kbmc: Add Loongson-2K BMC reset function support

 drivers/char/ipmi/Makefile       |   1 +
 drivers/char/ipmi/ipmi_si.h      |   7 +
 drivers/char/ipmi/ipmi_si_intf.c |   3 +
 drivers/char/ipmi/ipmi_si_ls2k.c | 250 +++++++++++++++++++
 drivers/mfd/Kconfig              |  13 +
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/ls2kbmc-mfd.c        | 398 +++++++++++++++++++++++++++++++
 7 files changed, 674 insertions(+)
 create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
 create mode 100644 drivers/mfd/ls2kbmc-mfd.c


base-commit: 9f2b0c15b752bb940e2eb6737bee30fff96d96b6
-- 
2.47.1

