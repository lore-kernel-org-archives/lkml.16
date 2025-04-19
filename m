Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FC81EF39E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102172; cv=none; b=qbUW9PwGB8tMkVyeuqXKVtycvm8WcO/PxWo3QnPEZ2JdQHsBAltisz/Zopw78xdRQSQ4ZeI5aSSdnOJgrV1MYu7xj0cJotJDo9W4T8W5r4p1VxmVZiHwoUcUA3rqF2vM61VylsmdAABuPJM87jw0/WLbDdexd0wNwZHXT40HqXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102172; c=relaxed/simple;
	bh=8Lmq+B+8dQHOJgJYKg4Eu++IihkxOmet9HBYrJI4JGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tp8XFzorhCCHaLNuuiT6X/BsQOrnmJBGzzfTO1w6Cap+J8GF37ZoeFqtwXkB2+Ljf8bMpBFfRQ66+KmnT5G/iEVLRhU7BBf4JNddFzCZ1fjS2VggtHvp2h0k83xQsugGBxC8YhbJumX2e7F9HcChWjIiNJ8TMglSkbzlRZJpKx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a+3nMgwp; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+3nMgwp"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b1095625dso3502733e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102168; x=1745706968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzUqR1jHKNDNB1MvP/C818suEL+5EgmWCT+bBhmdbf0=;
        b=a+3nMgwpMQKiVMFbFSzkZPjll5Ho0l8Q+CpPT61slP6Jd7tpiHrNNmKBDYotkXHQx2
         mTExYnMnuzLjxoBbm+KMyccGD7gBAQOA/a2itFqGEodMvcN1OHT5G1nlsDFFs1lHOZ8o
         liPkRi+jq/WIEOiW+YbGg385D3omQ2nAxIz7apN3lB8YBeD/yTHh33s+ZhZGsCC9nxZ1
         AGxamLpSEUAuORCDUkSFZVMelK1oDZFlerPQv5uESfuutrwQdbqLJQtwTaiPhtBQynGJ
         TfeYTedugxu1aDQ/6/K3VyiywcH4VkGrzC2TL5o+GKTluoVBsXBreKxhPd2Cne7Nx6NM
         f4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102168; x=1745706968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzUqR1jHKNDNB1MvP/C818suEL+5EgmWCT+bBhmdbf0=;
        b=YVZX+/mTX8t7EP7gHhifFGd3fnl7/3RqnRiy1CqUNlTWUsBVLe12PGiAYSc69wT592
         4VBRYaL6ZBa+v8ZGJ/Y0QEq7ytJO8UJ+QPylQLNTgAoKQRAMHCC8EZyEoUD94ee/Bpep
         NZ9IfWAuqicxuttdz+aCEUGeiJSsmtKMhkTl1wW+x449E7LSH+u2ypl90ihhu53z8DsJ
         BX1pdeSu9UfuFnkQwuvqyKX8ayHyT9eqy9rIXM8oDQnUFAFKvSPsa/OGLqash45xCw9w
         54MNbQ2Pu8o5cZY2Dbkvl6djxDympGQlUrv5Mu6n+WWt7uoswk1tc3lYkF61bs/iN+aP
         vpkA==
X-Forwarded-Encrypted: i=1; AJvYcCU7Mh1OIEv4nM+z7emXGfDvZ74cYKxdaxzAGfftPUY4f67rIU11XntjoeImbeB2HbbDOMV/cfVg5PuwDfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk8wqyjUwUf/cYdkYnfQe7kfUBdxy1sC6maYpxTYsQiEyl0FSu
	kXkrYGAA1dpzKI7vvzeHwNO65/e/KClIQhTxaJCPDqGwhpSlJSQwq67z7/uDDO8=
X-Gm-Gg: ASbGnctR6LcW/4crWHfVw7Y3kk86QZ8ogBeEiZa9f2gJifeUuLOtDbkwurh5OtSGvJw
	KQYILEe8Gk7PGfdOcD5Ihu97yCQ/P6iRKpC8Dv8YfXHrT3iq8HH4V9DajPJ8BK4VIDjhwvD+4t9
	ZLqzOC7+nTtyE4Q0BFeNWq34Jyyhp9VjWyE9M5q0Df7W2k1j6toFfUlg/qqvjDi/EAgkMjygejr
	PEhFrEems45qnhU0ZMZm/FTeuKTH5vomoRAeP/N0lhHN3s5P/8e6ZHImL3l8P4usQ5jI8tzOxkD
	jGLWYBQFlgn76ES9gsnZG5IzX9NO7ZLNIAtOTifeoDgJKntxi78=
