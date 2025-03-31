Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DC718C011;
	Mon, 31 Mar 2025 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743403293; cv=none; b=jO5HeFzKmQIHeYzdmHgknqaJwUsjGwA96idMWqKeWGsIiOB4O2e8ve/tivccHGrFqXJf+RruX05CS4OJP+HI/tzR5Fu5n15hOZUsccex0+Ect43V+4TpRenIKxBFRV6sB0A3+7AOObcoi0Fvl7ZMn6n20ErXicHgRcjy2U17tXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743403293; c=relaxed/simple;
	bh=XZphg2z8XmETxUp5JaJLewdPqU6Io3kpErklsQZIhBg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F0uWkiB8vxSA7X3K0pQzbPSZIbo37wD0ypa0QnjbzLVKLsq7xchXsZuqC47FucjVGvI0eZS5umrxyPW+oplGdY/JR0bpjXEKVJuwU7sTpZZ2k+UISisMjV6NYOG9z22qRI73i3leXYnKAenH1/g5Kha1kk5hNL/bEkfWG65V7/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8CxqmoQOepntSSsAA--.26652S3;
	Mon, 31 Mar 2025 14:41:20 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by front1 (Coremail) with SMTP id qMiowMDxu8QNOepnBt9oAA--.50151S2;
	Mon, 31 Mar 2025 14:41:18 +0800 (CST)
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
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH v2 0/2]  Loongarch irq-redirect supprot
Date: Mon, 31 Mar 2025 14:41:14 +0800
Message-Id: <20250331064116.32540-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxu8QNOepnBt9oAA--.50151S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CrW7Ww47KrykXF1kJFW8GrX_yoW8JFyDpF
	WDu3sYyrs5CFWfGFn7Ca4Uury5J3WxGrW2qayaq343ur98uryDZry8CF98ZFykGay7t340
	gr1rWa4UWFyUA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8TCJPUUUUU==

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
 drivers/irqchip/irq-loongarch-avec.c          |  21 +-
 drivers/irqchip/irq-loongarch-ir.c            | 561 ++++++++++++++++++
 drivers/irqchip/irq-loongson.h                |  12 +
 include/linux/cpuhotplug.h                    |   1 +
 11 files changed, 669 insertions(+), 14 deletions(-)
 create mode 100644 drivers/irqchip/irq-loongarch-ir.c

-- 
2.43.0

