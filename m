Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D0A255F49
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032265; cv=none; b=Fm6RezOxzGVZLbLVa60nYBvO5M+Hen71pY6LV5KuoEsRwq215VQx/Lo6bJfVKW2UM/Mm0HhVQvni1rDmqY75f10nLPfTRwfTy6iOg8LID9lt/og1W/XiFH37ghokX3E6IuJOJgRsEs5kNS7BOI7lDPXsgo6bjUAfxskurduknWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032265; c=relaxed/simple;
	bh=astZc3nUAClnYhgFpBq4rVLSxe/yHa4jWlpH3eL0x8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jT7zzUVSQiOpcYhcacWQKIAxjtlnVsNdWrDEZWeJWwNkMf0S0798eir9zgTfRWcKu48rqFebcRFzfJ0AUwx6oriVaIBBQQbeq/z8Sj77SsSIlbR/CvvO31XmnXgLyClCUNTZ03UPO7URwLeTrbFc86GiwbrlW5sYbLyMni2DiZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=XKkM8KVu; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="XKkM8KVu"
Received: from terminus.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3:0:0:0:136])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54C6hsAx1535999
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 11 May 2025 23:43:59 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54C6hsAx1535999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747032239;
	bh=Cgx1rOWl22QL0Zm3MeNtwiHmB2LeuWL5kaf6x4tsjII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XKkM8KVuN93lJORuxYjKdflVRuub/O9Ko17jPFdh7+yca4qhcgm78IBukiD2nOMCH
	 cJMcON/aX8rjfVXGf4ox6G7uVx/ip+axRFjXqlgRiVLMhSUl6Mg2tiSj0cjCeD/Pju
	 EBByGhogsv2wkRTZEC9L6zO+I6N9peIPTnhVoyxoM5/cStRfI7HuJHx8sqfXFO/Zww
	 vz0ItoPIHbMeQi+rQDsIbrxT0tPQC9JM8IaRP9EU2BhfB4K155/dW1VAcHocrDUdt1
	 H0+9bqVwKXg+Ggqx0xBQ11lJA6Kr4yw2Tm7fSN/X+JCvQrZ6bfFLhwk2jgKJ0NmJm5
	 pNYJUTW544uiQ==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org
Cc: luto@kernel.org, tglx@linutronix.de, mingo@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        peterz@infradead.org, brgerst@gmail.com
Subject: [PATCH v4 2/2] x86: Remove the padding space at top of the init stack
Date: Sun, 11 May 2025 23:43:53 -0700
Message-ID: <20250512064353.1535984-3-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512064353.1535984-1-xin@zytor.com>
References: <20250512064353.1535984-1-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because the owner of the init stack, init task, doesn't have any user
level context, there will NEVER be an actual pt_regs structure pushed
at top of the init stack.

However a zeroed pt_regs structure is created at build time and kept
at top of the init stack for task_pt_regs() to function properly with
the init task in the same manner as a normal task with user level
context.

Besides, task_pt_regs() no longer converts a fixed offset from top of
a task kernel stack to a pt_regs structure pointer, but rather returns
whatever in the thread_info.user_pt_regs field, which is initialized
at build time to '(struct pt_regs *)TOP_OF_INIT_STACK - 1' for the
init task.

As a result, there is no point to reserve any padding space at top of
the init stack, so remove the padding space.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/processor.h | 16 ++++++++++++++--
 arch/x86/kernel/vmlinux.lds.S    |  7 +++++--
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 42e5a6a41403..5c5378232bd4 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -640,8 +640,20 @@ static __always_inline void prefetchw(const void *x)
 			  "m" (*(const char *)x));
 }
 
-#define TOP_OF_INIT_STACK ((unsigned long)&init_stack + sizeof(init_stack) - \
-			   TOP_OF_KERNEL_STACK_PADDING)
+extern unsigned long __end_init_stack[];
+
+/*
+ * No need to reserve extra padding space above the pt_regs structure
+ * at top of the init stack, because its owner init task doesn't have
+ * any user level context, thus there will NEVER be an actual pt_regs
+ * structure pushed at top of the init stack.
+ *
+ * However a zeroed pt_regs structure is created at build time and kept
+ * at top of the init stack for task_pt_regs() to function properly with
+ * the init task in the same manner as a normal task with user level
+ * context.
+ */
+#define TOP_OF_INIT_STACK ((unsigned long)&__end_init_stack)
 
 #define task_top_of_stack(task) ((unsigned long)(task_pt_regs(task) + 1))
 
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index d813f64a89d6..6266e500f7fb 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -181,8 +181,11 @@ SECTIONS
 		/* init_task */
 		INIT_TASK_DATA(THREAD_SIZE)
 
-		/* equivalent to task_pt_regs(&init_task) */
-		__top_init_kernel_stack = __end_init_stack - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE;
+		/*
+		 * task_pt_regs(&init_task) is:
+		 *	'(struct pt_regs *)&__end_init_stack - 1'
+		 */
+		__top_init_kernel_stack = __end_init_stack - PTREGS_SIZE;
 
 #ifdef CONFIG_X86_32
 		/* 32 bit has nosave before _edata */
-- 
2.49.0