X-Google-Smtp-Source: AGHT+IFmea0W7fyk5E36UX+d1KPazK0iLChsYY2dcspCJddLKNCeOYSi+wYuBVuxVxg8eew0JWKzvA==
X-Received: by 2002:ac2:4c47:0:b0:545:2cb6:af31 with SMTP id 2adb3069b0e04-54d6e62cb53mr1849382e87.15.1745102168217;
        Sat, 19 Apr 2025 15:36:08 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:36:07 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:56 +0200
Subject: [PATCH v6 09/31] ARM: entry: save the syscall sp in thread_info
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-9-95f1fcdfeeb2@linaro.org>
References: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
In-Reply-To: <20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org>
To: Dmitry Vyukov <dvyukov@google.com>, Oleg Nesterov <oleg@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2

We are going to rewrite the syscall handling in C, which
means that the stack used by the call code is no longer
predicatably 8 bytes (for syscall arguments r4 and r5)
but a varying number of bytes depending on how nested the
C code is.

However the current code is just assuming it can rewind
the stack by adding 8 to sp if a syscall is interrupted by
a sigreturn call.

Solve this by storing the entry sp in the per-task
struct thread_info and use that in the sigreturn wrapper
instead. We already have the thread info available in
the SWI entry and sigreturn is probably not so common
that retrieveing a pointer to thread_info should affect
anything very much.

Storing this per-task in thread_info makes the solution
SMP robust.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/thread_info.h | 1 +
 arch/arm/kernel/asm-offsets.c      | 1 +
 arch/arm/kernel/entry-common.S     | 8 ++++++--
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/thread_info.h b/arch/arm/include/asm/thread_info.h
index 943ffcf069d29cf4a035964d20d56f7ebdd6d602..d8a45c5a10496aaf806bfeaa0353d5e8985bd6f5 100644
--- a/arch/arm/include/asm/thread_info.h
+++ b/arch/arm/include/asm/thread_info.h
@@ -67,6 +67,7 @@ struct thread_info {
 	__u32			cpu_domain;	/* cpu domain */
 	struct cpu_context_save	cpu_context;	/* cpu context */
 	__u32			abi_syscall;	/* ABI type and syscall nr */
+	__u32			sp_syscall;	/* SP when entering syscall */
 	unsigned long		tp_value[2];	/* TLS registers */
 	union fp_state		fpstate __attribute__((aligned(8)));
 	union vfp_state		vfpstate;
diff --git a/arch/arm/kernel/asm-offsets.c b/arch/arm/kernel/asm-offsets.c
index 123f4a8ef44660a39c4eff2a6e5fd86cb48fb572..291de33ec53d11d87d39d9b87c3c82843e4ebbe8 100644
--- a/arch/arm/kernel/asm-offsets.c
+++ b/arch/arm/kernel/asm-offsets.c
@@ -49,6 +49,7 @@ int main(void)
   DEFINE(TI_CPU_DOMAIN,		offsetof(struct thread_info, cpu_domain));
   DEFINE(TI_CPU_SAVE,		offsetof(struct thread_info, cpu_context));
   DEFINE(TI_ABI_SYSCALL,	offsetof(struct thread_info, abi_syscall));
+  DEFINE(TI_SP_SYSCALL,		offsetof(struct thread_info, sp_syscall));
   DEFINE(TI_TP_VALUE,		offsetof(struct thread_info, tp_value));
   DEFINE(TI_FPSTATE,		offsetof(struct thread_info, fpstate));
 #ifdef CONFIG_VFP
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 3cfc6d952ff99be9c4c1be4481ac3039260e3e57..8baab7f97f59c434396f30b08ddd3029c5f9c0e5 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -232,6 +232,8 @@ ENTRY(vector_swi)
 
 	uaccess_disable tbl
 	get_thread_info tsk
+	/* Save a per-task copy of SP for sigreturn */
+	str	sp, [tsk, #TI_SP_SYSCALL]
 
 	adr	tbl, sys_call_table		@ load syscall table pointer
 
@@ -377,13 +379,15 @@ sys_syscall:
 ENDPROC(sys_syscall)
 
 sys_sigreturn_wrapper:
-		add	r0, sp, #S_OFF
+		get_thread_info tsk
+		ldr	r0, [tsk, #TI_SP_SYSCALL]	@ read back SP
 		mov	why, #0		@ prevent syscall restart handling
 		b	sys_sigreturn
 ENDPROC(sys_sigreturn_wrapper)
 
 sys_rt_sigreturn_wrapper:
-		add	r0, sp, #S_OFF
+		get_thread_info tsk
+		ldr	r0, [tsk, #TI_SP_SYSCALL]	@ read back SP
 		mov	why, #0		@ prevent syscall restart handling
 		b	sys_rt_sigreturn
 ENDPROC(sys_rt_sigreturn_wrapper)

-- 
2.49.0

