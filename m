Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70352AE7C
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747473523; cv=none; b=QaMzCaOCD0yiK/YpOOzrTp7Ncx2NSFRy0j/0LwBE/cMvHorz6yEfzBbb4+ILzi75K+Ln1Y5YlAwZZab6745cF3WrLMmnEVxbqLha0Dl1Wu6FM3zroPNlQlefTZmK+5SmnkJiOEoaFo4f2f2OumieWcD5Z9oFjeiiRTHGKb1I20A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747473523; c=relaxed/simple;
	bh=Wx3vkHoGM2SIgtXNrgr14kmQXUf9CbbQw1ZTh/t+Fs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JY3+YD78uVyl/FkvA6De2GDOWQvc7BWF6/Z0ZzoeBeQUVNALfLwt7Muha9Drf0Fi72RwYZLoyhD6QfHlquJwm6cQ8b/cyzU+onFHp24mlD4kR4M5vqyv0iNacbsdxoN1g9tPa7i0iDUEpRIVD9ue9pRly5aYDvkIKU0h+RMGgTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8DxOGpnVChoZqnuAA--.61368S3;
	Sat, 17 May 2025 17:18:31 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMDxOcRiVChosg_cAA--.55457S2;
	Sat, 17 May 2025 17:18:29 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v6.15-rc7
Date: Sat, 17 May 2025 17:18:17 +0800
Message-ID: <20250517091817.3490818-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxOcRiVChosg_cAA--.55457S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ArWrZw17AFW7CF1fAw15ZFc_yoW8Xw13pr
	9xCrnxGF4UGr13Jr13t34DWrn8tryxGw43Xa13t34xGr1UAr1UXr18KrykXFy5t3yrKr10
	qF18Jw1YgF1UJwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9jb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU8hiSPUUUUU==

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.15-2

for you to fetch changes up to 12614f794274f63fbdfe76771b2b332077d63848:

  LoongArch: uprobes: Remove redundant code about resume_era (2025-05-14 22:18:10 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.15-rc7

Fix some bugs about kernel-fpu, cpu idle function, hibernation and
uprobes.
----------------------------------------------------------------
Huacai Chen (3):
      LoongArch: Fix MAX_REG_OFFSET calculation
      LoongArch: Move __arch_cpu_idle() to .cpuidle.text section
      LoongArch: Save and restore CSR.CNTC for hibernation

Tianyang Zhang (1):
      LoongArch: Prevent cond_resched() occurring within kernel-fpu

Tiezhu Yang (2):
      LoongArch: uprobes: Remove user_{en,dis}able_single_step()
      LoongArch: uprobes: Remove redundant code about resume_era

 arch/loongarch/include/asm/ptrace.h  |  2 +-
 arch/loongarch/include/asm/uprobes.h |  1 -
 arch/loongarch/kernel/genex.S        |  7 +++++--
 arch/loongarch/kernel/kfpu.c         | 22 ++++++++++++++++++++--
 arch/loongarch/kernel/time.c         |  2 +-
 arch/loongarch/kernel/uprobes.c      | 11 +----------
 arch/loongarch/power/hibernate.c     |  3 +++
 7 files changed, 31 insertions(+), 17 deletions(-)

