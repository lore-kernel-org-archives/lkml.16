Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8598523313E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751107076; cv=none; b=OyWI68j8XI1M7gDi1+P/lM481jlPFTS0OJi0XxWhdEYOdebObgRW1oMUR6SYX1Wnl4f4moB3/E2WzUEvIqZXrWQJjSmSnlEBSupZBAE6v7BPjVDg4ACbeol9zeH7so3o8OSg/+SHmoSIQIpdj20aahNLa7C2tMt+q6c3qD4xEnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751107076; c=relaxed/simple;
	bh=lcdY5/4igis1D06o50sZUMdu2ySz2CbfqGSKDk9HFPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h7X39TyO+pOYq94NLz4lYruPcFRVJDQ0+ajeMNXZ4XEjtO4jmD2EgVM8l+HQXOflKaTsT97KkQs0K6k/cANfHPIfXXxLdHmG8usHPExNhgLp02JvLw8587qmAW5HXQ6g1GryJHvc0yoNrPTpm0Kyy98wzd7rdllCmdOsJhZCof8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.149])
	by gateway (Coremail) with SMTP id _____8AxGHH2xV9oJt0eAQ--.5478S3;
	Sat, 28 Jun 2025 18:37:42 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.149])
	by front1 (Coremail) with SMTP id qMiowJCxrsPsxV9oHkQBAA--.706S2;
	Sat, 28 Jun 2025 18:37:41 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v6.16-rc4
Date: Sat, 28 Jun 2025 18:37:19 +0800
Message-ID: <20250628103719.3741195-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxrsPsxV9oHkQBAA--.706S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCF48KF4xWr43uFy3Kr4rJFc_yoWrJFWUpF
	9xCrn7GF4rGr93Arnrt3s8ur1DJr1xCw1aq3Wa9ry8CF4avw1UZr1ktrykXFyUtayrJry0
	gF1rGws0qF48JwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_
	JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
	0xZFpf9x07jepB-UUUUU=

The following changes since commit 86731a2a651e58953fc949573895f2fa6d456841:

  Linux 6.16-rc3 (2025-06-22 13:30:08 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.16-1

for you to fetch changes up to 955853cf83657faa58572ef3f08b44f0f88885c1:

  LoongArch: KVM: Disable updating of "num_cpu" and "feature" (2025-06-27 18:27:44 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.16-rc4

Replace __ASSEMBLY__ with __ASSEMBLER__ in headers like others, fix
build warnings about export.h, reserve the EFI memory map region for
kdump, handle __init vs inline mismatches, and fix some bugs about KVM.
----------------------------------------------------------------
Bibo Mao (6):
      LoongArch: KVM: Avoid overflow with array index
      LoongArch: KVM: Add address alignment check for IOCSR emulation
      LoongArch: KVM: Fix interrupt route update with EIOINTC
      LoongArch: KVM: Check interrupt route from physical CPU
      LoongArch: KVM: Check validity of "num_cpu" from user space
      LoongArch: KVM: Disable updating of "num_cpu" and "feature"

Huacai Chen (1):
      LoongArch: Fix build warnings about export.h

Kees Cook (1):
      LoongArch: Handle KCOV __init vs inline mismatches

Ming Wang (1):
      LoongArch: Reserve the EFI memory map region

Thomas Huth (1):
      LoongArch: Replace __ASSEMBLY__ with __ASSEMBLER__ in headers

 arch/loongarch/include/asm/addrspace.h         |  8 +--
 arch/loongarch/include/asm/alternative-asm.h   |  4 +-
 arch/loongarch/include/asm/alternative.h       |  4 +-
 arch/loongarch/include/asm/asm-extable.h       |  6 +-
 arch/loongarch/include/asm/asm.h               |  8 +--
 arch/loongarch/include/asm/cpu.h               |  4 +-
 arch/loongarch/include/asm/ftrace.h            |  4 +-
 arch/loongarch/include/asm/gpr-num.h           |  6 +-
 arch/loongarch/include/asm/irqflags.h          |  4 +-
 arch/loongarch/include/asm/jump_label.h        |  4 +-
 arch/loongarch/include/asm/kasan.h             |  2 +-
 arch/loongarch/include/asm/loongarch.h         | 16 ++---
 arch/loongarch/include/asm/orc_types.h         |  4 +-
 arch/loongarch/include/asm/page.h              |  4 +-
 arch/loongarch/include/asm/pgtable-bits.h      |  4 +-
 arch/loongarch/include/asm/pgtable.h           |  4 +-
 arch/loongarch/include/asm/prefetch.h          |  2 +-
 arch/loongarch/include/asm/smp.h               |  2 +-
 arch/loongarch/include/asm/thread_info.h       |  4 +-
 arch/loongarch/include/asm/types.h             |  2 +-
 arch/loongarch/include/asm/unwind_hints.h      |  6 +-
 arch/loongarch/include/asm/vdso/arch_data.h    |  4 +-
 arch/loongarch/include/asm/vdso/getrandom.h    |  4 +-
 arch/loongarch/include/asm/vdso/gettimeofday.h |  4 +-
 arch/loongarch/include/asm/vdso/processor.h    |  4 +-
 arch/loongarch/include/asm/vdso/vdso.h         |  4 +-
 arch/loongarch/include/asm/vdso/vsyscall.h     |  4 +-
 arch/loongarch/kernel/acpi.c                   |  1 +
 arch/loongarch/kernel/alternative.c            |  1 +
 arch/loongarch/kernel/efi.c                    | 12 ++++
 arch/loongarch/kernel/elf.c                    |  1 -
 arch/loongarch/kernel/kfpu.c                   |  1 +
 arch/loongarch/kernel/paravirt.c               |  1 -
 arch/loongarch/kernel/time.c                   |  2 +-
 arch/loongarch/kernel/traps.c                  |  1 +
 arch/loongarch/kernel/unwind_guess.c           |  1 +
 arch/loongarch/kernel/unwind_orc.c             |  3 +-
 arch/loongarch/kernel/unwind_prologue.c        |  1 +
 arch/loongarch/kvm/intc/eiointc.c              | 89 ++++++++++++++++++--------
 arch/loongarch/lib/crc32-loongarch.c           |  1 +
 arch/loongarch/lib/csum.c                      |  1 +
 arch/loongarch/mm/ioremap.c                    |  4 +-
 arch/loongarch/pci/pci.c                       |  1 -
 tools/arch/loongarch/include/asm/orc_types.h   |  4 +-
 44 files changed, 151 insertions(+), 100 deletions(-)

