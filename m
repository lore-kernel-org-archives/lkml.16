Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103701EB19B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745102162; cv=none; b=bkH3zCVvTVbS+MR+jItflJmsYUbAOtIkYbgaO17rQiEl0/gVMx1wXoK2HpYWgFkkak5fn45wA1f7K/DhB/ksSfPX7NU7uF/yLJYPa89EwMGHRrTj+Qq+GFh5avWwY8dszGMjyavOp5GteP3BXAbLUNmr7quKO7hwjh45JXOH7mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745102162; c=relaxed/simple;
	bh=C4h+gx0/1cRWyZmov3YVUGgb/6MevMRGPWN5ZX+l1qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eKoK2+cGyK755sz94+cGA/7J5vA6X/g/vJzZ7ZAKjCWiqXio+ryCyjPL4THPrzbqfsOfW+qn+xF2jIkMLmliKsYnXtUMZkbn2DyAcn/MWEvJDMjXl079/gaQuqZzw9Xo0OFFoLnVtFXAwDXT++1uY43Sn1tYoWDXMt+3rvNpDPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=feUIs0vg; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="feUIs0vg"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549963b5551so3109501e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 15:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745102159; x=1745706959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xa+6PSlNL4t/65YhlpxeyjZxsZsxKfkQGqf+kwb8SlM=;
        b=feUIs0vgbOjhIiQ5gDS2nCp+pwvsCgop8PEAh1gxqoOEsK2hikV21iOEJIF5zgvG+O
         llS15DlissJdS2fXWmyCylw10ZMPVRSiMAirYSe5vYl69fpgC5yyoMrjTdgqzJQwDkLu
         misATRZXl4lUvD3eUbz0skXbVCqLyc0RvCHHEgnybrZUKHK18SJHR1sO4r2/n1DUK+Pl
         TkP2bnRg2hKuSC/8szCvT4pO8F/cpdDpsoaEny4jf5fsyUFfSfSiMG8bkLOO7JzOgYDR
         Tz+DBgQTj7h0LNbibjOi9XOx+dpb6M8Dx6sabX7bW57EqJBhsqAJGOS4/yLpED5/Pjr1
         hMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102159; x=1745706959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xa+6PSlNL4t/65YhlpxeyjZxsZsxKfkQGqf+kwb8SlM=;
        b=qNCxw+KUV+UQfmXNRCg06BbnfWAiF7UmDe+GM/RIVXZbgSAAeUTlXMen3baFXcYKX9
         JEXyRjrspJ+UsU8qwB1PoodVUZJGQWttEZxN8EMvVVN7kORGjKugg98CteFD/iw9A06D
         6mQwS+SZQYc7lE/40KdwSr1Upx4TSEPIqktKLJOhWW4Xy4y5RmypCzbg/0KiFFIKTwc+
         Daq4gZoZvobCMxzJ/fLIePBlJnO8sivmK17KDHb34gIZVrJ+wLCchEctYB4742Xkj96z
         EeynzW4y6hzvhEPdwI31LKcY0hxvSpGSqN1Mc9fH1j9toubKlBWD2BO5X38oHeeqdxjF
         Hkog==
X-Forwarded-Encrypted: i=1; AJvYcCVjkvwc3a1OR6WSmUUED4T61gqJjNnA6DWIVIsmiPAsRRn6Ioj8NzgKzOI/6RRGCWqVZW5329BKemcCMGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFA2YhcRrtYeMY3BougqJSkG34a9ZHQhTMWDnaZIYVwaLDWmn6
	xPvEE+rTxJBcLkCfrPbSKeTlH4q+sjDrm/proXD9dIiUcUCsXTVJpcDt4mOwhiE=
X-Gm-Gg: ASbGnctroLiJwzW119mAQXxtqXzNmLxtR5No5ftcQEJmk5L/1JAuKTrkkrRYzdqLgGT
	izzA82ggFSevfuPFGa45mqX+XEa37cRPU0iHrYbYql5mdL2VEoalmL5K8bBulYVwVjEUDWWVSIE
	IxK23BWMe0P0TbHM/X8WdZBA8s9lmkv/Wp8CtHWDN2N1dYx5kdpx86uEEE66qXJIY2oohPfysr4
	W9hcJakFiMSzxo6ORlHuBUTQ8OIs8wJk0FgRFhLSVJTMYzQ509DCf7/0cRrktMO2ig5ujPv3zW4
	Q1fRp4F49//aSQwmEMvt5Aa4QkzmfDvyv/el9ZLqU0G+duUkFW0=
X-Google-Smtp-Source: AGHT+IFxQdlR3XbwN3+K/S07VkZdxfUuHrjaKg+XbMlUjDGQX29Og6QcKArMltGpAQ4oZl3D4gBdWQ==
X-Received: by 2002:a05:6512:b06:b0:549:5769:6ae3 with SMTP id 2adb3069b0e04-54d6e61c9c7mr2111296e87.6.1745102159063;
        Sat, 19 Apr 2025 15:35:59 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540daesm535322e87.79.2025.04.19.15.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:35:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Apr 2025 00:35:49 +0200
Subject: [PATCH v6 02/31] ARM: ptrace: Split report_syscall()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-arm-generic-entry-v6-2-95f1fcdfeeb2@linaro.org>
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

The generic entry code requires that report_syscall() be provided
in two parts: report_syscall_enter() and report_syscall_exit()
so split the combined function in two.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/kernel/ptrace.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index c421a899fc84c476a672cbfe1c8ece8355d8512d..07b0daf47441f1f76a8af416acc74fa5ed770403 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -827,31 +827,45 @@ enum ptrace_syscall_dir {
 	PTRACE_SYSCALL_EXIT,
 };
 
-static void report_syscall(struct pt_regs *regs, enum ptrace_syscall_dir dir)
+static void report_syscall_enter(struct pt_regs *regs)
 {
 	unsigned long ip;
 
 	/*
 	 * IP is used to denote syscall entry/exit:
-	 * IP = 0 -> entry, =1 -> exit
+	 * IP = 0 -> entry
 	 */
 	ip = regs->ARM_ip;
-	regs->ARM_ip = dir;
+	regs->ARM_ip = PTRACE_SYSCALL_ENTER;
 
-	if (dir == PTRACE_SYSCALL_EXIT)
-		ptrace_report_syscall_exit(regs, 0);
-	else if (ptrace_report_syscall_entry(regs))
+	if (ptrace_report_syscall_entry(regs))
 		current_thread_info()->abi_syscall = -1;
 
 	regs->ARM_ip = ip;
 }
 
+static void report_syscall_exit(struct pt_regs *regs)
+{
+	unsigned long ip;
+
+	/*
+	 * IP is used to denote syscall entry/exit:
+	 * IP = 1 -> exit
+	 */
+	ip = regs->ARM_ip;
+	regs->ARM_ip = PTRACE_SYSCALL_EXIT;
+
+	ptrace_report_syscall_exit(regs, 0);
+
+	regs->ARM_ip = ip;
+}
+
 asmlinkage int syscall_trace_enter(struct pt_regs *regs)
 {
 	int scno;
 
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
-		report_syscall(regs, PTRACE_SYSCALL_ENTER);
+		report_syscall_enter(regs);
 
 	/* Do seccomp after ptrace; syscall may have changed. */
 #ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
@@ -892,5 +906,5 @@ asmlinkage void syscall_trace_exit(struct pt_regs *regs)
 		trace_sys_exit(regs, regs_return_value(regs));
 
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
-		report_syscall(regs, PTRACE_SYSCALL_EXIT);
+		report_syscall_exit(regs);
 }

-- 
2.49.0

