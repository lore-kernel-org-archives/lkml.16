Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E60D1E5B8A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018936; cv=none; b=XlTTRfmu/tm86IbwVQaelAxZ6jfd9nV/w14u0AHoS3adbx9jj1Z4vrLVqTi2/5UV5YEm69Sp5FE3pXzT4wTCyl+LBIRXHaT6HH5q0qhsT5X6a4hdTmiM2BfQXBqxShU4IWTGtYj6qre7VHcEbDs4ynkQr/xaRgK49k36qKv6tu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018936; c=relaxed/simple;
	bh=tfAd7pxoIaaF4Wc0E9TXD8BNBW9T4Pxdgh3Abv0XiWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ClAJVtlWmDUcFk4kHYT1296UW3Zi6jlt+XodMWb3H0rrGd3rse7pd2+/ouhWuflQTbD2VQwA0Qeoc72iIxq+lGuZOrpcqLKSbfhrWPMDTUnp1PagMPJZqQNF3Et2FfVirQ6nao9z98lVrFY6okHcidz93dOE0tj91ekFhNSa8D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxbWtrIhJoIznLAA--.8933S3;
	Wed, 30 Apr 2025 21:15:23 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCx_cZmIhJoqoKgAA--.14402S4;
	Wed, 30 Apr 2025 21:15:23 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] LoongArch: Enable tracing infrastructure in defconfig
Date: Wed, 30 Apr 2025 21:15:13 +0800
Message-ID: <20250430131516.24287-3-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowMCx_cZmIhJoqoKgAA--.14402S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur1DGF1DJr1rGrWDWr1fZrc_yoW8WFWDpr
	4fCws8trZ5Jr1Sk39rAr97WrZ5tr97Cr13W3W7CrW7C393Zw4jvF40gry3uF4DXa9xtw4F
	va95Krya9FWUC3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8l38UUUUUU==

When executing the command "perf list", I met "Error: failed to open
tracing events directory" twice, the first reason is that there is no
"/sys/kernel/tracing/events" directory due to it does not enable the
kernel tracing infrastructure with CONFIG_FTRACE, the second reason
is that there is no root privileges.

Although the error string was added to tell the users what happened
and what should to do in commit b48543c451c3 ("perf list: Give clues
if failed to open tracing events directory"), it is better to enable
CONFIG_FTRACE in defconfig to avoid the error message at runtime:

  $ ./perf list
  Error: failed to open tracing events directory
  /sys/kernel/tracing/events: No such file or directory

Additionally, CONFIG_UPROBE_EVENTS is default y only if CONFIG_FTRACE
is set, otherwise there exists the following error:

  $ ./perf probe -x /usr/lib64/libcrypto.so BN_mod_mul_montgomery
  /sys/kernel/tracing//uprobe_events does not exist.
  Please rebuild kernel with CONFIG_UPROBE_EVENTS=y.
    Error: Failed to add events.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/configs/loongson3_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index a3c9d189a627..eaaf3419555c 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -1006,5 +1006,4 @@ CONFIG_STRIP_ASM_SYMS=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 CONFIG_SCHEDSTATS=y
-# CONFIG_FTRACE is not set
 CONFIG_UNWINDER_ORC=y
-- 
2.42.0

