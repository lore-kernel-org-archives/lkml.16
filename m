Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCB01EC01F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510009; cv=none; b=f8NELhuMPQx/3FrbNkVefGnIDchFbHBqzcP4vWr9dBuYwlmGiJRHALL5u7CSxqRbgbZL1ReliWBoSD3mWLFXJeixC3NBt7+Lw+WqLn6aY4GzFESLpx33t1hpQzIBZmBgBPXTpinMXTactVNXyG4ImZUrAqZ5TVBXL62LNKg8OeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510009; c=relaxed/simple;
	bh=DpGxsgVgr/Xpff/beTHEZQp3I9HuOTYslzz02JBPytQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lzB7Qj0ZptW5FaFZYapvs3tWrETyoq534sGqzZGwxlGtk2j0zb+mSmtfxuZ6stRDKXzbi5ZLqNEroUqtj9xLAUjPCaGHQmnnpk33XjRy+6JVFaFfvFXLLfdH6rs6IOf3WfJoHf/1nx29T7Dh9hjPMhGIB8pLqWsleoHwsyow8Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.198])
	by gateway (Coremail) with SMTP id _____8AxGHHz2etnUMCtAA--.29558S3;
	Tue, 01 Apr 2025 20:20:03 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
	by front1 (Coremail) with SMTP id qMiowMBxGcTp2etnLbhqAA--.28868S2;
	Tue, 01 Apr 2025 20:20:01 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch changes for v6.15
Date: Tue,  1 Apr 2025 20:19:44 +0800
Message-ID: <20250401121945.3814892-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxGcTp2etnLbhqAA--.28868S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXFy7uw47XrWrJF1DAF47GFX_yoW5XF1xpr
	y3uFnxGr4DGr9xJwnrK343Wr1DtF1fGr1xXa13G348Cr1UZr1UWr1xGFZ5XFyUt3yktr10
	qr1rG3ZxKF1UA3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_
	JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
	0xZFpf9x07jepB-UUUUU=

The following changes since commit 38fec10eb60d687e30c8c6b5420d86e8149f7557:

  Linux 6.14 (2025-03-24 07:02:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-6.15

for you to fetch changes up to 17ba839c3c6c95562f329340e67da432309dd0d4:

  LoongArch: Update Loongson-3 default config file (2025-03-30 16:31:16 +0800)

----------------------------------------------------------------
LoongArch changes for v6.15

1, Add jump table support for objtool;
2, Always select HAVE_VIRT_CPU_ACCOUNTING_GEN;
3, Enable UBSAN (Undefined Behavior Sanitizer);
4, Increase MAX_IO_PICS up to 8;
5, Increase ARCH_DMA_MINALIGN up to 16;
6, Fix and improve BPF JIT;
7, Fix and improve vDSO implementation;
8, Update the default config file;
9, Some bug fixes and other small changes.

Note: There is conflicts in arch/loongarch/Kconfig and rust/Makefile,
but can be simply fixed by adjusting context as Stephen Rothwell done
in linux-next.

----------------------------------------------------------------
Bibo Mao (1):
      LoongArch: Always select HAVE_VIRT_CPU_ACCOUNTING_GEN

Hengqi Chen (3):
      LoongArch: BPF: Fix off-by-one error in build_prologue()
      LoongArch: BPF: Use move_addr() for BPF_PSEUDO_FUNC
      LoongArch: BPF: Don't override subprog's return value

Huacai Chen (4):
      Merge Merge tag 'objtool-core-2025-03-22' into loongarch-next
      LoongArch: Increase MAX_IO_PICS up to 8
      LoongArch: Increase ARCH_DMA_MINALIGN up to 16
      LoongArch: Update Loongson-3 default config file

Miaoqian Lin (1):
      LoongArch: Fix device node refcount leak in fdt_cpu_clk_init()

WANG Rui (1):
      rust: Fix enabling Rust and building with GCC for LoongArch

Xi Ruoyao (2):
      LoongArch: vDSO: Remove --hash-style=sysv
      LoongArch: vDSO: Make use of the t8 register for vgetrandom-chacha

Yuli Wang (2):
      LoongArch: Enable UBSAN (Undefined Behavior Sanitizer)
      LoongArch: Rework the arch_kgdb_breakpoint() implementation

谢致邦 (XIE Zhibang) (1):
      LoongArch: Fix help text of CMDLINE_EXTEND in Kconfig

 arch/loongarch/Kconfig                     |  7 ++++---
 arch/loongarch/configs/loongson3_defconfig | 11 ++++++++++-
 arch/loongarch/include/asm/cache.h         |  2 ++
 arch/loongarch/include/asm/irq.h           |  2 +-
 arch/loongarch/kernel/env.c                |  2 ++
 arch/loongarch/kernel/kgdb.c               |  5 +++--
 arch/loongarch/net/bpf_jit.c               | 12 ++++++++++--
 arch/loongarch/net/bpf_jit.h               |  5 +++++
 arch/loongarch/vdso/Makefile               |  3 +--
 arch/loongarch/vdso/vgetrandom-chacha.S    | 13 +++----------
 rust/Makefile                              |  4 +++-
 11 files changed, 44 insertions(+), 22 deletions(-)

