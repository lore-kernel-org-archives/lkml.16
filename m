Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666211DDC00
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745663029; cv=none; b=uSXmh1P6zGKcTOoovTPMMw96K/WPE7aWLk2DWoBEpZIa6QgOTqOfAs4KmfNpGSxPB+U8sK6i9oqtm5BlQe/llfdzPhMdV89XY8BlzwLcMueoXbHsufll47UUNLpmWsprz0mNBbeWWzCRqgWPN8d3CM6FG65EsNK5YbEMzOCnD1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745663029; c=relaxed/simple;
	bh=ru15U/s3x3GM6bcn/BiGbM2DcGsqFmej86zNWz/DyU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FadwOdY82yq9FcoY4GWw3kciZ5bqgu5jgGloIle1ix/Lj5v/P8qY9gXa4O1PQpmdCRSWovXCEEJ96/EuTuGlHPlz6ENi77sfQzQ0xhAN58J+6MBSIeTzb91gztnLZ/VTLRj/DWAJi61XN3j1V8b3PCVu9jtsqDo7PVMqjIywewY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.238])
	by gateway (Coremail) with SMTP id _____8BxrOIotAxoPb7GAA--.28331S3;
	Sat, 26 Apr 2025 18:23:36 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.238])
	by front1 (Coremail) with SMTP id qMiowMAxTsUjtAxo456WAA--.42675S2;
	Sat, 26 Apr 2025 18:23:35 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v6.15-rc4
Date: Sat, 26 Apr 2025 18:22:59 +0800
Message-ID: <20250426102259.1232395-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxTsUjtAxo456WAA--.42675S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WryfXFyxWry8JFyxZr4rtFc_yoW8Zw1Dpr
	ya9FnxGr4rGrWfXrnxt34UWrn8tr1xGr1SqF43try8Ar1UZr1UW348Xr97XFyUJ3yfJr40
	qr1rGw4YgF1UJ3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
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

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.15-1

for you to fetch changes up to 5add0dbbebd60628b55e5eb8426612dedab7311a:

  LoongArch: KVM: Fix PMU pass-through issue if VM exits to host finally (2025-04-26 09:58:13 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.15-rc4

Add a missing Kconfig option, fix some bugs about exception handler,
memory management and KVM.
----------------------------------------------------------------
Bibo Mao (2):
      LoongArch: KVM: Fully clear some CSRs when VM reboot
      LoongArch: KVM: Fix PMU pass-through issue if VM exits to host finally

Ming Wang (1):
      LoongArch: Return NULL from huge_pte_offset() for invalid PMD

Petr Tesarik (1):
      LoongArch: Remove a bogus reference to ZONE_DMA

Tiezhu Yang (3):
      LoongArch: Make regs_irqs_disabled() more clear
      LoongArch: Make do_xyz() exception handlers more robust
      LoongArch: Handle fp, lsx, lasx and lbt assembly symbols

Yuli Wang (1):
      LoongArch: Select ARCH_USE_MEMTEST

Yulong Han (1):
      LoongArch: KVM: Fix multiple typos of KVM code

 arch/loongarch/Kconfig              |  1 +
 arch/loongarch/include/asm/fpu.h    | 39 ++++++++++++++++++++++---------------
 arch/loongarch/include/asm/lbt.h    | 10 +++++++---
 arch/loongarch/include/asm/ptrace.h |  4 ++--
 arch/loongarch/kernel/fpu.S         |  6 ++++++
 arch/loongarch/kernel/lbt.S         |  4 ++++
 arch/loongarch/kernel/signal.c      | 21 --------------------
 arch/loongarch/kernel/traps.c       | 20 +++++++++++--------
 arch/loongarch/kvm/intc/ipi.c       |  4 ++--
 arch/loongarch/kvm/main.c           |  4 ++--
 arch/loongarch/kvm/vcpu.c           |  8 ++++++++
 arch/loongarch/mm/hugetlbpage.c     |  2 +-
 arch/loongarch/mm/init.c            |  3 ---
 13 files changed, 68 insertions(+), 58 deletions(-)

