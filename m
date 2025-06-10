Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22E91FC11F;
	Tue, 10 Jun 2025 11:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555782; cv=none; b=fa9qNtKyDl16vhjjEiZmqozlwTX85ZOfic8HmN5ekT7PtcFQlNhGqViJUbqzYE3O/JSMZiAzOteDGBPgPrINhjUE0KL6dj5rmrcJ5JvD8/SBnLtNpIIt55adRN/9IJuPEPGlHwAvjX4B/2pwyJO9j2Z88rHVTzk2WPv6JNBEvCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555782; c=relaxed/simple;
	bh=RgJpcaN+67Db6QQGMO7Pjy7+uEp/KzAMBbtdlk0LQiw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=luHLyj41JfZiuQPwlitvGRbJTgiACSvhukHviOSjZDNemfhvXak3sQNl0uF58TuasCZGg1oJpXQlsp3G16h/Q2+m/RZOXnb9lZ239Ua2Z+KAszihhXNkSPMb58/0Jq7peBsxrXmRw19n6cbU7QJmwos+7DMU1IuiDhrvTg+0RY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8AxfeFBGkhoL6USAQ--.5363S3;
	Tue, 10 Jun 2025 19:42:57 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMBx3MQ9Gkho108UAQ--.60866S2;
	Tue, 10 Jun 2025 19:42:53 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	peterz@infradead.org,
	wangliupu@loongson.cn,
	lvjianmin@loongson.cn,
	maobibo@loongson.cn,
	siyanteng@cqsoftware.com.cn,
	gaosong@loongson.cn,
	yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Super User <root@localhost.localdomain>
Subject: [PATCH v4 0/2]  Loongarch irq-redirect supprot
Date: Tue, 10 Jun 2025 19:42:50 +0800
Message-Id: <20250610114252.21077-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBx3MQ9Gkho108UAQ--.60866S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CrW7Ww47KrykXF1kJFW8GrX_yoW8Cr15pF
	Zru3sYyr4rCFZ3CF1kGa4UuryrXF4xG3y2q3W2q34fur13uryDZr10kFZ8ZFykGay7tw1I
	gr4Fqa4UWas8AacCm3ZEXasCq-sJn29KB7ZKAUJUUUUk529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0yq2tUUUUU==

From: Super User <root@localhost.localdomain>

This series of patches introduces support for interrupt-redirect
controllers, and this hardware feature will be supported on 3C6000
for the first time

change log:
	v0->v1:
	1.Rename the model names in the document.
	2.Adjust the code format.
	3.Remove architecture - specific prefixes.
	4.Refactor the initialization logic, and IR driver no longer set AVEC_ENABLE.
	5.Enhance compatibility under certain configurations.

	v1->v2:
	1.Fixed an erroneous enabling issue.

	v2->v3
	1.Replace smp_call with address mapping to access registers
	2.Fix some code style issues

	v3->v4
	1.Provide reasonable comments on the modifications made to IRQ_SET_MASK_OK_DONE	
	2.Replace meaningless empty functions with parent_mask/unmask/ack
	3.Added and indeed released resources
	4.Added judgment for data structure initialization completion to avoid duplicate creation during cpuhotplug
	5.Fixed the code style and some unnecessary troubles

Tianyang Zhang (2):
  Docs/LoongArch: Add Advanced Extended-Redirect IRQ model description
  irq/irq-loongarch-ir:Add Redirect irqchip support

 .../arch/loongarch/irq-chip-model.rst         |  38 ++
 .../zh_CN/arch/loongarch/irq-chip-model.rst   |  37 ++
 arch/loongarch/include/asm/cpu-features.h     |   1 +
 arch/loongarch/include/asm/cpu.h              |   2 +
 arch/loongarch/include/asm/loongarch.h        |   6 +
 arch/loongarch/kernel/cpu-probe.c             |   2 +
 drivers/irqchip/Makefile                      |   2 +-
 drivers/irqchip/irq-loongarch-avec.c          |  25 +-
 drivers/irqchip/irq-loongarch-ir.c            | 562 ++++++++++++++++++
 drivers/irqchip/irq-loongson.h                |  12 +
 include/linux/cpuhotplug.h                    |   1 +
 11 files changed, 674 insertions(+), 14 deletions(-)
 create mode 100644 drivers/irqchip/irq-loongarch-ir.c

-- 
2.41.0

