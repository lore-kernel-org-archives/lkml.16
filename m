Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36CF2AF14
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018935; cv=none; b=ibXQLGqTYlege+NPPbxv2GduPEEzvKDydjbOZS5dg9FDoe1+uXz+hIF/jHtfvYqrlDvZUHXtlLHQBWt8UTuSL/rCv2SKPyQ2wIu4+96pLgGM/YZwfmihQ2u4A9h4AUswhHYMOe0FL7dVTBB+9DEECS/NfZ6B6Do+k/5wtDCYgYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018935; c=relaxed/simple;
	bh=uOjghlcsMo3DEQkUwDPO1+tvx20efvE49bhgbT+elEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pLvyNjy5JEH+Z6Uq9YaARBLdI26F9zdtQXVwrF7GfCQqymNhHzy1l3JnBUPPL9Hm/P7wAqVTxs+5KOQNFdtY0PuW2LrkvS5IP7Xqqr9wwTC3RcMNlgqJZ5ZUeEaB66XJxoxCTOJsN2gR3cW/Nh+OplEOvuJ/jf3YmMI6l+6ApiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxrOJsIhJoJjnLAA--.35231S3;
	Wed, 30 Apr 2025 21:15:24 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCx_cZmIhJoqoKgAA--.14402S5;
	Wed, 30 Apr 2025 21:15:23 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] LoongArch: Enable tracing syscalls in defconfig
Date: Wed, 30 Apr 2025 21:15:14 +0800
Message-ID: <20250430131516.24287-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250430131516.24287-1-yangtiezhu@loongson.cn>
References: <20250430131516.24287-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCx_cZmIhJoqoKgAA--.14402S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr18try7Zr47Gr1xAr43urX_yoW8Gw1Up3
	W5Aw1DGr48GrnYkrW7CrZ7Wws2yFZ7GFy7Ww1UZry5A39xXw10vr4rKFyY9FW7u395t3yF
	vF95KF129FyUZacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOdb8UUUUU=

There exist the following errors when building bpf selftest:

  $ cd tools/testing/selftests/bpf/
  $ make
  ...
  CLNG-BPF [test_progs] profiler1.bpf.o
  In file included from progs/profiler1.c:5:
  progs/profiler.inc.h:599:49: error: declaration of 'struct syscall_trace_enter' will not be visible outside of this function [-Werror,-Wvisibility]
  ...
  progs/profiler.inc.h:604:15: error: incomplete definition of type 'struct syscall_trace_enter'
  ...
  progs/profiler.inc.h:605:15: error: incomplete definition of type 'struct syscall_trace_enter'
  ...
  3 errors generated.

This is because there is no basic tracer to catch the syscall entry
and exit events, it is better to enable the kernel tracing syscalls
with CONFIG_FTRACE_SYSCALLS in defconfig to avoid the building errors.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index eaaf3419555c..4289e3abf8c7 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -1006,4 +1006,5 @@ CONFIG_STRIP_ASM_SYMS=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 CONFIG_SCHEDSTATS=y
+CONFIG_FTRACE_SYSCALLS=y
 CONFIG_UNWINDER_ORC=y
-- 
2.42.0

