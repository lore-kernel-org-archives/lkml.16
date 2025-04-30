Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE17B23507A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746019053; cv=none; b=u7n7/X2kjhx6zVzhY1qpOUBl6mX8PjIn1AiTofHKaTY3JVQqlHhR/x6pj/RXolIhDViJJ41p4uvtBEspgxAbPprlPTa1NHKUdD4pCY1RL62uthcAbd/Uqrxr2zdAzQB7HpA18h5YzxVWmKHJIaETWCtUcfKkCePz5Y7af7FDR3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746019053; c=relaxed/simple;
	bh=kl1jPBmACbBRpgdgLtgWldKaD0L8gV1HoyWz3TUvS8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YH/HYou0wivePAtQrAXa4SQ5uYccWq4CmQkeutxyNUBDU26v5UNk29wJv51Bwl85vwvFz2oDzvxxCsrLuviOHNsl5v0YYlEQAnvqiv5jgBYR/fGFAChl5DXVIfrvCIypc5r0nt5pS6yxLeRAeu+OySUsWkwTIId9HBs+jn2hY6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxjXJsIhJoLDnLAA--.8731S3;
	Wed, 30 Apr 2025 21:15:24 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCx_cZmIhJoqoKgAA--.14402S7;
	Wed, 30 Apr 2025 21:15:24 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] LoongArch: Enable kprobe and ftrace in defconfig
Date: Wed, 30 Apr 2025 21:15:16 +0800
Message-ID: <20250430131516.24287-6-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowMCx_cZmIhJoqoKgAA--.14402S7
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJrW7XrW7ZFW3WF1kWrWUKFX_yoW8WF1xpr
	n7A397Ja18Jrn3ArW7C34DWrZ5tF1kJFW7Wr17Ar1Y9r1kJw45Xw10yr1UJF4DX397XrWr
	ZF93Gr1avFW5JwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

kprobe and ftrace are often used, just enable them in defconfig
to avoid setting them manually each time when updating kernel.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/configs/loongson3_defconfig | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index d9160f025da0..2301882400f2 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -39,7 +39,6 @@ CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_SCHED_AUTOGROUP=y
-CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
@@ -67,6 +66,7 @@ CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
 CONFIG_LOONGSON3_CPUFREQ=m
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
+CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
 CONFIG_MODULE_UNLOAD=y
@@ -1006,7 +1006,17 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_INFO_BTF=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_FS=y
 CONFIG_SCHEDSTATS=y
+CONFIG_FUNCTION_GRAPH_RETVAL=y
+CONFIG_FUNCTION_GRAPH_RETADDR=y
+CONFIG_FPROBE=y
+CONFIG_FUNCTION_PROFILER=y
+CONFIG_STACK_TRACER=y
+CONFIG_IRQSOFF_TRACER=y
+CONFIG_PREEMPT_TRACER=y
+CONFIG_SCHED_TRACER=y
+CONFIG_HWLAT_TRACER=y
+CONFIG_TIMERLAT_TRACER=y
 CONFIG_FTRACE_SYSCALLS=y
+CONFIG_BLK_DEV_IO_TRACE=y
 CONFIG_UNWINDER_ORC=y
-- 
2.42.0

